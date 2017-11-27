package test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.dao.ReservationDao;
import com.plzdog.vo.Reservation;

public class ReservationTest {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/web-context.xml");
		ReservationDao dao = (ReservationDao) ctx.getBean("ReservationDaoImpl");
	
		dao.insertReservation(new Reservation(0,1,new Date("2017/11/27"),new Date("2017/11/28"),"저희 강아지가 행복했으면 좋겠어요.","kim@naver.com","lee@naver.com"));	
	}
}
