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

</script>

<style>

	.dbox {
		width:760px;
		height:300px;
		float:left;
		margin-top:30px;
		border:1px solid black;
	}

	.dogul {
		width:300px;
		height:200px;
		margin-top:30px;
		background-color:#eee;
		float:left;
		margin-left:80px;
	}
	
	.dogul1 {
		width:300px;
		height:150px;
		margin-top:30px;
		background-color:#eee;
		float:left;
	}
	
	.dogli {
		width:100%;
		height:50px;
		font-size:18px;
		font-weight:bold;
		line-height:50px;
		float:left;
		border:1px solid black;
	}
	

</style>
</head>
<body>
<div class="col-xs-3" style="float:left;"></div>


<div class="dbox">
	<c:forEach items="${list }"></c:forEach>
		<li class="dogli">개 이미지:</li>
		
		<ul class="dogul">
			<li class="dogli">개 이름:</li>
			<li class="dogli">개 성별:</li>
			<li class="dogli">개 생일:</li>
			<li class="dogli">개 종류:</li>
		</ul>
		<ul class="dogul1">
			
			<li class="dogli">예약 상태:</li>
			<li class="dogli">시작 날짜:</li>
			<li class="dogli">종료 날짜:</li>
		</ul>
</div>
	
<div class="col-xs-3" style="float:right;"></div>


<!-- 수정하기/ 상세보기 / 삭제하기 버튼 -->
<!-- 수락/ 거절 버튼 -->
</body>
</html>