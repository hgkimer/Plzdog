package com.plz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.plzdog.vo.Authority;

@Service
public interface AuthorityService {
	/**
	 * 새로운 권한을 추가하는 메소드
	 * @param authority
	 */
	void addAuthority(Authority authority);
	/**
	 * 매개변수로 받은 권한을 권한을 수정하는 메솓,
	 * @param authority
	 */
	void updateAuthority(Authority authority);
	/**
	 * 매개변수로 받은 이메일로 권한을 삭제하는 메소드
	 * @param email
	 */
	void removeAuthority(String email);
	/**
	 * 권한을 전체 조회하는 메소드
	 * @return
	 */
	List<Authority> findAllAuthority();
	/**
	 * 매개변수로 받은 email로 권한을 조회하는 메소드
	 * @param email
	 * @return
	 */
	List<Authority> findAuthorityByEmail(String email);
}
