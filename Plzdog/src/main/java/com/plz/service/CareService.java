package com.plz.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

public interface CareService {
	
	List<Care> selectCareJoinCareImage(int resId);
	
	void deleteCare(int careId);
	
	void insertCareImage(CareImage careImage);
	
	void updateCareImage(CareImage careImage, String originalImage);
	
	void deleteCareImage(int careId);

	void insertCare(Care care, HttpServletRequest request) throws IllegalStateException, IOException;

	Care selectCareJoinCareImageByCareId(int careId);

	void updateCare(Care care, HttpServletRequest request) throws IllegalStateException, IOException;

}
