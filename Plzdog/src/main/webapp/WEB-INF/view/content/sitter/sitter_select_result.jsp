<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.plzdog.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>시터 전체 결과</h2>

<c:forEach items="${requestScope.sitterList }" var="member">
	<div class="sitter" onclick="location.href='goToProfile.do?email=${member.email }'" style="cursor:pointer">
	email : ${member.email }<br> 
	회원이름 : ${member.memberName }<br>
	회원 비밀번호 : ${member.password }<br>
	회원 주소 : ${member.mainAddress } ${member.subAddress }<br>
	우편번호 : ${member.zipcode}<br>
	회원 이미지 : <img src="${initParam.rootPath }/memberImage/${member.memberImage }" width="350px"><br>
	탈퇴여부 : ${member.memberEnable }<br>
	
	학교 이름 : ${member.sitter.school }<br>
	<%-- 증명서/면허증 :  <img src="${initParam.rootPath }/sitterImage/${member.sitter.Image}" width="350px"><br> --%>
	서비스 가능 지역 : ${member.sitter.serviceAddress }<br>
	평점 : ${member.sitter.sitterRate }<br>
	방문돌봄 가격 : ${member.sitter.visitPrice }<br>
	위탁돌봄 가격 : ${member.sitter.givePrice }<br>
	-----------------------------<br>
	</div>
</c:forEach>
</body>
</html>