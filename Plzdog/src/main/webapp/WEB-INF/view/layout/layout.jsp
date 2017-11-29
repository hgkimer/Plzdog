<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="content" />
	<a href="${initParam.rootPath }/care_test.do">돌봄일지 테스트</a><br>
	<a href="${initParam.rootPath }/res_test.do">예약 조회 테스트</a><br>
 	<tiles:insertAttribute name="footer" />
</body>
</html>