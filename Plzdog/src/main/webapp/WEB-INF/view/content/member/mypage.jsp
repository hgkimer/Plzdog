<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
mypage.do<br>
<form action="${initParam.rootPath }/member/search_reservation.do" method="post">
	<sec:csrfInput/>
	<input type="text" name="mEmail">
	<button type="submit">전송</button>
</form>
<br>
</body>
</html>