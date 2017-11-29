<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--Spring Security 커스텀태그 --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
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
		width:100%;
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

				<%--인증 안된(로그인 안한) 사용자 메뉴 : 인증되면 안보여야 하는 메뉴 --%>
				<sec:authorize access="!isAuthenticated()">
					<li class="navi"><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
					<li class="navi"><a href="${initParam.rootPath }/join_form.do">회원가입</a></li>
					<li class="navi"><a href="${initParam.rootPath}/main.do">메인페이지</a></li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
				<li class="navi"><a href="${initParam.rootPath }/member/sitter_register.do"><img src="image/foot.png">도그시터 신청하기</a></li>
				<li class="navi"><a href="${initParam.rootPath }/member/search_sitter.do"><img src="image/search.png">도그시터 찾기</a></li>
				<li class="navi"><a href="${initParam.rootPath }/main.do">메인페이지</a></li>
				<li class="navi"><a href="${initParam.rootPath }/faq.do">FAQ</a></li>
				<li class="navi"><a href="${initParam.rootPath }/join_form.do">회원가입</a></li>
				<li class="navi"><a href="${initParam.rootPath }/member/mypage.do">마이페이지</a></li>
				<li class="navi"><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
				</sec:authorize>
			</ul>
	</header>
</body>
</html>