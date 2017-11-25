package test;

import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.plz.dao.AuthorityDao;
import com.plzdog.vo.Authority;

import java.util.List;

/*src/test/java

junit test case 클릭 -> browse에서 해당 Dao 선택
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/com/plz/config/spring/model-context.xml")
public class TestDaoImpl {
	
	@Autowired
	AuthorityDao dao;
	
	@Test
	public void test() {
		List<Authority> list = dao.selectAllAuthority();
		System.out.println(list);
		assertNotEquals(0, list.size());
	}
}
