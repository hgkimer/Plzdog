package test;

import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.CareService;
import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

public class CareTest {
	
	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/web-context.xml");
		CareService service = (CareService) ctx.getBean("careServiceImpl");
//		service.insertCare(new Care(0, "강아지가 말을 안들어요", 4, new Date()));
//		service.updateCare(new Care(6, "강아지가 다시 말을 잘듣네요", 4, new Date()));
//		service.deleteCare(6);
//		service.insertCareImage(new CareImage("이미지2", 7));
//		service.updateCareImage(new CareImage("이미지3", 7), "이미지2");
//		service.deleteCareImage("이미지1");
//		List<Care> list = service.selectCareJoinCareImage(4);
//		for(Care c : list) {
//			System.out.println(c);
//		}
//		List<Care> list = service.selectCareJoinCareImage(2);
//		System.out.println(list);
	}

}
