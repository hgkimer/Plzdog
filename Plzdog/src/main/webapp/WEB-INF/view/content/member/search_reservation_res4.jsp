<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
function payRes(resId){
	var payCheck = confirm('결제하시겠습니까? 확인을 누르면 결제페이지로 이동합니다.');
	if(payCheck){
		location.replace('${initParam.rootPath}/member/payment.do?resId='+resId);
	}else{
		alert("취소합니다.")
	}
}
function deleteRes(resId){
	var dCheck = confirm("예약을 삭제하시겠어요?");
	if(dCheck){
		var reCheck = confirm("지워진 예약은 복구가 불가능 합니다. 그래도 진행 하시겠어요?");
		if(reCheck){
			$.ajax({
				"url" : "${initParam.rootPath}/member/delete_reservation.do",
				"type" : "get",
				"data" : {"resId" : resId},
				"success" : function(){
					location.reload();
					alert("예약이 삭제되었습니다.");
				},//end of success
				"error" : function(xhr, status, errorMsg){
					alert("오류가 발생했습니다. - " + status +", " + errorMsg);
				}//end of error
			});//end of ajax
		}else{
			alert("취소되었습니다.");
		}
	}else{
		alert("취소되었습니다.");
		location.reload();
	}
}
</script>


<div class="container">
	<div class="row" style="margin-top: 20px;">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="row">
				<c:if test="${errorMessage != null}">
					<h2 style="color: tomato; text-align: center;">${errorMessage}</h2>
					<p style="text-align: center">
						<strong>예약 등록을 하시려면 아래의 링크를 클릭하세요!</strong>
					<p>
						<a href="${initParam.rootPath }/member/search_sitter.do"
							class="btn btn-info btn-block btn-lg">나에게 맞는 시터 찾기</a>
				</c:if>
				<c:forEach items="${requestScope.list}" var="res">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="col-lg-4">
								<img style="width: 200px" alt="강아지 사진"
									src="${initParam.rootPath }/dogImage/${res.resDogList[0].dogImage[0].dogImage}"
									class="img-circle">
							</div>
							<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
							<div class="col-lg-8">
								<div class="col-lg-6">
									<p></p>
									<label>강아지 이름</label>
									<c:forEach items="${res.resDogList }" var="dog">
										<p>
											<span class="glyphicons glyphicons-dog"></span>${dog.dogName }</p>
									</c:forEach>
									<br>
									<c:if test="${res.price > 0 }">
										<span class="glyphicon glyphicon-piggy-bank"></span>
										<label> ${res.price }원</label>
									</c:if>
								</div>
								<div class="col-lg-6">
									<p></p>
									<p>
										<span class="glyphicon glyphicon-calendar"></span><label>서비스
											시작 <fmt:formatDate value="${res.resSDate }"
												pattern="yyyy-MM-dd" />
										</label>
									</p>
									<p>
										<span class="glyphicon glyphicon-calendar"></span><label>서비스
											종료 <fmt:formatDate value="${res.resEDate }"
												pattern="yyyy-MM-dd" />
										</label>
									</p>
								</div>
							</div>
							<div class="row">
								<!-- 다음 줄 시작 -->
								<div class="col-lg-8"></div>
								<div class="col-lg-4">
									<button type="button" class="btn btn-success btn-sm" onclick="payRes(${res.resId});">결제하기</button>
									<button type="button" class="btn btn-danger btn-sm"
										onclick="deleteRes(${res.resId});">삭제하기</button>
									<button type="button" class="btn btn-info btn-sm"
										data-toggle="collapse" data-target="#${res.resId }">상세보기</button>
								</div>
							</div>
						</div>
						
						<!-- END OF panel 헤드 -->
						
						<div class="panel-body">
							<div class="collapse" id="${res.resId }">
								<div class="row">
									<div class="col-lg-6">
										<c:forEach items="${res.demandList }" var="demand">
											<!-- 요구사항 목록중 카테고리가 서비스인 코드만 출력 -->
											<c:if test="${demand.code.category == '서비스' }">
												<label>서비스 종류 : ${demand.code.codeName }</label>
												<br>
											</c:if>
										</c:forEach>
										<span class="glyphicon glyphicon-calendar"></span><label>서비스
											시작 : <fmt:formatDate value="${res.resSDate }"
												pattern="yyyy-MM-dd HH시 mm분" />
										</label><br>
										<c:if test="${res.price > 0 }">
											<span class="glyphicon glyphicon-piggy-bank"></span>
										<label> ${res.price }원</label>
										</c:if>

									</div>
									<div class="col-lg-6">
										<!-- ApplicationScope에 저장된 예약 상태를 표시하는 코드리스트들을 가져와서 
									현재 예약의 상태와 비교후 일치하는 것만 출력 -->
										<c:forEach items="${applicationScope.resList }"
											var="resStatus">
											<c:if test="${resStatus.code == res.resStatus }">
												<label>예약 상태 : ${resStatus.codeName	}</label>
												<br>
											</c:if>
										</c:forEach>
										<p>
											<span class="glyphicon glyphicon-calendar"></span><label>서비스
												종료 : <fmt:formatDate value="${res.resEDate }"
													pattern="yyyy-MM-dd HH시 mm분" />
											</label>
										</p>
										<p></p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-4">
										<img style="width: 200px; height: 150px;" class="img-thumbnail" alt="회원사진"
											src="${initParam.rootPath }/memberImage/${res.member.memberImage}">
									</div>
									<div class="col-lg-4">
										<p>
											<strong><span class="glyphicon glyphicon-envelope"></span>
												${res.member.email }</strong>
										</p>
										<p>
											<strong><span class="glyphicon glyphicon-user"></span>
												${res.member.memberName }</strong>
										</p>
										<p>
							
											<strong><span class="glyphicon glyphicon-phone-alt"></span>
												${res.member.phoneNum }</strong>
										</p>
									</div>
									<div class="col-lg-4">
										<span class="glyphicon glyphicon-th-list"></span><label>요구
											사항</label><br>
										<ol>
											<c:forEach items="${res.demandList }" var="demand">
												<li><strong>${demand.code.codeName } <span class="glyphicon glyphicon-ok"></span></strong></li>
											</c:forEach>
										</ol>
									</div>
								</div>
								<hr>
								<c:forEach items="${res.resDogList }" var="dog">
									<div class="row">
										<div class="col-lg-4">
											<!-- 각 강아지들의 첫번쨰 사진을 출력 -->
											<img class="img-circle" style="width: 200px" alt="강아지 사진"
												src="${initParam.rootPath }/dogImage/${dog.dogImage[0].dogImage}">
										</div>

										<div class="col-lg-4">
											<!-- 강아지들의 기본정보 출력(이름, 종 ,성별, 무게, 생일) -->
											<p>
												<strong><span class="glyphicon glyphicon-search"></span>${dog.dogName }</strong>
											</p>
											<hr>
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
										<div class="col-lg-4">
											<!-- 강아지 상세 정보 -->
											<span class="glyphicon glyphicon-th-list"></span><label>강아지
												상세 정보</label><br>
											<c:forEach items="${dog.dogInfoList }" var="dogInfo">
												<ol>
													<li><strong>${dogInfo.code.codeName } <span class="glyphicon glyphicon-ok"></span></strong></li>
												</ol>
											</c:forEach>
										</div>
									</div>
									<hr>
								</c:forEach>
								<div class="row">
									<div class="col-lg-5"></div>
									<div class="col-lg-4">
										<label>요청 내용 상세</label><br>
									</div>
									<div class="col-lg-3"></div>
								</div>
								
								<div class="row">
									<div class="col-lg-12">
										<div class="well-lg">
											<strong>${res.resContents }</strong>
										</div>
									</div>
								</div>
								<hr>

								<div class="row">
									<div class="col-lg-4">
										<img style="width: 200px; height: 150px;" class="img-thumbnail" alt="회원사진"
											src="${initParam.rootPath }/memberImage/${res.sitter.memberImage}">
									</div>
									<div class="col-lg-4">
										<p>
											<strong><span class="glyphicon glyphicon-envelope"></span>
												${res.sitter.email }</strong>
										</p>
										<p>
											<strong><span class="glyphicon glyphicon-user"></span>
												${res.sitter.memberName }</strong>
										</p>
										<p>
											<strong><span class="glyphicon glyphicon-phone-alt"></span>
												${res.sitter.phoneNum }</strong>
										</p>
									</div>
									<div class="col-lg-4">
										<span class="glyphicon glyphicon-th-list"></span><label>보유 능력 리스트</label><br>
										<ol>
											<c:forEach items="${res.sitter.sitter.skillList }" var="skill">
												<c:if test="${fn:contains(skill.code.category, '시터')}">
													<li><strong>${skill.code.codeName } <span class="glyphicon glyphicon-ok"></span></strong></li>
												</c:if>
											</c:forEach>
										</ol>
									</div>
									<div class="row">
										<div class="col-lg-10"></div>
										<div class="col-lg-2">
											<div class="col-lg-4"></div>
											<div class="col-lg-4">
												<button type="button" class="btn btn-info btn-sm"
													data-toggle="collapse" data-target="#${res.resId }">접기</button>
											</div>
											<div class="col-lg-4">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- panel 바디 -->
						</div>
					</div>
					<!-- panel 폼-->
				</c:forEach>
				<!-- 전체 예약 객체 ForEach문 끝 -->
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
</div>

