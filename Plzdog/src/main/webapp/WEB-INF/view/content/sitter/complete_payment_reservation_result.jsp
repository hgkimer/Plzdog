<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.navList {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div class="all">
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
						<c:forEach items="${reservation.resDetailList}" var="resDetail">
								<li>강아지 이름 : ${resDetail.dog.dogName }</li>
								<li>강아지종 : ${resDetail.dog.species}</li>
								<li>강아지성별 : ${resDetail.dog.gender}</li>
								<li>강아지몸무게 : ${resDetail.dog.weigth}</li>
								<li>강아지생년월일 : ${resDetail.dog.birth}</li>
						</c:forEach>
					</ul>
				</div>
		</c:forEach>
	</div>
	<%-- <li>강아지종 : ${dog.species}</li>
									<li>강아지성별 : ${dog.gender}</li>
									<li>강아지생년월일 : ${dog.birth}</li> --%>
								<%-- <c:forEach items="${dog.dogImage }" var="dogImage">
											강아지 이미지 : <img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }" width="100px;"><br>
										</c:forEach> --%>