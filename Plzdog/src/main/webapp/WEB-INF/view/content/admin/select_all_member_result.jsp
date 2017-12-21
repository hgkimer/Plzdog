<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">

	/* var checkboxValues = new Array();
	
	$("input[name='checkSitter']:checked").each(function() {
	    checkboxValues.push($(this).val());
	});
	
	 $(document).ready(function(){
	 $("#sortId").on("click", function(){
		  	
	 	});
	 });  */

	function popupProfile(email) {
		var url = '${initParam.rootPath }/member/goToProfile.do?email=' + email
		window.open(url, "newProfileForm", "width = 1000, height = 1000");
	}

	function removeMember(email) {
		if (confirm("회원정보와 회원과 관련된 정보를 삭제 하시겠습니까?")) {
			var url = '${initParam.rootPath}/admin/remove_member.do?email='
					+ email;
			location.href = url;
		} else {
			return false;
		}
	}
</script>

<%-- <div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			필요한 서비스 : 
			<select name="selectService" id="selectServiceId" required="required">
				<option value="">모든 서비스</option>
				<c:forEach items="${applicationScope.serviceList}" var="category">
					<option value="${category.code}">${category.codeName }</option>
				</c:forEach>
			</select><br>
			<br>
			
			시터 세부사항 : <br>
			<c:forEach items="${applicationScope.skillList }" var="sitterSkill" begin='3'>
				<input type="checkbox" name="checkSitter" id="checkSitterId" value=${sitterSkill.code } />${sitterSkill.codeName }<br>
			</c:forEach>
			
			<button id="serachBtn">검색하기</button>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div> --%>

<style>
#mySidebar {
	display: none;
}
</style>

<div class="container">
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<h2></h2>
			<table class="table col-sm-12" style="background-color: ghostWhite;">
				<thead>
					<tr>
						<td id='sortId' style="cursor:pointer">회원 권한</td>
						<td>회원 이메일</td>
						<td>회원 이름</td>
						<td>주소</td>
						<td>연락처</td>
						<td>회원 탈퇴 여부</td>
						<td>프로필 보기</td>
						<td>회원 탈퇴</td>
					</tr>
				</thead>
				<tbody id="listTbody">
					<c:forEach items="${requestScope.memberList }" var="member">
						<tr>
							<c:set var="doneLoop" value="false" />
							<%-- true이면 값을 출력 하지 않음 --%>
							
							<%-- <c:forEach items="${member.authorityList }" var="authority">

								<c:if test="${fn:contains(authority.authority, 'ROLE_ADMIN')}">
									<td>관리자</td>
									<c:set var="doneLoop" value="true" />
								</c:if>

								<c:if test="${not doneLoop}">
									<c:if test="${fn:contains(authority.authority, 'ROLE_SITTER')}">
										<td>시터</td>
										<c:set var="doneLoop" value="true" />
										
										<c:if test="${not doneLoop}">
											<c:if
												test="${fn:contains(authority.authority, 'ROLE_MEMBER')}">
												<td>회원</td>
											</c:if>
										</c:if>
									</c:if>
								</c:if>
							</c:forEach> --%>
							
							<!-- 권한을 3개 가지고 있으면 관리자. -->
							<c:if test="${fn:length(member.authorityList) == 3}">
								<td id='authorityId'>관리자</td>
							</c:if>
							<c:if test="${fn:length(member.authorityList) == 2}">
								<td id='authorityId'>시터</td>
							</c:if>
							<c:if test="${fn:length(member.authorityList) == 1}">
								<td id='authorityId'>회원</td>
							</c:if>
							<td>${member.email }</td>
							<td>${member.memberName }</td>
							<td>${member.mainAddress }${member.subAddress }</td>
							<td>${member.phoneNum }</td>
							<td>${member.memberEnable == 1 ? '회원이 탈퇴 안함' : '회원이 탈퇴함'}</td>
							<!-- td에서는 javascript함수를 사용하기 위해서 "data"형식으로 값을 넣는다. -->
							<td onclick='javascript:popupProfile("${member.email}");' style="cursor:pointer">
								<button type="button" class="btn btn-default" >프로필로 가기</button></td>
							<td onclick='javascript:removeMember("${member.email}");' style="cursor:pointer">
								<button type="button" class="btn btn-warning" >회원 관련 정보 삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-lg-1"></div>
	</div>
</div>
