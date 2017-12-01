<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script type="text/javascript">
$(document).ready(function(){
	$("#addDogImage").on("click",function(){
		$("#addDog").append("<div class='form-group'><label for='birthday'> 강아지 이미지 : </label><input type='file' name='dogImageList' id='dogImage' class='form-controller' required='required'/></div>");
	});	
});
</script>
<h3>강아지 등록하기</h3>
<form id="addDog" action="${initParam.rootPath }/" method="post">
	<sec:csrfInput/>
	<div class="form-group">
		<label for="dogName">이름 : </label>
		<input type="text" name="name" id="dogName" class="form-controller" required="required"/>
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
		<input type="number" name="species" id="species" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="birthday">생년월일 : </label>
		<input type="date" name="birthday" id="birthday" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="dogImageId">강아지 상세정보 : </label>
		<input type="checkbox" name="code-1" id="dogImage" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="dogImageId">강아지 이미지 : </label>
		<input type="file" name="dogImageList" id="dogImage" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="dogimage">강아지이미지 : </label>
		<input type="file" name="dogimage" id="dogimage" class="form-controller" required="required"/>
	</div>
	<c:forEach items="${applicationScope.dogInfoList }" var="dogInfo">
		<input type="checkbox" name="dogInfoList[${cnt.index }.code.code]" id="dogInfo" value="${dogInfo.code }" class="form-controller" required="required"/>
			${dogInfo.codeName }
	</c:forEach><br>
	<button id="addDogImage" type="button">강아지 이미지 추기</button>
	<input type="submit" value="전송" class="btn btn-default">
</form>
