<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="res">
	예약 번호 : ${res.resId }<br>
	예약 상태 : ${res.resType }<br>
	리뷰 : ${res.resContents }<br>
	견주 이메일 : ${res.memberEmail }<br>
	시터 이메일  : ${res.sitterEmail }<br>
</c:forEach>
</body>
</html>