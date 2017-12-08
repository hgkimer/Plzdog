<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
	* {
		margin:0 auto;
		padding:0;
		list-style:none;
		text-decoration:none;
	}
	
	a {
		color:inherit;
	}
	
	.clear {
		clear:both;
	}
	
	.top {
		width:200px;
		height:30px;
		float:left;
	}
	
	.res_detail {
		width:600px;
		height:300px;
		float:left;
		margin:10px;
	}
	
	.res {
		width:100%;
		height:100%;
		float:left;
		border:1px solid black;
	}
	
	.care {
		width:100%;
		height:100%;
		float:left;
		border:1px solid black;
		display:none;
	}
	
	.care img {
		width:200px;
		height:200px;
		float:left;
	}
</style>
</head>
<body>
	<div class="res_detail">
		<div class="top">
			<button class="btn1">예약상세</button>
			<button class="btn2">돌봄일지</button>
		</div>
		<div class="res">
			<%--이메일에 해당하는 예약에 대한 리스트 --%>
				<ul>
					<li>예약상태 : ${requestScope.resMember.resStatus}</li>
					<li>시작날짜 : ${requestScope.resMember.resSDate}</li>
					<li>끝날짜 : ${requestScope.resMember.resEDate}</li>
					
					<li>회원 이미지 <br> 
					<img src="${initParam.rootPath }/memberImage/${requestScope.resMember.member.memberImage }" width="350px"><br>
					<li>견주이메일 : ${requestScope.resMember.member.email}</li>
					<li>견주 이름 : ${requestScope.resMember.member.memberName }</li>
					<li>회원 주소 : ${requestScope.resMember.member.mainAddress } ${requestScope.resMember.member.mainAddress }</li>
					<li>전화번호 :  ${requestScope.resMember.member.phoneNum }</li>
					<li>의뢰내용 : ${requestScope.resMember.resContents}</li>
					<li>가격 : ${requestScope.resMember.price}</li>
					<c:forEach items ="${requestScope.resMember.demandList }" var="demand">
						<li>서비스 요구사항 : ${demand.code.codeName}</li>
					</c:forEach>
					
					<li>회원의 강아지 정보</li>
					<c:forEach items="${requestScope.resMember.member.dogList }" var="dog" >
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
				</ul>
		</div>
		<div class="care">
			<img src="${initParam.rootPath }/image/caredog.jpg">
		</div>
	</div>
	
	<div class="clear"></div>
</body>
</html>