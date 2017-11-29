<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
search_reservation_result.do<br>

오류 메세지 : ${requsetScope.errorMessage }
내가 견주<br>
<c:forEach var="res" items="${requestScope.mresList }">
${res }
</c:forEach>

내가 시터

<c:forEach var="res" items="${requestScope.sresList }">
${res }
</c:forEach>



</body>
</html>