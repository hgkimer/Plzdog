package com.plz.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	public String joinMember(@ModelAttribute Member member, HttpServletRequest request,
			ModelMap model ) throws AuthenticationException{
				/*//파일 업로드 처리
				MultipartFile memberImage = (MultipartFile)member.getMemberImage();
				if(memberImage!=null && !memberImage.isEmpty()) {
					//사진 저장할 디렉토리 
					String dir = request.getServletContext().getRealPath("/memberImage");
					String fileName = memberImage.getOriginalFilename();
					File upImage = new File(dir, fileName);
					memberImage.transferTo(upImage);
					member.setMemberImage(fileName);
				}*/
				//member의 회원 탈퇴 여부 1 : 탈퇴 X , 0 : 탈퇴 O
				member.setMemberEnable(1);
				//DB
				service.insertMember(member, "ROLE_MEMBER");
				model.addAttribute(member);
				return "member/join_success.tiles";
			} 
	}
