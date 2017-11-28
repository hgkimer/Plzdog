package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.SkillDao;
import com.plzdog.vo.Skill;
@Repository
public class SkillDaoImpl implements SkillDao{
	@Autowired
	private SqlSessionTemplate session;
	
	public String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.skillMapper." + id;
	}
	
	@Override
	public int insertSkill(Skill skill) {
		return session.insert(makeSqlId("insertSkill"), skill);
	}

	@Override
	public int deleteSkill(String email) {
		return session.delete(makeSqlId("deleteSkill"), email);
	}

	@Override
	public List<Skill> selectSkillByEmail(String email) {
		return session.selectList(makeSqlId("selectSkillByEmail"), email);
	}

}
