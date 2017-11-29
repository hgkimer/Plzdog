package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.AuthorityService;
import com.plz.service.impl.AuthorityServiceImpl;
import com.plzdog.vo.Authority;

public class TestAuthorityDao {
	public static void main(String [] args) {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
	//Authority Test ----- 완료
	AuthorityService authService = (AuthorityServiceImpl) ctx.getBean("authorityServiceImpl");
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
	List<Authority> newA = authService.findAuthorityByEmail(email);
	System.out.println(newA);
	}
}
