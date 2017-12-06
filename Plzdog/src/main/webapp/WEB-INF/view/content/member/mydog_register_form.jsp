<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.plzdog.vo.Code"%>

<script type="text/javascript">
$(document).ready(function(){
	$("#addDogImage").on("click",function(){
		$("#addDog").append("<input type='file' name='dogImageList' id='dogImage'/><br>");
	});	
});
</script>
<style type="text/css">
	.plus {
		width:1000px;
		height:400px;
		float:left;
		margin-top:50px;
	}
	
	#addDog {
		width:400px;
		height:50px;
	}
	
	.form-group {
		border: 1px solid #e3e3e3;
    	width: 350px;
    	height: 50px;
    	line-height: 45px;
    	float: left;
    	margin-top: 10px;
	}
</style>
<div class="plus">
	<form id="addDog" action="${initParam.rootPath }/dog/insertDog.do" method="post" enctype="multipart/form-data">
		<sec:csrfInput/>
		<%-- 이메일 , dogId --%>
		<input type="hidden" name="email" value='<sec:authentication property="principal.email"/>'>
		<!-- <input type="hidden" name="dogId" value="0"> -->
		<div class="form-group">
			<label for="dogName">이름 : </label>
			<input type="text" name="dogName" id="dogName" class="form-controller" required="required"/>
		</div>
		<div class="form-group">
			<label for="species">견종 : </label>
			<input type="text" name="species" id="species" class="form-controller" required="required"/>
		</div>
		<div class="form-group">
			<label for="weight">몸무게 : </label>
			<input type="number" name="weight" id="weight" class="form-controller" required="required"/>
		</div>
		<div class="form-group" style="text-align:center;">
			<label for="gender">성별 : </label>
			<label><input type="radio" name="gender" value="수컷" id="gendermale" class="form-controller"/>수컷</label>
			<label><input type="radio" name="gender" value="암컷" id="genderfemale" class="form-controller"/>암컷</label>
		</div>
		<div class="form-group">
			<label for="birthday">생년월일 : </label>
			<input type="date" name="birth" id="birthday" class="form-controller" required="required"/>
		</div>
		<div class="form-group" style="width:1000px;">
			<label for="dogImageId">강아지 상세정보 : </label>
			<c:forEach items="${applicationScope.dogInfoList }" var="code" >
			<%--String[] 배열로 값이 전달. --%>
			<input type="checkbox" name="dogCodeList" id="code" value="${code.code }" class="form-controller"/>
				${code.codeName }
			</c:forEach><br>
		</div>
			<div class="di">
				강아지 이미지 : <br>
				<input type="file" name="dogImageList" id="dogImage" /><br>
				<button id="addDogImage" type="button">강아지 이미지 추기</button>
				<input type="submit" value="전송" class="btn btn-default">
			</div>
	</form>
</div>