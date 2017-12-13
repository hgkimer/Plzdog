<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mySidebar {
	display:none;
}
</style>
</head>
<body>
<h1>예약 신청 완료</h1><br>

<p>${requestScope.reservation.resId }</p>
<p><fmt:formatDate value = '${requestScope.reservation.resSDate }' type="date"/></p>
<p><fmt:formatDate value = '${requestScope.reservation.resEDate }' type="date"/></p>
<p>${requestScope.reservation.price }원</p>
<p>${requestScope.reservation.sitterEmail }</p>
</body>
</html>