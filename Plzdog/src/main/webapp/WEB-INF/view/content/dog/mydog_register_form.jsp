<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.plzdog.vo.Code"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#addDogImage").on("click",function() {
			$("#dogImage").siblings().last().after("<input type='file' name='dogImageList' id='dogImage'/>");
		});
		
		$("#dDate").datepicker(
				{
				dateFormat:'yy-mm-dd',
		        // timepicker 설정
		        timeFormat:'HH:mm:ss',
		        controlType:'select',
		        oneLine:true
				});
	});
</script>

<style>
#mySidebar {
	display:none;
}
</style>
<div class="col-lg-3"></div>

<div class="container">
	<div class="row">
		<div class="col-lg-6" style="margin-left:100px;">
		<h1 style="text-align:center">강아지 등록</h1>
			<form action="${initParam.rootPath }/dog/insertDog.do"
				method="post" enctype="multipart/form-data">
				<sec:csrfInput />
				<%-- 이메일 , dogId --%>
				<input type="hidden" name="email"
					value='<sec:authentication property="principal.email"/>'>
				<!-- <input type="hidden" name="dogId" value="0"> -->
				<div class="form-group">
					<label for="dogName">이름 : </label> <input type="text"
						name="dogName" id="dogName" class="form-control"
						required="required" />
				</div>
				<div class="form-group">
					<label for="species">견종 : </label> <input type="text"
						name="species" id="species" class="form-control"
						required="required" />
				</div>
				<div class="form-group">
					<label for="weight">몸무게 : </label> <input type="number"
						name="weight" id="weight" class="form-control"
						required="required" />
				</div>
				<div class="form-group">
					<label for="gender">성별 : </label> 
					<label><input type="radio" name="gender" value="수컷" id="gendermale" class="radio-inline" />수컷</label> 
					<label><input type="radio" name="gender" value="암컷" id="genderfemale" class="radio-inline" />암컷</label>
				</div>
				<div class="form-group">
					<label for="birthday">생년월일 : </label> <input type="text"
						name="birth" id="dDate" class="form-control"
						required="required" />
				</div>
				<div class="form-group">
					<strong>강아지 상세 정보</strong>
				</div>
				<div class="checkbox">
					<c:forEach items="${applicationScope.dogInfoList }" var="code">
						<%--String[] 배열로 값이 전달. --%>
						<label><input type="checkbox" name="dogCodeList" id="code"value="${code.code }"/>${code.codeName }</label><br>
					</c:forEach>
				</div>
				<div class="row">
					<div class="col-lg-6">
					<label for="dogImage">강아지 이미지 :</label><input type="file" name="dogImageList" id="dogImage" placeholder="강아지 선택"/>
					</div>
					<div class="col-lg-6">
					<div class="form-group">
					<button id="addDogImage" type="button" class="btn btn-info">강아지 이미지 추가</button>
					</div>
				</div>
				</div>
				<p></p>
				<div></div>
				<div class="form-group">
					<input type="submit" value="전송" class="btn btn-warning btn-block">
				</div>
			</form>
		</div>
	</div>
</div>