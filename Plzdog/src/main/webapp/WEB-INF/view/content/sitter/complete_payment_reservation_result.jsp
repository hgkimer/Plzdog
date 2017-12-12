<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	$(document).ready(function(){
		$(".btn1").on("click", function(){
			$(".care").hide();
			$(".res").show();
		});
		$(".btn2").on("click", function(){
			$(".res").hide();
			$(".care").show();
		});
	});
</script>

<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="row">
					<c:forEach items="${requestScope.memberList }" var="reservation">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-lg-4">
									<img style="width: 300px" alt="강아지 사진"
										src="${initParam.rootPath }/강아지Image/${resservation.member.dogImage}">
								</div>
								<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
								<div class="col-lg-8">
									<div class="col-lg-6">
										<p></p>
										<p>
											강아지 이름 :
											<c:forEach items="${reservation.resDetailList}" var="resDetail">
											${resDetail.dog.dogName }			
											</c:forEach>
										</p>
										<c:forEach items="${reservation.resDetailList}" var="resDetail">
										${resDetail.dog.gender}							
										</c:forEach>
									</div>
									<div class="col-lg-6">
										<p></p>
										<p>
											서비스 시작:
											<fmt:formatDate value="${reservation.resSDate }" pattern="yyyy-MM-dd" />
										</p>
										<p>
											서비스 종료 :
											<fmt:formatDate value="${reservation.resEDate }" pattern="yyyy-MM-dd" />
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-8"></div>
									<div class="col-lg-4">
										<button type="button" class="btn btn-warning btn-sm">수정하기</button>
										<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
										<button type="button" class="btn btn-info btn-sm"
											data-toggle="collapse" data-target="#${reservation.resId }">상세보기</button>
									</div>
								</div>
							</div>
							<div class="panel-body">
								<div class="collapse" id="${reservation.resId }">
									<div class="row">
										<div class="col-lg-6">
											<c:forEach items="${reservation.demandList }" var="demand">
												<!-- 요구사항 목록중 카테고리가 서비스인 코드만 출력 -->
												<c:if test="${demand.code.category == '서비스' }">
													<p>서비스 종류 : ${res.demandList[0].code.codeName }</p>
												</c:if>

											</c:forEach>
											<p>
												서비스 시작 :
												<fmt:formatDate value="${reservation.resSDate }"
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
												<c:if test="${resStatus.code == reservation.resStatus }">
													<p>예약 상태 : ${resStatus.codeName	}</p>
												</c:if>
											</c:forEach>
											<p>
												서비스 종료 :
												<fmt:formatDate value="${reservation.resEDate }"
													pattern="yyyy-MM-dd HH시 mm분" />
											</p>
											<button type="button" class="btn btn-default">돌봄일지
												조회</button>
											<p></p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">
											<img
												src="${initParam.rootPath }/memberImage/${reservation.member.memberImage}">
										</div>
										<div class="col-lg-4">
											<p>신청자 이메일 : ${reservation.member.email }</p>
											<p>신청자 이름 : ${reservation.member.memberName }</p>
											<p>신청자 전화번호 ${reservation.member.phoneNum }</p>
										</div>
										<div class="col-lg-4">
											<p>※요구 사항※</p>
											<ul>
												<c:forEach items="${reservation.demandList }" var="demand">
													<li>${demand.code.codeName }</li>
												</c:forEach>
											</ul>
										</div>
										<div class="row">
											<div class="col-lg-10"></div>
											<div class="col-lg-2">
												<button type="button" class="btn btn-info"
													data-toggle="collapse" data-target="#${res.resId }">접기</button>
											</div>
										</div>
								<!--  --------- TODO: 여기서 부턴 시터 정보 -----------		-->
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
								</div>
							</div>
						</div>
					</c:forEach>
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