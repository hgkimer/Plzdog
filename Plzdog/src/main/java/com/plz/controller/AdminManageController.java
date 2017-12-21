package com.plz.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
//관리자를 관리하느 컨트롤러
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.MemberService;
import com.plzdog.vo.Member;

@Controller
@RequestMapping("/admin/")
public class AdminManageController {

	@Autowired
	private MemberService service;

	/**
	 * 관리자를 등록하는 메소드.
	 * 등록 처리후 join_success.do로 redirect방식으로 이동 (MainController) - 요청파라미터로 등록된 userId 전송
	 * @param user
	 * @return
	*/
	
	@RequestMapping("register_admin")
	public ModelAndView registerAdmin(@ModelAttribute Member member,HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartFile ImageMember = member.getImageMember();
		if(ImageMember!=null && !ImageMember.isEmpty()) {
			//사진 저장할 디렉토리 
			String dir = request.getServletContext().getRealPath("/memberImage");
			String fileName = ImageMember.getOriginalFilename();
			File upImage = new File(dir, fileName);
			ImageMember.transferTo(upImage);
			member.setMemberImage(fileName);
		}
		service.insertMember(member, "ROLE_ADMIN");
		//redirect 방식이동시 model값은 요청파라미터로 전송된다.
		return new ModelAndView("redirect:/join_success.do","email", member.getEmail());
	}
	
	@RequestMapping("select_all_member")
	public String selectAllMember(Model model) {
		
		List<Member> memberList = service.findAllMemberJoinAuthority();
		
		model.addAttribute("memberList", memberList);
		return "admin/select_all_member_result.tiles";
	}
	
	/**
	 * 회원과 관련된 정보 삭제
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping("remove_member")
	@Transactional
	public String removeMember(@RequestParam String email, Model model) {
		
		service.deleteMember(email);
		
		//다시 조회 후 뿌림
		List<Member> memberList = service.findAllMemberJoinAuthority();
		
		model.addAttribute("memberList", memberList);
		return "admin/select_all_member_result.tiles";
	}
}
