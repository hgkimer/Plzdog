<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	$("#addImage").on("click",function(){
		$("#addCare").append("<input type='file' name='careImageList' id='imageCare'/><br>");
	});	
});
</script>
<h3>돌봄일지 등록하기</h3>
<form id="addCare" action="${initParam.rootPath }/sitter/insert_care.do" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
	예약 번호 : <input type="number" id="resId" name="resId" required="required"/><br>
	날짜 : <input type="date" id="careDate" name="careDate" required="required"/><br>
	내용 : <textarea rows="5" cols="30" id="careContents" name="careContents" required="required"></textarea><br>
	
	<%--careImage --%>
	이미지 추가 : <br>
	<input type="file" name="careImageList" id="imageCare"/><br>
	
	<button id="addImage" type="button">이미지 추기</button>
	<button type="submit">전송</button>
</form>

<%-- <form action="${initParam.rootPath }/care/insert_image.do" method="post" enctype="multipart/form-data"> --%>
