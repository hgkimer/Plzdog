package com.plz.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.ReservationDao;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.reservationMapper."+id;
	}
	
	@Override
	public int insertReservation(Reservation reservation) {
		return session.insert(makeSqlId("insertReservation"),reservation);
	}

	@Override
	public int deleteReservation(int resId) {
		return session.delete(makeSqlId("deleteReservation"),resId);
	}

	@Override
	public int updateReservation(Reservation reservation) {
		return session.update(makeSqlId("updateReservation"),reservation);
	}
	
	@Override
	public List<Reservation> selectAllReservation() {
		return session.selectList(makeSqlId("selectAllReservation"));
	}

	@Override
	public List<Reservation> selectMemberReservationByEmail(String email) {
		return session.selectList(makeSqlId("selectMemberReservationByEmail"),email);
	}

	@Override
	public List<Reservation> selectReservationJoinDemandByEmail(String email) {
		return session.selectList(makeSqlId("selectReservationJoinDemandByEmail"),email);
	}

	@Override
	public List<Reservation> selectSitterReservationByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectSitterReservationByEmail"), sitterEmail);
	}

	@Override
	public Reservation selectSitterReservationSalesByResId(int resId) {
		return session.selectOne(makeSqlId("selectSitterReservationSalesByResId"), resId);
	}

	@Override
	public List<Reservation> selectMemberCareByEmail(String email) {
		return session.selectList(makeSqlId("selectMemberCareByEmail"),email);
	}

	@Override
	public List<Reservation> selectSitterCareByEmail(String sitterEmail) {
		return session.selectList(makeSqlId("selectSitterCareByEmail"),sitterEmail);
	}
	
	//서비스 요구 사항을 추가, 수정 , 삭제
	@Override
	public int insertDemand(Demand demand) {
		return session.insert(makeSqlId("insertDemand"),demand);
	}
	@Override
	public int updateDemand(Demand demand, String originalCodeDemand) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("resId", demand.getResId());
		params.put("codeDemand", demand.getCodeDemand());
		params.put("originalCodeDemand", originalCodeDemand);
		return session.update(makeSqlId("updateDemand"), params);
	}
	
	@Override
	public int deleteDemand(int resId) {
		return session.delete(makeSqlId("deleteDemand"),resId);
	}
}
