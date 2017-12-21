package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.MemberDao;
import com.plzdog.vo.Member;
import com.plzdog.vo.Review;
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
		return session.selectList(makeSqlId("selectAllMemberJoinDog"));
	}
	
	@Override
	public List<Member> selectAllMemberJoinAuthority() {
		return session.selectList(makeSqlId("selectAllMemberJoinAuthority"));
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return session.selectOne("selectMemberJoinDogByEmail", email);
	}

	@Override
	public List<Member> selectMemberByName(String memberName) {
		return session.selectList(makeSqlId("selectMemberJoinDogByName"), memberName);
	}
	
	@Override
	public List<Member> selectAllSitter() {
		return session.selectList(makeSqlId("selectAllMemberJoinSitterSkillAuthority"));
	}
	
	@Override
	public Member selectSitterByEmail(String email) {
		return session.selectOne(makeSqlId("selectMemberJoinSitterSkillAuthorityByEmail"), email);
	}
	
	@Override
	public List<Member> selectSitterByName(String name) {
		return session.selectList(makeSqlId("\"selectMemberJoinSitterSkillAuthorityByName\""), name);
	}
	
	@Override
	public List<Review> selectReviewByEmail(String email) {
		return session.selectList(makeSqlId("selectReviewByEmail"), email);
	}
}
