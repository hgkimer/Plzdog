package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Authority;

public interface AuthorityDao {
	/**
	 * 권한을 추가하는 메소드
	 * @param authority
	 * @return
	 */
	int insertAuthority(Authority authority);
	
	/**
	 * 권한을 수정하는 메소드
	 * @param authority
	 * @return
	 */
	int updateAuthority(Authority authority);
	
	/**
	 * 매개변수로 받은 email에 해당하는 권한을 삭제하는 메소드.
	 * @param email
	 * @return
	 */
	int deleteAuthority(String email);
	
	/**
	 * 전체 email과 권한을 조회하는 메소드
	 * @return
	 */
	List<Authority> selectAllAuthority();
	
	/**
	 * 매개변수로 받은 email로 권한을 조회하는 메소드
	 * @param email
	 * @return
	 */
	List<Authority> selectAuthorityByEmail(String email);
	
}
