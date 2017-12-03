package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.dao.SitterDao;
import com.plzdog.vo.Sitter;

public class TestSitterDao {
	public static void main(String[] args) {
		
		ApplicationContext cxt = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		SitterDao dao = (SitterDao)cxt.getBean("sitterDaoImpl");
		Sitter nSitter = new Sitter("new@naver.com","서울대","증명서 이미지 경로","한국",3.9,10000,1);
		System.out.println(dao.insertSitter(nSitter));
		nSitter.setSchool("새로운 대학교");
		System.out.println(dao.updateSitter(nSitter));
		//System.out.println(dao.deleteSitter(nSitter.getEmail()));
		System.out.println(dao.selectSitterByEmail("new@naver.com"));
		
		String email = "soo@naver.com";
		
		System.out.println(dao.selectSitterByEmail(email));
		System.out.println(dao.selectSitterSkillListByEmail(email));
	}
	
}
