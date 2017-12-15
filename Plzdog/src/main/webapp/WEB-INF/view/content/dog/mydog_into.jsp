<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.form-group {
	width: auto;
	height: auto;
	float: left;
	font-size: 20px;
}

#dogImage img {
	width: 200px;
	height: 100px;
}

.btns {
	float: right;
	margin-top: 60px;
}
</style>
<div class="container" style="margin-top: 50px;">
	<div class="row">
		
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="row" style="margin-bottom : 20px;">
				<button onclick="location.href='mydog_register_form.do'"
			class="btn btn-info btn-sm" >강아지 등록</button>
			</div>
			
			<div class="row" style="border: 1px solid black; float: left;">
				<c:forEach items="${requestScope.dogList }" var="dog">
					<div class="form-group" id="dogImage">
						<label for="dogImageId">강아지 이미지 : </label><br>
						<c:forEach items="${dog.dogImage }" var="dogImage">
							<img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }"
								width="200px" class="img-circle">
							<br>
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
						<label for="birthday">생년월일 : <fmt:formatDate
								value="${dog.birth }" type="date" />
						</label>
					</div>

					<div class="form-group">
						<label for="dogImageId">강아지 상세정보 : </label>
						<c:forEach items="${dog.dogInfoList }" var="dogInfo">
							${dogInfo.code.codeName } (O)<br>
						</c:forEach>
					</div>
					<div class="btns">
						<button
							onclick="location.href='select_dog_dogInfo_dogImage.do?dogId=${dog.dogId}'"
							class="btn btn-warning btn-sm">강아지 수정</button>
						<button onclick="location.href='delete_dog.do?dogId=${dog.dogId}'"
							class="btn btn-danger btn-sm">강아지 삭제</button>
					</div>
			</c:forEach>
			</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>