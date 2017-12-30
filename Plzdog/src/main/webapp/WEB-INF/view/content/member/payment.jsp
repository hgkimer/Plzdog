<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#pay').on("click",function(){
		var radioChk = $('input[type=radio]:checked').val();
		if(!radioChk){
			alert('결제 방식을 선택하여 주세요.');
		}else{
			var IMP = window.IMP;
			var result = 1;
			IMP.init('imp17685781');
		IMP.request_pay({
				    pg : 'inicis', // version 1.1.0부터 지원.
				    pay_method : $('input[type=radio]:checked').val(),
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '예약 번호 : ${requestScope.res.resId}',
				    amount : $('input[name=price]').val(),
				    buyer_email : '${requestScope.res.member.email}',
				    buyer_name : '${requestScope.res.member.memberName}',
				    buyer_tel : '${requestScope.res.member.phoneNum}',
				    buyer_addr : '${requestScope.res.member.mainAddress}'+ ' ${requestScope.res.member.subAddress}',
				    buyer_postcode : '${requestScope.res.member.zipcode}',
				    //결제후 이동할 url
				    m_redirect_url : '${initParam.rootPath}/member/payment_result.do?status='+result+'&resId=${requestScope.res.resId}'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				       /*
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				       */
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        result = 0;
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    location.replace('${initParam.rootPath}/member/payment_result.do?status='+result+'&resId=${requestScope.res.resId}');
				    alert(msg);
				});
		}
		
	});
});
	
</script>
<div class="container">
	<div class="row" style="margin-top: 20px;">
		<div class="col-lg-2"></div>
		<div class="col-lg-4">
			<div class="well">
				<div class="row">
					<div class="col-lg-12">
						<p style="font-size: 20px; text-align: center;">주문 상세</p>
						<label>예약 번호 - [${requestScope.res.resId }]</label><br>
						<label>시작일 - <fmt:formatDate pattern="yyyy-MM-dd HH:mm:00" value="${requestScope.res.resSDate }"/> </label><br>
						<label>종료일 - <fmt:formatDate pattern="yyyy-MM-dd HH:mm:00" value="${requestScope.res.resEDate }"/></label>
						<hr>
						<c:forEach items="${requestScope.res.resDogList }" var="dog">
							<label>${dog.dogName }</label>
							<img src="${initParam.rootPath }/dogImage/${dog.dogImage[0].dogImage}"
							 class="img-circle" style="width:100px; height:100px;"/>
						</c:forEach>
						<hr>
						<div class="row">
							<div class="col-lg-6">
								<label>요구사항</label><br>
								<c:forEach items="${requestScope.res.demandList}" var="demand">
									<strong><span class="glyphicon glyphicon-ok"></span>${demand.code.codeName }</strong><br>
								</c:forEach>
							</div>
							<div class="col-lg-6">
								<label>요구사항 상세</label>
								<hr>
								<label>${res.resContents}</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-2">
			<div class="well">
				<div class="row">
					<div class="col-lg-12">
						<p style="font-size: 20px; text-align: center;">담당 시터</p>	
						<div class="row">
							<div class="col-lg-2"></div>
							<div class="col-lg-8">
								<img style="width:200px; height:200px;" class="img-thumbnail" src="${initParam.rootPath }/memberImage/${requestScope.res.sitter.memberImage }">
						<hr>
							</div>
							<div class="col-lg-2"></div>
						</div>
						<label>예약 번호 - [${requestScope.res.resId }]</label><br>
						<label>이름 - ${requestScope.res.sitter.memberName }</label><br>
						<label>이메일 - ${requestScope.res.sitter.email }</label>
						<label>방문 돌봄 가격(시간당) - <fmt:formatNumber pattern="#,###원" value="${requestScope.res.sitter.sitter.visitPrice }"></fmt:formatNumber></label>
						<label>위탁 돌봄 가격(시간당) - <fmt:formatNumber pattern="#,###원" value="${requestScope.res.sitter.sitter.givePrice }"></fmt:formatNumber></label>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-2">
			<div class="well">
				<div class="row">
					<div class="col-lg-12">
						<p style="font-size: 20px; text-align: center;">결제</p>
					<label>총 서비스 시간 - ${requestScope.totalTime }시간</label>
					<p style="color: red; font-size: 20px;"><strong>총 결제 금액  - <fmt:formatNumber pattern="#,###원" value="${requestScope.totalTime * requestScope.res.price }"/></strong></p>
					<form action="" method="post" class="form-group">
						<sec:csrfInput/>
						<input type="hidden" name="price" value="${requestScope.totalTime * requestScope.res.price }">
						<div class="radio">
							<label><input type="radio" name="payType" value="trans">계좌 이체</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="payType" value="card">카드 결제</label>
						</div>
						<button id="pay" class="btn btn-lg btn-block btn-warning" type="button">결제하기</button>
					</form>
					</div>	
				</div>
			</div>
		</div>
	</div>
</div>
