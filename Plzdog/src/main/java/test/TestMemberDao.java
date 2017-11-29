package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.MemberService;
import com.plzdog.vo.Member;

public class TestMemberDao {
	public static void main(String [] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		MemberService service = (MemberService)ctx.getBean("memberServiceImpl");
//		Member nMem = new Member("kim@naver.com", "김호규", "456123", "경기도 용인시","수지구 신봉동",16701,"image010","010-1123-4587",0);
//		System.out.println(nMem.getEmail());
//		service.addMember(nMem); 
//		System.out.println("------등록 완료------");
//		
//		nMem.setMemberName("변경한 이름");
//		service.updateMember(nMem);
//		System.out.println(service.findMemberByEmail(nMem.getEmail()));
//		System.out.println("------수정완료------");
//		service.deleteMember(nMem.getEmail());
//		System.out.println(service.findMemberByEmail(nMem.getEmail()));
//		System.out.println("------삭제완료------");
//		
//
		Member nMem = new Member("new@naver.com", "새로운사람", "456123", "경기도 용인시","수지구 신봉동",16701,"image010","010-1123-4587",0);
		System.out.println(nMem.getEmail());
		service.insertMember(nMem,"ROLE_MEMBER"); 
		System.out.println("------등록 완료------");
		
		String email ="soo@naver.com";
		String name = "수";
		System.out.println(service.selectAllMember());
		System.out.println();
		System.out.println(service.selectMemberByEmail(email));
		System.out.println();
		System.out.println(service.selectMemberByName(name));
		System.out.println();
		System.out.println(service.selectReviewByEmail(email));
		System.out.println();
		System.out.println(service.selectAllSitter());
		System.out.println();
		System.out.println(service.selectSitterByEmail(email));
		System.out.println();
		System.out.println(service.selectSitterByName(name));
	}
}
