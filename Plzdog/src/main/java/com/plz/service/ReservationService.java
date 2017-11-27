package com.plz.service;

import java.util.List;

import com.plzdog.vo.Authority;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Reservation;

public interface ReservationService {
	/**
	 * 새로운 예약을 추가하는 메소드
	 * @param reservation
	 */
	void addReservation(Reservation reservation);
	/**
	 * 예약을 수정하는 메소드
	 * @param reservation
	 */
	void updateReservation(Reservation reservation);
	/**
	 * 매개변수로 받은 resId로 예약을 삭제하는 메소드
	 * @param resId
	 */
	void removeReservation(int resId);
	/**
	 * 예약을 전체 조회하는 메소드
	 * @return
	 */
	List<Reservation> findAllReservation();
	/**
	 * 매개변수로 받은 email로 회원의 예약의 상태를 조회하는 메소드
	 * @param email
	 * @return
	 */
	List<Reservation> findMemberReservationByEmail(String email);
	/**
	 * 매개변수 받은 펫시터의 이메일로  해당예약의 시터의 급여를 조회
	 * @param email
	 * @return
	 */
	List<Reservation> findReservationJoinDemandByEmail(String email);
	
	/**
	 * 매개변수 받은 펫시터의 이메일로  해당 시터의 예약을 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findSitterReservationByEmail(String sitterEmail);
	/**
	 * 매개변수로 받은 회원의 이메일로 해당 예약의 돌봄일지를 조회
	 * @param email
	 * @return
	 */
	List<Reservation> findMemberCareByEmail(String email);
	
	/**
	 * 매개변수로 받은 회원의 이메일로 해당 예약의 돌봄일지를 조회
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findSitterCareByEmail(String sitterEmail);
	/**
	 * 매개변수로 받은 시터의 이메일로 해당 시터의 급여를 조회
	 * @param sitterEmail
	 * @return
	 */
	Reservation findSitterReservationSalesByResId(int resId);
	
	void addDemand(Demand demand);
	
	void updateDemand(Demand demand);
	
	void removeDemand(int resId);
}
