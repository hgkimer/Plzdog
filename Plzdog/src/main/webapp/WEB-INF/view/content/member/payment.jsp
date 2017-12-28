<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row" style="margin-top: 20px;">
		<div class="col-lg-2"></div>
		<div class="col-lg-4">
			<div class="well">
				<div class="row">
					<div class="col-lg-12">
						<p style="font-size: 20px; text-align: center;">주문 상세</p>
						<label>예약 번호 - [${requestScope.res.resId }]</label><br>
						<label>시작일 - ${requestScopre.res.resSDate }</label><br>
						<label>종료일 - ${requestScope.res.member.email }</label>
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
		
		
			<div class="well">
				<div class="row">
					<div class="col-lg-12">
						<p style="font-size: 20px; text-align: center;">담당 시터</p>
						<img src="${initParam.rootPath }/memberImage/${requestScope.res.member.memberImage }">
						<hr>
						<label>예약 번호 - [${requestScope.res.resId }]</label><br>
						<label>이름 - ${requestScope.res.member.memberName }</label><br>
						<label>이메일 - ${requestScope.res.member.email }</label>
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>
</body>
</html>