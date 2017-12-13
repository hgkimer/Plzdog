<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#addImage").on("click",function(){
		$("#addCare").append("<input type='file' name='careImageList' id='imageCare'/><br>");
	});	
});
</script>
</head>
<body>
<h3>돌봄일지 등록하기</h3>
<form id="addCare" action="${initParam.rootPath }/sitter/insert_care.do" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
	예약 번호 : <input type="number" id="email" name="resId" value='${param.resId }' required readonly/><br>
	날짜 : <input type="date" id="careDate" name="careDate" required="required"/><br>
	내용 : <textarea rows="5" cols="30" id="careContents" name="careContents" required="required"></textarea><br>
	
	<%--careImage --%>
	이미지 추가 : <br>
	<input type="file" name="careImageList" id="imageCare"/><br>
	
	<button id="addImage" type="button">이미지 추가</button>
	<button type="submit">전송</button>
</form>
</body>
</html>
