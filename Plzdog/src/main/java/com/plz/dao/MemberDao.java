package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Member;
import com.plzdog.vo.Review;

public interface MemberDao {
	/**
	 * 매개변수로 받은 회원의 정보를 저장하는 메소드
	 * @param member
	 * @return
	 */
	int insertMember(Member member);
	/**
	 * 매개변수로 받은 email로 회원을 삭제하는 메소드
	 * @param email
	 * @return
	 */
	int deleteMember(String email);
	/**
	 * 매개변수로 받은 회원의 정보를 수정하는 메소드
	 * @param member
	 * @return
	 */
	int updateMember(Member member);
	/**
	 * 전체 회원을 조회하는 메소드
	 * @return
	 */
	List<Member> selectAllMember();
	/**
	 * 매개변수로 받은 email로 회원을 조회하는 메소드
	 * @param email
	 * @return
	 */
	Member selectMemberByEmail(String email);
	/**
	 * 매개변수로 받은 회원이름과 일치하는 회원을 조회하는 메소드(부분일치)
	 * @param memberName
	 * @return
	 */
	List<Member> selectMemberByName(String memberName);
	/**
	 * 매개변수로 받은 펫시터 정보를 조회하는 메소드
	 * 	+ sitter 조인
	 * @return
	 */
	List<Member> selectAllSitter();
	/**
	 * 이메일로 펫시터 정보를 조회하는 메소드
	 * 	+ sitter 조인
	 * @param email
	 * @return
	 */
	Member selectSitterByEmail(String email);
	/**
	 * 매개변수로 받은 이름으로 펫시터 정보를 조회하는 메소드
	 * 	+ sitter 조인
	 * @param name
	 * @return
	 */
	List<Member> selectSitterByName(String name);
	/**
	 * 매개변수로 받은 이름으로 회원의 정보와 회원이 작성한 후기(Review)를 조회하는 메소드
	 * 	+ review 조인
	 * @param name
	 * @return
	 */
	List<Review> selectReviewByEmail(String email);
	
	/**
	 * 전체 회원 + 권한 조회
	 * @return
	 */
	List<Member> selectAllMemberJoinAuthority();
	
	/**
	 * 회원 + 권한 조회
	 * @param email
	 * @return
	 */
	Member selectMemberJoinAuthorityByEmail(String email);

}
