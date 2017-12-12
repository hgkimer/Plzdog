<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
function approve(){
	if(confirm("승인 하시겠습니까?")){
		location.href="${initParam.rootPath }/sitter/approve_reservation.do"; 
	} else{ 
		return false;
	} 
}
function reject(){
	if(confirm("거절 하시겠습니까?")){
		location.href="${initParam.rootPath }/sitter/reject_reservation.do"; 
	} else{ 
		return false;
	} 
}
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
		width:300px;
		height:100px;
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
			<button id ='approveId' onclick='approve()'>승인</button>
			<button id ='rejectId' onclick='reject()'>거절</button>
		</div>
		<div class="res">
			이메일에 해당하는 예약에 대한 리스트
				<ul>
					<li>예약상태 : ${sessionScope.resMember.resStatus}</li>
					<li>시작날짜 : ${sessionScope.resMember.resSDate}</li>
					<li>끝날짜 : ${sessionScope.resMember.resEDate}</li>
					
					<li>회원 이미지 <br> 
					<img src="${initParam.rootPath }/memberImage/${sessionScope.resMember.member.memberImage }" width="350px"><br>
					<li>견주이메일 : ${sessionScope.resMember.member.email}</li>
					<li>견주 이름 : ${sessionScope.resMember.member.memberName }</li>
					<li>회원 주소 : ${sessionScope.resMember.member.mainAddress } ${sessionScope.resMember.member.subAddress }</li>
					<li>전화번호 :  ${sessionScope.resMember.member.phoneNum }</li>
					<li>의뢰내용 : ${sessionScope.resMember.resContents}</li>
					<li>가격 : ${sessionScope.resMember.price}</li>
					<c:forEach items ="${sessionScope.resMember.demandList }" var="demand">
						<li>서비스 요구사항 : ${demand.code.codeName}</li>
					</c:forEach>
				
					<li>예약한 회원의 강아지 정보</li>
					<c:forEach items="${sessionScope.resMember.resDetailList }" var="resDetail" >
					 강아지 이름 : ${resDetail.dog.dogName}<br>
					 강아지 종 : ${resDetail.dog.species }<br>
					 강아지 성별 : ${resDetail.dog.gender }<br>
					 강아지 몸무게 : ${resDetail.dog.weight }<br>
					 강아지 생년월일 : ${resDetail.dog.birth }<br>
					 강아지 상세 정보 : <br>
							 <c:forEach items="${resDetail.dog.dogInfoList }" var="dogInfo">
							 	${dogInfo.code.codeName } (O) <br>
							 </c:forEach>
							 <c:forEach items="${resDetail.dog.dogImage }" var="dogImage">
							 		강아지 이미지 : <img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }" width="350px"><br>
							 </c:forEach>
					</c:forEach>
				</ul>
		</div>
		<div class="care">
			<img src="${initParam.rootPath }/image/caredog.jpg">
		</div>
	</div>
	
	<div class="clear"></div> --%>