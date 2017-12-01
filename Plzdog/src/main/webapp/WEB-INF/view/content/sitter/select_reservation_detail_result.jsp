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
$(document).ready(function(){
	$(".btn1").on("click", function(){
		$(".care").hide();
		$(".res").show();
	});
	$(".btn2").on("click", function(){
		$(".res").hide();
		$(".care").show();
	});
});
</script>
<style type="text/css">
	* {
		margin:0 auto;
		padding:0;
		list-style:none;
		text-decoration:none;
	}..
	
	a {
		color:inherit;
	}
	
	.clear {
		clear:both;
	}
	
	.top {
		width:200px;
		height:30px;
		float:left;
	}
	
	.res_detail {
		width:600px;
		height:300px;
		float:left;
		margin:10px;
	}
	
	.res {
		width:100%;
		height:100%;
		float:left;
		border:1px solid black;
	}
	
	.care {
		width:100%;
		height:100%;
		float:left;
		border:1px solid black;
		display:none;
	}
	
	.care img {
		width:200px;
		height:200px;
		float:left;
	}
</style>
</head>
<body>
	<div class="res_detail">
		<div class="top">
			<button class="btn1">예약상세</button>
			<button class="btn2">돌봄일지</button>
		</div>
		<div class="res">
			<c:forEach var="list" items="${requestScope.list}">
				<ul>
					<li>예약상태 : ${list.resId}</li>
					<li>시작날짜 : ${list.resSDate}</li>
					<li>끝날짜 : ${list.resEDate}</li>
					<li>견주이메일 : ${list.dog.email}</li>
					<li>의뢰내용 : ${list.resContents}</li>
					<li>가격 : ${list.price}</li>
					<li>서비스 요구사항 : ${list.codeName}</li>
				</ul>
			</c:forEach>
		</div>
		<div class="care">
			<img src="${initParam.rootPath }/image/caredog.jpg">
		</div>
	</div>
	
	<div class="clear"></div>
</body>
</html>