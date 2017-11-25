package test;


import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.CareService;
import com.plzdog.vo.Care;

public class test {
	
	public static void main(String[] args) {
		
/*		CareService service = new CareServiceImpl();
		List<Care> list = service.selectCareJoinCareImage(1);
		System.out.println(list);*/
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/web-context.xml");
		CareService service = (CareService) ctx.getBean("careServiceImpl");
		List<Care> list = service.selectCareJoinCareImage(1);
		System.out.println(list);
	}
}
