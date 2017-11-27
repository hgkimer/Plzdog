package com.plz.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.ReviewDao;
import com.plzdog.vo.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.reviewMapper."+id;
	}
	
	@Override
	public int insertReview(Review review) {
		return session.insert(makeSqlId("insertReview"), review);
	}

	@Override
	public int updateReview(Review review) {
		return session.update(makeSqlId("updateReview"), review);
	}

	@Override
	public int deleteReview(int reviewId) {
		return session.delete(makeSqlId("deleteReview"), reviewId);
	}
}
