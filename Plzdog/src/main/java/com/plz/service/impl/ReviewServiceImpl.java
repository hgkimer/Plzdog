package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.plz.dao.ReviewDao;
import com.plz.service.AuthorityService;
import com.plz.service.DogService;
import com.plz.service.MemberService;
import com.plz.service.ReviewService;
import com.plzdog.vo.Member;
import com.plzdog.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao dao;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private DogService dService;
	
	@Autowired
	private ReviewService rService;
	
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
	
	@Override
	public Member refreshProfile(Review review) {
		
		Member member = service.selectSitterByEmail(review.getSitterEmail());
		//강아지들 정보 저장.
		member.setDogList(dService.selectDogByEmail(review.getSitterEmail()));
		//해당 시터의 리뷰 정보 조회
		List<Review> reviewList = rService.findReviewBySitterEmail(review.getSitterEmail());
		System.out.println(reviewList);
		
		//작성자 이름 저장
		if(reviewList != null) {
			for(Review r : reviewList) {
				r.setMemberName(service.findMemberByEmail(r.getMemberEmail()).getMemberName());
			}
		}
		
		//해당 시터의 리뷰 정보 저장.
		member.setReviewList(reviewList);
		
		return member;
	}
	
}
