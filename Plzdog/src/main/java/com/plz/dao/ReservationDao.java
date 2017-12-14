package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Demand;
import com.plzdog.vo.Reservation;

public interface ReservationDao {
	/**
	 * 매개변수로 받은 예약의 정보를 저장하는 메소드
	 * @param Reservation
	 * @return
	 */
	int insertReservation(Reservation reservation);
	/**
	 * 매개변수로 받은 resId로 예약을 삭제하는 메소드
	 * @param resId
	 * @return
	 */
	int deleteReservation(int resId);
	/**
	 * 매개변수로 받은 예약의 정보를 수정하는 메소드
	 * @param reservation
	 * @return
	 */
	int updateReservation(Reservation reservation);
	/**
	 * 전체 예약을 조회하는 메소드
	 * @return
	 */
	List<Reservation> selectAllReservation();
	/**
	 * 예약 아이디로 예약을 조회하는 메소드
	 * @param resId
	 * @return
	 */
	Reservation selectReservationById(int resId);
	/**
	 * 매개변수로 받은 email로 회원의 예약을 조회하는 메소드
	 * @param email
	 * @return
	 */
	List<Reservation> selectMemberReservationByEmail(String email);
	/**
	 * 매개변수로 받은 email로 시터의 예약을 조회하는 메소드
	 * @param email
	 * @return
	 */
	List<Reservation> selectSitterReservationByEmail(String email);
	/**
	 * 매개변수로 받은 이메일과 일치하는 회원의 예약의 상태을 조회하는 메소드
	 * @param email
	 * @return
	 */
	List<Reservation> selectReservationJoinDemandByEmail(String email);
	/**
	 * 매개변수 받은 펫시터의 이메일로  해당예약의 시터의 급여를 조회
	 * @param email
	 * @return
	 */
	Reservation selectSitterReservationSalesByEmail(String email);
	
	/**
	 * 매개변수로 받은 회원의 이메일로 해당 예약의 돌봄일지를 조회
	 * @param email
	 * @return
	 */
	List<Reservation> selectMemberCareByEmail(String email);
	
	/**
	 * 매개변수로 받은 시터의 이메일로 해당 예약의 돌봄일지를 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> selectSitterCareByEmail(String sitterEmail);
	
	int insertDemand(Demand demand);
	
	int deleteDemand(int resId);
	
	int updateDemand(Demand demand, String originalCodeDemand);
	
	//새로 추가한 select
	/**
	 * 시터의 마이페이지 - 예약 조회 - 간단히 보기
	 * @param email 시터 email
	 * @return
	 */
	List<Reservation> selectSimpleReservationSitter(String email);
	
	/**
	 * 시터의 마이페이지 - 예약 조회 - 자세히 보기
	 * @param email 시터 email
	 * @return
	 */
	List<Reservation> selectDetailReservationSitter(String email);
	
	
	/**
	 * 관리자 페이지 - 모든 예약 조회 - 간단히 보기
	 * @return
	 */
	List<Reservation> selectSimpleReservationAdmin();
	
	/**
	 * 관리자 페이지 - 예약 조회 - 자세히 보기
	 * @param sitterEmail
	 * @param memberEmail
	 * @return
	 */
	List<Reservation> selectDetailReservationAdmin(String sitterEmail, String memberEmail);
	
	/**
	 * 이메일로 회원, 강아지 정보 조회
	 * @param email
	 * @return
	 */
	//List<Reservation> selectSimpleReservationMemberByEmail(String email);
	
	// -----------------------Lee su il----------------------------------
	/**
	 * 시터 이메일로 예약에 해당하는 회원 정보를 조회(simple 페이지)
	 * @param stterEmail
	 * @return
	 */
	List<Reservation> selectSimpleSitterReservationMemberByEmail(String sitterEmail);
	
	/**
	 * 시터 이메일로 예약에 해당하는 강아지 정보를 조회(simple 페이지)
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> selectSimpleSitterReservationResDetailDogByEmail(String sitterEmail);
	
	/**
	 * resId로 예약에 해당하는 서비스 요구사항 조회(detail 페이지)
	 * @param resId
	 * @return
	 */
	Reservation selectDetailSitterReservationDemandCodeByResId(int resId);
	
	/**
	 * 시터 이메일로 결제완료된 예약을 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> selectCompletePaymentReservationMemberByEmail(String sitterEmail);
	
	/**
	 * 시터 이메일로 결제완료 된 강아지 정보 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> selectCompletePaymentReservationResDetailDogByEmail(String sitterEmail);
	
	/**
	 * 시터 이메일로  결제대기 증인 예약을 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> selectWaitingPaymentReservationMemberByEmail(String sitterEmail);
	
	/**
	 * 시터 이메일로  결제대기 증인 강아지 정보 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> selectWaitingPaymentReservationResDetailDogByEmail(String sitterEmail);
	// -----------------------Lee su il----------------------------------
	
	List<Reservation> selectAllMemberReservationMember();
	
	List<Reservation> selectMemberReservationResDetailDogByEmail(String email);
	
	
	
	// -----------------------Yoon gue seok--------------------------------
	/*
	 * ################################################################
	 *  김호규/ 건들지 마시오
	 */
	/**
	 * 매개변수로 받은 email과 일치하는 예약정보와 강아지정보를 조회하는 메소드.
	 * res-1
	 * @param email 견주 email
	 * @return
	 */
	List<Reservation> selectReservationRes1JoinResDetailAndDog(String email);
	/**
	 * 매개변수로 받은 email과 일치하는 예약정보와 강아지정보를 조회하는 메소드.
	 * res-2
	 * @param email
	 * @return
	 */
	List<Reservation> selectReservationRes2JoinResDetailAndDog(String email);
	/**
	 * 매개변수로 받은 예약아이디와 일치하는 예약의 요구사항을 조회하는 메소드.
	 * @param resId
	 * @return
	 */
	Reservation selectReservationDemandCodeByResId(int resId);
	/**
	 * 시터가 견적 제출을 위해 모든 회원의 예약들 중 견적 대기 상태(res-1)인
	 * 예약을 조회해 호는 select 메소드.
	 * @return
	 */
	List<Reservation> selectReservationAllRes1();
	
	
	
	/*
	 * ################################################################
	 */
	
	
}
