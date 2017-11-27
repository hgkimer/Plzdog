package com.plz.dao;

import com.plzdog.vo.Review;

public interface ReviewDao {
	
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
