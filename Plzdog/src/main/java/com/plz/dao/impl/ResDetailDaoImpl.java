package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.ResDetailDao;
import com.plzdog.vo.ResDetail;
@Repository
public class ResDetailDaoImpl implements ResDetailDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.resDetailMapper." + id;
	}
	@Override
	public int insertResDetail(ResDetail resDetail) {
		return session.insert(makeSqlId("insertResDetail"), resDetail);
	}

	@Override
	public int updateResDetail(ResDetail resDetail) {
		return session.update(makeSqlId("updateResDetail"), resDetail);
	}

	@Override
	public int deleteResDetailByResId(int resId) {
		return session.delete(makeSqlId("deleteResDetailByResId"), resId);
	}

	@Override
	public int deleteResDetailByDogId(int dogId) {
		return session.delete(makeSqlId("deleteResDetailByDogId"), dogId);
	}

	@Override
	public int deleteResDetailByResIdAndDogId(ResDetail resDetail) {
		return session.delete(makeSqlId("deleteResDetailByResIdAndDogId"), resDetail);
	}

	@Override
	public List<ResDetail> selectResDetailByResId(int resId) {
		return session.selectList(makeSqlId("selectResDetailByResId"), resId);
	}

	@Override
	public List<ResDetail> selectResDetailByDogId(int dogId) {
		return session.selectList(makeSqlId("selectResDetailByDogId"), dogId);
	}

}
