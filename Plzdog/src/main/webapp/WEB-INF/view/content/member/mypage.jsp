<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	.w3-teal {
		display:block;
	}
	
	.row {
		border:1px solid black;
	}
	
	.memberImage {
		float:left;
	}
	
</style>

<div class="container" style="font-size: 20px;">
	<div class="row">
		<div class="col-sm-2">회원 이미지</div><br>
		<div class="memberImage">
			<img src="${initParam.rootPath }/memberImage/<sec:authentication property='principal.memberImage'/>" class="img-responsive" width="350px">
		</div>

		<div class="col-sm-2">Email</div>
		<div class="col-sm-6"><sec:authentication property="principal.email"/></div>

		<div class="col-sm-2">이름</div>
		<div class="col-sm-6"><sec:authentication property="principal.memberName"/></div>

		<div class="col-sm-2">회원 주소</div>

		<div class="col-sm-2">우편번호</div>
		<div class="col-sm-6"><sec:authentication property="principal.zipcode"/></div>
	</div>
	<div class="row" style="margin-top:20px">
		<div class="col-sm-12">
			<a href="${initParam.rootPath }/member/member_edit_form.do" class="btn btn-default">정보수정</a>
		</div>
	</div>
</div>