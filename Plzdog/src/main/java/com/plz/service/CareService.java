package com.plz.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

public interface CareService {
	
	List<Care> selectCareJoinCareImage(int careId);
	
	void updateCare(Care care);
	
	void deleteCare(int careId);
	
	void insertCareImage(CareImage careImage);
	
	void updateCareImage(CareImage careImage, String originalImage);
	
	void deleteCareImage(String careImage);

	void insertCare(Care care, HttpServletRequest request) throws IllegalStateException, IOException;
}
