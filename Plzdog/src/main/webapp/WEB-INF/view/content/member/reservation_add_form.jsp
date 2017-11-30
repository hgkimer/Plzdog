<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/member/reservation_add.do" method="post">
	<sec:csrfInput/>
	<input type="text" value="1"  name="resType"/><br>
	시작날짜<input type="date" name="resSDate"/><br>
	끝날짜<input type="date" name="resEDate"/><br>
	의뢰내용<input type="text" name="resContents"/>
	<br>
	<input type="text" value='<sec:authentication property="principal.email"/>' id="memberEmail" name="memberEmail"/>
	<input type="text" value="${sessionScope.lastSitter }" id="sitterEmail" name="sitterEmail"/>
	<button type="submit">전송</button>
	
	
</form>
</body>
</html>