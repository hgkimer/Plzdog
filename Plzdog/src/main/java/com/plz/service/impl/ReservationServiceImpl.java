package com.plz.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.AuthorityDao;
import com.plz.dao.MemberDao;
import com.plz.dao.ResDetailDao;
import com.plz.dao.ReservationDao;
import com.plz.service.ReservationService;
import com.plzdog.vo.Authority;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Member;
import com.plzdog.vo.ResDetail;
import com.plzdog.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao dao;
	@Autowired
	private ResDetailDao resdDao;
	@Autowired
	private AuthorityDao aDao;
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member checkSitter(String sitterEmail) {
		Member sitter = null;
		List<Authority> aList = aDao.selectAuthorityByEmail(sitterEmail);
		for(Authority a : aList) {
			if(a.getAuthority().equals("ROLE_SITTER")) {
				sitter = mDao.selectSitterByEmail(sitterEmail);
				break;
			}else {
				continue;
			}
		}return sitter;
	}
	
	@Override
	//Reservation, Demand, ResDetail 동시에 insert가 들어가기 때문에 Transaction 처리
	@Transactional
	public void addReservation(Reservation reservation, List<String> demandList, List<Integer> dogList) {
		dao.insertReservation(reservation);
		//요구사항 리스트를 반복해서 Demand 테이블에 insert
		for(String demand : demandList) {
			dao.insertDemand(new Demand(reservation.getResId(),demand));
		}
		//해당 예약 Id를 가지고 있는 강아지 ID를 반복해서 ResDetail 테이블에 insert
		for(int dogId : dogList) {
			resdDao.insertResDetail(new ResDetail(reservation.getResId(), dogId));
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
	
	//------------------------------------
	
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
	public List<Reservation> findSimpleReservationMemberByEmail(String email){
		return dao.selectSimpleReservationMemberByEmail(email);
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
	
	// -----------------------Lee su il----------------------------------
	@Override
	public List<Reservation> findSimpleSitterReservationMemberByEmail(String sitterEmail){
		return dao.selectSimpleSitterReservationMemberByEmail(sitterEmail);
	}
	
	@Override
	public List<Reservation> findSimpleSitterReservationResDetailDogByEmail(String sitterEmail){
		return dao.selectSimpleSitterReservationResDetailDogByEmail(sitterEmail);
	}
	
	@Override
	public Reservation findDetailSitterReservationDemandCodeByResId(int resId) {
		return dao.selectDetailSitterReservationDemandCodeByResId(resId);
	}
	// -----------------------Lee su il----------------------------------
}