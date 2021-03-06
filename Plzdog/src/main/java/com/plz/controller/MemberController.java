package com.plz.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.plz.service.AuthorityService;
import com.plz.service.DogService;
import com.plz.service.MemberService;
import com.plz.service.ReviewService;
import com.plzdog.vo.Member;
import com.plzdog.vo.Review;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private AuthorityService aService;
	
	@Autowired
	private DogService dService;
	
	@Autowired
	private ReviewService rService;
	
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
		//aService.removeAuthority(email);
		Member member = ((Member)authentication.getPrincipal());
		
		//0이면 탈퇴
		member.setMemberEnable(0);
		//로그 아웃
		context.setAuthentication(null);
		//회원 수정
		service.updateMember(member);
		
		model.addAttribute("memberName",member.getMemberName());
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
		//System.out.println(email);
		
		//일반 회원으로 조회를 할 경우 mapper에서 sitter테이블이 없으므로 null값이 출력 된다.
		Member member = service.findMemberByEmail(email);
		
		if(member.getAuthorityList().size() == 2) { //시터라면
		//if(member.ggtSitter().getEmail() != null) {//시터라면,
			member = service.selectSitterByEmail(email);
			//시터임을 나타내는 flag를 scope에 저장
			model.addAttribute("sitterFlag", true);
			//강아지들 정보 저장.
			member.setDogList(dService.selectDogByEmail(email));
			
			List<Review> reviewList = rService.findReviewBySitterEmail(email);
			
			//작성자 이름 저장
			if(reviewList != null) {
				for(Review review : reviewList) {
					review.setMemberName(service.findMemberByEmail(review.getMemberEmail()).getMemberName());
				}
			}
			
			//해당 시터의 리뷰 정보 저장.
			member.setReviewList(reviewList);
			
			
		}else {
			//일반회원의 경우
			member = service.findMemberByEmail(email);
			member.setDogList(dService.selectDogByEmail(email));
		}
		//회원정보 scope에 저장.
		model.addAttribute("profile", member);
		return "member/profile.tiles";
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
	
	/**
	 * 모든 시터 조회(skill, dog 포함)
	 * @param model
	 * @return
	 */
	@RequestMapping("select_all_sitter")
	public String selectAllSitter(String email, ModelMap model) {
		List<Member> sitterList = new ArrayList<>();
		
		for(Member member : service.selectAllSitter()) {
			//ROLE_MEMBER, ROLE_SITTER
			if(member.getAuthorityList().size() == 2) {
				sitterList.add(member);
				if(member.getEmail().equals(email)) {
					sitterList.remove(member);
					
				}
			}
		}
		model.addAttribute("sitterList", sitterList);
		return "sitter/sitter_select_result.tiles";
	}
	
	@RequestMapping("find_sitter")
	public @ResponseBody List<Member> findSitter(@RequestParam(value="checkArray[]") List<String> checkArray,
				@RequestParam(value="selectService") String selectService ){
		//전체 시터
		List<Member> sitterList = new ArrayList<>();
		//체크된 code 저장 변수
		List<String> checkList = new ArrayList<>();
		//비교 code 저장 변수
		List<String> compareList = new ArrayList<>();
		//각 코드의 id
		String code;
		
		//선택된 code를 합친다.
		checkList.add(selectService);
		for(int i=0 ; i < checkArray.size() ; i++) {
			checkList.add(checkArray.get(i));
		}
		
		for(Member member : service.selectAllSitter()) {
			//ROLE_MEMBER, ROLE_SITTER
			if(member.getAuthorityList().size() == 2) {
				//member가 가진 전체 스킬 정보
				//compareList 초기화
				compareList = new ArrayList<>();
				for(int i=0; i< member.getSitter().getSkillList().size() ; i++) {
					code = member.getSitter().getSkillList().get(i).getCode().getCode();
					for(int j=0; j < checkList.size() ; j++) {
						if(checkList.get(j).equals(code)) {
							compareList.add(code);
						}
					}
				}
			}
			//checkList가 가진 모든 것을 포함하면 true
			if(compareList.containsAll(checkList)){
				sitterList.add(member);
			}
		}
		return sitterList;
	}
	
	/**
	 * 리뷰 등록
	 * reviewDate를 받지를 못한다.
	 * Date는 @ModelAttrubute를 사용해야 한다.
	 * @param review
	 * @param model
	 * @return
	 */
	@RequestMapping("insert_review")
	@Transactional
	public String registerReview(@ModelAttribute Review review,Model model) {
		
		//현재 시간으로 변환
		review.setReviewDate(new Date());
		rService.addReview(review);
		
		Member member = rService.refreshProfile(review);
		
		model.addAttribute("profile", member);
		return "member/profile.tiles";
	}
	
	/**
	 * 리뷰 수정
	 * @param review
	 * @param model
	 * @return
	 */
	@RequestMapping("update_review")
	@Transactional
	public String updateReview(@RequestParam(name="reviewRate") List<Integer> reviewRate,String reviewContents,
			String sitterEmail,String memberEmail,int reviewId, Model model) {
		
		Review review = new Review(reviewId,reviewRate.get(0),reviewContents,sitterEmail,memberEmail,new Date());
		rService.updateReview(review);
		
		Member member = service.selectSitterByEmail(sitterEmail);
		//강아지들 정보 저장.
		member.setDogList(dService.selectDogByEmail(sitterEmail));
		//해당 시터의 리뷰 정보 조회
		List<Review> reviewList = rService.findReviewBySitterEmail(sitterEmail);
		
		//작성자 이름 저장
		if(reviewList != null) {
			for(Review r : reviewList) {
				r.setMemberName(service.findMemberByEmail(r.getMemberEmail()).getMemberName());
			}
		}
		
		//해당 시터의 리뷰 정보 저장.
		member.setReviewList(reviewList);
		
		model.addAttribute("profile", member);
		return "member/profile.tiles";
	}
	
	/**
	 * 리뷰 삭제
	 * @param review
	 * @param model
	 * @return
	 */
	@RequestMapping("delete_review")
	@Transactional
	public String deleteReview(@RequestParam int reviewId,@RequestParam String sitterEmail , Model model) {
		rService.removeReview(reviewId);
		
		Member member = service.selectSitterByEmail(sitterEmail);
		//시터임을 나타내는 flag를 scope에 저장
		model.addAttribute("sitterFlag", true);
		//강아지들 정보 저장.
		member.setDogList(dService.selectDogByEmail(sitterEmail));
		//해당 시터의 리뷰 정보 조회
		List<Review> reviewList = rService.findReviewBySitterEmail(sitterEmail);
		
		//작성자 이름 저장
		if(reviewList != null) {
			for(Review r : reviewList) {
				r.setMemberName(service.findMemberByEmail(r.getMemberEmail()).getMemberName());
			}
		}
		
		//해당 시터의 리뷰 정보 저장.
		member.setReviewList(reviewList);
		
		model.addAttribute("profile", member);
		return "member/profile.tiles";
	}

}
