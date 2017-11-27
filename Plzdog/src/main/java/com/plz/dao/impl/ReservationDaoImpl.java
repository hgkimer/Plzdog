package com.plz.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.ReservationDao;
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
	public int deleteReservation(String resId) {
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
	public Reservation selectSitterReservationByEmail(String sitterEmail) {
		return session.selectOne(makeSqlId("selectSitterReservationByEmail"),sitterEmail);
	}

	@Override
	public List<Reservation> selectMemberCareByEmail(String email) {
		return session.selectList(makeSqlId("selectMemberCareByEmail"),email);
	}
}
