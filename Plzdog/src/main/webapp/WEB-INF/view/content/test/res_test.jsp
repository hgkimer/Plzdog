<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/reservation/select.do" method="post">
	<sec:csrfInput/>
	<input type="text" id="email" name="email">
	<button type="submit">전송</button>
</form>
</body>
</html>