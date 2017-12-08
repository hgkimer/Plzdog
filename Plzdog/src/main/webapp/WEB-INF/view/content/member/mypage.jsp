<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style type="text/css">
	
</style>

<h2 style="margin-top:30px;">마이페이지</h2>
<div class="mypage-form">
	<form action="${initParam.rootPath }/member/search_reservation.do" method="post" class="myform">
		<sec:csrfInput/>
		<input type="hidden" name="mEmail" value='<sec:authentication property="principal.email"/>'>
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
	
	<form action="${initParam.rootPath }/sitter/select_all_request_reservation.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="sitterEmail" value='<sec:authentication property="principal.email"/>'/>
		<button type="submit">전체 예약 조회</button>
	</form>
</div>