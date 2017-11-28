<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	* {
		margin:0 auto;
		padding:0;
		list-style:none;
		text-decoration:none;
	}
	
	body {
		width:100%;
		height:100%;
	}
	
	a {
		color:inherit;
	}
	
	header {
		width:100%;
		height:100px;
		background-color:#0cb70f;
		box-shadow:0px 5px 5px gray;
		position:relative;
	}
	
	.container {
		float:left;
		width:100%;
		height:100%;
		float:right;
	}
	
	.nav {
		width:60%;
		height:100%;
		float:right;
	}
	
	.nav img {
		width:30px;
		height:30px;
	}
	
	.navi {
		font-weight:bold;
		font-size:18px;
		float:left;
		line-height:30px;
		width:auto;
		height:100%;
		text-align:center;
		line-height:80px;
		vertical-align: baseline;
		margin-left:30px;
		vertical-align: baseline;
		color:white;
	}
</style>
</head>

<body>
	<header>
		<div class="container">
			<div class="logo"></div>
			<ul class="nav">
				<li class="navi"><a href="${initParam.rootPath }/member/sitter_register.do"><img src="image/foot.png">펫트너 신청하기</a></li>
				<li class="navi"><a href="#"><img src="image/search.png">펫트너 찾기</a></li>
				<li class="navi"><a href="#">FAQ</a></li>
				<li class="navi"><a href="#">로그인</a></li>
				<li class="navi"><a href="#">회원가입</a></li>
			</ul>
	</header>
</body>
</html>