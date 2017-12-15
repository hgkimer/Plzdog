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
</style>
<p></p>
<div class="container">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="row" style="margin-bottom: 20px;">
				<button onclick="location.href='mydog_register_form.do'"
					class="btn btn-warning btn-lg btn-block">강아지 등록</button>
				<c:forEach items="${requestScope.dogList }" var="dog">
					<div class="panel panel-warning" style="margin-top: 20px;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-lg-4">
										<img
											src="${initParam.rootPath }/dogImage/${dog.dogImage[0].dogImage }"
											width="200px" class="img-circle">
								</div>
								<div class="col-lg-8">
									<p>
										<strong><span class="glyphicon glyphicon-search"></span>${dog.dogName }</strong>
									</p>
									<p>
										<strong><span class="glyphicon glyphicon-heart"></span>${dog.gender }</strong>
									</p>
								</div>
							</div>
							<div class="row">
									<div class="col-lg-7"></div>
									<div class="col-lg-5">
										<div class="btns">
											<button
												onclick="location.href='select_dog_dogInfo_dogImage.do?dogId=${dog.dogId}'"
												class="btn btn-default btn-sm">강아지 수정</button>
											<button
												onclick="location.href='delete_dog.do?dogId=${dog.dogId}'"
												class="btn btn-danger btn-sm">강아지 삭제</button>
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="collapse" data-target="#${dog.dogId }">상세보기</button>
										</div>
									</div>
								</div>
						</div>
						<div class="panel-body">
							<div class="collapse" id="${dog.dogId }">
							<div class="col-lg-12">
								<c:forEach items="${dog.dogImage }" var="dogImage">
								<img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }"
											width="200px" class="img-circle">
								</c:forEach>
							</div>
							<div class="row" style="margin-top:20px">
								<div class="col-lg-6">
									<p>
										<strong><span class="glyphicon glyphicon-search"></span>${dog.dogName }</strong>
									</p>
									<p>
										<strong><span class="glyphicon glyphicon-filter"></span>${dog.species }</strong>
									</p>
									<p>
										<strong><span class="glyphicon glyphicon-heart"></span>${dog.gender }</strong>
									</p>
									<p>
										<strong>무게 ${dog.weight }kg</strong>
									</p>
									<p>
										<strong><span class="glyphicon glyphicon-gift"></span>
											<fmt:formatDate value="${dog.birth }" pattern="yyyy-MM-dd" /></strong>
									</p>
								</div>
								<div class="col-lg-6">
									<!-- 강아지 상세 정보 -->
									<span class="glyphicon glyphicon-th-list"></span><label>강아지
										상세 정보</label><br>
									<c:forEach items="${dog.dogInfoList }" var="dogInfo">
										<ol>
											<li><strong>${dogInfo.code.codeName }</strong></li>
										</ol>
									</c:forEach>
								</div>
								</div>
									<div class="row">
									<div class="col-lg-10"></div>
									<div class="col-lg-2">
										<div class="col-lg-4"></div>
										<div class="col-lg-4">
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="collapse" data-target="#${dog.dogId }">접기</button>
										</div>
										<div class="col-lg-4"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>
</div>
