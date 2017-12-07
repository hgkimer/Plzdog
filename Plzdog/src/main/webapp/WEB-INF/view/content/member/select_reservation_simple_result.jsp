<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	.resmember {
		width:600px;
		height:200px;
		border:1px solid black;
	}
</style>
</head>
<body>
	<div class="resmember">
		<ul class="navmember">
			<li>이름 :</li>
			<li>학교이름 :</li>
			<li>평점 :</li>
			<li>방문돌봄가격 :</li>
			<li>위탁돌봄가격 :</li>
			<li>전화번호 :</li>
		</ul>
	</div>
</body>
</html>