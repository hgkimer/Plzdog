<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mySidebar {
	display: none;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row" style="margin-top: 20px;">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="well well-lg well-info">
					<h2 style="color: tomato; text-align: center;">예약 등록을 완료하였습니다.</h2>
					<p style="text-align: center">
						<label>서비스 시작 : <fmt:formatDate
								value='${requestScope.reservation.resSDate }' type="date" /></label><br> 
						<label>서비스
							종료 : <fmt:formatDate value='${requestScope.reservation.resEDate }'
								type="date" /><br>
						</label>
						<c:if test="${reservation.sitterEmail != null }">
							<p>${requestScope.reservation.price }원</p>
							<p>${requestScope.reservation.sitterEmail }</p>

						</c:if>
					</p>
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-lg-12">
						<a href="${initParam.rootPath }/memeber/search_sitter.do" class="btn btn-info btn-block">나에게 맞는 시터를 더 찾아보려면 클릭!</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>

</body>
</html>