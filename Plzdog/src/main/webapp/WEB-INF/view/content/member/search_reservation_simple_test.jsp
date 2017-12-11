<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="coll-lg-2"></div>
			<div class="col-lg-8">
				<c:forEach items="${requestScope.list }" var="res">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="col-lg-4">
								<img style="width: 300px" alt="강아지 사진"
									src="${initParam.rootPath }/dogImage/${res.resDogList[0].dogImage[0].dogImage}">
							</div>
							<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
							<div class="col-lg-8">
								<div class="col-lg-6">
									<p>
										강아지 이름 :
										<c:forEach items="${res.resDogList }" var="dog">
								${dog.dogName }						
							</c:forEach>
									</p>
									<p>
										시작 날짜:
										<fmt:formatDate value="${res.resSDate }" pattern="yyyy-MM-dd" />
									</p>
								</div>
								<div class="col-lg-6">
									<p>
										강아지 성별 :${dog.gender }
										<c:forEach items="${res.resDogList }" var="dog">
								${dog.gender }								
							</c:forEach>
									</p>
									<p>
										종료 날짜 :
										<fmt:formatDate value="${res.resEDate }" pattern="yyyy-MM-dd" />
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-8"></div>
								<div class="col-lg-4">
									<button type="button" class="btn btn-warning btn-sm">수정하기</button>
									<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
									<button type="button" class="btn btn-info btn-sm"
										data-toggle="collapse" data-target="#${res.resId }">상세보기</button>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="collapse" id="${res.resId }">
								<div class="row">
									<div class="col-lg-6">
										<c:forEach items="${res.demandList }" var="demand">
											${demand.code }
											<!-- 요구사항 목록중 카테고리가 서비스인 코드만 출력 -->
											<c:if test="${demand.code.category == '서비스' }">
												<p>서비스 종류 : ${res.demandList[0].code.codeName }</p>
											</c:if>

										</c:forEach>
										<p>
											시작 날짜
											<fmt:formatDate value="${res.resSDate }"
												pattern="yyyy-MM-dd HH시 mm분" />
										</p>
										<p>금액 ${res.price }</p>

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
											종료 날짜 :
											<fmt:formatDate value="${res.resEDate }"
												pattern="yyyy-MM-dd HH시 mm분" />
										</p>
										<button type="button" class="btn btn-default">돌봄일지 조회</button>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-4">
										<img
											src="${initParam.rootPath }/memberImage/${res.member.imageMember}">
									</div>
									<div class="col-lg-4">
										<p>신청자 이메일 : ${res.member.email }</p>
										<p>신청자 이름 : ${res.member.memberName }</p>
										<p>신청자 전화번호 ${res.member.phoneNum }</p>
									</div>
									<div class="col-lg-4">
										<p>요구 사항</p>
										<c:forEach items="${res.demandList }" var="demand">
											${demand.code.codeName }<br>
										</c:forEach>
									</div>
								</div>
								<button type="button" class="btn btn-info"
									data-toggle="collapse" data-target="#${res.resId }">접기</button>
							</div>

						</div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>

</body>
</html>