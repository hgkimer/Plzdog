<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약 신청 완료</h1><br>

<p>${sessionScope.reservation.resId }</p>
<p><fmt:formatDate value = '${sessionScope.reservation.resSDate }' type="date"/></p>
<p><fmt:formatDate value = '${sessionScope.reservation.resEDate }' type="date"/></p>
<p>${sessionScope.reservation.price }원</p>
<p>${sessionScope.reservation.sitterEmail }</p>
</body>
</html>