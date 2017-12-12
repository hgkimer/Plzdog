<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty requestScope.approveMessage}">
	<script type="text/javascript">
	var value = '<c:out value="${requestScope.approveMessage }"/>';
		alert(value);
	</script>
</c:if>

<c:if test="${not empty requestScope.rejectMessage}">
	<script type="text/javascript">
	var value = '<c:out value="${requestScope.rejectMessage }"/>';
		alert(value);
	</script>
</c:if>

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
	<div class="all">
		<c:forEach items="${requestScope.memberList }" var="reservation">
			<c:if test="${reservation eq null }">
				시터에게 온 예약이 없습니다.
			</c:if>
			<div class="reservation" onclick="location.href='select_reservation_detail.do?sitterEmail=<sec:authentication property="principal.email"/>&memberEmail=${reservation.memberEmail }'">
				<div class="navImage">
					회원 이미지 : <br> 
					<img src="${initParam.rootPath }/memberImage/${requestScope.resMember.member.memberImage }" width="350px"><br>
					회원 이름 : ${reservation.member.memberName } 
				</div>
				<div class="dogOwner">
					<ul class="navList">
						<li>시작날짜 : ${reservation.resSDate}</li>
						<li>끝날짜 : ${reservation.resEDate}</li>
						<li>예약에 대한 가격 : ${reservation.price}</li>
						<c:forEach items="${reservation.resDetailList}" var="resDetail">
								<li>강아지 이름 : ${resDetail.dog.dogName }</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
  