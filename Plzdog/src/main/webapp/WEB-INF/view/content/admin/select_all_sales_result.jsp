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
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h2></h2>
			<table class="table col-sm-12" style="background-color: ghostWhite;">
				<thead>
					<tr>
						<td>결제일</td>
						<td>시터 수입</td>
						<td>수수료</td>
						<td>총액</td>
					</tr>
				</thead>
				<tbody id="listTbody">
					<c:forEach items="${requestScope.salesList }" var="sales">
						<tr>
							<td><fmt:formatDate value="${sales.salesDate }" pattern="yyyy-MM-dd HH시 mm분" /></td>
							<td><fmt:formatNumber value = "${sales.pay }" type ="currency"/></td>
							<td><fmt:formatNumber value = "${sales.commission }" type ="currency"/></td>
							<td><fmt:formatNumber value = "${sales.total }" type ="currency"/></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td>전체 총액 : ${requestScope.allTotal }           전체 수수료 : ${requestScope.allCommission }</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>
