<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	* {
		margin:0 auto;
		padding:0;
		list-style:none;
		text-decoration:none;
	}
	
	a {
		color:inherit;
	}
	
	.clear {
		clear:both;
	}
	
	.all {
		width:700px;
		height:0%;
		margin-top:20px;
	}
	
	.reservation {
		width:700px;
		height:200px;
		float:left;
		cursor:pointer;
		position:relative;
		box-shadow:0px 0px 5px;
	}
	
	.dogImage {
		width:150px;
		height:150px;
		float:left;
		border-radius:100px;
		margin-top:25px;
		margin-left:10px;
	}
	
	.dogImage img {
		width:100%;
		height:100%;
		border-radius:100px;
	}
	
	.dogOwner {
		width:300px;
		height:150px;
		float:left;
		font-size:20px;
		line-height:40px;
	}
</style>
</head>

<body>
<div class="all">
	<div class="reservation" onclick="location.href='sitter_mypage_detail.do'">
		<div class="dogImage">
			<img src="${initParam.rootPath }/image/dog.jpg">
		</div>
		
		<div class="dogOwner">
			<%-- <c:forEach var="i" items="${list}" begin="0" varStatus="status" end="list.length"> --%>
				<ul class="nav">
					<li>이름 :</li>
					<li>강아지 이름 :</li>
					<li>시작날짜 :</li>
					<li>끝날짜 :</li>
					<li>예약상태 :</li>
				</ul>
			<%-- </c:forEach> --%>
		</div>
	</div>
	<div class="reservation" onclick="location.href='sitter_mypage_detail.do'">
		<div class="dogImage">
			<img src="${initParam.rootPath }/image/dog.jpg">
		</div>
		
		<div class="dogOwner">
			<%-- <c:forEach var="i" items="${ }" begin="0" varStatus="status" end=""> --%>
				<ul class="nav">
					<li>이름 :</li>
					<li>강아지 이름 :</li>
					<li>시작날짜 :</li>
					<li>끝날짜 :</li>
					<li>예약상태 :</li>
				</ul>
			<%-- </c:forEach> --%>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>