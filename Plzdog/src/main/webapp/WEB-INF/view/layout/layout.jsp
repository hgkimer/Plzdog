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
	<tiles:insertAttribute name="contents" />
	<tiles:insertAttribute name="footer" />
</body>
</html>