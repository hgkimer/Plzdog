package com.plz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.MemberService;
import com.plzdog.vo.Member;
@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("join_member")
	public ModelAndView joinMember(@ModelAttribute Member member ) {
		service.addMember(member);
		return new ModelAndView("redirect:/join_success.do", "memberEmail", member.getEmail());
	}
}
