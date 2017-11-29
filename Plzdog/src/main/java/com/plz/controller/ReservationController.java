package com.plz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.ReservationService;
import com.plzdog.vo.Reservation;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService service;

	/**
	 * 예약 관련 Controller 1. 예약 등록(견주, 시터) 2. 예약 상태 변경 3. 예약 전체 조회 (로그인한 Email로 /견주,
	 * 시터) 4. 예약 삭제(??) 5.
	 */
	/**
	 * 예약 조회 Controller 매개변수로 받은 email로 예약 정보를 조회한다. 
	 * Business Logic 
	 * 1. 이메일로 예약 검색(member email컬럼에서 예약 조회) 
	 * 		1-a. 신청한 예약이 없는 경우 => sitter email 컬럼에서 조회 
	 * 		1-a-1. sitter email에도 없는경우 = 예약자체 정보 X => errorMessage 전달. 
	 * 2. 리스트 저장
	 * 
	 * @param mEmail
	 * @return
	 */
	@RequestMapping("/member/search_reservation")
	public ModelAndView searchReservation(@RequestParam String mEmail) {
		List<Reservation> rlist = service.findMemberReservationByEmail(mEmail);
		if (rlist.isEmpty() || rlist == null) {
			rlist = service.findSitterReservationByEmail(mEmail);
			if (!rlist.isEmpty() && rlist != null) {
				return new ModelAndView("/member/search_reservation.tiles", "sresList", rlist);
			} else {
				String errorMessage = "조회된 예약이 없습니다.";
				return new ModelAndView("/member/search_reservation.tiles", "errorMessage", errorMessage);
			}
		} else {
			return new ModelAndView("/member/search_reservation.tiles", "mresList", rlist);
		}
	}
}
































