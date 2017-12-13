<%@page import="com.plzdog.vo.CareImage"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
/* $(document).ready(function(){
	$("#registerCareId").on("click", function(){
		$(".selectCare").hide();
		$(".editCare").hide();
		$(".registerCare").show();
	});	
		
	$("#editCareId").on("click", function(){
		$(".selectCare").hide();
		$(".registerCare").hide();
		$(".editCare").show();
	});
	$("#selectCareId").on("click", function(){
		$(".editCare").hide();
		$(".registerCare").hide();
		$(".selectCare").show();
	});
}); */
</script>

<style type="text/css">
	* {
		margin:0 auto;
		padding:0;
		list-style:none;
		text-decoration:none;
	}
	
	/* a 태그 자동으로 검정색 */
	a {
		color:inherit;
	}
	
	/* 공간을 나누어 준다. */
	.clear {
		clear:both;
	}
	
	.top {
		width:300px;
		height:100px;
		float:left;
	}
	
	.manageCare {
		width:800px;
		height:800px;
		float:left;
		margin:10px;
	}
	
	.registerCare {
		width:100%;
		height:100%;
		float:left;
		display:none;
	}
	
	.editCare {
		width:100%;
		height:100%;
		float:left;
		display:none;
	}
	
	.selectCare {
		width:100%;
		height:100%;
		float:left;
		display:none;
	}
	
</style>

</head>
<body>
	
	<!-- <button type="button" class="btn btn-default" id='registerCareId' onclick='popupRegisterCare()'>돌봄일지등록결과</button>
	<button type="button" class="btn btn-default" id='editCareId' onclick='popupEditCare()'>돌봄일지수정</button>
	<button type="button" class="btn btn-default" id='deleteCareId' onclick='popupDeleteCare()'>돌봄일지삭제</button>
	<button type="button" class="btn btn-default" id='selectCareId' onclick='popupSelectCare()'>돌봄일지조회</button>
	<button type="button" class="btn btn-default" id='returnCareId' onclick="location.href='care_manage_form.do'">되돌아가기</button> -->
				돌봄일지 번호 : ${care.careId }<br>
				돌봄일지 내용 : ${care.careContents }<br>
				예약번호 : ${care.resId }<br>
				<c:forEach items="${care.careImage }" var="CareImage">
					<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="350px"><br>
				</c:forEach>
</body>
</html>