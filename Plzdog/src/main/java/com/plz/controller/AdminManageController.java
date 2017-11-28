package com.plz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
//관리자를 관리하느 컨트롤러
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.AuthorityService;
import com.plz.service.MemberService;
import com.plzdog.vo.Authority;
import com.plzdog.vo.Member;

@Controller
@RequestMapping("/admin/")
public class AdminManageController {

	@Autowired
	private AuthorityService service;

	/**
	 * 관리자를 등록하는 메소드.
	 * 등록 처리후 join_success.do로 redirect방식으로 이동 (MainController) - 요청파라미터로 등록된 userId 전송
	 * @param user
	 * @return
	 */
	@RequestMapping("register_admin")
	public ModelAndView registerAdmin(@ModelAttribute Member member) {
		service.addAuthority(new Authority(member.getEmail(), "ROLE_ADMIN"));
		//redirect 방식이동시 model값은 요청파라미터로 전송된다.
		return new ModelAndView("redirect:/join_success.do", "member", member);
	}
}