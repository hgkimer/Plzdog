<%@ page contentType="text/html; charset=UTF-8"%>
<%--Spring Security 커스텀태그 --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

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
	
	.reservation {
		width:600px;
		height:200px;
		float:left;
		border:1px solid black;
		cursor:pointer;
	}
	
	.dogImage {
		width:150px;
		height:150px;
		float:left;
		border:1px solid black;
		border-radius:100px;
	}
	
	.dogImage img {
		width:100%;
		height:100%;
		border-radius:100px;
	}
	
	.dogOwner {
		width:300px;
		height:150px;
		float:left;
		font-size:20px;
		line-height:40px;
	}
</style>

<div class="reservation" onclick="location.href='main_test.do'">
	<div class="dogImage">
		<img src="image/dog.jpg">
	</div>
	
	<div class="dogOwner">
		<ul class="nav">
			<li>이름 :</li>
			<li>강아지 이름 :</li>
			<li>날짜 :</li>
			<li>예약상태 :</li>
		</ul>
	</div>
</div>