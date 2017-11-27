package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Member;

public interface MemberDao {
	/**
	 * 매개변수로 받은 회원정보를 저장하는 메소드
	 * @param member
	 * @return
	 */
	int insertMember(Member member);
	
	
}
