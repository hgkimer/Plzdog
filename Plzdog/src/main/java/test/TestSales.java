package test;

import java.util.List;

import javax.print.PrintService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.SalesService;
import com.plzdog.vo.Reservation;
import com.plzdog.vo.Sales;


public class TestSales {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		SalesService service = (SalesService) ctx.getBean("salesServiceImpl");
//		service.insertSales(new Sales(1, 1000, 100, 2000, new Date()));
//		service.updateSales(new Sales(1, 2000, 200, 4000, new Date()));
		service.deleteSales(1);
	}
}
