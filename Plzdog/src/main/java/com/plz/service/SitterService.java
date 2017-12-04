package com.plz.service;

import java.util.List;

import com.plzdog.vo.Sitter;

public interface SitterService {
	/**
	 * 매개변수로 받은  sitter의 정보를 등록하는 메소드
	 * 	보유기술 리스트와 환경에 대한 코드값들을 리스트로 받아
	 * 	sitter정보 저장과 동시에 Skill테이블에 insert 한다.
	 * @param sitter
	 * @param skillList
	 * @param enList
	 */
	void insertSitter(Sitter sitter, List<String> skillList);
	
}
