<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.contents {
		border:1px solid black;
		margin-top:50px;
	}
	
	.form-group {
		width:auto;
		height:20px;
		float:left;
	}
	
	#dogImage img {
		width:200px;
		height:100px;
	}
</style>

<div class="col-lg-3" style="float:left; height:-webkit-fill-available;"></div>

	<button onclick="location.href='mydog_register_form.do'">강아지 등록</button>

<c:forEach items="${requestScope.dogList }" var="dog">
<div class="col-lg-6 contents" style="height:100px;">
	<div class="form-group" id="dogImage">
		<label for="dogImageId">강아지 이미지 : </label><br>
		<c:forEach items="${dog.dogImage }" var="dogImage">
			<img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }" width="350px"><br>
		</c:forEach>
	</div>
	
		<div class="form-group">
			<label for="dogName">이름 : ${dog.dogName }</label>
		</div>
		<div class="form-group">
			<label for="species">견종 : ${dog.species } </label>
		</div>
		<div class="form-group">
			<label for="gender">성별 : ${dog.gender }</label>
		</div>
		<div class="form-group">
			<label for="weight">몸무게 : ${dog.weight }</label>
		</div>
		<div class="form-group">
			<label for="birthday">생년월일 : <fmt:formatDate value ="${dog.birth }" type="date"/> </label>
		</div>
		  
		<div class="form-group">
			<label for="dogImageId">강아지 상세정보 : </label>
			<c:forEach items="${dog.dogInfoList }" var="dogInfo">
				${dogInfo.code.codeName } (O)<br>
			</c:forEach>
		</div>
		<button onclick="location.href='select_dog_dogInfo_dogImage.do?dogId=${dog.dogId}'">강아지 수정</button>
		<button onclick="location.href='delete_dog.do'">강아지 삭제</button>
</div>
</c:forEach>

<div class="col-lg-3" style="float:right;"></div>