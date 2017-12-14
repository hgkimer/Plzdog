package com.plz.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.CareService;
import com.plz.service.ReservationService;
import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

@Controller
@RequestMapping("/care/")
public class CareController {

	@Autowired
	private CareService service;
	
	@Autowired
	private ReservationService Rservice;
	
	/*@RequestMapping("select_care")  //매개변수를 VO로 받을 땐 @ModelAttribute
	//request.getParameter
	public String selectCareJoinCareImage(@RequestParam int resId, ModelMap model) throws Exception {
		List<Care> list = service.selectCareJoinCareImage(resId);
		for(Care c : list) {
			System.out.println(c);
		}
		//request.Dispatcher
		model.addAttribute("list", list);
		return "sitter/care_success.tiles";
	}*/
	
	@RequestMapping("care_image_result")
	public ModelAndView uploadSuccess(@RequestParam int careId) {
		List<Care> careList = service.selectCareJoinCareImage(careId);
		return new ModelAndView("sitter/care_success.tiles", "careList", careList);
	}
	
	
}