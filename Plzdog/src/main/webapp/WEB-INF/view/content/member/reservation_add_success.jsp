<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>성공</h1><br>

<p>${requestScope.reservation.resId }</p>
<p>${requestScope.reservation.resSDate }</p>
<p>${requestScope.reservation.resEDate }</p>
<p>${requestScope.reservation.price }원</p>
<p>${requestScope.reservation.sitterEmail }</p>
</body>
</html>