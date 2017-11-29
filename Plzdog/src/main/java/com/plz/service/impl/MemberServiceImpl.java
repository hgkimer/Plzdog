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
import com.plzdog.vo.Review;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private AuthorityDao daoAuthority;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public void insertMember(Member member, String role) {
		//패스워드 암호화 처리
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		//member 테이블 insert
		dao.insertMember(member);
		//Authority 테이블 insert
		daoAuthority.insertAuthority(new Authority(member.getEmail(),role));
		if(role.equals("ROLE_ADMIN")){
			List<Authority> list = daoAuthority.selectAuthorityByEmail(member.getEmail());
			for(Authority a : list) {
				if(a.getAuthority() != "ROLE_SITTER") {
					daoAuthority.insertAuthority(new Authority(member.getEmail(), "ROLE_MEMBER"));
				} else if(a.getAuthority() != "ROLE_MEMBER") {
					daoAuthority.insertAuthority(new Authority(member.getEmail(), "ROLE_SITTER"));
				}
			}
		}
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
	public List<Member> selectAllMember() {
		return dao.selectAllMember();
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return dao.selectMemberByEmail(email);
	}

	@Override
	public List<Member> selectMemberByName(String name) {
		return dao.selectMemberByName(name);
	}

	@Override
	public List<Member> selectAllSiiter() {
		return dao.selectAllSitter();
	}

	@Override
	public Member selectSitterByEmail(String email) {
		return dao.selectSitterByEmail(email);
	}

	@Override
	public List<Member> selectSitterByName(String name) {
		return dao.selectSitterByName(name);
	}

	@Override
	public List<Review> selectReviewByEmail(String email) {
		return dao.selectReviewByEmail(email);
	}

}
