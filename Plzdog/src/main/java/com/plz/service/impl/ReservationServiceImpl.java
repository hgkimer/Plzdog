package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.dao.ReservationDao;
import com.plz.service.ReservationService;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao dao;
	
	@Override
	public void addReservation(Reservation reservation) {
		dao.insertReservation(reservation);
	}

	@Override
	public void updateReservation(Reservation reservation) {
		dao.updateReservation(reservation);
	}

	@Override
	public void removeReservation(int resId) {
		dao.deleteReservation(resId);
	}

	@Override
	public List<Reservation> findAllReservation() {
		return dao.selectAllReservation();
	}

	@Override
	public List<Reservation> findMemberReservationByEmail(String email) {
		return dao.selectMemberReservationByEmail(email);
	}
	
	@Override
	public List<Reservation> findSitterReservationByEmail(String sitterEmail) {
		return dao.selectSitterReservationByEmail(sitterEmail);
	}

	@Override
	public List<Reservation> findReservationJoinDemandByEmail(String email) {
		return dao.selectReservationJoinDemandByEmail(email);
	}

	@Override
	public List<Reservation> findMemberCareByEmail(String email) {
		return dao.selectMemberCareByEmail(email);
	}
	
	@Override
	public List<Reservation> findSitterCareByEmail(String sitterEmail) {
		return dao.selectSitterCareByEmail(sitterEmail);
	}

	@Override
	public Reservation findSitterReservationSalesByResId(int resId) {
		return dao.selectSitterReservationSalesByResId(resId);
	}
	
	//서비스 요구 사항을 추가, 수정 , 삭제
	@Override
	public void addDemand(Demand demand) {
		dao.insertDemand(demand);
	}
	
	@Override
	public void updateDemand(Demand demand, String originalCodeDemand) {
		dao.updateDemand(demand, originalCodeDemand);
	}
	
	@Override
	public void removeDemand(int resId) {
		dao.deleteDemand(resId);
	}
	
	
}
