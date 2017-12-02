package com.plz.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.plz.service.AuthorityService;
import com.plz.service.MemberService;
import com.plzdog.vo.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private AuthorityService aService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	/**
	 * 회원탈퇴
	 * 해당회원의 이메일을 받느다.
	 * 탈퇴후 탈퇴 완료 페이지로 이동
	 * @param member
	 * @param email
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("deleteMember")
	public String deleteMember(@RequestParam String email,ModelMap model) {
		
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		//권한을 지운다
		aService.removeAuthority(email);
		System.out.println(email);
		Member member = ((Member)authentication.getPrincipal());
		
		//0이면 탈퇴
		member.setMemberEnable(0);
		//로그 아웃
		context.setAuthentication(null);
		//회원 수정
		service.updateMember(member);
		
		model.addAttribute(email);
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
		Member member = service.selectSitterByEmail(email);
		System.out.println(member);
		boolean flag = false;
		if(member != null) {
			//시터인 경우
			flag= true;
			model.addAttribute("sitterFlag", flag);
			//사용자가 마지막으로 접근한 시터의 Email을 세션에 저장한다.
			model.addAttribute("profile", member);
			//ession.setAttribute("lastSitter", member.getEmail());
			return "member/profile.tiles";
		}else {
			//일반 견주일 경우
			member = service.selectMemberByEmail(email);
			System.out.println(member);
			model.addAttribute("profile", member);
			return "member/profile.tiles";
		}
	}	
	/**
	 * 사용자 정보 수정 - 관리자/회원 공통으로 자기 정보 수정시 사용.
	 * 수정할 정보와 현재 패스워드를 받는다.
	 * 수정후 mypage로 이동
	 * @param member
	 * @param oldMemberPassword
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("updateMember")
	public String updateMember(@ModelAttribute Member member, @RequestParam String oldMemberPassword, HttpServletRequest request, ModelMap model ) 
			throws IllegalStateException, IOException{
				//로그인 사용자의 정보 조회(password 비교를 위해)
				/*
				 * SecurityContext 는 인증 후 인증된 사용자의 정보를 저장하는 객체. servlet에서 Authentication를 가져와야 된다.
				 */
				SecurityContext context = SecurityContextHolder.getContext();
				Authentication authentication = context.getAuthentication();
//				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
					
				System.out.println(oldMemberPassword+"--"+((Member)authentication.getPrincipal()).getPassword());
				//패스워드 체크
				if(!passwordEncoder.matches(oldMemberPassword, ((Member)authentication.getPrincipal()).getPassword())){ 
					//정보수정 폼으로 이동
					model.addAttribute("errorMessage", "패스워드를 확인하세요");
					return "member/member_edit_form.tiles";
				}
				//변경 사진 처리
				MultipartFile memberImage = member.getImageMember();
				if(memberImage != null && ! memberImage.isEmpty()) {//업로드된 파일이 있는 경우 파일을 옮기고 파일명을 User에 설정
					String fileName = UUID.randomUUID().toString();	
					File dest = new File(request.getServletContext().getRealPath("/memberImage"), fileName);
					memberImage.transferTo(dest);
					member.setMemberImage(fileName);
				}
				//Business Logic 호출
				service.updateMember(member);
				/*
				 * 로그인 회원 정보가 변경 되었으므로 수정 처리후 Authentication 객체를 변경한다.
				 *  - 새로운 Authentication객체를 생성해서 Security Context에 넣는다. (변경)
				 *  - Authentication 객체 생성시 필요한 것 
				 *  	+ Principal의 VO : User 
				 *  	+ password
				 *  	+ 그 사용자의 권한 정보 : List<GrantedAuthority>
				 */
				//로그인 정보 (Authentication 객체) 변경. 
				//변경된 User정보를 SecurityContext에 넣는다. 
				if(member.getMemberImage() == null) {
					//사진 변경을 안한 경우 기존 로그인 정보에 있는 파일명으로 설정.
					member.setMemberImage(((Member)authentication.getPrincipal()).getMemberImage());
				}
				
				//권한(Authority) 변경 또는 추가 시
				List<GrantedAuthority> list = new ArrayList<>(authentication.getAuthorities());
				UsernamePasswordAuthenticationToken newAutentication = 
						new UsernamePasswordAuthenticationToken(member,member.getPassword(), list);
				context.setAuthentication(newAutentication);
				
				return "member/member_result_form.tiles";
	}
}
