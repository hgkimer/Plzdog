<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">

</script>

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
						<td>시작일</td>
						<td>종료일</td>
						<td>가격</td>
						<td>예약상태</td>
						<td>견주 이메일</td>
						<td>견주 이름</td>
						<td>시터 이메일</td>
						<td>시터 이름</td>
					</tr>
				</thead>
				<tbody id="listTbody">
					<c:forEach items="${requestScope.resList }" var="res">
						<tr>
							<td><fmt:formatDate value="${res.resSDate }" pattern="yyyy-MM-dd HH시 mm분" /></td>
							<td><fmt:formatDate value="${res.resEDate }" pattern="yyyy-MM-dd HH시 mm분" /></td>
							<td><fmt:formatNumber value = "${res.price }" type ="currency"/></td>
							
							<c:choose>
								<c:when test="${res.resStatus eq 'res-1'}">
									<td>예약대기</td>
								</c:when>
								<c:when test="${res.resStatus eq 'res-2'}">
									<td>견주의 승인 대기</td>
								</c:when>
								<c:when test="${res.resStatus eq 'res-3'}">
									<td>시터의 승인 대기</td>
								</c:when>
								<c:when test="${res.resStatus eq 'res-4'}">
									<td>결제 대기</td>
								</c:when>
								<c:when test="${res.resStatus eq 'res-5'}">
									<td>결제 완료</td>
								</c:when>
							</c:choose>
							<td>${res.member.email }</td>
							<td>${res.member.memberName }</td>
							<c:choose>
								<c:when test="${empty res.sitter.email }">
									<td colspan="2">예약 대기 상태에서는 시터의 관한 정보가 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td>${res.sitter.email }</td>
								</c:otherwise>
							</c:choose>
							<td>${res.sitter.memberName }</td>
							<%-- <td onclick='javascript:removeMember("${member.email}");' style="cursor:pointer">
								<button type="button" class="btn btn-warning" >회원 관련 정보 삭제</button></td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-lg-1"></div>
	</div>
</div>