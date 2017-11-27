package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.dao.MemberDao;
import com.plz.service.MemberService;
import com.plzdog.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao dao;

	@Override
	public void addMember(Member member) {
		dao.insertMember(member);
	}

	@Override
	public void deleteMember(String email) {
		dao.deleteMember(email);
	}

	@Override
	public void updateMember(Member member) {
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
