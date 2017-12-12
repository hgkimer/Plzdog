<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	.w3-teal {
		display:block;
	}
	
	.two {
		width:850px;
		height:300px;
		margin-top:100px;
	}
	
	.member-form1 {
		float:left;
		font-weight:bold;
		font-size:17px;
		width:200px;
		height:80px;
		text-align:center;
		margin-left:10px;
		border:1px solid black;
		line-height:80px;
		border-radius:10px;
		background-color:#337ab7;
		border-color:#2e6da4;
		color:white;
		box-shadow:0px 0px 10px black;
	}
	
	.member-form {
		float:left;
		font-weight:bold;
		font-size:17px;
		width:auto;
		height:80px;
		text-align:center;
		margin-left:10px;
		line-height:80px;
		border-radius:10px;
	}
	
	.btn-primary {
		border-radius:10px;
		box-shadow:0px 0px 10px black;
	}
	
</style>
<div class="col-lg-3"></div>

<div class="two">
	<div class="mypage-form" style="margin-left:20px;">
		<form action="${initParam.rootPath }/member/search_reservation_res1.do" method="post" class="member-form">
			<sec:csrfInput/>
			<input type="hidden" name="email" value='<sec:authentication property="principal.email"/>'>
			<button type="submit" class="btn-primary">내가 신청한 예약 조회</button>
		</form>
		<div class="member-form1">
			<a href="${initParam.rootPath }/member/member_result_form.do">회원 정보 조회</a>
		</div>
		
		<form action="${initParam.rootPath }/sitter/select_reservation_simple.do" method="post" class="member-form">
			<sec:csrfInput/>
			<input type="hidden" name="sitterEmail" value='<sec:authentication property="principal.email"/>'/>
			<button type="submit" class="btn-primary">내게 온 예약 조회</button>
		</form>		

	<form action="${initParam.rootPath }/sitter/complete_payment_reservation_result.do" method="post" class="member-form">
		<sec:csrfInput/>
		<input type="hidden" name="sitterEmail" value='<sec:authentication property="principal.email"/>'/>
		<button type="submit" class="btn-primary">결제가 완료된 예약 조회(시터)</button>
	</form>

</div>