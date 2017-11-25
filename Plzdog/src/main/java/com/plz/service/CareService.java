package com.plz.service;

import java.util.List;

import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

public interface CareService {

	int insertCare(Care care);
	
	List<Care> selectCareJoinCareImage(int careId);
	
	int updateCare(Care care);
	
	int deleteCare(int careId);
	
	int insertCareImage(CareImage careImage);
	
	int updateCareImage(CareImage careImage);
	
	int deleteCareImage(String careImage);
}
