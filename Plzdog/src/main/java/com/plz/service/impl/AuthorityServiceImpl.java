package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.AuthorityDao;
import com.plz.service.AuthorityService;
import com.plzdog.vo.Authority;
@Service
public class AuthorityServiceImpl implements AuthorityService {
	@Autowired
	private AuthorityDao dao;
	
	@Override
	@Transactional
	public void addAuthority(Authority authority) {
		dao.insertAuthority(authority);
	}

	@Override
	public void updateAuthority(Authority authority) {
		dao.updateAuthority(authority);
	}

	@Override
	public void removeAuthority(String email) {
		dao.deleteAuthority(email);
	}

	@Override
	public List<Authority> findAllAuthority() {
		return dao.selectAllAuthority();
	}

	@Override
	public List<Authority> findAuthorityByEmail(String email) {
		return dao.selectAuthorityByEmail(email);
	}

}
