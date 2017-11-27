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
<script src="${initParam.rootPath }/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<style>
/* 가운데 항목의 높이 고정 */
.row.content {
	height: 650px
}
/* 사이드 메뉴 부분 설정 */
.side {
	background-color: #f1f1f1;
	height: 100%;
}
/*상단 header 부분 설정*/
header {
	background-color: #66ffcc;
	margin-bottom: 0px;
}
/* 하단 footer 부분 설정 */
footer {
	background-color: #f1f1f1;
	color: black;
	padding: 15px;
}

@media screen and (max-width: 750px) {
	/*화면이 웹 스크린이고 width가 750px 이하가 되면 적용될 style*/
	.side {
		height: auto;
		padding: 15px;
	}
	.content {
		height: auto;
	}
}
}
</style>
</head>
<body>
	<%--Header--%>
	<div class="container">
		<%-- header --%>
		<%-- class row : 한줄 표시, page-header : 헤더 --%>
		<header class="row page-header">
			<div class="col-sm-12 text-center">
				<%-- name=header 설정의 jsp 포함시키기 --%>
				<tiles:insertAttribute name="header" />
			</div>
		</header>
		<%--가운데--%>
		<%-- content는 height 스타일 지정하기 위해 지정 --%>
		<section class="row content">
			<%--사이드 메뉴--%>
			<nav class="col-sm-3 side">
				<tiles:insertAttribute name="menu" />
			</nav>
			<%--바디--%>
			<section class="col-sm-9">
				<tiles:insertAttribute name="content" />
			</section>
		</section>
		<%--footer--%>
		<footer class="row text-center">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>