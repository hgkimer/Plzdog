<%@page import="com.plzdog.vo.CareImage"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	돌봄일지 번호 : ${care.careId }<br>
	돌봄일지 내용 : ${care.careContents }<br>
	예약번호 : ${care.resId }<br>
	<c:forEach items="${care.careImage }" var="CareImage">
		<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="350px"><br>
	</c:forEach>
</body>
</html>