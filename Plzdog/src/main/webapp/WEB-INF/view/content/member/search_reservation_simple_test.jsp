<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<c:forEach items="${requestScope.list }">
				<p>강아지 사진 :</p>
				<p>강아지 이름 :</p>
				<p>강아지 성별 :</p>
				<p>서비스 종류 : </p>
				
				
			</c:forEach>
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">상세보기</button>
		</div>
		
		<div class="panel-body">
			<div class="collapse" id="demo">
				
			</div>
		</div>
	</div>
</body>
</html>