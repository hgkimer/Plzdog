package com.plz.service;

import java.util.List;

import com.plzdog.vo.Member;
import com.plzdog.vo.Review;

public interface MemberService{
	/**
	 * 한 명의 회원을 등록하는 메소드
	 * @param member
	 */
	void insertMember(Member member , String role);
	/**
	 * 매개변수로 받은 회원의 정보를 삭제하는 메소드
	 * @param email
	 */
	void deleteMember(String email);
	/**
	 * 매개변수로 받은 회원의 정보를 수정하는 메소드
	 * @param member
	 */
	void updateMember(Member member);
	/**
	 * 모든 회원의 정보를 조회하는 메소드
	 * @return
	 */
	List<Member> findAllMember();
	/**
	 * 매개변수로 받은 email로 회원을 조회하는 메소드
	 * @param email
	 * @return
	 */
	Member findMemberByEmail(String email);
	/**
	 * 매개 변수로 받은 이름으로 회원을 조회하는 메소드
	 * 	+ 부분일치
	 * 	+ 이름 중복가능
	 * @param name
	 * @return
	 */
	List<Member> selectMemberByName(String name);
	/**
	 * 기본 회원 정보와 시터 정보를 추가하여 전체 회원정보를 조회하느 메소드
	 * @return
	 */
	List<Member> selectAllSitter();
	/**
	 * 매개 변수로 받은 이메일과 일치하는 기본 회원 정보 + 시터 정보를 조회하는 메소드
	 * @param email
	 * @return
	 */
	Member selectSitterByEmail(String email);
	/**
	 * 매개 변수로 받은 이름과 일치하는 기본 회원 정보 + 시터 정보를 조회하는 메소드
	 * @param name
	 * @return
	 */
	List<Member> selectSitterByName(String name);
	/**
	 * 매개 변수로 받은 이름과 일치하는 기본회원 정보와 리뷰정보를 조회하는 메소드........
	 * @param name
	 * @return
	 */
	List<Review> selectReviewByEmail(String email);
	
	/**
	 * 전체 회원 정보 + 권한 조회
	 * @return
	 */
	List<Member> findAllMemberJoinAuthority();
	
	/**
	 * 회원 정보 + 권한 조회
	 * @param email
	 * @return
	 */
	Member findMemberJoinAuthorityByEmail(String email);
	
}
