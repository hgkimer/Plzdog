package com.plz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.plz.service.MemberService;
import com.plzdog.vo.Member;

/*
 *   /member/ 나 /admin/ 으로 요청하지 않는 작업을 처리하기 위한 컨트롤러 
 *   인증이 필요없는 작업 처리
 */
@Controller
public class mainController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("join_member")
	public String joinMember(@ModelAttribute Member member, ModelMap model ) {
		//member의 회원 탈퇴 여부 1 : 탈퇴 X , 0 : 탈퇴 O
		member.setMemberEnable(1);
		//DB
		service.insertMember(member,"ROLE_MEMBER");
		//rquest영역
		model.addAttribute(member);
		return "member/join_success.tiles";
	}
}
