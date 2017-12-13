package com.plz.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plz.service.DogService;
import com.plz.service.MemberService;
import com.plzdog.vo.Code;
import com.plzdog.vo.Dog;

@Controller
@RequestMapping("/dog/")
public class DogController {

	@Autowired
	private DogService service;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("insertDog")
	public String insertDog(@ModelAttribute Dog dog, @RequestParam(name="dogCodeList") List<String> dogCodeList,
			HttpServletRequest request, ModelMap model) throws IllegalStateException, IOException {
		model.addAttribute(dog);
		model.addAttribute("codeList",service.addDog(dog, dogCodeList, request));
		return "member/mydog_register_result_form.tiles";
	}
	
	@RequestMapping("select_dog")
	public String selectDog(@RequestParam String email, ModelMap model) {
		if(memberService.findMemberByEmail(email) != null) {
			List<Dog> dogList = service.selectDogByEmail(email);
			model.addAttribute("dogList", dogList);
			return "dog/mydog_into";
		} else {
			String errorMessage = "없는 email입니다.";
			model.addAttribute("errorMessage", errorMessage);
			return "dog/mydog_into";
		}
	}
	
	@RequestMapping("update_dog")
	public String updateDog(@ModelAttribute Dog dog, Model model) {
		if(service.selectDogByEmail(dog.getEmail()) != null) {
			service.updateDog(dog);
			model.addAttribute("dog", dog);
			return "dog/update_result";
		} else {
			String errorMessage = "없는 email입니다.";
			model.addAttribute("errorMessage", errorMessage);
			return "dog/update_result";
		}
	}
	
//	@RequestMapping("delete_dog")
//	public 
}
