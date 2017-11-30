package com.plz.service;

import java.util.List;

import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

public interface CareService {

	void insertCare(Care care);
	
	List<Care> selectCareJoinCareImage(int resId);
	
	void updateCare(Care care);
	
	void deleteCare(int careId);
	
	void insertCareImage(CareImage careImage);
	
	void updateCareImage(CareImage careImage, String originalImage);
	
	void deleteCareImage(String careImage);
}
