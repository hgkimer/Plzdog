package com.plz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.DogService;
import com.plz.service.ResDetailService;
import com.plz.service.MemberService;
import com.plz.service.ReservationService;
import com.plzdog.vo.Dog;
import com.plzdog.vo.Member;
import com.plzdog.vo.Reservation;


@Controller
public class ReservationController {
	@Autowired
	private ReservationService service;
	@Autowired
	private DogService dogService;
	@Autowired
	private ResDetailService resDetailService;


	@RequestMapping("/member/selectDogInReservation")
	public String selectDogInReservation(@RequestParam int resId, @RequestParam(name="dogId") List<Integer> dogIdList) {
		resDetailService.addResDetail(resId, dogIdList);
		return "member/reservation_add_success.tiles";
	}
	private MemberService memberService;
	
	/**
	 * 예약 관련 Controller 
	 * 1. 예약 등록(견주, 시터) 
	 * 2. 예약 상태 변경==> 
	 * 3. 예약 전체(로그인한 Email로 /견주,시터) 조회
	 * 4. 예약 삭제 
	 * 5.
	 */
	
	/**
	 * 1.예약 등록 Controller
	 * 사용자가 의뢰 신청버튼을 클릭했을 때 폼에 입력한 값과  로그인한 사용자의 정보를 전달하여 예약을 만든다.
	 * 	- 직접작성시는 비워둔다.
	 * 	- 검색을 통한 예약을 작성했을 때는 해당 시터의  이메일도 함께 전달하여 DB에 저장한다.
	 * @param res
	 * @return
	 */
	@RequestMapping("/member/reservation_add")
	public String addReservation(@ModelAttribute Reservation res, @RequestParam(name="demand") List<String> demandList, HttpSession session) {
		//1. 요청파라미터 받기(매개변수)
		//2. Business Logic
		System.out.println(res);
		System.out.println(demandList);
		service.addReservation(res, demandList);
		List<Dog> dogList = dogService.selectDogByEmail(res.getMemberEmail());
		session.setAttribute("dogList", dogList);
		session.setAttribute("resId", res.getResId());
		session.setAttribute("reservation", res);
		//3. View로 이동
		return "member/select_dog_reservation.tiles";
	}
	
	/**
	 * 3. 예약 조회 Controller 
	 * 매개변수로 받은 email로 예약 정보를 조회한다. 
	 * Business Logic 
	 * 1. 이메일로 예약 검색(member email컬럼에서 예약 조회) 
	 * 		1-a. 신청한 예약이 없는 경우 => sitter email 컬럼에서 조회 
	 * 		1-a-1. sitter email에도 없는경우 = 예약자체 정보 X => errorMessage 전달. 
	 * 2. 리스트 저장
	 * 3. view로 이동
	 * @param mEmail
	 * @return
	 */
	@RequestMapping("/member/search_reservation")
	public String searchReservation(@RequestParam String mEmail, Model model) {
		System.out.println(mEmail);
		List<Reservation> rlist = service.findMemberReservationByEmail(mEmail);
		if (rlist.isEmpty() || rlist == null) {
			rlist = service.findSitterReservationByEmail(mEmail);
			if (!rlist.isEmpty() && rlist != null) {
				System.out.println(rlist);
				model.addAttribute("sresList", rlist);
				return "member/search_reservation_result.tiles";
			} else {	
				String errorMessage = "조회된 예약이 없습니다.";
				model.addAttribute("errorMessage", errorMessage);
				return "member/search_reservation_result.tiles";
			}
		} else {
			System.out.println(rlist);
			model.addAttribute("mresList", rlist);
			return "member/search_reservation_result.tiles";
		}
	}
	/**
	 * 4. 예약 삭제 Controller
	 * 사용자가 예약 취소버튼을 누르게 되면 요청파라미터로 받은 예약 번호에 해당하는 예약을 삭제
	 * 실제 사용은 예약 취소 버튼을 누르면 이동하게끔
	 * 삭제하면 바로 리스트에서 없어지도록  해야 함 AJAX 처리 필요
	 * @param resId
	 * @return
	 */
	@RequestMapping("/member/delete_reservation")
	public ModelAndView removeReservation(@RequestParam int resId) {
		System.out.println(resId);
		if(service.findReservationById(resId) == null) {
			String error = "삭제할 예약이 없습니다.";
		return new ModelAndView("member/delete_reservation_result.tiles", "errorMessage", error);
		}
		service.removeReservation(resId);
		return new ModelAndView("member/delete_reservation_result.tiles");
	}
	
	/**
	 * 시터 마이페이지 - 예약 조회 - 간단히 보기
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("/sitter/select_reservation_simple")
	public String selectSimpleReservationSitter(@RequestParam String email, Model model) {
				String memberEmail = null;
				//견주한테 들어온 예약
				List<Reservation> res = service.findSitterReservationByEmail(email);
				
				for(int i = 0 ; i < res.size() ; i++) {
					memberEmail = res.get(i).getMemberEmail();
				}	
				
				//예약(정보)에 해당하는 견주의 강아지 정보
				List<Reservation> list = service.selectSimpleReservationSitter(email);
				for(Reservation res1 : list) {
					System.out.println(res1);
				}
				//견주 정보(이미지)
				Member member = memberService.selectMemberByEmail(memberEmail);
				//System.out.println(member);
				//시터에게 온 강아지 정보+예약정보
				model.addAttribute("list",list);
				//회원의 관한 정보(이미지)
				model.addAttribute("member", member);
		return "sitter/select_reservation_simple_result.tiles";
	}
	
	/**
	 * 시터 마이페이지 - 예약 조회 - 자세히 보기
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("/sitter/select_reservation_detail")
	public String selectDetailReservationSitter(@RequestParam String email, Model model) {
		//예약과 관련된 스킬
		List<Reservation> list = service.selectDetailReservationSitter(email);
		model.addAttribute("list", list);
		return "sitter/select_reservation_detail_result.tiles";
	}
	
	/**
	 * 견주 마이페이지 - 예약 조회 - 간단히 보기
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/select_reservation_simple")
	public String selectSimpleReservationMember(@RequestParam String email, Model model) {
		List<Reservation> list = service.selectSimpleReservationMember(email);
		model.addAttribute("list", list);
		return "member/select_reservation_simple_result.tiles";
	}
	
	/**
	 * 견주 마이페이지 - 예약 조회 - 자세히 보기
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/select_reservation_detail")
	public String selectDetailReservationMember(@RequestParam String email, Model model) {
		List<Reservation> list = service.selectDetailReservationMember(email);
		model.addAttribute("list", list);
		return "member/select_reservation_detail_result.tiles";
	}
	
	/**
	 * 관리자 페이지  - 예약 조회 - 간단히 보기
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/select_reservation_simple")
	public String selectSimpleReservationAdmin(@RequestParam String email, Model model) {
		List<Reservation> list = service.selectSimpleReservationAdmin();
		model.addAttribute("list", list);
		return "admin/select_reservation_simple_result.tiles";
	}
	
	/**
	 * 관리자 페이지 - 예약 조회 - 자세히 보기
	 * @param sitterEmail
	 * @param memberEmail
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/select_reservation_detail")
	public String selectDetailReservationAdmin(@RequestParam String sitterEmail, @RequestParam String memberEmail, Model model) {
		List<Reservation> list = service.selectDetailReservationAdmin(sitterEmail, memberEmail);
		model.addAttribute("list", list);
		return "admin/select_reservation_detail_result.tiles";
	}
}