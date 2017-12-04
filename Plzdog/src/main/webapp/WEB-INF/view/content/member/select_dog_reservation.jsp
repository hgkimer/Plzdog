<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
강아지를 선택해 주세요<br>
<form action="${initParam.rootPath }/member/selectDogInReservation.do" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="resId" value="${sessionScope.resId }">
	<c:forEach var="dog" items="${sessionScope.dogList }">
		<input type="checkbox" name="dogId" value="${dog.dogId }">${dog.dogName }
	</c:forEach>
	<button type="submit">선택</button>
</form>
</body>
</html>