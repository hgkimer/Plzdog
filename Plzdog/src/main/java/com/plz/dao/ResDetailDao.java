package com.plz.dao;

import java.util.List;

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
	/**
	 * 매개변수로 받은 예약 Id로 상세정보를 삭제하는 메소드.
	 * @param resId
	 * @return
	 */
	int deleteResDetailByResId(int resId);
	/**
	 * 매개변수로 받은 강아지의 Id로 예약 상세정보를 삭제하는 메소드.
	 * @param dogId
	 * @return
	 */
	int deleteResDetailByDogId(int dogId);
	/**
	 * 매개변수로 받은 예약 Id와 강아지의 Id와 일치하는 예약 상세정보를 삭제하는 메소드.
	 * @param resDetail
	 * @return
	 */
	int deleteResDetailByResIdAndDogId(ResDetail resDetail);
	/**
	 * 매개변수로 받은 예약 아이디와 일치하는 예약 상세정보들을 조회하는 메소드.
	 * 	- 같은 예약에 묶여 있는 여러 강아지의 Id를 리턴한다.
	 * @param resId
	 * @return
	 */
	List<ResDetail> selectResDetailByResId(int resId);
	/**
	 * 매개변수로 받은 강아지의 아이디와 일치하는 예약 상세정보들을 조회하는 메소드.
	 * 	하나의 강아지에 묶여 있는 여러 예약 아이디들을 리턴한다.
	 * @param dogId
	 * @return
	 */
	List<ResDetail> selectResDetailByDogId(int dogId);
}
