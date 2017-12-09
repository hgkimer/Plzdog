<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${requestScope.memberList }" var="member">
	<form action="${initParam.rootPath }/admin/enroll_sitter.do">
		<h1>이메일 : ${member.email }</h1>
		<h2>이름 : ${member.memberName }</h2>
		<input type="hidden" name="email" value="${member.email }">
		<input type="hidden" name="authority" value="ROLE_SITTER">
		<button type="submit">승인</button>
	</form>
</c:forEach>
</body>
</html>