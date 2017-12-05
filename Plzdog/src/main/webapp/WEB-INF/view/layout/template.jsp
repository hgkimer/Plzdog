<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">		<!-- 장치 width에 맞춰라 / 모바일로 처음 접속했을 때 크기(100%)-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tiles Exam</title>
<%--Bootsrap/jQuery 등록 --%>
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<style>

/* @media screen and (max-width: 750px) {
	/*화면이 웹 스크린이고 width가 750px 이하가 되면 적용될 style*/
	.side {
		height: auto;
		padding: 15px;
	}
	
	.content {
		height: auto;
	}
	
	.clear {
		clear:both;
	}
} 
</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<div class="clear"></div>
	<%--메인 body --%>
	<div class="row whole">
		
		<%-- 메뉴 --%>
		<nav class="col-sm-2 side">
			<tiles:insertAttribute name="menu"/>
		</nav>
		<!-- 내용 -->
		<nav class="col-sm-9 content">
			<tiles:insertAttribute name="content"/>
		</nav>
	</div>
	<tiles:insertAttribute name="footer" />
	<a href="${initParam.rootPath }/sitter/care_test.do">돌봄일지 테스트</a><br>
	<a href="${initParam.rootPath }/admin/select_waiting.do">대기시터 테스트</a><br>
	<a href="${initParam.rootPath }/test/sidebar.do">sidebar 테스트</a><br>
<%-- 	<a href="${initParam.rootPath }/res_test.do">예약 조회 테스트</a><br> --%>
</body>
</html>