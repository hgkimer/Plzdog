package com.plz.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
//관리자를 관리하느 컨트롤러
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.MemberService;
import com.plz.service.ReservationService;
import com.plzdog.vo.Member;
import com.plzdog.vo.Reservation;

@Controller
@RequestMapping("/admin/")
public class AdminManageController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private ReservationService rService;

	/**
	 * 관리자를 등록하는 메소드.
	 * 등록 처리후 join_success.do로 redirect방식으로 이동 (MainController) - 요청파라미터로 등록된 userId 전송
	 * @param user
	 * @return
	*/
	
	@RequestMapping("register_admin")
	public ModelAndView registerAdmin(@ModelAttribute Member member,HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartFile ImageMember = member.getImageMember();
		if(ImageMember!=null && !ImageMember.isEmpty()) {
			//사진 저장할 디렉토리 
			String dir = request.getServletContext().getRealPath("/memberImage");
			String fileName = ImageMember.getOriginalFilename();
			File upImage = new File(dir, fileName);
			ImageMember.transferTo(upImage);
			member.setMemberImage(fileName);
		}
		service.insertMember(member, "ROLE_ADMIN");
		//redirect 방식이동시 model값은 요청파라미터로 전송된다.
		return new ModelAndView("redirect:/join_success.do","email", member.getEmail());
	}
	
	/**
	 * 모든 회원을 조회
	 * @param model
	 * @return
	 */
	@RequestMapping("select_all_member")
	public String selectAllMember(Model model) {
		
		List<Member> memberList = service.findAllMemberJoinAuthority();
		
		model.addAttribute("memberList", memberList);
		return "admin/select_all_member_result.tiles";
	}
	
	/**
	 * 회원과 관련된 정보 삭제
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("remove_member")
	@Transactional
	public String removeMember(@RequestParam String email, Model model) {
		
		service.deleteMember(email);
		
		//다시 조회 후 뿌림
		List<Member> memberList = service.findAllMemberJoinAuthority();
		
		model.addAttribute("memberList", memberList);
		return "admin/select_all_member_result.tiles";
	}
	
	/**
	 * 모든 예약 조회
	 * @param model
	 * @return
	 */
	@RequestMapping("select_all_reservation")
	public String selectAllReservation(Model model) {
		
		List<Reservation> resList = rService.findAllReservation();
		//회원을 저장할 변수
		Member member = new Member();
		//시터를 저장할 변수
		Member sitter = new Member();
		
		for(Reservation res : resList) {
			
			//회원의 기본정보 조회
			member = service.findMemberJoinAuthorityByEmail(res.getMemberEmail());
			
			//res-1은 시터 이메일이 없다.
			if(!res.getResStatus().equals("res-1")) {
				//시터의 기본 정보 조회
				sitter = service.findMemberJoinAuthorityByEmail(res.getSitterEmail());
			}
			
			//예약에 회원과 시터 기본정보 추가
			res.setMember(member);
			res.setSitter(sitter);
		}
		
		model.addAttribute("resList", resList);
		return "admin/select_all_reservation_result.tiles";
	}
}
