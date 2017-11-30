<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${requestScope.profile.memberName }</h1>
<p>이메일 : ${requestScope.profile.email }</p>
<p>프로필 사진 : ${requestScope.profile.memberImage }</p>
<p>우편번호 : ${requestScope.profile.zipcode }</p>
<p>주소 : ${requestScope.profile.mainAddress }</p>
<p>전화번호 : ${requestScope.profile.phoneNum }</p>
<p>개 :<br>
	<c:forEach var="dog" items="${requestScope.profile.dogList }">
		 ${dog.dogName}<br>
	</c:forEach>
</p>

<c:if test="${requestScope.sitterFlag == true }">
<h1>Sitter 정보</h1>
<p>학교 : ${requestScope.profile.sitter.school }</p>
<p>서비스지역 : ${requestScope.profile.sitter.serviceAddress }</p>
<p>시터평점 : ${requestScope.profile.sitter.sitterRate }</p>

<p>스킬 리스트 : <br>
	<c:forEach var="code" items="${requestScope.profile.skillList }">
		★${code.codeName }<br>
	</c:forEach></p>

<sec:authentication property="principal.email"/>
<form action="${initParam.rootPath }/member/reservation_add_form.do">
	<input type="text" value="${requestScope.profile.email }" name="sitterEmail"/>
	<button type="submit">예약 신청</button>
</form>
</c:if>
<h2></h2>
</body>
</html>