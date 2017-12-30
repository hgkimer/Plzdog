<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
function popupRegisterReview(sitterEmail) {
	var url = '${initParam.rootPath}/member/review_register_form.do?sitterEmail='+sitterEmail;
	window.open(url,"newReviewManageForm","width = 500, height = 500");
}

function popupUpdateReview(sitterEmail) {
	var url = '${initParam.rootPath}/member/review_edit_form.do?sitterEmail='+sitterEmail;
	window.open(url,"newReviewManageForm","width = 1000, height = 1000");
}

function deleteReview(reviewId) {
	
	opener.parent.location="/WEB-INF/view/content/member/profile.jsp";
	opener.parent.location.reload();
}

</script>

	<div class="container">
		<div class="row" style="margin-top:20px">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="col-lg-6">
									<label>${requestScope.profile.memberName } 님의 프로필</label><br>
									<img style="width: 350px; height: 350px" alt="회원 사진" src="${initParam.rootPath }/memberImage/${requestScope.profile.memberImage }"><br>
								</div>
								<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
								<div class="col-lg-6">
									<div class="col-lg-6">
										<p></p>
										<p>
											<span class="glyphicon glyphicon-envelope"></span><label for="pId"> Email : </label> ${requestScope.profile.email } <br>
										</p>
										<p>
											 주소 : ${requestScope.profile.mainAddress }
										</p>
										<P>
											전화번호 : ${requestScope.profile.phoneNum }
										</P>
									</div>
								</div>
								<div class="row">
								<!-- 다음 줄 시작 -->
									<div class="col-lg-8"></div>
									<div class="col-lg-4">
										
									</div>
								</div>
							</div> <!-- END OF panel 헤드 -->
							<c:if test="${requestScope.profile.sitter != null }">
							<div class="panel-body">
									<div class="row">
										<div class="col-lg-3">
											<p><strong></strong></p>
											<p><strong> 학교 : ${requestScope.profile.sitter.school }</strong></p>
											<p><strong> 서비스지역 : ${requestScope.profile.sitter.serviceAddress }</strong></p>
											<p><strong> 시터평점 : ${requestScope.profile.sitter.sitterRate }</strong></p>
											<p><strong> 방문돌봄금액 : ${requestScope.profile.sitter.visitPrice }</strong></p>
											<p><strong> 위탁돌봄금액 : ${requestScope.profile.sitter.givePrice }</strong></p>
										</div>
										<div class="col-lg-3">
										<p><strong><span class="glyphicon glyphicon-th-list"></span>보유 능력 : <br></strong></p>
										<p>	<c:forEach var="skill" items="${requestScope.profile.sitter.skillList }">
													<c:if test="${fn:contains(skill.code.category, '시터')}">
														<strong>${skill.code.codeName } </strong><br>
													</c:if>		
											</c:forEach></p>
										</div>
										<div class="col-lg-3">
										<p><strong><span class="glyphicon glyphicon-th-list"></span>제공 가능한 서비스 : <br></strong></p>
										<p>	<c:forEach var="skill" items="${requestScope.profile.sitter.skillList }">
													<c:if test="${fn:contains(skill.code.category, '서비스')}">
														<strong>${skill.code.codeName } </strong><br>
													</c:if>		
											</c:forEach></p>
										</div>
										<div class="col-lg-3">
											<p><strong><span class="glyphicon glyphicon-th-list"></span>보유 환경 : <br></strong></p>
											<p>	<c:forEach var="skill" items="${requestScope.profile.sitter.skillList }">
														<c:if test="${fn:contains(skill.code.category, '환경')}">
															<strong>${skill.code.codeName } </strong><br>
														</c:if>
												</c:forEach></p>
										
										</div>
										<div class="row">
											<div class="col-lg-12">
													<form action="${initParam.rootPath }/member/checkSitter.do">
											<input type="hidden" value="${requestScope.profile.email }" name="sitterEmail"/>
											<button type="submit" class="btn btn-warning btn-lg btn-block">예약 신청</button>
											</form>
											</div>
										</div>
									</div>
							</div> <!-- panel 바디 -->
							</c:if>
							<div class="panel-footer">
									<c:choose>
											<c:when test="${empty requestScope.profile.dogList   }">
											<h4 style="color: tomato; text-align: center;">회원님의 강아지가 없습니다!</h4>
											</c:when>
										<c:otherwise>
											<c:forEach items="${requestScope.profile.dogList }" var="dog" >
											<div class="row">
												<div class="col-lg-4">
													<!-- 각 강아지들의 첫번쨰 사진을 출력 -->
													<c:forEach items="${dog.dogImage }" var="dogImage">
													 	<img class="img-circle" src="${initParam.rootPath }/dogImage/${dogImage.dogImage }" width="200px"><br>
													</c:forEach>
												</div>
												<div class="col-lg-4">
													<!-- 강아지들의 기본정보 출력(이름, 종 ,성별, 무게, 생일) -->
													<p><strong><span class="glyphicon glyphicon-search"></span>${dog.dogName}</strong></p>
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
															<li><strong>${dogInfo.code.codeName } <span class="glyphicon glyphicon-ok"></span></strong></li>
														</ol>
													</c:forEach>
												</div>
											</div>
											<hr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									
									<!-- 리뷰 -->
										<c:choose>
											<c:when test="${empty requestScope.profile.reviewList }">
											<h4 style="color: tomato; text-align: center;">등록된 리뷰가 없습니다!</h4>
											<button type="button" class="btn btn-info btn-sm" 
														onclick='javascript:popupRegisterReview("${requestScope.profile.email}")'>리뷰 등록</button>
											</c:when>
										<c:otherwise>
											<h2 style="color: blue; text-align: center; font-family: courier; background-color:powderblue;">리뷰</h2>
											<c:forEach items="${requestScope.profile.reviewList }" var="review" >
											<div class="row">
												<div class="col-lg-12">
													<span class="glyphicon glyphicon-calendar"></span><label for="pId"> 작성일 : </label>
													<strong><fmt:formatDate value='${review.reviewDate }' type="date" pattern="yyyy-MM-dd HH시 mm분" /></strong> &nbsp; 
													<span class="glyphicon glyphicon-user"></span><label for="pName"> 작성자 : </label>
													<strong>${review.memberName}</strong> &nbsp; 
													<span class="glyphicon glyphicon-user"></span><label for="pName"> 평점 : </label>
													<strong>${review.reviewRate}</strong>
													<div style="width:80%; height: 100px; border: 1px solid orange;">
													${review.reviewContents }	
													</div>
													<button type="button" class="btn btn-info btn-sm"
														onclick='javascript:popupUpdateReview("${requestScope.profile.email}")'>리뷰 수정</button>
													<button type="button" class="btn btn-info btn-sm"
														onclick='javascript:deleteReview("${review.reviewId}")'>리뷰 삭제</button>
												</div>
											</div>
											<hr>
											</c:forEach>
												<button type="button" class="btn btn-info btn-sm" 
														onclick='javascript:popupRegisterReview("${requestScope.profile.email}")'>리뷰 등록</button>
										</c:otherwise>
									</c:choose>
								
							</div> <!-- 판넬 푸터 -->
						</div><!-- panel 폼-->
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
		