package com.plz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plz.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService service;
	
	//회원 탈퇴
	@RequestMapping("deleteMember")
	public String deleteMember(@RequestParam String email) {
		service.deleteMember(email);
		System.out.println(email);
		return "member/delete_success.tiles";
	}
}
