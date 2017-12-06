package com.plz.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.DogService;
import com.plz.service.MemberService;
import com.plz.service.ReservationService;
import com.plzdog.vo.Dog;
import com.plzdog.vo.Member;
import com.plzdog.vo.Reservation;


@Controller
public class ReservationController {
	@Autowired
	private ReservationService rService;
	@Autowired
	private DogService dogService;
	@Autowired
	private MemberService memberService;
	
	
	/**
	 * 시터인지 아닌지 확인한 뒤 예약 등록 폼으로 전달하는 Contoller
	 * 	- 예약 등록 폼에서 sitter인 경우 시터가 입력한 방문 및 위탁 돌봄 가격의 정보를 가져오기 위함.
	 * @param sitterEmail
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/checkSitter")
	public String checkSitter(@RequestParam String sitterEmail, Model model) {
		//시터인지 체크하고 시터의 정보를 저장하는 메소드.
		//시터 O => 회원정보 및 시터정보 들어있음.
		//시터 X => null
		Member sitter = rService.checkSitter(sitterEmail);
		//예약 등록 폼에서는 EL을 쓸거기 때문에 Null로 리턴 시킴 = 시터 아니면 값 없음.
		model.addAttribute("sitter", sitter);
		return "member/reservation_add_form.tiles";
	}
	/**
	 * 예약 등록 화면에서 회원의 강아지 정보를 AJAX 처리 하기 위한 Controller
	 * @param email
	 * @return
	 */
	@RequestMapping("/member/find_dog_reservation")
	@ResponseBody
	public List<Dog> findMyDog(String email){
		List<Dog> dogList = dogService.selectDogByEmail(email);
		return dogList;
	}
	
	/**
	 * 예약 등록 Controller
	 * 사용자가 의뢰 신청버튼을 클릭했을 때 폼에 입력한 값과  로그인한 사용자의 정보를 전달하여 예약을 만든다.
	 * 	- 직접작성시는 비워둔다.
	 * 	- 검색을 통한 예약을 작성했을 때는 해당 시터의  이메일도 함께 전달하여 DB에 저장한다.
	 * @param res
	 * @return
	 */
	@RequestMapping("/member/reservation_add")
	public String addReservation(@ModelAttribute Reservation res, @RequestParam(name="demand") List<String> demandList,  @RequestParam(name="mydog")List<Integer> dogList) {
		//1. 요청파라미터 받기(매개변수)
		//2. Business Logic
		rService.addReservation(res, demandList, dogList);
		//3. View로 이동
		return "member/reservation_add_success.tiles";
	}
	
	/**
	 * 예약 조회 Controller 
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
		List<Reservation> rlist = rService.findMemberReservationByEmail(mEmail);
		if (rlist.isEmpty() || rlist == null) {
			rlist = rService.findSitterReservationByEmail(mEmail);
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
	 * 예약 삭제 Controller
	 * 사용자가 예약 취소버튼을 누르게 되면 요청파라미터로 받은 예약 번호에 해당하는 예약을 삭제
	 * 실제 사용은 예약 취소 버튼을 누르면 이동하게끔
	 * 삭제하면 바로 리스트에서 없어지도록  해야 함 AJAX 처리 필요
	 * @param resId
	 * @return
	 */
	@RequestMapping("/member/delete_reservation")
	public ModelAndView removeReservation(@RequestParam int resId) {
		System.out.println(resId);
		if(rService.findReservationById(resId) == null) {
			String error = "삭제할 예약이 없습니다.";
		return new ModelAndView("member/delete_reservation_result.tiles", "errorMessage", error);
		}
		rService.removeReservation(resId);
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
				//시터이메일 해당하는 예약
				//견주가 시터한테 신청한 예약
				List<Reservation> list = rService.findSitterReservationByEmail(email);
				
				//예약(정보)에 해당하는 견주의 강아지 정보
				List<Member> memberList = new ArrayList<>();
				for(Reservation res1 : list) {
					 memberList.add(memberService.findMemberByEmail(res1.getMemberEmail()));
				}
				
				//시터에게 온 강아지 정보+예약정보
				model.addAttribute("list",list);
				//시터에게 온 회원 + 강아지 정보
				model.addAttribute("memberList",memberList);
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
		List<Reservation> list = rService.selectDetailReservationSitter(email);
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
		List<Reservation> list = rService.selectSimpleReservationMember(email);
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
		List<Reservation> list = rService.selectDetailReservationMember(email);
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
		List<Reservation> list = rService.selectSimpleReservationAdmin();
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
		List<Reservation> list = rService.selectDetailReservationAdmin(sitterEmail, memberEmail);
		model.addAttribute("list", list);
		return "admin/select_reservation_detail_result.tiles";
	}
}