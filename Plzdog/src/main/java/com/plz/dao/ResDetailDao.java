package com.plz.dao;

import com.plzdog.vo.ResDetail;

public interface ResDetailDao {
	/**
	 * 매개변수로 받은 예약 상세 정보를 insert하는 메소드.
	 * @param resDetail
	 * @return
	 */
	int insertResDetail(ResDetail resDetail);
	
	/**
	 * 예약 번호와 일치하는 강아지 Id를 변경하는 메소드.
	 * 	- 어디다 쓸지는 아직 모르겠다.
	 * @param resDetail
	 * @return
	 */
	int updateResDetail(ResDetail resDetail);
}
