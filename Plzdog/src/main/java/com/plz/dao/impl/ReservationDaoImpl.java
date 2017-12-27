package com.plz.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.ReservationDao;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSessionTemplate session;

	private String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.reservationMapper." + id;
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return session.insert(makeSqlId("insertReservation"), reservation);
	}

	@Override
	public int deleteReservation(int resId) {
		return session.delete(makeSqlId("deleteReservation"), resId);
	}

	@Override
	public int updateReservation(Reservation reservation) {
		return session.update(makeSqlId("updateReservation"), reservation);
	}

	@Override
	public List<Reservation> selectAllReservation() {
		return session.selectList(makeSqlId("selectAllReservation"));
	}

	@Override
	public List<Reservation> selectMemberReservationByEmail(String email) {
		return session.selectList(makeSqlId("selectMemberReservationByEmail"), email);
	}

	@Override
	public List<Reservation> selectReservationJoinDemandByEmail(String email) {
		return session.selectList(makeSqlId("selectReservationJoinDemandByEmail"), email);
	}

	@Override
	public List<Reservation> selectSitterReservationByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectSitterReservationByEmail"), sitterEmail);
	}

	@Override
	public Reservation selectSitterReservationSalesByEmail(String email) {
		return session.selectOne(makeSqlId("selectSitterReservationSalesByResId"), email);
	}

	@Override
	public List<Reservation> selectMemberCareByEmail(String email) {
		return session.selectList(makeSqlId("selectMemberCareByEmail"), email);
	}

	@Override
	public List<Reservation> selectSitterCareByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectSitterCareByEmail"), sitterEmail);
	}

	// ---------------------lee su il -----------------------------------

	@Override
	public List<Reservation> selectSimpleSitterReservationMemberByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectSimpleSitterReservationMemberByEmail"), sitterEmail);
	}

	@Override
	public List<Reservation> selectSimpleSitterReservationResDetailDogByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectSimpleSitterReservationResDetailDogByEmail"), sitterEmail);
	}

	@Override
	public Reservation selectDetailSitterReservationDemandCodeByResId(int resId) {
		return session.selectOne(makeSqlId("selectDetailSitterReservationDemandCodeByResId"), resId);
	}

	@Override
	public List<Reservation> selectCompletePaymentReservationMemberByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectCompletePaymentReservationMemberByEmail"), sitterEmail);
	}

	@Override
	public List<Reservation> selectCompletePaymentReservationResDetailDogByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectCompletePaymentReservationResDetailDogByEmail"), sitterEmail);
	}
	
	@Override
	public List<Reservation> selectWaitingPaymentReservationMemberByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectWaitingPaymentReservationMemberByEmail"), sitterEmail);
	}

	@Override
	public List<Reservation> selectWaitingPaymentReservationResDetailDogByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectWaitingPaymentReservationResDetailDogByEmail"), sitterEmail);
	}

	// ----------------------------------------------

	// 서비스 요구 사항을 추가, 수정 , 삭제
	@Override
	@Transactional
	public int insertDemand(Demand demand) {
		return session.insert(makeSqlId("insertDemand"), demand);
	}

	@Override
	public int updateDemand(Demand demand, String originalCodeDemand) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("resId", demand.getResId());
		params.put("codeDemand", demand.getCodeDemand());
		params.put("originalCodeDemand", originalCodeDemand);
		return session.update(makeSqlId("updateDemand"), params);
	}

	/*
	 * @Override public List<Reservation>
	 * selectSimpleReservationMemberByEmail(String email){ return
	 * session.selectList(makeSqlId("selectSimpleReservationMemberByEmail"),email);
	 * }
	 */

	@Override
	public int deleteDemand(int resId) {
		return session.delete(makeSqlId("deleteDemand"), resId);
	}

	@Override
	public Reservation selectReservationById(int resId) {
		return session.selectOne(makeSqlId("selectReservationById"), resId);
	}

	@Override
	public List<Reservation> selectSimpleReservationSitter(String email) {
		return session.selectList(makeSqlId("selectSimpleReservationSitter"), email);
	}

	@Override
	public List<Reservation> selectDetailReservationSitter(String email) {
		return session.selectList(makeSqlId("selectDetailReservationSitter"), email);
	}

	@Override
	public List<Reservation> selectSimpleReservationAdmin() {
		return session.selectList(makeSqlId("selectSimpleReservationAdmin"));
	}

	@Override
	public List<Reservation> selectDetailReservationAdmin(String sitterEmail, String memberEmail) {
		HashMap<String, String> params = new HashMap<>();
		params.put("sitterEmail", sitterEmail);
		params.put("memberEmail", memberEmail);
		return session.selectList(makeSqlId("selectDetailReservationAdmin"), params);
	}

	// ---------------윤 규석 ----------------------
	@Override
	public List<Reservation> selectAllMemberReservationMember() {
		return session.selectList(makeSqlId("selectAllMemberReservationMember"));
	}

	@Override
	public List<Reservation> selectMemberReservationResDetailDogByEmail(String email) {
		return session.selectList(makeSqlId("selectMemberReservationResDetailDogByEmail"), email);
	}
	// ------------------윤규석-------------------

	// ------------------김호규-------------------
	
	@Override
	public List<Reservation> selectReservationRes1JoinResDetailAndDog(String email) {
		return session.selectList(makeSqlId("selectReservationRes1JoinResDetailAndDog"), email);
	}

	@Override
	public Reservation selectReservationDemandCodeByResId(int resId) {
		return session.selectOne(makeSqlId("selectReservationDemandCodeByResId"), resId);
	}

	@Override
	public List<Reservation> selectReservationRes2JoinResDetailAndDog(String email) {
		return session.selectList(makeSqlId("selectReservationRes2JoinResDetailAndDog"), email);
	}

	@Override
	public List<Reservation> selectReservationAllRes1() {
		return session.selectList(makeSqlId("selectReservationAllRes1"));
	}
	
	@Override
	public List<Reservation> selectReservationRes4JoinResDetailAndDog(String email) {
		return session.selectList(makeSqlId("selectReservationRes4JoinResDetailAndDog"),email);
	}
	
	@Override
	public List<Reservation> selectReservationRes5JoinResDetailAndDog(String email) {
		return session.selectList(makeSqlId("selectReservationRes5JoinResDetailAndDog"), email);
	}

	@Override
	public Reservation selectReservationbyResId(int resId) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	// ------------------------------------------


}
