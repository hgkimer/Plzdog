<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>시터 입장에서 결제 완료 페이지</h2>
<script type="text/javascript">
$(document).ready(function(){
	$("")
});
</script>

	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<a href=""></a>
				<div class="row">
					<c:forEach items="${requestScope.memberList }" var="res">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-lg-4">
									<img style="width: 200px" alt="강아지 사진"
										src="${initParam.rootPath }/dogImage/${res.resDetailList[0].dog.dogImage[0].dogImage}">
								</div>
								<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
								<div class="col-lg-8">
									<div class="col-lg-6">
										<p></p>
											<p>강아지 이름</p>
											<c:forEach items="${res.resDetailList}" var="resDetail">
											<p><span class="glyphicon glyphicon-tag"></span>${resDetail.dog.dogName }</p>	
											</c:forEach>
										<p>성별</p>
										<c:forEach items="${res.resDetailList}" var="resDetail">
										<p><span class="glyphicon glyphicon-tag"></span>${resDetail.dog.gender}</p>
										</c:forEach>
									</div>
									<div class="col-lg-6">
										<p></p>
										<p>
											 <span class="glyphicon glyphicon-calendar"></span>서비스 시작
											<fmt:formatDate value="${res.resSDate }" pattern="yyyy-MM-dd" />
										</p>
										<p>
											 <span class="glyphicon glyphicon-calendar"></span>서비스 종료
											<fmt:formatDate value="${res.resEDate }" pattern="yyyy-MM-dd" />
										</p>
									</div>
								</div>
								<div class="row">
								<!-- 다음 줄 시작 -->
									<div class="col-lg-8"></div>
									<div class="col-lg-4">
										<button type="button" class="btn btn-info btn-sm"
											data-toggle="collapse" data-target="#${res.resId }">상세보기</button>
									</div>
								</div>
							</div> <!-- panel 헤드 -->
							<div class="panel-body">
								<div class="collapse" id="${res.resId }">
									<div class="row">
										<div class="col-lg-6">
											<c:forEach items="${res.demandList }" var="demand">
												<!-- 요구사항 목록중 카테고리가 서비스인 코드만 출력 -->
												<c:if test="${demand.code.category == '서비스' }">
													<p>서비스 종류 : ${res.demandList[0].code.codeName }</p>
												</c:if>
											</c:forEach>
											<p>
												 <span class="glyphicon glyphicon-calendar"></span>서비스 시작 :
												<fmt:formatDate value="${res.resSDate }"
													pattern="yyyy-MM-dd HH시 mm분" />
											</p>
											<c:if test="${res.price > 0 }">
												<p>금액 ${res.price }</p>
											</c:if>
										</div>
										<div class="col-lg-6">
											<!-- ApplicationScope에 저장된 예약 상태를 표시하는 코드리스트들을 가져와서 
									현재 예약의 상태와 비교후 일치하는 것만 출력 -->
											<c:forEach items="${applicationScope.resList }"
												var="resStatus">
												<c:if test="${resStatus.code == res.resStatus }">
													<p>예약 상태 : ${resStatus.codeName	}</p>
												</c:if>
											</c:forEach>
											<p>
												 <span class="glyphicon glyphicon-calendar"></span>서비스 종료 :
												<fmt:formatDate value="${res.resEDate }"
													pattern="yyyy-MM-dd HH시 mm분" />
											</p>
											<button type="button" class="btn btn-default">돌봄일지
												조회</button>
											<p></p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">
											<img alt="회원사진" style="width: 200px"
												src="${initParam.rootPath }/memberImage/${res.member.memberImage}">
										</div>
										<div class="col-lg-4">
											<p>신청자 이메일 : ${res.member.email }</p>
											<p>신청자 이름 : ${res.member.memberName }</p>
											<p>신청자 전화번호 ${res.member.phoneNum }</p>
										</div>
										<div class="col-lg-4">
											<p>※요구 사항※</p>
											<ul>
												<c:forEach items="${res.demandList }" var="demand">
													<li>${demand.code.codeName }</li>
												</c:forEach>
											</ul>
										</div>
									</div>
									<div class="row">
											<div class="col-lg-5"></div>
											<div class="col-lg-4">
												<h5>요청 내용 상세</h5>
											</div>
											<div class="col-lg-3"></div>
									</div>
									<div class="row">
										<div class="col-lg-12">
												<div class="well-lg">
												${res.resContents }
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
								</div>
								
							</div> <!-- panel 바디 -->
						</div><!-- panel 폼-->
						
					</c:forEach><!-- 전체 예약 객체 ForEach문 끝 -->
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>

<%-- 
	<div class="all">
		<div class="top">
			<button class="btn1">예약 상세</button>
			<button class="btn2">돌봄일지 작성</button>
			<button class="btn3">돌봄일지 수정</button>
			<button class="btn4">돌봄일지 작성</button>
		</div>
		<c:forEach items="${requestScope.memberList }" var="reservation">
				<div class="navImage">
					<img src="${initParam.rootPath }/memberImage/${reservation.member.memberImage }"><br>
					회원 이름 : ${reservation.member.memberName } <br>
				</div>
				<div class="dogOwner">
					<ul class="navList">
						<li>예약상태 : ${reservation.resStatus}</li>
						<li>시작날짜 : ${reservation.resSDate}</li>
						<li>끝날짜 : ${reservation.resEDate}</li>
						<li>예약에 대한 가격 : ${reservation.price}</li>
					</ul>
				<button class="btn5">강아지 상세 보기</button>
				<div class="dog">
						<c:forEach items="${reservation.resDetailList}" var="resDetail">
								강아지 이름 : ${resDetail.dog.dogName }<br>
								강아지종 : ${resDetail.dog.species}<br>
								강아지성별 : ${resDetail.dog.gender}<br>
								강아지몸무게 : ${resDetail.dog.weight}<br>
								강아지생년월일 : ${resDetail.dog.birth}<br>
						</c:forEach>
				</div>
				</div>
		</c:forEach>
			<div class="care">
			<img src="${initParam.rootPath }/image/caredog.jpg">
			</div>
	</div> --%>