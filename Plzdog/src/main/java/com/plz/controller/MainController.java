package com.plz.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.plz.service.MemberService;
import com.plzdog.vo.Member;

/*
 *   /member/ 나 /admin/ 으로 요청하지 않는 작업을 처리하기 위한 컨트롤러 
 *   인증이 필요없는 작업 처리
 */
@Controller
public class MainController {
	@Autowired
	private MemberService service;
	
	/**
	 * 회원 등록(가입)
	 * 회원은 사진업로드를 하므로 처리한다.
	 * 처리후 join_success.do를 이용해 응답 처리 - redirect방식 이동, 요청파라미터로 등록된 userId 전달
	 * @param member
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("join_member")
	public ModelAndView joinMember(@ModelAttribute Member member, HttpServletRequest request
			) throws IllegalStateException, IOException{
				//파일 업로드 처리
				MultipartFile ImageMember = member.getImageMember();
				if(ImageMember!=null && !ImageMember.isEmpty()) {
					//사진 저장할 디렉토리 
					String dir = request.getServletContext().getRealPath("/memberImage");
					String fileName = ImageMember.getOriginalFilename();
					File upImage = new File(dir, fileName);
					ImageMember.transferTo(upImage);
					member.setMemberImage(fileName);
				}
				//member의 회원 탈퇴 여부 1 : 탈퇴 X , 0 : 탈퇴 O
				member.setMemberEnable(1);
				System.out.println(member);
				//DB
				service.insertMember(member, "ROLE_MEMBER");
				//redirect 방식은 tilesViewer방식이 아닌 일반 ViewResolver로 가기 때문에 
				//회원 가입 완료를 보여주는 handler를 만들어서 요청 리다리렉트 방식으로 요청파라미터로 email보냄
				return new ModelAndView("redirect:/join_success.do","email",member.getEmail());
			}
		
		/**
		 * 가입 성공후 성공정보를 보여주기 위한 handler 메소드
		 * 
		 * @param userId
		 * @return
		 */
		@RequestMapping("join_success")
		public ModelAndView joinSuccess(@RequestParam String email) {
			Member member = service.selectMemberByEmail(email);
			System.out.println(member);
			return new ModelAndView("join_success.tiles","member",member);
		}
	}
