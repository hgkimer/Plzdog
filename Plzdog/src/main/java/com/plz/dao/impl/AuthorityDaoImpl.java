package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.plz.dao.AuthorityDao;
import com.plzdog.vo.Authority;

@Repository
public class AuthorityDaoImpl implements AuthorityDao{
	//sqlsession Temaplate 주입
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.authorityMapper." + id;
	}
	
	@Override
	public int insertAuthority(Authority authority) {
		return session.insert(makeSqlId("insertAuthority"), authority);
	}

	@Override
	public int updateAuthority(Authority authority) {
		return session.update(makeSqlId("updateAuthority"), authority);
	}

	@Override
	public int deleteAuthority(String email) {
		return session.delete(makeSqlId("deleteAuthority"), email);
	}

	@Override
	public List<Authority> selectAllAuthority() {
		return session.selectList(makeSqlId("selectAllAuthority"));
	}

	@Override
	public List<Authority> selectAuthorityByEmail(String email) {
		return session.selectList(makeSqlId("selectAuthorityByEmail"), email);
	}
}
