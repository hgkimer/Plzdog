<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document)

</script>

<style>
#mySidebar {
	display:none;
}
</style>
<%--
	CSRF(Cross site request forgery, 사이트간 요청 위조)란 웹 사이트의 취약점을 
	이용하여 사용자가 의도하지 않는 요청을 송신하도록 하는 공격의 의미합니다.
	
	csrf 토큰을 이용해서 어떻게 요청했는지를 알 수 있다.
	내부적으로 쿠키값을 이용한다? 졸라 긴 랜덤 문자열
	spring 4 security에서 필수등록
	securityFilter에서 등록되 어있다.
	요청방식이 post -> 무조건 토큰 체크
	login/logout -> 무조건 토큰 체크 
	
	ajax 요청할 때
	data = ${"id":$("#id").val()}
	data = csrf토큰 값도 넣는다.
 --%>


<c:if test="${not empty param.errorMessage}">
	<div class="well text-danger">${param.errorMessage }</div>
</c:if>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4" style="border: 1px, black">
			<h1> </h1>
			<form action="${initParam.rootPath}/login.do" method="post">
				<sec:csrfInput />
				<%--csrf 토큰 생성 자동으로 input type="hidden"으로 생성해줌
					 input type="hidden" name="${_csrf.paramName} value="${_csrf.token}"
					 
					 $.ajax({
					 	data : '${_csrf.paramName}=${_csrf.token}&name=abc&age=20
					 --%>
				<div class="form-group">
					<label for="email">email</label>
					 <span class="glyphicon glyphicon-user"></span> 
					<input type="text" id="id" name="email" class="form-control" required="required">
				</div>
				<div class="form-group">
					
					<label for="password">password</label> 
					<span class="glyphicon glyphicon-lock"></span>
					<input type="password"
						id="password" name="password" class="form-control"
						required="required">
				</div>
				<div class="row">
					
					<div class="col-lg-12">
						<button type="submit" class="btn btn-info btn-block">Login</button>
					</div>
				</div>

			</form>
			<p> </p>
				<div class="row">
					<div class="col-lg-12">
					
						<a href="${initParam.rootPath }/join_form.do" class="btn btn-warning btn-block">Sign up</a>
					</div>
				</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>

