package com.plz.service;

import java.util.List;



public interface ResDetailService {
	/**
	 * 선택된 강아지의 Id와 해당하는 예약 아이디로 예약 상세정보 테이블에 insert하는 메소드
	 * @param resDetail
	 */
	void addResDetail(int resId, List<Integer> dogIdList);
}
