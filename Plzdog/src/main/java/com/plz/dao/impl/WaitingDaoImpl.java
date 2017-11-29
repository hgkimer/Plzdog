package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.WaitingDao;
import com.plzdog.vo.Waiting;

@Repository
public class WaitingDaoImpl implements WaitingDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.waitingMapper."+id;
	}
	@Override
	public int insertWaiting(String email) {
		return session.insert(makeSqlId("insertWaiting"), email);
	}

	@Override
	public List<String> selectAllWaiting() {
		return session.selectList(makeSqlId("selectAllWaiting"));
	}

	@Override
	public String selectWaitingByEmail(String email) {
		return session.selectOne(makeSqlId("selectWaitingByEmail"), email);
	}

	@Override
	public int deleteWaiting(String email) {
		return session.delete(makeSqlId("deleteWaiting"), email);
	}

}
