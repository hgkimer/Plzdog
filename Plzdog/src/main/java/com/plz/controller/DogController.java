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

import com.plz.service.DogService;
import com.plz.service.MemberService;
import com.plzdog.vo.Care;
import com.plzdog.vo.Dog;

@Controller
@RequestMapping("/dog/")
public class DogController {

	@Autowired
	private DogService service;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("insert_dog")
	@Transactional
	public String insertDog(@ModelAttribute Dog dog, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		service.insertDog(dog, request);
		return "dog/insert_result";
	}
	
	@RequestMapping("select_dog")
	public String selectDog(@RequestParam String email, ModelMap model) {
		if(memberService.selectMemberByEmail(email) != null) {
			List<Dog> dogList = service.selectDogByEmail(email);
			model.addAttribute("dogList", dogList);
			return "dog/select_result";
		} else {
			String errorMessage = "없는 email입니다.";
			model.addAttribute("errorMessage", errorMessage);
			return "dog/select_result";
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
