package com.plz.dao;

import com.plzdog.vo.Sitter;

public interface SitterDao {
	/**
	 * 매개변수로 받은 sitter 정보를 추가하는 메소드
	 * @param sitter
	 * @return
	 */
	int insertSitter(Sitter sitter);
	/**
	 * 매개변수로 받은 email로 sitter 정보를 삭제하는 메소드
	 * @param email
	 * @return
	 */
	int deleteSitter(String email);
	/**
	 * 매개변수로 받은 sitter 정보에서 email이 일치하는 sitter정보를 수정하는 메소드
	 * @param sitter
	 * @return
	 */
	int updateSitter(Sitter sitter);
	/**
	 * 매개변수로 받은 email로 시터 정보를 조회하는 메소드
	 * @param Email
	 * @return
	 */
	Sitter selectSitterByEmail(String email);
	/**
	 * 매개변수로 받은  email로 스킬을 포함한 시터정보릘 조회하는 메소드
	 * 	+ skill 조인
	 * @param email
	 * @return
	 */
	Sitter selectSitterSkillListByEmail(String email);
}
