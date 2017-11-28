package com.plz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plz.service.CareService;
import com.plzdog.vo.Care;

@Controller
public class CareController {

	@Autowired
	private CareService service;
	
	@RequestMapping("/care/select_care")  //매개변수를 VO로 받을 땐 @ModelAttribute
	//request.getParameter
	public String selectCareJoinCareImage(@RequestParam int careId, ModelMap model) throws Exception {
		List<Care> list = service.selectCareJoinCareImage(careId);
		for(Care c : list) {
			System.out.println(c);
		}
		//request.Dispatcher
		model.addAttribute("list", list);
		return "test/dog_success.tiles";
	}
}