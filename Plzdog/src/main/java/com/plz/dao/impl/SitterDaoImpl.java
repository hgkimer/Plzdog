package com.plz.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.SitterDao;
import com.plzdog.vo.Sitter;
@Repository
public class SitterDaoImpl implements SitterDao{
	@Autowired
	private SqlSessionTemplate session;
	
	public String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.sitterMapper." + id; 
	}
	@Override
	public int insertSitter(Sitter sitter) {
		return session.insert(makeSqlId("insertSitter"), sitter);
	}

	@Override
	public int deleteSitter(String email) {
		return session.delete(makeSqlId("deleteSitter"), email);
	}

	@Override
	public int updateSitter(Sitter sitter) {
		return session.update(makeSqlId("updateSitter"), sitter);
	}

	@Override
	public Sitter selectSitterByEmail(String email) {
		return session.selectOne(makeSqlId("selectSitterByEmail"), email);
	}

	@Override
	public Sitter selectSitterSkillListByEmail(String email) {
		return session.selectOne(makeSqlId("selectSitterByEmail"), email);
	}

}
