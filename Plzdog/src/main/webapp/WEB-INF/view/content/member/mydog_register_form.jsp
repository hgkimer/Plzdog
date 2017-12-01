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

<h3>강아지 등록하기</h3>
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
		<label for="gender">성별 : </label>
		<label><input type="radio" name="gender" id="gendermale" class="form-controller"/>수컷</label>
		<label><input type="radio" name="gender" id="genderfemale" class="form-controller"/>암컷</label>
	</div>
	<div class="form-group">
		<label for="weight">몸무게 : </label>
		<input type="number" name="weight" id="weight" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="birthday">생년월일 : </label>
		<input type="date" name="birth" id="birthday" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="dogImageId">강아지 상세정보 : </label>
		<c:forEach items="${applicationScope.dogInfoList }" var="code" varStatus="status">
		<input type="checkbox" name="codeList" id="code" value="${code.code }" class="form-controller"/>
			${code.codeName }
		</c:forEach><br>
	</div>  
	강아지 이미지 : <br>
	<input type="file" name="dogImageList" id="dogImage" /><br>
	<button id="addDogImage" type="button">강아지 이미지 추기</button>
	<input type="submit" value="전송" class="btn btn-default">
</form>
