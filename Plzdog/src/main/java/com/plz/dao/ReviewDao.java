package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Review;

public interface ReviewDao {
	
	/**
	 * 리뷰 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Review> selectReviewBySitterEmail(String sitterEmail);
	
	/**
	 * 리뷰 등록
	 * @param reivew
	 * @return
	 */
	int insertReview(Review review);

	/**
	 * 리뷰 수정
	 * @param review
	 * @return
	 */
	int updateReview(Review review);
	
	/**
	 * 리뷰 삭제
	 * @param reviewId
	 * @return
	 */
	int deleteReview(int reviewId);
}
