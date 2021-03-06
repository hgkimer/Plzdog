package com.plz.service.impl;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.AuthorityDao;
import com.plz.dao.DogDao;
import com.plz.dao.MemberDao;
import com.plz.dao.ResDetailDao;
import com.plz.dao.ReservationDao;
import com.plz.service.ReservationService;
import com.plzdog.vo.Authority;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Dog;
import com.plzdog.vo.Member;
import com.plzdog.vo.ResDetail;
import com.plzdog.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao dao;
	@Autowired
	private ResDetailDao resdDao;
	
	@Autowired
	private AuthorityDao aDao;
	@Autowired
	private MemberDao mDao;
	@Autowired
	private DogDao dDao;

	/*
	 * 프로필 페이지에 접근할 때, 시터인지 아닌지 확인해 주는 메소드 이메일을 요청파라미터로 받아 권한을 검색한뒤 ROLE_SITTER 가
	 * 있으면 리스트에 시터의 정보들을 담은 MEMBER 객체를 리턴한다. - 없으면 siiter객체가 NULL인 멤버 객체를 리턴한다.
	 */
	@Override
	public Member checkSitter(String sitterEmail) {
		Member sitter = null;
		List<Authority> aList = aDao.selectAuthorityByEmail(sitterEmail);
		for (Authority a : aList) {
			if (a.getAuthority().equals("ROLE_SITTER")) {
				sitter = mDao.selectSitterByEmail(sitterEmail);
				break;
			} else {
				continue;
			}
		}
		return sitter;
	}

	@Override
	// Reservation, Demand, ResDetail 동시에 insert가 들어가기 때문에 Transaction 처리
	@Transactional
	public void addReservation(Reservation reservation, List<String> demandList, List<Integer> dogList) {
		dao.insertReservation(reservation);
		// 요구사항 리스트를 반복해서 Demand 테이블에 insert
		for (String demand : demandList) {
			dao.insertDemand(new Demand(reservation.getResId(), demand));
		}
		// 해당 예약 Id를 가지고 있는 강아지 ID를 반복해서 ResDetail 테이블에 insert
		for (int dogId : dogList) {
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

	// 서비스 요구 사항을 추가, 수정 , 삭제
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

	// ------------------------------------

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

	/*
	 * @Override public List<Reservation> findSimpleReservationMemberByEmail(String
	 * email){ return dao.selectSimpleReservationMemberByEmail(email); }
	 */

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
	public List<Reservation> findSimpleSitterReservationMemberByEmail(String sitterEmail) {
		return dao.selectSimpleSitterReservationMemberByEmail(sitterEmail);
	}

	@Override
	public List<Reservation> findSimpleSitterReservationResDetailDogByEmail(String sitterEmail) {
		return dao.selectSimpleSitterReservationResDetailDogByEmail(sitterEmail);
	}

	@Override
	public Reservation findDetailSitterReservationDemandCodeByResId(int resId) {
		return dao.selectDetailSitterReservationDemandCodeByResId(resId);
	}

	@Override
	public List<Reservation> findSimpleSitterReservationInfoByEmail(String sitterEmail) {
		// 시터이메일 해당하는 예약
		// 견주들이 해당 시터한테 신청한 예약
		List<Reservation> memberList = dao.selectSimpleSitterReservationMemberByEmail(sitterEmail);

		// 해당 시터가 가진 견주들의 강아지 정보
		List<Reservation> dogList = dao.selectSimpleSitterReservationResDetailDogByEmail(sitterEmail);

		for (Reservation resMember : memberList) {
			for (Reservation resDog : dogList) {
				if (resMember.getResId() == resDog.getResId()) {
					resMember.setResDetailList(resDog.getResDetailList());
				}
			}
		}
		return memberList;
	}

	@Override
	public List<Reservation> findCompletePaymentReservationInfoByEmail(String sitterEmail) {
		// 시터이메일 해당하는 예약
		// 견주들이 해당 시터한테 신청한 예약
		List<Reservation> memberList = dao.selectCompletePaymentReservationMemberByEmail(sitterEmail);

		// 해당 시터가 가진 견주들의 강아지 정보
		List<Reservation> dogList = dao.selectCompletePaymentReservationResDetailDogByEmail(sitterEmail);

		for (Reservation resMember : memberList) {
			for (Reservation resDog : dogList) {
				if (resMember.getResId() == resDog.getResId()) {
					resMember.setResDetailList(resDog.getResDetailList());
				}
			}
		}
		return memberList;
	}

	@Override
	public List<Reservation> findWaitingPaymentReservationInfoByEmail(String sitterEmail) {
		// 시터이메일 해당하는 예약
		// 견주들이 해당 시터한테 신청한 예약
		List<Reservation> memberList = dao.selectWaitingPaymentReservationMemberByEmail(sitterEmail);

		// 해당 시터가 가진 견주들의 강아지 정보
		List<Reservation> dogList = dao.selectWaitingPaymentReservationResDetailDogByEmail(sitterEmail);

		for (Reservation resMember : memberList) {
			for (Reservation resDog : dogList) {
				if (resMember.getResId() == resDog.getResId()) {
					resMember.setResDetailList(resDog.getResDetailList());
				}
			}
		}
		return memberList;
	}

	@Override
	public List<Reservation> findWaitingForApprovalReservationSitter(String sitterEmail) {
		// 시터에게 온 회원 + 회원의 강아지 정보
		List<Reservation> memberList = findSimpleSitterReservationInfoByEmail(sitterEmail);

		// 시터에게 온 회원의 요구사항
		Reservation skillList = new Reservation();

		// 시터에게 온 회원의 강아지 스킬 + 강아지 이미지
		for (int i = 0; i < memberList.size(); i++) {

			skillList = findDetailSitterReservationDemandCodeByResId(memberList.get(i).getResId());

			// 해당 회원의 요구사항을 회원 리스트에 넣는다.
			memberList.get(i).setDemandList(skillList.getDemandList());

			for (int j = 0; j < memberList.get(i).getResDetailList().size(); j++) {
				// 해당 회원의 강아지들의 정보를 회원의 dogList에 넣는다.
				memberList.get(i).getResDetailList().get(j).setDog(dDao
						.selectDogJoinDogInfoDogImageByDogId(memberList.get(i).getResDetailList().get(j).getDogId()));
			}
		}
		return memberList;
	}

	@Override
	public List<Reservation> findCompletePaymentReservationSitter(String sitterEmail) {
		// 시터이메일 해당하는 예약
		// 견주들이 해당 시터한테 신청한 예약들 중에 결제 완료 한 예약

		// sitterEmail, res-5 : 결제 완료
		List<Reservation> memberList = findCompletePaymentReservationInfoByEmail(sitterEmail);

		// 시터에게 온 회원의 요구사항
		Reservation skillList = new Reservation();

		// 시터에게 온 회원의 강아지 스킬 + 강아지 이미지
		for (int i = 0; i < memberList.size(); i++) {

			skillList = findDetailSitterReservationDemandCodeByResId(memberList.get(i).getResId());

			// 해당 회원의 요구사항을 회원 리스트에 넣는다.
			memberList.get(i).setDemandList(skillList.getDemandList());

			for (int j = 0; j < memberList.get(i).getResDetailList().size(); j++) {
				// 해당 회원의 강아지들의 정보를 회원의 dogList에 넣는다.
				memberList.get(i).getResDetailList().get(j).setDog(dDao
						.selectDogJoinDogInfoDogImageByDogId(memberList.get(i).getResDetailList().get(j).getDogId()));
			}
		}
		return memberList;
	}

	@Override
	public List<Reservation> findWaitingPaymentReservationSitter(String sitterEmail) {
		// 시터이메일 해당하는 예약
		// 견주들이 해당 시터한테 신청한 예약들 중에 결제 완료 한 예약

		// sitterEmail, res-4 : 결제 대기
		List<Reservation> memberList = findWaitingPaymentReservationInfoByEmail(sitterEmail);

		// 시터에게 온 회원의 요구사항
		Reservation skillList = new Reservation();

		// 시터에게 온 회원의 강아지 스킬 + 강아지 이미지
		for (int i = 0; i < memberList.size(); i++) {

			skillList = findDetailSitterReservationDemandCodeByResId(memberList.get(i).getResId());

			// 해당 회원의 요구사항을 회원 리스트에 넣는다.
			memberList.get(i).setDemandList(skillList.getDemandList());

			for (int j = 0; j < memberList.get(i).getResDetailList().size(); j++) {
				// 해당 회원의 강아지들의 정보를 회원의 dogList에 넣는다.
				memberList.get(i).getResDetailList().get(j).setDog(dDao
						.selectDogJoinDogInfoDogImageByDogId(memberList.get(i).getResDetailList().get(j).getDogId()));
			}
		}
		return memberList;
	}

	// -----------------------Lee su il----------------------------------

	// ------------------------Yoon gue seok------------------------------
	@Override
	public List<Reservation> findAllMemberReservationMember() {
		return dao.selectAllMemberReservationMember();
	}

	public List<Reservation> findMemberReservationResDetailDogByEmail(String email) {
		return dao.selectMemberReservationResDetailDogByEmail(email);
	}
	// -------------------------------------------------------------------

	// -------------------------김호규------------------------------------
	@Override
	public List<Reservation> findReservationRes1(String email) {
		// 1. 자신의 이메일을 통해 예약과 강아지 정보를 조회
		List<Reservation> resList = dao.selectReservationRes1JoinResDetailAndDog(email);
		// 2. 의뢰자, 강아지, 요구사항 내용을 각 예약객체에 세팅한다.
		for (Reservation r : resList) {
			// 의뢰자 정보 세팅
			r.setMember(mDao.selectMemberByEmail(r.getMemberEmail()));
			ArrayList<Dog> dogList = new ArrayList<>();
			// 예약 상세 리스트를 반복문을 돌려 해당하는 강아지의 ID를 통해 강아지 상세 정보와 이미지들을 반복해서 세팅.
			for (ResDetail rd : r.getResDetailList()) {
				rd.setDog(dDao.selectDogJoinDogInfoDogImageByDogId(rd.getDogId()));
				// 정보를 저장한 강아지들을 리스트에 담는다.
				dogList.add(rd.getDog());
			}
			// 강아지의 전체 정보를 담은 리스트를 각 예약객체에 세팅.
			r.setResDogList(dogList);
			// 예약 아이디와 일치하는 Demand 리스트 세팅.
			Reservation res = dao.selectReservationDemandCodeByResId(r.getResId());
			r.setDemandList(res.getDemandList());
		}
		// 모든 정보를 저장한 예약 타입의 리스트들을 리턴.
		return resList;
	}

	@Override
	public List<Reservation> findReservationRes2(String email) {
		// 1. 자신의 이메일을 통해 예약과 강아지 정보를 조회
		List<Reservation> resList = dao.selectReservationRes2JoinResDetailAndDog(email);
		// 2. 의뢰자, 시터, 강아지 요구사항 정보를 각 예약 겍체에 세팅한다.
		for (Reservation r : resList) {
			// 의뢰자 정보 세팅
			r.setMember(mDao.selectMemberByEmail(email));
			// 의뢰를 접수하기 희망하는 시터의 정보 세팅
			r.setSitter(mDao.selectSitterByEmail(r.getSitterEmail()));
			// 예약 상세 리스트를 반복문을 돌려 해당하는 강아지의 ID를 통해 강아지 상세 정보와 이미지들을 반복해서 세팅.
			ArrayList<Dog> dogList = new ArrayList<>();
			for (ResDetail rd : r.getResDetailList()) {
				rd.setDog(dDao.selectDogJoinDogInfoDogImageByDogId(rd.getDogId()));
				// 정보를 저장한 강아지들을 리스트에 담는다.
				dogList.add(rd.getDog());
			}
			r.setResDogList(dogList);
			// 강아지의 전체 정보를 담은 리스트를 각 예약 객체에 세팅
			Reservation res = dao.selectReservationDemandCodeByResId(r.getResId());
			r.setDemandList(res.getDemandList());
		}
		// 모든 정보를 저장한 예약 타입의 리스트들을 리턴.
		return resList;
	}
	
	@Override
	public List<Reservation> findReservationRes4(String email) {
		//1. 자신의 이메일을 통해 예약과 강아지 정보를 조회
		List<Reservation> resList = dao.selectReservationRes4JoinResDetailAndDog(email);
		//2. 의뢰자, 시터, 강아지 요구사항 정보를 각 예약 겍체에 세팅한다.
		for(Reservation r : resList) {
			//의뢰자 정보 세팅
			r.setMember(mDao.selectMemberByEmail(email));
			//의뢰를 접수한 시터의 정보 세팅
			r.setSitter(mDao.selectSitterByEmail(r.getSitterEmail()));
			//예약 상세 리스트를 반복문을 돌려 해당하는 강아지의 ID를 통해 강아지 상세 정보와 이미지들을 반복해서 세팅.
			ArrayList<Dog> dogList = new ArrayList<>();
			for(ResDetail rd : r.getResDetailList()) {
				rd.setDog(dDao.selectDogJoinDogInfoDogImageByDogId(rd.getDogId()));
				//정보를 저장한 강아지들을 리스트에 담는다.
				dogList.add(rd.getDog());
			}
			r.setResDogList(dogList);
			//강아지의 전체 정보를 담은 리스트를 각 예약 객체에 세팅
			Reservation res = dao.selectReservationDemandCodeByResId(r.getResId());
			//요구사항 세팅
			r.setDemandList(res.getDemandList());
		}
		//모든 정보를 저장한 예약 타입의 리스트들을 리턴.
		return resList;
	}
	
	@Override
	public Reservation payment(int resId) {
		Reservation r = dao.selectReservationJoinResDetailAndDogByResId(resId);
		//예약 객체의 회원 정보 세팅
		r.setMember(mDao.selectMemberByEmail(r.getMemberEmail()));
		//예약 객체에 담당 시터 정보 세팅
		r.setSitter(mDao.selectSitterByEmail(r.getSitterEmail()));
		//강아지들의 상세정보를 담을 Dog 객체 리스트 생성
		ArrayList<Dog> dogList = new ArrayList<>();
		for(ResDetail rd : r.getResDetailList()) {
			//하나의 예약 상세정보에 들어있는 강아지의 아이디를 통해 강아지 들의 상세정보를 객체에 저장
			rd.setDog(dDao.selectDogJoinDogInfoDogImageByDogId(rd.getDogId()));
			//저장된 강아지들을 위에서 만든 강아지 리스트에 
			dogList.add(rd.getDog());
		}
		//강아지 정보를 저장한 뒤 세팅
		r.setResDogList(dogList);
		Reservation res = dao.selectReservationDemandCodeByResId(r.getResId());
		//요구사항 저장
		r.setDemandList(res.getDemandList());
		return r;
	}
	
	@Override
	public List<Reservation> findReservationRes5(String email){
		//1. 자신의 이메일을 통해 예약과 강아지 정보를 조회
				List<Reservation> resList = dao.selectReservationRes5JoinResDetailAndDog(email);
				//2. 의뢰자, 시터, 강아지 요구사항 정보를 각 예약 겍체에 세팅한다.
				for(Reservation r : resList) {
					//의뢰자 정보 세팅
					r.setMember(mDao.selectMemberByEmail(email));
					//의뢰를 접수하기 희망하는 시터의 정보 세팅
					r.setSitter(mDao.selectSitterByEmail(r.getSitterEmail()));
					//예약 상세 리스트를 반복문을 돌려 해당하는 강아지의 ID를 통해 강아지 상세 정보와 이미지들을 반복해서 세팅.
					ArrayList<Dog> dogList = new ArrayList<>();
					for(ResDetail rd : r.getResDetailList()) {
						rd.setDog(dDao.selectDogJoinDogInfoDogImageByDogId(rd.getDogId()));
						//정보를 저장한 강아지들을 리스트에 담는다.
						dogList.add(rd.getDog());
					}
					r.setResDogList(dogList);
					//강아지의 전체 정보를 담은 리스트를 각 예약 객체에 세팅
					Reservation res = dao.selectReservationDemandCodeByResId(r.getResId());
					r.setDemandList(res.getDemandList());
				}
				//모든 정보를 저장한 예약 타입의 리스트들을 리턴.
				return resList;
	}
	
	@Override
	public List<Reservation> findReservationAllRes1Sitter() {
		// 1. res-1 상태인 예약 전체 조회
		List<Reservation> resList = dao.selectReservationAllRes1();
		for (Reservation r : resList) {
			// 예약 객체의 회원 이메일을 통해 회원정보를 세팅
			r.setMember(mDao.selectMemberByEmail(r.getMemberEmail()));
			// 쿼리로 못불러와서 예약 상세객체들을 dao를 통해 따로 세팅
			r.setResDetailList(resdDao.selectResDetailByResId(r.getResId()));
			ArrayList<Dog> dogList = new ArrayList<>();
			for (ResDetail rd : r.getResDetailList()) {
				rd.setDog(dDao.selectDogJoinDogInfoDogImageByDogId(rd.getDogId()));
				// 정보를 저장한 강아지들을 리스트에 담는다.
				dogList.add(rd.getDog());
			}
			r.setResDogList(dogList);
			// 강아지의 전체 정보를 담은 리스트를 각 예약 객체에 세팅
			Reservation res = dao.selectReservationDemandCodeByResId(r.getResId());
			r.setDemandList(res.getDemandList());
		}
		return resList;
	}
	
	@Override
	public void updateProposal(String sEmail, int resId) {
		// 매개변수로 받은 예약 아이디로 예약 객체 생성
		Reservation res = dao.selectReservationById(resId);
		Member sitter = mDao.selectSitterByEmail(sEmail);
		// 서비스 별로 다른 가격을 넣어주기 위해 demand List 세팅
		res.setDemandList(dao.selectReservationDemandCodeByResId(resId).getDemandList());
		String service = null;// 서비스 종류를 저장하기 위한 변수
		if (res.getSitterEmail() == null) { // 아직 견적이 신청되지 않은 경우.
			for (Demand d : res.getDemandList()) {
				// 예약의 요구사항 리스트에서 서비스 카테고리인 Demand 객체의 코드값을 저장
				if (d.getCode().getCategory().equals("서비스")) {
					service = d.getCode().getCode();
				}
			}
			if (service.equals("service-1")) {
				// 서비스 종류가 방문 돌봄인 경우, 해당 시터의 정보에서 방문돌봄의 가격으로 예약 가격을 저장한다.
				res.setPrice(sitter.getSitter().getVisitPrice());
			} else {
				// 서비스 종류가 위탁 돌봄인 경우, 해당 시터의 정보에서 위탁돌봄의 가격으로 예약 가격을 저장한다.
				res.setPrice(sitter.getSitter().getGivePrice());
			}
			res.setSitterEmail(sitter.getEmail());// 시터의 이메일 세팅
			res.setResStatus("res-2");
			dao.updateReservation(res);// 세팅한 예약으로 수정
		}else { //견적 신청을 한 경우
			 res.setSitterEmail(null);
			 res.setPrice(0);
			 res.setResStatus("res-1");
			 dao.updateReservation(res);
		}
	}

	@Override
	public void acceptReservation(int resId) {
		//매출을 추가
		Reservation res = dao.selectReservationById(resId);
		res.setResStatus("res-4");
		dao.updateReservation(res);
	}
	
	@Override
	public void denyReservation(int resId) {
		Reservation res = dao.selectReservationById(resId);
		res.setResStatus("res-1");
		res.setSitterEmail(null);
		dao.updateReservation(res);
	}

	

	

	// ----------------------------------------------------------------------
}