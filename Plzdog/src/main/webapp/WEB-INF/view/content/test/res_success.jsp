<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<c:forEach items="${list }" var="res">
				예약 번호 : ${res.resId }<br>
				예약 상태 : ${res.resType }<br>
				리뷰 : ${res.resContents }<br>
				견주 이메일 : ${res.memberEmail }<br>
				시터 이메일  : ${res.sitterEmail }<br>
			</c:forEach>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
