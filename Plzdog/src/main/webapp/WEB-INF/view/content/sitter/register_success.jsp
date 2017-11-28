<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>등록 제품 정보</h2>
<ul class="list-group" style="font-size:1.3em">
	<li class="list-group-item">제품 ID : ${param.productId}</li>
	<li class="list-group-item">제품명 : ${param.productName }</li>
	<li class="list-group-item">제품가격 : <fmt:formatNumber value='${param.productPrice }'/>원</li>
</div>
