package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.dao.ReservationDao;
import com.plz.service.ReservationService;
import com.plzdog.vo.Reservation;

public class ReservationTest {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		ReservationService service = (ReservationService) ctx.getBean("reservationServiceImpl");
		ReservationDao dao = (ReservationDao) ctx.getBean("reservationDaoImpl");
		
		//service.addReservation(new Reservation(0,1,new Date("2017/11/27"),new Date("2017/11/28"),"저희 강아지가 행복했으면 좋겠어요.","kim@naver.com","lee@naver.com"));
		
		//service.updateReservation(new Reservation(7,3,new Date("2017/11/26"),new Date("2017/11/27"),"저희 강아지가 행복했으면 좋겠어요.","kim@naver.com","lee@naver.com"));
		
		//service.removeReservation(7);
		
		//예약 전체 조회
		/*List<Reservation> list = service.findAllReservation();
		printReservation(list,"전체조회");*/
		/*//해당 회원,시터 이메일에 해당하는 예약 조회
		list = service.findMemberReservationByEmail("lee@naver.com");
		printReservation(list,"회원 해당 예약조회");
		
		list = service.findSitterReservationByEmail("soo@naver.com");
		printReservation(list,"시터 해당 예약조회");
		
		//해당 회원, 시터 이메일에 해당하는 예약의 돌봄일지를 조회
		list = service.findMemberCareByEmail("lee@naver.com");
		printReservation(list,"회원 해당 예약의 돌봄일지 조회");
		
		list = service.findSitterCareByEmail("soo@naver.com");
		printReservation(list,"시터 해당 예약의 돌봄일지 조회");
		
		//해당 회원의 예약상태를 조회
		list = service.findReservationJoinDemandByEmail("lee@naver.com");
		printReservation(list, "회원 해당 예약상태 조회");
		
		//resId로 해당 시터의 급여를 조회
		Reservation r = service.findSitterReservationSalesByEmail("a@.com");
		System.out.println("================");
		System.out.println(r);
		
		//insert, delete , update Demand
		//service.addDemand(new Demand(4,"code-11"));
		//service.addDemand(new Demand(4,"code-2"));
		//service.addDemand(new Demand(4,"code-1")); //update
		//service.updateDemand(new Demand(3,"code-11"), "code-1");
		//service.updateDemand(new Demand(3,"code-12"), "code-2");
		//service.updateDemand(new Demand(3,"code-11"), "code-3");
		//service.updateDemand(new Demand(4,"code-10"),"code-1");
		//service.updateDemand(new Demand(4,"code-12"),"code-10");
		//service.updateDemand(new Demand(1,"code-1"),"code-11");
		service.removeDemand(4);
		
		list = service.findReservationJoinDemandByEmail("lee@naver.com");
		printReservation(list, "회원 해당 예약상태 조회");*/
		
		//list = service.selectSimpleReservationSitter("soo1@naver.com");
		//printReservation(list, "회원 해당 예약 정보 + 강아지 이미지");
		
		/*list = service.findSimpleSitterReservationMemberByEmail("soo1@naver.com");
		printReservation(list,"예약에 해당하는 회원 정보");
		
		list = service.findSimpleSitterReservationResDetailDogByEmail("soo1@naver.com");
		printReservation(list, "예약에 해당하는 회원의 강아지 정보");*/
		
		/*Reservation res = service.findDetailSitterReservationDemandCodeByResId(1);
		System.out.println("예약에 해당하는 회원의 요구사항"+res);
		
		Reservation res1 = service.findDetailSitterReservationDemandCodeByResId(11);
		System.out.println("예약에 해당하는 회원의 요구사항"+res1);*/
		
		/*List<Reservation> memberList = service.findSimpleSitterReservationMemberByEmail("soo1@naver.com");
		
		//해당 시터가 가진 견주들의 강아지 정보
		List<Reservation> dogList = service.findSimpleSitterReservationResDetailDogByEmail("soo1@naver.com");
		
		for(Reservation resMember : memberList) {
			for(Reservation resDog : dogList) {
				if(resMember.getResId() == resDog.getResId()) {
					resMember.setResDetailList(resDog.getResDetailList());
				}
			}
		}
		
		for(Reservation res1 : memberList) {
			System.out.println("회원에 해당된 예약 : "+res1);
		}*/
		
		//전체 의뢰 조회 res-1 null 인것
		/*List<Reservation> memberList1 = service.findAllMemberReservationMember();
		for(Reservation res2 : memberList1) {
			System.out.println("각 의뢰 : " + res2);
		}*/
		
		//견주에 해당하는 개정보
		/*System.out.println("견주에 해당 개정보"+
				service.findMemberReservationResDetailDogByEmail("dbsrb0322@naver.com"));*/
		
		/*List<Reservation> dogList1 = new ArrayList<>();
		for(int i =0 ; i<memberList1.size() ; i++) {
			// resid 34 , 35 , 36
			dogList1 = service.findMemberReservationResDetailDogByEmail(memberList1.get(i).getMemberEmail());
				 
				if(memberList1.get(i).getResId() == dogList1.get(i).getResId()) {
				memberList1.get(i).setResDetailList(dogList1.get(i).getResDetailList());
			}
		}*/
		
		//예약에 해당하는 견주 + 강아지 정보
		/*for(int k =0 ; k<memberList1.size() ; k++) {
			System.out.println("각 의뢰 : " + memberList1.get(k));
			}*/
		
		List<Reservation> resList = dao.selectReservationRes5JoinResDetailAndDog("lee@naver.com");
		System.out.println(resList);
		
		resList = dao.selectReservationRes1JoinResDetailAndDog("lee@naver.com");
		System.out.println(resList);
		
		resList = dao.selectCompletePaymentReservationMemberByEmail("soo1@naver.com");
		System.out.println(resList);
		
		Reservation r = dao.selectReservationDemandCodeByResId(22);
		System.out.println(r);
		}
	
	
	
	public static void printReservation(List<Reservation> list,String label) {
		System.out.println("---------"+label+"-----------");
		for(Reservation r : list) {
			System.out.println(r);
		}
		System.out.println("----------------------");
	}
}
