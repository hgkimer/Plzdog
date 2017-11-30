package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.CodeDao;
import com.plzdog.vo.Code;
@Repository
public class CodeDaoImpl implements CodeDao{
	@Autowired
	private SqlSessionTemplate session;
	//Mapper Id를 만들어주는 메소드
	public String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.codeMapper." + id;
	}
	@Override
	public int insertCode(Code code) {
		return session.insert(makeSqlId("insertCode"), code);
	}

	@Override
	public int deleteCode(String code) {
		return session.delete(makeSqlId("deleteCode"),code);
	}

	@Override
	public int updateCode(Code code) {
		return session.update(makeSqlId("updateCode"), code);
	}

	@Override
	public Code selectCodeByCode(String code) {
		return session.selectOne(makeSqlId("selectCodeByCode"), code);
	}
	@Override
	public List<Code> selectCodeByCategory(String category) {
		return session.selectList(makeSqlId("selectCodeByCategory"), category);
	}

}
