package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.CareDao;
import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

@Repository
public class CareDaoImpl implements CareDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.careMapper."+id;
	}
	
	@Override
	public int insertCare(Care care) {
		return session.insert(makeSqlId("insertCare"), care);
	}

	@Override
	public List<Care> selectCareJoinCareImage(int careId) {
		return session.selectList(makeSqlId("selectCareJoinCareImage"), careId);
	}

	@Override
	public int updateCare(Care care) {
		return session.update(makeSqlId("updateCare"), care);
	}

	@Override
	public int deleteCare(int careId) {
		return session.delete(makeSqlId("deleteCare"), careId);
	}

	@Override
	public int insertCareImage(CareImage careImage) {
		return session.insert(makeSqlId("insertCareImage"), careImage);
	}

	@Override
	public int updateCareImage(CareImage careImage) {
		return session.update(makeSqlId("updateCareImage"), careImage);
	}

	@Override
	public int deleteCareImage(String careImage) {
		return session.delete(makeSqlId("deleteCareImage"), careImage);
	}
}