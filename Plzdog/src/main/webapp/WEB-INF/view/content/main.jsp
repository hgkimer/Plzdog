<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<h1>메인 페이지</h1>
<%-- <sec:authoize> - 현 사용자가 특정 권한이 있으면 몸체의 내용을 처리한다.
	   access속성에 어떤 권한인지를 표현한다. - 스프링 시큐리티의 sprint EL  이용
		<sec:authentication> - 인증한 사용자의 정보 조회. 	   
--%>
<sec:authorize access="isAuthenticated()">
	 <!-- Authentication의 getPrincipal() 호출 - User 리턴 -->
	<sec:authentication property="principal.email"/> 님 환영합니다.<br>
</sec:authorize>
