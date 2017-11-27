package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.MemberDao;
import com.plzdog.vo.Member;
@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate session;
	/**
	 * Sql ID를 만들어주는 메소드
	 * @param id
	 * @return
	 */
	public String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.memberMapper." + id;
	}
	@Override
	public int insertMember(Member member) {
		return session.insert(makeSqlId("insertMember"), member);
	}

	@Override
	public int deleteMember(String email) {
		return session.delete(makeSqlId("deleteMember"), email);
	}

	@Override
	public int updateMember(Member member) {
		return session.update(makeSqlId("updateMember"), member);
	}

	@Override
	public List<Member> selectAllMember() {
		return session.selectList(makeSqlId("selectAllMember"));
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return session.selectOne("selectMemberByEmail", email);
	}

	@Override
	public List<Member> selectMemberByName(String memberName) {
		return session.selectList(makeSqlId("selectMemberByName"), memberName);
	}

	@Override
	public List<Member> selectAllMemberJoinSitter() {
		return session.selectList(makeSqlId("selectAllMemberJoinSitter"));
	}

	@Override
	public Member selectMemberJoinSitterByEmail(String email) {
		return session.selectOne(makeSqlId("selectMemberJoinSitterByEmail"), email);
	}

	@Override
	public List<Member> selectMemberJoinSitterByName(String name) {
		return session.selectList(makeSqlId("selectMemberJoinSitterByName"), name);
	}

	@Override
	public List<Member> selectMemberJoinReviewByEmail(String email) {
		return session.selectList(makeSqlId("selectMemberJoinReview"), email);
	}

}
