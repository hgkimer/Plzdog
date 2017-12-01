package com.plz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.SitterDao;
import com.plz.service.SitterService;
import com.plzdog.vo.Sitter;

@Service
public class SitterServiceImpl implements SitterService {

	@Autowired
	private SitterDao sitterDao;
	
	@Override
	@Transactional
	public void insertSitter(Sitter sitter) {
		sitterDao.insertSitter(sitter);
	}

}
