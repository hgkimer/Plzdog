package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.dao.CodeDao;
import com.plzdog.vo.Code;

public class TestCodeDao {
	public static void main(String[] args) {
		
		ApplicationContext cxt = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		CodeDao dao = (CodeDao)cxt.getBean("codeDaoImpl");
		Code nCode = new Code("new-Code6", "완전새롭다","새로운 카테고리");
//		System.out.println(dao.insertCode(nCode));
//		nCode.setCodeName("바뀐완전새로움:");
//		nCode.setCategory("심지어카테고리도바뀜");
//		System.out.println(dao.updateCode(nCode));
//		System.out.println(dao.deleteCode(nCode.getCode()));
		System.out.println(dao.selectCodeByCode("code-1"));
	}
	
}
