package com.plz.service;

import java.util.List;

import com.plzdog.vo.Code;

public interface CodeService {
	/*#######################################################################
	 * 시간되면 관리자 기능으로 넣을거임, 시간없음 그냥 없앨거니까 그냥 두세여
	 *#######################################################################  
	 */
	/**
	 * 매개변수로 받은 code로 코드를 조회하는 메소드
	 * @param code
	 * @return
	 */
	Code findCodeByCode(String code);
	/**
	 * 매개변수로 받은 카테고리에 해당하는 코드들의 list를 리턴하는 메소드
	 * @param category
	 * @return
	 */
	List<Code> findCodeByCategory(String category);
	
}
