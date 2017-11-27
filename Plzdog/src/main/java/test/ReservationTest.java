package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.ReservationService;
import com.plzdog.vo.Demand;
import com.plzdog.vo.Reservation;

public class ReservationTest {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		ReservationService service = (ReservationService) ctx.getBean("reservationServiceImpl");
		
		//service.addReservation(new Reservation(0,1,new Date("2017/11/27"),new Date("2017/11/28"),"저희 강아지가 행복했으면 좋겠어요.","kim@naver.com","lee@naver.com"));
		
		//service.updateReservation(new Reservation(7,3,new Date("2017/11/26"),new Date("2017/11/27"),"저희 강아지가 행복했으면 좋겠어요.","kim@naver.com","lee@naver.com"));
		
		//service.removeReservation(7);
		
		//예약 전체 조회
		List<Reservation> list = service.findAllReservation();
		printReservation(list,"전체조회");
		//해당 회원,시터 이메일에 해당하는 예약 조회
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
		Reservation r = service.findSitterReservationSalesByResId(1);
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
		printReservation(list, "회원 해당 예약상태 조회");
	}
	
	public static void printReservation(List<Reservation> list,String label) {
		System.out.println("---------"+label+"-----------");
		for(Reservation r : list) {
			System.out.println(r);
		}
		System.out.println("----------------------");
	}
}
