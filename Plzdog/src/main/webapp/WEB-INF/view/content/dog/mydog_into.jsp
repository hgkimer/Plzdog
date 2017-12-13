<%@ page contentType="text/html;charset=utf-8"%>

<div class="form-group">
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
		<label for="birthday">생년월일 : <fmt:formatDate value = '${dog.birth }' type="date"/></label>
	</div>
	
	<div class="form-group">
		<label for="dogImageId">강아지 상세정보 : </label>
		<c:forEach items="${codeList }" var="code">
			${code.codeName } (O)<br>
		</c:forEach>
	</div>