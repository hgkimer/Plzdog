package test;

import java.util.List;

import com.plz.dao.CareDao;
import com.plz.dao.impl.CareDaoImpl;
import com.plz.service.CareService;
import com.plz.service.impl.CareServiceImpl;
import com.plzdog.vo.Care;

public class test {
	
	public static void main(String[] args) {
		
/*		CareService service = new CareServiceImpl();
		List<Care> list = service.selectCareJoinCareImage(1);
		System.out.println(list);*/
		
		CareDao dao = new CareDaoImpl();
		List<Care> list2 = dao.selectCareJoinCareImage(1);
		System.out.println(list2);
	}
}
