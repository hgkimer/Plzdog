package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.plz.dao.AuthorityDao;
import com.plz.dao.MemberDao;
import com.plz.service.MemberService;
import com.plzdog.vo.Authority;
import com.plzdog.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private AuthorityDao dao1;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public void addMember(Member member) {
		//패스워드 암호화 처리
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		//member 테이블 insert
		dao.insertMember(member);
		//Authority 테이블 insert
		dao1.insertAuthority(new Authority(member.getEmail(),"ROLE_MEMBER"));
	}

	@Override
	public void deleteMember(String email) {
		dao.deleteMember(email);
	}

	@Override
	public void updateMember(Member member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		dao.updateMember(member);
	}

	@Override
	public List<Member> findAllMember() {
		return dao.selectAllMember();
	}

	@Override
	public Member findMemberByEmail(String email) {
		return dao.selectMemberByEmail(email);
	}

	@Override
	public List<Member> findMemberByName(String name) {
		return dao.selectMemberByName(name);
	}

	@Override
	public List<Member> findMemberJoinSiiter() {
		return dao.selectAllMemberJoinSitter();
	}

	@Override
	public Member findMemberJoinSitterByEmail(String email) {
		return dao.selectMemberJoinSitterByEmail(email);
	}

	@Override
	public List<Member> findMemberJoinSitterByName(String name) {
		return dao.selectMemberJoinSitterByName(name);
	}

	@Override
	public List<Member> findMemberJoinReviewByEmail(String email) {
		return dao.selectMemberJoinReviewByEmail(email);
	}

}
