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
	 * 견주의 마이페이지 - 예약 조회 - 간단히 보기
	 * @param email 견주 email
	 * @return
	 */
	List<Reservation> selectSimpleReservationMember(String email);
	
	/**
	 * 견주의 마이페이지 - 예약 조회 - 자세히 보기
	 * @param email 견주 email
	 * @return
	 */
	List<Reservation> selectDetailReservationMember(String email);
	
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
	List<Reservation> selectSimpleReservationMemberByEmail(String email);
	
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
	
	// -----------------------Lee su il----------------------------------
	List<Reservation> selectAllMemberReservationMember();
	
	List<Reservation> selectMemberReservationResDetailDogByEmail(String email);
	
	// -----------------------Yoon gue seok--------------------------------
	
	
}
