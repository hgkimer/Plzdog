package com.plz.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.plz.service.AuthorityService;
import com.plz.service.CareService;
import com.plz.service.DogService;
import com.plz.service.MemberService;
import com.plz.service.ReservationService;
import com.plz.service.SitterService;
import com.plz.service.WaitingService;
import com.plzdog.vo.Authority;
import com.plzdog.vo.Care;
import com.plzdog.vo.Member;
import com.plzdog.vo.Reservation;
import com.plzdog.vo.Sitter;

@Controller
public class SitterController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SitterService sitterService;
	
	@Autowired
	private CareService careService;
	
	@Autowired
	private AuthorityService authorityService;
	
	@Autowired
	private WaitingService waitingService;
	
	@Autowired
	private ReservationService rService;
	
	@Autowired
	private DogService dogService;

	@RequestMapping("/admin/select_waiting")
	public ModelAndView selectWaiting(HttpServletRequest request) {
		List<String> waitingList = waitingService.selectAllWaiting();
		System.out.println(waitingList);
		List<Member> memberList = new ArrayList<>();
			for(int i =0; i < waitingList.size(); i++) {
				memberList.add(memberService.findMemberByEmail(waitingList.get(i)));
		}
		return new ModelAndView("admin/select_waiting_result.tiles", "memberList", memberList);
	}
	/**
	 * 관리자 승인 : 시터등록을 신청한 사람들의 권한을 견주에서 시터로 바꿔주는 메소드
	 * @param authority 시터 권한으로 받는다.
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/enroll_sitter")
	public String enrollSitter(@ModelAttribute Authority authority, ModelMap model) {
		authorityService.addAuthority(authority);
		
		waitingService.deleteWaiting(authority.getEmail());
		
		model.addAttribute("email", authority.getEmail());
		return "admin/sitter_enroll_result.tiles";
	}
	
	@RequestMapping("/admin/delete_sitter")
	public String deleteSitter(@RequestParam String email, Model model) {
		memberService.deleteMember(email);
		model.addAttribute(email);
		return "sitter/sitter_delete_result.tiles";
	}
	
	//------------- lee su il -------------------------
	
	/**
	 * 관리자 승인 이전의 시터 등록 : 시터 정보는 저장되지만 권한은 견주의 권한으로 받는다.
	 * @param sitter
	 * @param role 견주 권한으로 받는다.
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/insert_sitter")
	public String insertSitter(@ModelAttribute Sitter sitter, HttpServletRequest request, @RequestParam(name="skill") List<String> skillList) 
	throws IllegalStateException, IOException{
		System.out.println(skillList);
		System.out.println(sitter);
		MultipartFile certificationImage = sitter.getCertificationImage();
		if(certificationImage!=null && !certificationImage.isEmpty()) {
			//사진 저장할 디렉토리 
			String dir = request.getServletContext().getRealPath("/certificationImage");
			String fileName = UUID.randomUUID().toString();	
			File upImage = new File(request.getServletContext().getRealPath("/certificationImage"), fileName);
			certificationImage.transferTo(upImage);
			sitter.setCertification(fileName);
		}
		sitterService.insertSitter(sitter, skillList);
		waitingService.insertWaiting(sitter.getEmail());
		return "sitter/sitter_register_result.tiles";
	}
	

	@RequestMapping("/sitter/update_sitter")
	public String updateSitter(@ModelAttribute Member sitter, ModelMap model) {
		if(memberService.findMemberByEmail(sitter.getEmail()) != null) {
			memberService.updateMember(sitter);
			model.addAttribute("sitter", sitter);
			return "sitter/sitter_update_result.tiles";
		} else {
			return "sitter/sitter_update_error.tiles";
		}
	}
	
	/*@RequestMapping("/sitter/select_res")
	public String selectResId(@RequestParam String email, Model model) {
		model.addAttribute("res", rService.findMemberReservationByEmail(email));
		return null;
	}*/
	
	/**
	 * 돌봄 일지 등록
	 * 돌봄 일지의 등록과 여러개의 이미지 처리
	 * @param care
	 * @param request
	 * @param model
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/sitter/insert_care")
	public String insertCare(@ModelAttribute Care care, HttpServletRequest request,ModelMap model) throws IllegalStateException, IOException {
		if(care == null) {
			model.addAttribute("errorMessage","객체가 없습니다.");
		}
		careService.insertCare(care,request);
		model.addAttribute(care);
		return "/WEB-INF/view/content/sitter/care_register_result_form.jsp";
	}
	
	@RequestMapping("/sitter/update_care")
	public String updateCare(@ModelAttribute Care care, ModelMap model) {
		if(careService.selectCareJoinCareImage(care.getResId()) != null) {
	
			careService.updateCare(care);
			model.addAttribute(care);
			return "sitter/care_success.tiles";
		} else {
			return "sitter/fail.tiles";
		}
	}
	
	/**
	 * 시터가 승인을 누르면 예약 상태가 res-4 (결제 대기) 상태로 변환
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/sitter/approve_reservation")
	@Transactional
	//이번 내용은 리다이렉트 전송시 parameter를 URL에 붙여서 전송하지 않을 때
	public String approveReservation(@RequestParam String sitterEmail, @RequestParam String memberEmail, 
			 RedirectAttributes redirectAttributes, HttpSession session) {
		
		List<Reservation> memberList = (List<Reservation>)session.getAttribute("resList");
		Reservation resMember = new Reservation();
		
		for(Reservation res : memberList) {
			if(res.getMemberEmail().equals(memberEmail)) {
				resMember = res;
			}
		}
		
		Reservation res = new Reservation(resMember.getResId(),resMember.getResSDate(),resMember.getResEDate(),resMember.getPrice(),resMember.getResContents(),"res-4",resMember.getMemberEmail(),resMember.getSitterEmail());
		//예약 수정
		rService.updateReservation(res);
		
		//다시 조회 후(refresh)에 memberList로 데이터 전달
		memberList = rService.findWaitingForApprovalReservationSitter(resMember.getSitterEmail());
		
		redirectAttributes.addFlashAttribute("approveMessage",resMember.getMember().getMemberName()+"님의 예약이 완료되었습니다.");
		//redirectAttributes.addFlashAttribute("memberList",memberList);
		session.setAttribute("resList", memberList);
		return "redirect:/sitter/approve_reservation_success.do";
	}
	
	/**
	 * 예약 확인 redirect handler
	 */
	@RequestMapping("/sitter/approve_reservation_success")
	public String approveReservationView() {
		return "sitter/waiting_for_approval_reservation_result.tiles";
	}
	
	/**
	 * 시터가 거절을 누르면 res-1(예약 대기) sitterEmail 삭제 , price 삭제
	 * @param resMember
	 * @param model
	 * @return
	 */
	@RequestMapping("/sitter/reject_reservation")
	@Transactional
	public String rejectReservation(@RequestParam String sitterEmail, @RequestParam String memberEmail, 
			 RedirectAttributes redirectAttributes, HttpSession session) {
		
		List<Reservation> memberList = (List<Reservation>)session.getAttribute("resList");
		Reservation resMember = new Reservation();
		
		for(Reservation res : memberList) {
			if(res.getMemberEmail().equals(memberEmail)) {
				resMember = res;
			}
		}
		
		//시터가 거절을 누르면 res-1(예약 대기) sitterEmail 삭제 , price 삭제
		Reservation res = new Reservation(resMember.getResId(),resMember.getResSDate(),resMember.getResEDate(),0,resMember.getResContents(),"res-1",resMember.getMemberEmail(),null);
		
		//예약 수정
		rService.updateReservation(res);
		
		//다시 조회 후(refresh)에 memberList로 데이터 전달
		memberList = rService.findWaitingForApprovalReservationSitter(resMember.getSitterEmail());
		
		//model.addAttribute("memberList",memberList);
		redirectAttributes.addFlashAttribute("rejectMessage",resMember.getMember().getMemberName()+"님의 예약이 거절되었습니다.");
		session.setAttribute("resList", memberList);
		return "redirect:/sitter/reject_reservation_success.do";
	}
	
	/**
	 * 예약 거절 redirect handler
	 */
	@RequestMapping("/sitter/reject_reservation_success")
	public String rejectReservationView() {
		return "sitter/waiting_for_approval_reservation_result.tiles";
	}
	
	//------------- lee su il -------------------------
	
	
	@RequestMapping("/member/select_sitter_name")
	public String selectSitterByName(@RequestParam String name, ModelMap model) {
		List<Member> sitterList = memberService.selectSitterByName(name);
		model.addAttribute("sitterList", sitterList);
		return "sitter/sitter_select_result.tiles";
	}
	
	@RequestMapping("/member/select_sitter_email")
	public String selectSitterByEmail(@RequestParam String email, ModelMap model) {
		Member sitter = memberService.selectSitterByEmail(email);
		if(sitter != null) {
			model.addAttribute("sitter", sitter);
			return "sitter/sitter_select_result.tiles";
		} else {
			String errorMessage = "없는 email입니다.";
			model.addAttribute("errorMessage", errorMessage);
			return "sitter/sitter_select_result.tiles";
		}
	}
}
