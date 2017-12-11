package com.plz.listenter;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.dao.CodeDao;
import com.plzdog.vo.Code;

// 코드 테이블의 전체 코드들을 List로 ApplicationScope에 저장하기 위한 Listener
@WebListener
public class CodeLoadListener implements ServletContextListener {

   public void contextDestroyed(ServletContextEvent event) {
   }

   public void contextInitialized(ServletContextEvent event) {
      ServletContext ctx = event.getServletContext();
      String confg = ctx.getInitParameter("code-config");
      ApplicationContext context = new ClassPathXmlApplicationContext(confg);
      CodeDao dao = (CodeDao) context.getBean("codeDaoImpl");
      
      List<Code> skillList = dao.selectCodeByCategory("시터");
      List<Code> enList = dao.selectCodeByCategory("시터환경");
      List<Code> serviceList = dao.selectCodeByCategory("서비스");
      /*List<Code> checkSkillList = new ArrayList<>();
      for(int i = 3 ; i< skillList.size(); i++) {
    	  checkSkillList.add(skillList.get(i));
      }*/
      List<Code> resList = dao.selectCodeByCategory("예약");
      List<Code> dogInfoList = dao.selectCodeByCategory("강아지");
      //전체 요구사항(스킬)에 대한 코드 리스트(sitter-1 ~ -7)를 ApplicationScope에 저장
      ctx.setAttribute("skillList", skillList);
      //전체 시터 환경에 대한 코드 리스트를 ApplicationScope에 저장
      ctx.setAttribute("enList", enList);
      //전체 서비스 종류(service-1 : 방문돌봄, service-2 : 위탁돌봄)에 대한 코드 리스트를 ApplicationScope에 저장
      ctx.setAttribute("serviceList", serviceList);
      //전체 예약 상태 종류(res-1, res-2,res-3, res-4, res-5)에 대한 코드 리스트를 ApplicationScope에 저장
      ctx.setAttribute("resList", resList);
      //전체 강아지 관련 정보
      ctx.setAttribute("dogInfoList", dogInfoList);
   }

}