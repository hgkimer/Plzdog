package com.plz.service;

import java.util.List;

import com.plzdog.vo.Member;
import com.plzdog.vo.Review;

public interface ReviewService {
	
	/**
	 * 리뷰 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Review> findReviewBySitterEmail(String sitterEmail);
	
	/**
	 * 리뷰 등록
	 * @param reivew
	 * @return
	 */
	int addReview(Review review);

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
	int removeReview(int reviewId);
	
	/**
	 * 프로필을 다시 조회 하는 역할
	 * @param review
	 * @return
	 */
	Member refreshProfile(Review review);
}
