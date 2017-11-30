package com.plz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plz.service.MemberService;
import com.plz.service.SitterService;
import com.plzdog.vo.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private SitterService sService;
	
	//회원 탈퇴
	@RequestMapping("deleteMember")
	public String deleteMember(@RequestParam String email) {
		mService.deleteMember(email);
		System.out.println(email);
		return "member/delete_success.tiles";
	}
	
	/**
	 * 회원 프로필 Controller
	 * 	- email을 요청파라미터로 받아 회원의 정보를 찾은 다음 request에 저장한 뒤 view에서 출력
	 * 	- sitter인 경우 sitter를 구분할 수 있는 flag를 requestScope에 저장한 뒤 view로 이동
	 * 		- 마지막으로 접근한 시터 Profile의 email을 sessionScope에 저장 -> 예약 등록시 사용한 뒤 session에서 삭제
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("goToProfile")
	public String goToProfile(@RequestParam String email, Model model, HttpSession session) {
		//먼저 sitter에 등록되어 있는지 확인한다.
		Member member = mService.selectSitterByEmail(email);
		System.out.println(member);
		boolean flag = false;
		if(member != null) {
			//시터인 경우
			flag= true;
			model.addAttribute("sitterFlag", flag);
			//사용자가 마지막으로 접근한 시터의 Email을 세션에 저장한다.
			model.addAttribute("lastSitter", member.getEmail());
			session.setAttribute("profile", member);
			return "member/profile.tiles";
		}else {
			//일반 견주일 경우
			member = mService.selectMemberByEmail(email);
			System.out.println(member);
			model.addAttribute("profile", member);
			return "member/profile.tiles";
		}
		
	}
}
