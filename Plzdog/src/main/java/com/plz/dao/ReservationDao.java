package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Member;
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
	int deleteReservation(String resId);
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
	 * 매개변수로 받은 email로 회원의 예약을 조회하는 메소드
	 * @param email
	 * @return
	 */
	List<Reservation> selectMemberReservationByEmail(String email);
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
	Reservation selectSitterReservationByEmail(String sitterEmail);
	
	/**
	 * 매개변수로 받은 회원의 이메일로 해당 예약의 돌봄일지를 조회
	 * @param email
	 * @return
	 */
	List<Reservation> selectMemberCareByEmail(String email);
}
