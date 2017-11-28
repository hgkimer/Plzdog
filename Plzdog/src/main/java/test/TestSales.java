package test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.dao.SalesDao;
import com.plzdog.vo.Sales;


public class TestSales {

	public static void main(String[] args) {
		ApplicationContext cxt = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		SalesDao dao = (SalesDao)cxt.getBean("salesDaoImpl");
		Sales nSales = new Sales(1, 1000, 100, 1100, new Date("1999-03-22"));
		System.out.println(dao.insertSales(nSales));
	}
}
