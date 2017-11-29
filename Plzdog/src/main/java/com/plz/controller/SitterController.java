package com.plz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plz.service.AuthorityService;
import com.plz.service.MemberService;
import com.plz.service.SitterService;
import com.plzdog.vo.Authority;
import com.plzdog.vo.Member;
import com.plzdog.vo.Sitter;

@Controller
public class SitterController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SitterService sitterService;
	
	@Autowired
	private AuthorityService authorityService;

	/**
	 * 관리자 승인 : 시터등록을 신청한 사람들의 권한을 견주에서 시터로 바꿔주는 메소드
	 * @param authority 시터 권한으로 받는다.
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/enroll_sitter")
	public String enrollSitter(@ModelAttribute Authority authority, ModelMap model) {
		authorityService.updateAuthority(authority);
		model.addAttribute(authority.getEmail());
		return "admin/sitter_enroll_result.tiles";
	}
	
	/**
	 * 관리자 승인 이전의 시터 등록 : 시터 정보는 저장되지만 권한은 견주의 권한으로 받는다.
	 * @param sitter
	 * @param role 견주 권한으로 받는다.
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/insert_sitter")
	public String insertSitter(@ModelAttribute Sitter sitter, ModelMap model) {
		System.out.println(sitter);
		sitterService.insertSitter(sitter);
		model.addAttribute("sitter", sitter);
		return "sitter/sitter_register_result.tiles";
	}
	
	@RequestMapping("/sitter/update_sitter")
	public String updateSitter(@ModelAttribute Member sitter, ModelMap model) {
		if(memberService.selectMemberByEmail(sitter.getEmail()) != null) {
			memberService.updateMember(sitter);
			model.addAttribute("sitter", sitter);
			return "sitter/sitter_update_result.tiles";
		} else {
			return "sitter/sitter_update_error.tiles";
		}
	}
	
	@RequestMapping("/admin/delete_sitter")
	public String deleteSitter(@RequestParam String email, Model model) {
		memberService.deleteMember(email);
		model.addAttribute(email);
		return "sitter/sitter_delete_result.tiles";
	}
	
	@RequestMapping("/member/select_all_sitter")
	public String selectAllSitter(ModelMap model) {
		List<Member> sitterList = memberService.selectAllSiiter();
		model.addAttribute("sitterList", sitterList);
		return "sitter/sitter_select_result.tiles";
	}
	
	@RequestMapping("/member/select_sitter_name")
	public String selectSitterByName(@RequestParam String name, ModelMap model) {
		List<Member> sitterList = memberService.selectSitterByName(name);
		model.addAttribute("sitterList", sitterList);
		return "sitter/sitter_select_result.tiles";
	}
	
	@RequestMapping("/member/select_sitter_email")
	public String selectSitterByEmail(@RequestParam String email, ModelMap model) {
		Member sitter = memberService.selectSitterByEmail(email);
		if(sitter != null) {
			model.addAttribute("sitter", sitter);
			return "sitter/sitter_select_result.tiles";
		} else {
			String errorMessage = "없는 email입니다.";
			model.addAttribute("errorMessage", errorMessage);
			return "sitter/sitter_select_result.tiles";
		}
	}
}
