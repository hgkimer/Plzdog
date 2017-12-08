<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--Spring Security 커스텀태그 --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>

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
	
	a:hover {
		text-decoration:none;
	}
	
	header {
		width:100%;
		height:100px;
		background-color:#009688;
		box-shadow:0px 5px 5px gray;
		position:relative;
		z-index:1;
	}
	
	.nav {
		width:70%;
		height:100%;
		float:right;
	}
	
	.afew:hover {
		background-color:rgba(0,0,0,0.1);
	}
	
	.nav img {
		width:30px;
		height:30px;
	}
	
	.navi {
		font-weight:bold;
		font-size:20px;
		float:left;
		width:auto;
		height:100%;
		text-align:center;
		line-height:80px;
		margin-left:40px;
		color:white;
	}
	
	.w3-teal {
		height:100px;
	}
	
	::-webkit-scrollbar {
		display:none;
	} 
	
	.w3-teal {
		display:none;
	}
	
	
	.afew {
		display:none;
	}
</style>
</head>

<body>
	<header>
	<%-- 사이드 바 --%>
	<div class="w3-teal" style="width:50px; height:100px; float:left;">
	<button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>
		<div class="w3-container">
		</div>
	</div>
			
	<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none;" id="mySidebar">
		<button onclick="w3_close()" class="w3-bar-item w3-large" id="also">Close &times;</button>
		<ul class="nav" style="margin-top:20px; width:100%; text-align:center;">
			<sec:authorize access="isAuthenticated()">
				 <!-- Authentication의 getPrincipal() 호출 - User 리턴 -->
				<sec:authentication property="principal.memberName"/> 님 환영합니다.<br>
			</sec:authorize>
			
			<%--회원/관리자 공통 메뉴 /member로 시작 , 관리자 일수도 있고 , 회원일 수도 있고, 시터일 수도 있고--%>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_SITTER')">
				<li><a href="${initParam.rootPath }/member/mydog_register_form.do">강아지 등록</a></li>
				<li><a href="${initParam.rootPath }/member/member_result_form.do">사용자 정보조회</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<li><a id="few" style="cursor: pointer;">예약 조회</a>
					<ul class="big">
						<li class="afew"><a href="${initParam.rootPath }/member/search_reservation.do">내가 작성한 예약 조회</a></li>
						<sec:authorize access="hasRole('ROLE_SITTER')">
							<li class="afew"><a href="${initParam.rootPath }/sitter/select_reservation_simple.do">내게 온 예약 조회</a></li>
						</sec:authorize>
						<li class="afew"><a href="${initParam.rootPath }/member/.do">결제 완료된 예약 조회</a></li>
					</ul>
				</li>
			</sec:authorize>
			
			
			<%--관리자 메뉴 /admin 으로 시작--%>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="${initParam.rootPath }/admin/select_waiting.do">시터 등록</a></li>
				<li><a href="${initParam.rootPath }/admin/register_admin_form.do">관리자 등록</a></li>
			</sec:authorize>
			
			<%--인증 관련 없는 메뉴 (로그인 여부와 관련없이 나올 메뉴) --%>
			
			<%--인증된(로그인한) 사용자 메뉴 : 인증 안된상태에서 안보여야 하는 메뉴 --%>
			<sec:authorize access="isAuthenticated()">
				<li><a href="${initParam.rootPath }/member/deleteMember.do?email=<sec:authentication property="principal.email"/>">회원탈퇴</a>
			</sec:authorize>
		</ul>
		
		<!-- 
			로그아웃전송폼
			+ 로그인/로그아웃은 반드시 POST방식으로 요청하며 csrf 토큰을 보내야 한다.
			+ 로그아웃은 단순 링크이므로 아래와 같이 hidden 폼을 말들고 클릭시 Javascript에서 form을 submit하여 처리한다.
		 -->
		
			<form id="logoutForm" action="${initParam.rootPath }/logout.do" method="post" style="display:none">
			    <sec:csrfInput/>
			</form>
	</div>

		<%-- 헤더 부분 --%>
			<ul class="nav">
				<%--인증 안된(로그인 안한) 사용자 메뉴 : 인증되면 안보여야 하는 메뉴 --%>
				<sec:authorize access="!isAuthenticated()">
					<li class="navi"><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
					<li class="navi"><a href="${initParam.rootPath }/join_form.do">회원가입</a></li>
					<li class="navi"><a href="${initParam.rootPath }/main.do">메인페이지</a></li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
					<li class="navi"><a href="${initParam.rootPath }/member/sitter_register.do"><img src="${initParam.rootPath }/image/foot.png">도그시터 신청하기</a></li>
					<li class="navi"><a href="${initParam.rootPath }/member/search_sitter.do"><img src="${initParam.rootPath }/image/search.png">도그시터 찾기</a></li>
					<li class="navi"><a href="${initParam.rootPath }/main.do">메인페이지</a></li>
					<li class="navi"><a href="${initParam.rootPath }/member/mypage.do">마이페이지</a></li>
					<li class="navi"><a id="logout" style="cursor: pointer;">로그아웃</a></li>
				</sec:authorize>
			</ul>
	</header>
<script>
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}	

$(document).ready(function(){
	$(".navi > #logout").on("click", function(){
		$("#logoutForm").submit();
	});
	$("#few").on("click", function(){
		$(".afew").slideToggle();
	});
	$("#also").on("click", function(){
		$(".afew").hide();
	});
});
</script>
</body>
</html>