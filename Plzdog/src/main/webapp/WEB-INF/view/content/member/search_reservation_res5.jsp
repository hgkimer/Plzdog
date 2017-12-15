<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
		<div class="row" style="margin-top:20px;">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="row">
					<c:if test="${errorMessage != null }">
						<h2 style="color: tomato; text-align: center;">${errorMessage }</h2>
					<p style="text-align: center">	
						<strong>견적 승인 대기중인 예약을 확인하세요!</strong>
					<p>
						<a href="${initParam.rootPath }/member/search_reservation_res2.do?email=<sec:authentication property='principal.email'/>" class="btn btn-info btn-block btn-lg">승인 대기 예약 조회</a>
					</c:if>
					
					<c:forEach items="${requestScope.list }" var="res">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-lg-4">
									<img style="width: 200px" alt="강아지 사진"
										src="${initParam.rootPath }/dogImage/${res.resDogList[0].dogImage[0].dogImage}" class="img-circle">
								</div>
								<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
								<div class="col-lg-8">
									<div class="col-lg-6">
										<p></p>
											<label>강아지 이름</label>
											<c:forEach items="${res.resDogList }" var="dog">
											<p><span class="glyphicons glyphicons-dog"></span>${dog.dogName }</p>	
										</c:forEach>
									</div>
									<div class="col-lg-6">
										<p></p>
										<p>
											 <span class="glyphicon glyphicon-calendar"></span><label>서비스 시작
											<fmt:formatDate value="${res.resSDate }" pattern="yyyy-MM-dd" /></label>
										</p>
										<p>
											 <span class="glyphicon glyphicon-calendar"></span><label>서비스 종료
											<fmt:formatDate value="${res.resEDate }" pattern="yyyy-MM-dd" /></label>
										</p>
									</div>
								</div>
								<div class="row">
								<!-- 다음 줄 시작 -->
									<div class="col-lg-8"></div>
									<div class="col-lg-4">
										<a class="btn btn-danger btn-sm" href="${initParam.rootPath }/member/delete_reservation.do?resId=${res.resId}">삭제하기</a>
										<button type="button" class="btn btn-info btn-sm"
											data-toggle="collapse" data-target="#${res.resId }">상세보기</button>
									</div>
								</div>
							</div> <!-- END OF panel 헤드 -->
							<div class="panel-body">
								<div class="collapse" id="${res.resId }">
									<div class="row">
										<div class="col-lg-6">
											<c:forEach items="${res.demandList }" var="demand">
												<!-- 요구사항 목록중 카테고리가 서비스인 코드만 출력 -->
												<c:if test="${demand.code.category == '서비스' }">
													<label>서비스 종류 : ${res.demandList[0].code.codeName }</label><br>
												</c:if>
											</c:forEach>
												 <span class="glyphicon glyphicon-calendar"></span><label>서비스 시작 :
												<fmt:formatDate value="${res.resSDate }"
													pattern="yyyy-MM-dd HH시 mm분" /></label>
											<c:if test="${res.price > 0 }">
												 <span class="glyphicon glyphicon-piggy-bank"></span><label> ${res.price }원</label>
											</c:if>
										</div>
										<div class="col-lg-6">
											<!-- ApplicationScope에 저장된 예약 상태를 표시하는 코드리스트들을 가져와서 
									현재 예약의 상태와 비교후 일치하는 것만 출력 -->
											<c:forEach items="${applicationScope.resList }"
												var="resStatus">
												<c:if test="${resStatus.code == res.resStatus }">
													<label>예약 상태 : ${resStatus.codeName	}</label><br>
												</c:if>
											</c:forEach>
											<p>
												 <span class="glyphicon glyphicon-calendar"></span><label>서비스 종료 :
												<fmt:formatDate value="${res.resEDate }"
													pattern="yyyy-MM-dd HH시 mm분" /></label>
											</p>
											<button type="button" class="btn btn-default">돌봄일지
												조회</button>
											<p></p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">
											<img  style="width: 200px" class="img-thumnail" alt="회원사진"
												src="${initParam.rootPath }/memberImage/${res.member.memberImage}">
										</div>
										<div class="col-lg-4">
											<p><strong><span class="glyphicon glyphicon-envelope"></span> ${res.member.email }</strong></p>
											<p><strong><span class="glyphicon glyphicon-user"></span> ${res.member.memberName }</strong></p>
											<p><strong><span class="glyphicon glyphicon-phone-alt"></span> ${res.member.phoneNum }</strong></p>
										</div>
										<div class="col-lg-4">
											<span class="glyphicon glyphicon-th-list"></span><label>요구 사항</label><br>
											<ol>
												<c:forEach items="${res.demandList }" var="demand">
													<li><strong>${demand.code.codeName }</strong></li>
												</c:forEach>
											</ol>
										</div>
									</div>
									<c:forEach items="${res.resDogList }" var="dog">
									<div class="row">
										<div class="col-lg-4">
											<!-- 각 강아지들의 첫번쨰 사진을 출력 -->
											<c:forEach items="${dog.dogImage }" var="dogImage">
											<img  class="img-circle" style="width : 200px" alt="강아지 사진" src="${initParam.rootPath }/dogImage/${dogImage.dogImage}">
											</c:forEach>
										</div>
										
										<div class="col-lg-4">
											<!-- 강아지들의 기본정보 출력(이름, 종 ,성별, 무게, 생일) -->
											<p><strong><span class="glyphicon glyphicon-search"></span>${dog.dogName }</strong></p>
											<p><strong><span class="glyphicon glyphicon-filter"></span>${dog.species }</strong></p>
											<p><strong><span class="glyphicon glyphicon-heart"></span>${dog.gender }</strong></p>
											<p><strong>무게  ${dog.weight }kg</strong></p>
											<p><strong><span class="glyphicon glyphicon-gift"></span> <fmt:formatDate value="${dog.birth }" pattern="yyyy-MM-dd"/></strong></p>
										</div>
										<div class="col-lg-4">
											<!-- 강아지 상세 정보 -->
											<span class="glyphicon glyphicon-th-list"></span><label>강아지 상세 정보</label><br>
											<c:forEach items="${dog.dogInfoList }" var="dogInfo">
												<ol>
													<li><strong>${dogInfo.code.codeName }</strong></li>
												</ol>
											</c:forEach>
										</div>
									</div>
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
									
									<div class="row">
											<div class="col-lg-10"></div>
											<div class="col-lg-2">
												<div class="col-lg-4"></div>
												<div class="col-lg-4">
												<button type="button" class="btn btn-info btn-sm"
													data-toggle="collapse" data-target="#${res.resId }">접기</button>
												</div>
												<div class="col-lg-4"></div>
											</div>
									</div>
										<!--  --------- TODO: 여기서 부턴 시터 정보 입력 -----------		-->
									<!--  
										<div class="row">
										<div class="col-lg-4">
											<img
												src="${initParam.rootPath }/memberImage/${res.member.imageMember}">
										</div>
										<div class="col-lg-4">
											<p>시터 이메일 : ${res.member.email }</p>
											<p>시터 이름 : ${res.member.memberName }</p>
											<p>시터 전화번호 ${res.member.phoneNum }</p>
										</div>
										<div class="col-lg-4">
											<p>※요구 사항※</p>
											<ul>
												<c:forEach items="${res.demandList }" var="demand">
													<li>${demand.code.codeName }</li>
												</c:forEach>
											</ul>
										</div>
										
										-->
								</div>
								
							</div> <!-- panel 바디 -->
						</div><!-- panel 폼-->
						
					</c:forEach><!-- 전체 예약 객체 ForEach문 끝 -->
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>