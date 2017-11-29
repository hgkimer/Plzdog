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
import com.plzdog.vo.Authority;
import com.plzdog.vo.Member;

@Controller
@RequestMapping("/sitter/")
public class SitterController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private AuthorityService authorityService;

	/**
	 * 관리자 승인 : 시터등록을 신청한 사람들의 권한을 견주에서 시터로 바꿔주는 메소드
	 * @param authority 시터 권한으로 받는다.
	 * @param model
	 * @return
	 */
	@RequestMapping("enroll_sitter")
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
	@RequestMapping("insert_sitter")
	public String insertSitter(@ModelAttribute Member sitter, @RequestParam String role, ModelMap model) {
		service.insertMember(sitter, role);
		model.addAttribute("sitter", sitter);
		return "sitter/sitter_register_result.tiles";
	}
	
	@RequestMapping("update_sitter")
	public String updateSitter(@ModelAttribute Member sitter, ModelMap model) {
		if(service.selectMemberByEmail(sitter.getEmail()) != null) {
			service.updateMember(sitter);
			model.addAttribute("sitter", sitter);
			return "sitter/sitter_update_result.tiles";
		} else {
			return "sitter/sitter_update_error.tiles";
		}
	}
	
	@RequestMapping("delete_sitter")
	public String deleteSitter(@RequestParam String email, Model model) {
		service.deleteMember(email);
		model.addAttribute(email);
		return "sitter/sitter_delete_result.tiles";
	}
	
	@RequestMapping("select_all_sitter")
	public String selectAllSitter(ModelMap model) {
		List<Member> sitterList = service.selectAllSiiter();
		model.addAttribute("sitterList", sitterList);
		return "sitter/sitter_select_result.tiles";
	}
	
	@RequestMapping("select_sitter_name")
	public String selectSitterByName(@RequestParam String name, ModelMap model) {
		List<Member> sitterList = service.selectSitterByName(name);
		model.addAttribute("sitterList", sitterList);
		return "sitter/sitter_select_result.tiles";
	}
	
	@RequestMapping("select_sitter_email")
	public String selectSitterByEmail(@RequestParam String email, ModelMap model) {
		Member sitter = service.selectSitterByEmail(email);
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
