<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<script type="text/javascript">

function reject(email){
	if(confirm("시터 신청을 거절 하시겠습니까?")){
		var url='${initParam.rootPath }/admin/delete_sitter.do?email='+email;
		location.href=url; 
	} else{ 
		return false;
	} 
}

</script>

<p></p>
<div class="container">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<c:if test="${empty requestScope.memberList }">
				<div class="row">
					<h2 style="color: tomato; text-align: center;">시터 신청한 회원이 없습니다.</h2>
					<p style="text-align: center">
						<strong>회원들이 시터를 신청하록 노력하세요 :)</strong>
						<p>
				</div>
			</c:if>
				<c:forEach items="${requestScope.memberList }" var="member">
							<form action="${initParam.rootPath }/admin/enroll_sitter.do">
						<div class="panel panel-success">
							<div class="panel-heading">
								<div class="row">
									<div class="col-lg-12">
										<strong><span class="glyphicon glyphicon-envelope"></span>${member.email }</strong><br>
										<strong><span class="glyphicon glyphicon-user"></span>${member.memberName }</strong><br>
										<span class="glyphicon glyphicon-home"></span><label>${member.mainAddress }
										${member.subAddress }</label><br> <span
												class="glyphicon glyphicon-phone"></span><label>${member.phoneNum }</label><br>
										<input type="hidden" name="email" value="${member.email }">
										<input type="hidden" name="authority" value="ROLE_SITTER">
									</div>
								</div>
							</div>
							<div class="panel-body">
								<div class="col-lg-6">
									<p><strong></strong></p>
									<p><strong> 학교 : ${member.sitter.school }</strong></p>
									<p><strong> 서비스지역 : ${member.sitter.serviceAddress }</strong></p>
									<p><strong> 방문돌봄금액 : ${member.sitter.visitPrice }</strong></p>
									<p><strong> 위탁돌봄금액 : ${member.sitter.givePrice }</strong></p>
									<p><strong> 증명서 : </strong></p><br>
									<p></p>
									<img src="${initParam.rootPath }/certificationImage/${member.sitter.certification }" width="350px"/>
								</div>
								
								<div class="col-lg-6">
										<p><strong><span class="glyphicon glyphicon-th-list"></span>보유 능력 : <br></strong></p>
										<p>	<c:forEach var="skill" items="${member.sitter.skillList }">
													<c:if test="${fn:contains(skill.code.category, '시터')}">
														<strong>${skill.code.codeName } </strong><br>
													</c:if>		
											</c:forEach></p>
									
										<p><strong><span class="glyphicon glyphicon-th-list"></span>제공 가능한 서비스 : <br></strong></p>
										<p>	<c:forEach var="skill" items="${member.sitter.skillList }">
													<c:if test="${fn:contains(skill.code.category, '서비스')}">
														<strong>${skill.code.codeName } </strong><br>
													</c:if>		
											</c:forEach></p>
									
										
											<p><strong><span class="glyphicon glyphicon-th-list"></span>보유 환경 : <br></strong></p>
											<p>	<c:forEach var="skill" items="${member.sitter.skillList }">
														<c:if test="${fn:contains(skill.code.category, '환경')}">
															<strong>${skill.code.codeName } </strong><br>
														</c:if>
												</c:forEach></p>
										<button class="btn btn-success btn-block" type="submit" onsubmit="return comfirm('시터로 승인하시겠습니까?')">승인</button>
										<button class="btn btn-warning btn-block" type ="button" onclick="reject('${member.email}')">거절</button>
									</div>
							</div>
						</div>
					</form>
				</c:forEach>
			
					</div>
			<div class="col-lg-3"></div>
		</div>
	</div>