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
		height:400px;
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
		width:450px;
		height:400px;
		float:right;
		font-size:18px;
		line-height:45px;
	}
	
	.navlist {
		width:100%;
		height:100%;
	}
</style>
</head>
<body>

</body>
<div class="all">
	<div class="reservation" onclick="location.href='select_reservation_detail.do?email=<sec:authentication property="principal.email"/>'">
		<div class="dogImage">
			<c:forEach var="list" items="${reqeustScope.list}">
				<ul class="nav">
					<li>강아지사진 : ${list.dogImageList}</li>
				</ul>
			</c:forEach>
		</div>
		
		<div class="dogOwner">
			<c:forEach var="list" items="${requestScope.list}">
				<ul class="navlist">
					<li>예약상태 : ${list.resId}</li>
					<li>강아지이름 : ${list.dog.dogName}</li>
					<li>강아지종 : ${list.dog.species}</li>
					<li>강아지성별 : ${list.dog.gender}</li>
					<li>강아지생년월일 : ${list.dog.birth}</li>
					<li>시작날짜 : ${list.resSDate}</li>
					<li>끝날짜 : ${list.resEDate}</li>
					<li>가격 : ${list.price}</li>
					<c:forEach items ="${list.demandList }" var="demand">
						<li>서비스 요구사항 : ${demand.code.codeName}</li>
					</c:forEach>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>