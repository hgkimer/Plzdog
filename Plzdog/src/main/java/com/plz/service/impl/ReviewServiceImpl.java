package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.dao.ReviewDao;
import com.plz.service.ReviewService;
import com.plzdog.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao dao;

	@Override
	public List<Review> findReviewBySitterEmail(String sitterEmail) {
		return dao.selectReviewBySitterEmail(sitterEmail);
	}

	@Override
	public int addReview(Review review) {
		return dao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return dao.updateReview(review);
	}

	@Override
	public int removeReview(int reviewId) {
		return dao.deleteReview(reviewId);
	}
	
	
}
