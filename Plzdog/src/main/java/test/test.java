package test;


import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.CareService;
<<<<<<< HEAD
import com.plz.service.impl.CareServiceImpl;
import com.plzdog.vo.Care;


=======
import com.plzdog.vo.Care;
>>>>>>> branch 'master' of https://github.com/hgkimer/Plzdog.git

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
