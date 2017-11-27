package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.CareService;

public class ReservationTest {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/web-context.xml");
	CareService service = (CareService) ctx.getBean("careServiceImpl");
}
