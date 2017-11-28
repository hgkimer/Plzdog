package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.dao.CodeDao;
import com.plz.dao.SkillDao;
import com.plzdog.vo.Code;
import com.plzdog.vo.Skill;

public class TestSkillDao {
	public static void main(String[] args) {
		ApplicationContext cxt = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		SkillDao dao = (SkillDao)cxt.getBean("skillDaoImpl");
		Skill nSkill = new Skill("new@naver.com", "code-1");
		System.out.println(dao.insertSkill(nSkill));
		System.out.println(dao.deleteSkill(nSkill.getEmail()));
		System.out.println(dao.selectSkillByEmail(nSkill.getEmail()));
		
	}
}
