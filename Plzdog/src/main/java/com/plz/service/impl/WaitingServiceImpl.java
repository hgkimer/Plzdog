package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.dao.WaitingDao;
import com.plz.service.WaitingService;

@Service
public class WaitingServiceImpl implements WaitingService {

	@Autowired
	private WaitingDao dao;
	
	@Override
	public void insertWaiting(String email) {
		dao.insertWaiting(email);
	}

	@Override
	public List<String> selectAllWaiting() {
		return dao.selectAllWaiting();
	}

	@Override
	public String selectWaitingByEmail(String email) {
		return dao.selectWaitingByEmail(email);
	}

	@Override
	public void deleteWaiting(String email) {
		dao.deleteWaiting(email);
	}

}
