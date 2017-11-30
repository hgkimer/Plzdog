<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container" style="font-size: 20px;">
	<div class="row">
		<div class="col-sm-12">
			<h1>회원정보 조회결과</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2">Email</div>
		<div class="col-sm-10"><sec:authentication property="principal.email"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">이름</div>
		<div class="col-sm-10"><sec:authentication property="principal.memberName"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">회원 주소</div>
		<div class="col-sm-10"><sec:authentication property="principal.mainAddress"/> <sec:authentication property="principal.subAddress"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">우편번호</div>
		<div class="col-sm-10"><sec:authentication property="principal.zipcode"/></div>
	</div>
	<div class="row">
		<div class="col-sm-2">회원 이미지</div>
		<div class="col-sm-12">
			<img src="${initParam.rootPath }/memberImage/<sec:authentication property='principal.memberImage'/>" class="img-responsive" width="350px">
		</div>
	</div>
	<div class="row" style="margin-top:20px">
		<div class="col-sm-12">
			<a href="${initParam.rootPath }/member/member_edit_form.do" class="btn btn-default">정보수정</a>
		</div>
	</div>
</div>