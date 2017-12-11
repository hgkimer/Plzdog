<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	margin: 0 auto;
	padding: 0;
	list-style: none;
	text-decoration: none;
}

a {
	color: inherit;
}

.clear {
	clear: both;
}

.all {
	width: 700px;
	height: 0%;
	margin-top: 20px;
}

.reservation {
	width: 700px;
	height: 200px;
	float: left;
	cursor: pointer;
	position: relative;
	box-shadow: 0px 0px 5px;
}

.navImage {
	width: 150px;
	height: 150px;
	float: left;
	border-radius: 100px;
	margin-top: 25px;
	margin-left: 10px;
}

.navImage img {
	width: 100%;
	height: 100%;
	border-radius: 100px;
}

.dogOwner {
	width: 450px;
	height: 400px;
	float: right;
	font-size: 15px;
	line-height: 40px;
	font-weight: bold;
}

.dog {
	width: 500px;
	height: 500px;
	float: right;
	font-size: 15px;
	line-height: 40px;
	font-weight: bold;
}

.navList {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div class="all">
		<div class="top">
			<button class="btn1">예약 상세</button>
			<button class="btn2">돌봄일지 작성</button>
			<button class="btn3">돌봄일지 수정</button>
			<button class="btn4">돌봄일지 작성</button>
		</div>
		<c:forEach items="${requestScope.memberList }" var="reservation">
				<div class="navImage">
					<img src="${initParam.rootPath }/memberImage/${reservation.member.memberImage }"><br>
					회원 이름 : ${reservation.member.memberName } <br>
				</div>
				<div class="dogOwner">
					<ul class="navList">
						<li>예약상태 : ${reservation.resStatus}</li>
						<li>시작날짜 : ${reservation.resSDate}</li>
						<li>끝날짜 : ${reservation.resEDate}</li>
						<li>예약에 대한 가격 : ${reservation.price}</li>
					</ul>
				<button class="btn5">강아지 상세 보기</button>
				<div class="dog">
						<c:forEach items="${reservation.resDetailList}" var="resDetail">
								강아지 이름 : ${resDetail.dog.dogName }<br>
								강아지종 : ${resDetail.dog.species}<br>
								강아지성별 : ${resDetail.dog.gender}<br>
								강아지몸무게 : ${resDetail.dog.weight}<br>
								강아지생년월일 : ${resDetail.dog.birth}<br>
						</c:forEach>
				</div>
				</div>
		</c:forEach>
			<div class="care">
			<img src="${initParam.rootPath }/image/caredog.jpg">
			</div>
	</div>