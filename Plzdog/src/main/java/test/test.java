package test;


import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.AuthorityService;
import com.plz.service.CareService;
import com.plzdog.vo.Authority;
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
		
		
		//Authority Test ----- 완료
		AuthorityService authService = (AuthorityService) ctx.getBean("authorityServiceImpl");
		String email = "kim@naver.com";
		Authority newAuthority = new Authority(email, "ROLE_TEST");
		authService.removeAuthority(email);
		System.out.println("----삭제 완료------");
		authService.addAuthority(newAuthority);
		System.out.println("----권한 추가-------");
		Authority changeAuthority = new Authority(email,"ROLE_TEST_NEW");
		authService.updateAuthority(changeAuthority);
		System.out.println("-----수정 완료-----");
		List<Authority> list2 =  authService.findAllAuthority();
		System.out.println(list2);
		Authority newA = authService.findAuthorityByEmail(email);
		System.out.println(newA);
		
		
	}
}
