<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

</script>

	<div class="container">
		<div class="row" style="margin-top:20px">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="col-lg-6">
									<label>${requestScope.profile.memberName } 님의 프로필</label><br>
									<img style="width: 350px" alt="회원 사진" src="${initParam.rootPath }/memberImage/${requestScope.profile.memberImage }"><br>
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
										<p><strong><span class="glyphicon glyphicon-th-list"></span>시터 스킬 : <br></strong></p>
										<p>	<c:forEach var="skill" items="${requestScope.profile.sitter.skillList }">
													<c:if test="${fn:contains(skill.code.category, '시터')}">
														<strong>${skill.code.codeName } </strong><br>
													</c:if>		
											</c:forEach></p>
										</div>
										<div class="col-lg-2">
										<p><strong><span class="glyphicon glyphicon-th-list"></span>시터 서비스 : <br></strong></p>
										<p>	<c:forEach var="skill" items="${requestScope.profile.sitter.skillList }">
													<c:if test="${fn:contains(skill.code.category, '서비스')}">
														<strong>${skill.code.codeName } </strong><br>
													</c:if>		
											</c:forEach></p>
										</div>
										<div class="col-lg-4">
											<p><strong><span class="glyphicon glyphicon-th-list"></span>시터 환경 : <br></strong></p>
											<p>	<c:forEach var="skill" items="${requestScope.profile.sitter.skillList }">
														<c:if test="${fn:contains(skill.code.category, '환경')}">
															<strong>${skill.code.codeName } </strong><br>
														</c:if>
												</c:forEach></p>
											<button type="button" class="btn btn-info btn-sm" data-toggle="collapse" data-target="#dogId">시터의 강아지 보기</button><br>
											
											<form action="${initParam.rootPath }/member/checkSitter.do">
											<input type="hidden" value="${requestScope.profile.email }" name="sitterEmail"/>
											<button type="submit" class="btn btn-default">예약 신청</button>
											</form>
										</div>
										
										</div>
							</div> <!-- panel 바디 -->
							<div class="panel-footer">
									<div class="collapse" id="dogId">
									<c:forEach items="${requestScope.profile.dogList }" var="dog" >
									<div class="row">
										<div class="col-lg-4">
											<!-- 각 강아지들의 첫번쨰 사진을 출력 -->
											<c:forEach items="${dog.dogImage }" var="dogImage">
											 	강아지 이미지 : <img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }" width="200px"><br>
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
													<li><strong>${dogInfo.code.codeName }</strong></li>
												</ol>
											</c:forEach>
										</div>
									</div>
									</c:forEach>
									</div>
							</div> <!-- 판넬 푸터 -->
						</div><!-- panel 폼-->
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	
<%-- <div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h1>${requestScope.profile.memberName }</h1>
<p>이메일 : ${requestScope.profile.email }</p>
<p>프로필 사진 : <img src="${initParam.rootPath }/memberImage/${profile.memberImage }" width="350px"><br>
<p>우편번호 : ${requestScope.profile.zipcode }</p>
<p>주소 : ${requestScope.profile.mainAddress }</p>
<p>전화번호 : ${requestScope.profile.phoneNum }</p>
<p>개 :<br>
	<c:forEach items="${requestScope.profile.dogList }" var="dog" >
		 강아지 이름 : ${dog.dogName}<br>
		 강아지 종 : ${dog.species }<br>
		 강아지 성별 : ${dog.gender }<br>
		 강아지 몸무게 : ${dog.weight }<br>
		 강아지 생년월일 : ${dog.birth }<br>
		 강아지 상세 정보 : <br>
		 <c:forEach items="${dog.dogInfoList }" var="dogInfo">
		 	${dogInfo.code.codeName } (O) <br>
		 </c:forEach>
		 <c:forEach items="${dog.dogImage }" var="dogImage">
		 		강아지 이미지 : <img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }" width="350px"><br>
		 	</c:forEach>
	</c:forEach>
</p>

<h1>Sitter 정보</h1>
<p>학교 : ${requestScope.profile.sitter.school }</p>
<p>서비스지역 : ${requestScope.profile.sitter.serviceAddress }</p>
<p>시터평점 : ${requestScope.profile.sitter.sitterRate }</p>
<p>방문돌봄금액 : ${requestScope.profile.sitter.visitPrice }</p>
<p>위탁돌봄금액 : ${requestScope.profile.sitter.givePrice }</p>

<p>스킬 리스트 : <br>
	<c:forEach var="skill" items="${requestScope.profile.sitter.skillList }">
		★${skill.code.codeName }<br>
	</c:forEach></p>

<form action="${initParam.rootPath }/member/checkSitter.do">
	<input type="hidden" value="${requestScope.profile.email }" name="sitterEmail"/>
	<button type="submit" class="btn btn-warning btn-block" style="margin-bottom: 20px;">예약 신청</button>
</form>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div> --%>
