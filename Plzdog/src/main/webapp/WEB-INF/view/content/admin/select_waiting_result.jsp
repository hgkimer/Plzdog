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
	<form action="${initParam.rootPath }/admin/enroll_sitter">
		${member.email }<br>
		${member.memberName }<br>
		<input type="hidden" id="email" value="${member.email }">
		<input type="hidden" id="authority" value="ROLE_SITTER">
		<button type="submit">승인</button>
	</form>
</c:forEach>
</body>
</html>