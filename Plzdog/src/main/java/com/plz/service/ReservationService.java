package com.plz.service;

import java.util.List;

import com.plzdog.vo.Authority;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Member;
import com.plzdog.vo.Reservation;

public interface ReservationService {
	/**
	 * 예약 작성 폼으로 가기 위해
	 *  1. 매개변수로 받은 이메일로 시터 권한이 있는지 확인
	 *  2. 권한이 있다면 회원 조회(회원 정보 + 시터 정보) 메소드(MemberDao)를 통해 Member객체에 저장
	 *  	2-1. 권한이 없는 일반 회원이면 null을 리턴
	 *  3. 리턴
	 * 
	 * @param sitterEmail
	 */
	Member checkSitter(String sitterEmail);
	/**
	 * 새로운 예약을 추가하는 메소드
	 * 매개변수로 요구사항, 요구 환경 , 강아지 목록을 받아 insert도 함께한다.
	 * @param reservation
	 */
	void addReservation(Reservation reservation, List<String> demandList, List<Integer> dogList);
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
	 * 예약번호로 예약정보를 조회하는 메소드
	 * @param resId
	 * @return
	 */
	Reservation findReservationById(int resId);
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
	Reservation findSitterReservationSalesByEmail(String email);
	
	void addDemand(Demand demand);
	
	void removeDemand(int resId);
	
	void updateDemand(Demand demand, String originalCodeDemand);
	
	List<Reservation> selectSimpleReservationSitter(String email);
	
	List<Reservation> selectDetailReservationSitter(String email);
		
	List<Reservation> selectSimpleReservationAdmin();
	
	List<Reservation> selectDetailReservationAdmin(String sitterEmail, String memberEmail);
	
	/**
	 * 회원에 해당하는 회원 + 강아지 정보
	 * @param email
	 * @return
	 */
	//List<Reservation> findSimpleReservationMemberByEmail(String email);
	
	
	// -----------------------Lee su il----------------------------------
	
	/**
	 * 시터 이메일로 예약에 해당하는 회원 정보를 조회(simple 페이지)
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findSimpleSitterReservationMemberByEmail(String sitterEmail);
	
	/**
	 * 시터 이메일로 예약에 해당하는 강아지 정보를 조회(simple 페이지)
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findSimpleSitterReservationResDetailDogByEmail(String sitterEmail);
	
	/**
	 * resId로 예약에 해당하는 서비스 요구사항 조회(detail 페이지)
	 * @param resId
	 * @return
	 */
	Reservation findDetailSitterReservationDemandCodeByResId(int resId);
	
	/**
	 * sitterEmail에 해당하는 회원정보 + 강아지 정보 (간단히)
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findSimpleSitterReservationInfoByEmail(String sitterEmail);
	
	/**
	 * 시터 email로 결제 대기 중인 회원 정보 + 강아지 정보(간단히) 
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findWaitingPaymentReservationInfoByEmail(String sitterEmail);
	
	/**
	 * 시터 email로 결제 대기 중인 회원 정보 + 강아지 정보 (자세히)
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findWaitingPaymentReservationSitter(String sitterEmail);
	
	/**
	 * sitterEmail로 결제가 완료된 회원정보 + 강아지 정보 (간단히)
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findCompletePaymentReservationInfoByEmail(String sitterEmail);
	
	/**
	 * 시터 email 로 결제가 완료된 회원 정보 + 강아지 정보(자세히)
	 * @param sitterEmail
	 * @return
	 */
	List<Reservation> findCompletePaymentReservationSitter(String sitterEmail);
	// -----------------------Lee su il----------------------------------

	//-----------------------Yoon gue seok----------------------------------
	List<Reservation> findAllMemberReservationMember();
	
	List<Reservation> findMemberReservationResDetailDogByEmail(String email);
	
	//--------------------------------------------------------------------------
	
	
	
	//-------------------------김호규--------------------------------------------
	/**
	 * 의뢰자 이메일로 예약에 해당하는 회원 정보를 조회(simple 페이지)
	 * @param email
	 * @return
	 */
	List<Reservation> findSimpleMemberWaitingProposalReservationMemberByEmail(String email);
	
	/**
	 * 의뢰자 이메일로 예약에 해당하는 강아지 정보를 조회(simple 페이지)
	 * @param email
	 * @return
	 */
	List<Reservation> findSimpleMemberWaitingProposalReservationResDetailDogByEmail(String email);
	
	/**
	 * resId로 예약에 해당하는 서비스 요구사항 조회(detail 페이지)
	 * @param resId
	 * @return
	 */
	Reservation findDetailMemberWaitingProposalReservationDemandCodeByResId(int resId);
	
	/**
	 * 의뢰자 email에 해당하는 회원정보 + 강아지 정보 
	 * @param email
	 * @return
	 */
	List<Reservation> findSimpleMemberWaitingApprovaltReservationMemberByEmail(String email);
	
	/**
	 * 의뢰자 email 로 결제가 완료된 회원정보 + 강아지 정보 
	 * @param email
	 * @return
	 */
	List<Reservation> findSimpleMemberWaitingApprovaltReservationResDetailDogByEmail(String email);
	
}
