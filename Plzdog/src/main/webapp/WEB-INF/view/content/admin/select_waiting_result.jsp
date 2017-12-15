<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<p></p>
	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<c:forEach items="${requestScope.memberList }" var="member">
					<form action="${initParam.rootPath }/admin/enroll_sitter.do">
						<div class="panel panel-success">
							<div class="panel-heading">
								<div class="row">
									<div class="col-lg-12">
										<strong><span class="glyphicon glyphicon-envelope"></span>${member.email }</strong>
										<input type="hidden" name="email" value="${member.email }">
										<input type="hidden" name="authority" value="ROLE_SITTER">

									</div>
								</div>
							</div>
							<div class="panel-body">
								<div class="col-lg-12">
									<strong><span class="glyphicon glyphicon-user"></span>${member.memberName }</strong><br>
									<span class="glyphicon glyphicon-home"></span><label>${member.mainAddress }
										${member.subAddress }</label><br> <span
										class="glyphicon glyphicon-phone"></span><label>${member.phoneNum }</label><br>
									<button class="btn btn-warning btn-block" type="submit">승인</button>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>

</body>
</html>