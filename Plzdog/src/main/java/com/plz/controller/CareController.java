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
//@RequestMapping("/care/")
public class CareController {

	@Autowired
	private CareService service;
	
	private ReservationService Rservice;
	
	@RequestMapping("select_care")  //매개변수를 VO로 받을 땐 @ModelAttribute
	//request.getParameter
	public String selectCareJoinCareImage(@RequestParam int careId, ModelMap model) throws Exception {
		List<Care> list = service.selectCareJoinCareImage(careId);
		for(Care c : list) {
			System.out.println(c);
		}
		//request.Dispatcher
		model.addAttribute("list", list);
		return "sitter/care_success.tiles";
	}
	
	@RequestMapping("/sitter/insert_care")
	public String insertCare(@ModelAttribute Care care,
			HttpServletRequest request,ModelMap model) throws IllegalStateException, IOException {
			List<String> list = new ArrayList<>();
		//service.insertCareImage(new CareImage(care.getCareId(),fileName));
		service.insertCare(care,request);
		model.addAttribute(care);
		return "sitter/care_register_result_form.tiles";
	}
	
	/*@RequestMapping("insert_care")
	public String insertCare(@ModelAttribute Care care, ModelMap model) {
		service.insertCare(care);
		if(service.selectCareJoinCareImage(care.getCareId()) != null) {
			model.addAttribute(model);
			return "sitter/care_success.tiles";
		} else {
			return "sitter/fail.tiles";
		}
	}*/
	
	/*@RequestMapping("insert_image")
	public ModelAndView insertCareImage(@ModelAttribute CareImage ci, HttpServletRequest request) throws Exception {
		System.out.println(ci);
		MultipartFile careImage = ci.getImageCare();
		System.out.println(ci.getImageCare());
		if(ci.getImageCare() != null && !ci.getImageCare().isEmpty()) {
//																C:\Java\apache-tomcat-8.0.47\webapps\Plzdog 여기까지 알려줌
			String dir = request.getServletContext().getRealPath("/image");
			String fileName = careImage.getOriginalFilename();
			File upImage = new File(dir, fileName);
			careImage.transferTo(upImage);
			ci.setImageName(fileName);
			System.out.println(3);
		}
		System.out.println(4);
		return new ModelAndView("redirect:/care_image_result.do", "careId", ci.getCareId());
	}*/
	
	@RequestMapping("care_image_result")
	public ModelAndView uploadSuccess(@RequestParam int careId) {
		List<Care> careList = service.selectCareJoinCareImage(careId);
		return new ModelAndView("sitter/care_success.tiles", "careList", careList);
	}
	
	@RequestMapping("update_care")
	public String updateCare(@ModelAttribute Care care, ModelMap model) {
		if(service.selectCareJoinCareImage(care.getResId()) != null) {
//			
			service.updateCare(care);
			model.addAttribute(care);
			return "sitter/care_success.tiles";
		} else {
			return "sitter/fail.tiles";
		}
	}
}