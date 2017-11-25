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
	public int insertCare(Care care) {
		return careDao.insertCare(care);
	}

	@Override
	public List<Care> selectCareJoinCareImage(int careId) {
		return careDao.selectCareJoinCareImage(careId);
	}

	@Override
	public int updateCare(Care care) {
		return careDao.updateCare(care);
	}

	@Override
	public int deleteCare(int careId) {
		return careDao.deleteCare(careId);
	}

	@Override
	public int insertCareImage(CareImage careImage) {
		return careDao.insertCareImage(careImage);
	}

	@Override
	public int updateCareImage(CareImage careImage) {
		return careDao.updateCareImage(careImage);
	}

	@Override
	public int deleteCareImage(String careImage) {
		return careDao.deleteCareImage(careImage);
	}
}