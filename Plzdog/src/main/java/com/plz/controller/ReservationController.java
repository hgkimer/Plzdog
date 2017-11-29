package com.plz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plz.service.ReservationService;
import com.plzdog.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	@RequestMapping("/reservation/select")
	public String selectMemberReservationByEmail(@RequestParam String email, ModelMap model) {
		List<Reservation> list = service.findMemberReservationByEmail(email);
		model.addAttribute("list", list);
		return "test/res_success.tiles";
	}
	
}
