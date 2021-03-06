<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">		<!-- 장치 width에 맞춰라 / 모바일로 처음 접속했을 때 크기(100%)-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Plz Dog</title>
<%--Bootsrap/jQuery 등록 --%>
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<style>

* {
	margin:0 auto;
	padding:0;
	text-decoration:none;
	list-style:none;
}

html, body {
	width:100%;
	height:100%;
}

.container {
		width:100%;
		padding:0;
	}

/* @media screen and (max-width: 750px) {
	/*화면이 웹 스크린이고 width가 750px 이하가 되면 적용될 style*/
	.side {
		height: auto;
		padding: 15px;
	}
	
	.content {
		height: 100%;
	}
	
	.clear {
		clear:both;
	}
	
	html, body {
		width:100%;
		height:100%;
	}
} 
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<tiles:insertAttribute name="header"/>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div class="col-sm-12" style="padding:0; height:100%; min-height:600px; max-height:100%;">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</div>
</body>
</html>