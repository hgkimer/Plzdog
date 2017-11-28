package com.plz.dao;

import com.plzdog.vo.Code;

public interface CodeDao {
	/**
	 * 매개변수로 받은 Code를 등록하는 메소드
	 * @param code
	 * @return
	 */
	int insertCode(Code code);
	/**
	 * 매개변수로 받은 코드의 code(PK)로 코드정보를 삭제하는 메소드
	 * @param codeName
	 * @return
	 */
	int deleteCode(String code);
	/**
	 * 매개변수로 받은 코드 객체의 코드(code)를 통해 코드정보를 수정하는 메소드
	 * @param code
	 * @return
	 */
	int updateCode(Code code);
	/**
	 * 매개변수로 받은 code(PK)와 일치하는 코드정보를 조회하는 메소드
	 * @param code
	 * @return
	 */
	Code selectCodeByCode(String code);
	
}
