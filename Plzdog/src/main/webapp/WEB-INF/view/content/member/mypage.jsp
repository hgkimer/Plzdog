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
</style>

<h2 style="margin-top:30px;">마이페이지</h2>
<div class="mypage-form">
	<form action="${initParam.rootPath }/member/select_reservation_simple.do" method="post" class="myform">
		<sec:csrfInput/>
		<input type="hidden" name="email" value='<sec:authentication property="principal.email"/>'>
		<button type="submit">내가 신청한 예약 조회</button>
	</form>
	<br>
	<div class="member-form">
		<a href="${initParam.rootPath }/member/member_result_form.do">회원 정보 조회</a>
	</div>
	
	<form action="${initParam.rootPath }/sitter/select_reservation_simple.do" method="post" class="myform">
		<sec:csrfInput/>
		<input type="hidden" name="sitterEmail" value='<sec:authentication property="principal.email"/>'/>
		<button type="submit">내게 온 예약 조회</button>
	</form>
	
	<form action="${initParam.rootPath }/sitter/complete_payment_reservation_result.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="sitterEmail" value='<sec:authentication property="principal.email"/>'/>
		<button type="submit">결제가 완료된 예약 조회(시터)</button>
	</form>
	
	
</div>