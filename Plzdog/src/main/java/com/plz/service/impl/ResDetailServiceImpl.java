package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.ResDetailDao;
import com.plz.service.ResDetailService;
import com.plzdog.vo.ResDetail;
@Service
public class ResDetailServiceImpl implements ResDetailService {
	@Autowired
	private ResDetailDao dao;
	@Override
	@Transactional
	public void addResDetail(int resId, List<Integer> dogIdList) {
		//배열로 받은 강아지의 Id를 반복해서 insert 한다.
		for(int dogId : dogIdList) {
			ResDetail resDetail = new ResDetail(resId, dogId);
			System.out.println(resDetail);
			dao.insertResDetail(resDetail);
			System.out.println("완료");
		}
		
	}

}
