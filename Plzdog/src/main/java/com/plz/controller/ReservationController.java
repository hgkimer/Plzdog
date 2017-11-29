package com.plz.controller;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plz.service.ReservationService;
import com.plzdog.vo.Reservation;


@Controller
public class ReservationController {
	@Autowired
	private ReservationService service;

	/**
	 * 예약 관련 Controller 
	 * 1. 예약 등록(견주, 시터) 
	 * 2. 예약 상태 변경 
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
	@RequestMapping("/member/reservation_register")
	public String addReservation(@ModelAttribute Reservation res) {
		service.addReservation(res);
		return "member/add_reservation_success.tiles";
	}
	
	@RequestMapping
	public String changeReservation() {
		return null;
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
	public String removeReservation(@RequestParam int resId) {
		System.out.println(resId);
		service.removeReservation(resId);
		return "member/delete_reservation_result.tiles";
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
}
































