package com.plz.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.ReservationDao;
import com.plz.service.ReservationService;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao dao;
	
	@Override
	@Transactional
	public void addReservation(Reservation reservation) {
		List<Demand> dList = reservation.getDemandList();
		Iterator<Demand> itr = dList.iterator();
		while(itr.hasNext()) {
			Demand d = itr.next();
			if(d.getCodeDemand() == null) {
				itr.remove();
			}
			System.out.println(d);
		}
		dao.insertReservation(reservation);
		for(Demand d : reservation.getDemandList()) {
			System.out.println(d);
			d.setResId(reservation.getResId());
			dao.insertDemand(d);
		}
	}

	@Override
	public void updateReservation(Reservation reservation) {
		dao.updateReservation(reservation);
	}

	@Override
	@Transactional
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
	public Reservation findSitterReservationSalesByEmail(String email) {
		return dao.selectSitterReservationSalesByEmail(email);
	}
	
	//서비스 요구 사항을 추가, 수정 , 삭제
	@Override
	@Transactional
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

	@Override
	public Reservation findReservationById(int resId) {
		return dao.selectReservationById(resId);
	}

	@Override
	public List<Reservation> selectSimpleReservationSitter(String email) {
		return dao.selectSimpleReservationSitter(email);
	}

	@Override
	public List<Reservation> selectDetailReservationSitter(String email) {
		return dao.selectDetailReservationSitter(email);
	}

	@Override
	public List<Reservation> selectSimpleReservationMember(String email) {
		return dao.selectSimpleReservationMember(email);
	}

	@Override
	public List<Reservation> selectDetailReservationMember(String email) {
		return dao.selectDetailReservationMember(email);
	}

	@Override
	public List<Reservation> selectSimpleReservationAdmin() {
		return dao.selectSimpleReservationAdmin();
	}

	@Override
	public List<Reservation> selectDetailReservationAdmin(String sitterEmail, String memberEmail) {
		return dao.selectDetailReservationAdmin(sitterEmail, memberEmail);
	}
}