<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="care">
	${care.careId }<br>
	${care.careContents }<br>
	${care.resId }<br>
</c:forEach>
결과 : ${list }
</body>
</html>