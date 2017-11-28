<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄일지</title>
</head>
<body>
<form action="${initParam.rootPath }/care/select_care.do" method="post">
	<sec:csrfInput/> <!-- post, 로그인, 로그아웃 방식은 sec를 꼭 붙여준다. 토큰을 보내줘야한다. -->
	<input type="number" id="careId" name="careId">
	<button type="submit">전송</button>
</form>

</body>
</html>