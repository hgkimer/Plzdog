<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="panel panel-success">
					<div class="panel-heading">
						<div class="col-12">
							<c:choose>
								<c:when test="${requestScope.paymentFail != null }">
									<p style="font-size: 24px; color: tomato; text-align: center;">
										<strong>${requestScope.paymentFail }</strong>
									</p>
									<label>처음 부터 다시 결제를 진행하여 주세요.</label>
									<a class="btn btn-info btn-block btn-default"
										href="${initParam.rootPath }/member/search_reservation_res4.do?email=<sec:authentication property="principal.email"/>">
										결제 대기중 예약 조회 페이지로 돌아가기</a>
								</c:when>
								<c:otherwise>
									<p style="font-size: 24px; color: tomato; text-align: center;">
										<strong>성공적으로 결제되었습니다.</strong>
									</p>
									<p style="font-size: 24px; text-align: center;">결제 상세</p>
									<div class="row" style="margin-top: 20px;">
										<div class="col-lg-6">
											<label>주문자 - ${requestScope.res.member.memberName }</label><br>
											<label>이메일 - ${requestScope.res.member.email }</label>
										</div>
										<div class="col-lg-6">
											<label>결제 금액 - <fmt:formatNumber pattern="#,###원">${requestScope.res.price }</fmt:formatNumber>
											</label> <label></label>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<a class="btn btn-info btn-block btn-default"
												href="${initParam.rootPath }/member/search_reservation_res4.do?email=<sec:authentication property="principal.email"/>">
												결제 대기중 예약 조회 페이지로 돌아가기</a>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
</body>
</html>