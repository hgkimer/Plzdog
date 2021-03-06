package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

public interface CareDao {
	
	/**
	 * 돌봄일지 등록
	 * @param care
	 * @return
	 */	
	int insertCare(Care care);

	/**
	 * 예약번호 해당하는 모든 돌봄일지 + 돌봄일지 이미지 조회하기
	 * @param resId
	 * @return
	 */
	List<Care> selectCareJoinCareImage(int resId);
	
	/**
	 * 돌봄ID로 돌봄일지 + 돌봄일지 이미지 조회하기
	 * @param careId
	 * @return
	 */
	Care selectCareJoinCareImageByCareId(int careId);
	/**
	 * 돌봄일지 수정
	 * @param care
	 * @return
	 */
	int updateCare(Care care);
	
	/**
	 * 돌봄일지 삭제
	 * @param careId
	 * @return
	 */
	int deleteCare(int careId);
	
	/**
	 * 돌봄일지 이미지 등록
	 * @param careImage
	 * @return
	 */
	int insertCareImage(CareImage careImage);
	
	/**
	 * 돌봄일지 이미지 수정
	 * @param careImage, originalImage
	 * @return
	 */
	int updateCareImage(CareImage careImage, String originalImage);
	
	/**
	 * 돌봄일지 이미지 삭제
	 * @param careImage
	 * @return
	 */
	int deleteCareImage(int careId);

	
}
