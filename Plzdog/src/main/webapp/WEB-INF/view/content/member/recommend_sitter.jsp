<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
recommend_sitter.do

<form action="${initParam.rootPath }/member/reservation_register.do" method="post">
	<sec:csrfInput/>
	<input type="text" value="1" id="resType" name="resType"/><br>
	시작날짜<input type="date" id="resSDate" name="resSDate"/><br>
	끝날짜<input type="date" id="resEDate" name="resEDate"/><br>
	의뢰내용<input type="text" id="resContents" name="resContents"/>
	<br>
	<input type="text" value="hgkimer@naver.com" id="memberEmail" name="memberEmail"/>
	<input type="text" value="kim@naver.com" id="sitterEmail" name="sitterEmail"/>
	<button type="submit">전송</button>
	
	
</form>
</body>
</html>