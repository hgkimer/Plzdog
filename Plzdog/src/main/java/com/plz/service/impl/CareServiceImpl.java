package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.dao.CareDao;
import com.plz.service.CareService;
import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

@Service
public class CareServiceImpl implements CareService {

	@Autowired
	private CareDao careDao;
	
	@Override
	public void insertCare(Care care) {
		careDao.insertCare(care);
	}

	@Override
	public List<Care> selectCareJoinCareImage(int resId) {
		return careDao.selectCareJoinCareImage(resId);
	}

	@Override
	public void updateCare(Care care) {
		careDao.updateCare(care);
	}

	@Override
	public void deleteCare(int careId) {
		careDao.deleteCare(careId);
	}

	@Override
	public void insertCareImage(CareImage careImage) {
		careDao.insertCareImage(careImage);
	}

	@Override
	public void updateCareImage(CareImage careImage, String originalImage) {
		careDao.updateCareImage(careImage, originalImage);
	}

	@Override
	public void deleteCareImage(String careImage) {
		careDao.deleteCareImage(careImage);
	}
}