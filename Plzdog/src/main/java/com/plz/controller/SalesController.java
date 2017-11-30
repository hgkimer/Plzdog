package com.plz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.plz.service.ReservationService;
import com.plz.service.SalesService;

@Controller
public class SalesController {

	@Autowired
	private SalesService salesService;
	
	@Autowired
	private ReservationService reservationService;
}
