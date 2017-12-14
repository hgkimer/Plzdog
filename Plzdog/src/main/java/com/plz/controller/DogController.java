package com.plz.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.DogService;
import com.plz.service.MemberService;
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
		return "dog/mydog_register_result_form.tiles";
	}
	
	@RequestMapping("select_dog")
	public String selectDog(@RequestParam String email , ModelMap model) {
		if(memberService.findMemberByEmail(email) != null) {
			List<Dog> dogList = service.selectDogByEmail(email);
			model.addAttribute("dogList", dogList);
			for(Dog dog : dogList) {
				System.out.println(dog);
			}
			return "dog/mydog_into.tiles";
		} else {
			String errorMessage = "없는 email입니다.";
			model.addAttribute("errorMessage", errorMessage);
			return "dog/mydog_into.tiles";
		}
	}
	
	@RequestMapping("select_dog_dogInfo_dogImage")
	public String selectDogDogInfoDogImage(@RequestParam int dogId , ModelMap model) {
			Dog dog = service.findDogJoinDogInfoDogImageByDogId(dogId);
			model.addAttribute("dog", dog);
			return "dog/mydog_edit_form.tiles";
	}
	
	@RequestMapping("update_dog")
	public String updateDog(@ModelAttribute Dog dog, Model model) {
		if(service.selectDogByEmail(dog.getEmail()) != null) {
			service.updateDog(dog);
			model.addAttribute("dog", dog);
			return "dog/mydog_edit_form.tiles";
		} else {
			String errorMessage = "없는 email입니다.";
			model.addAttribute("errorMessage", errorMessage);
			return "dog/mydog_edit_form.tiles";
		}
	}
	
	@RequestMapping("delete_dog")
	public ModelAndView deleteDog(@RequestParam int dogId) {
		service.deleteDog(dogId);
		return new ModelAndView("dog/delete_result.tiles");
	}

}
