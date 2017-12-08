<%@ page contentType="text/html;charset=utf-8"%>

<style>
	.side {
		width:700px;
		height:200px;
		border:1px solid black;
		float:left;
	}
	
	.Image {
		float:left;
		width:170px;
		height:170px;
		border-radius:50%;
		border:1px solid black;
	}
	
	.information {
		float:left;
		width:400px;
		height:90px;
		margin-left:20px;
		line-height:30px;
	}
	
	.btns {
		float:right;
		width:350px;
		height:90px;
		margin-left:30px;
		line-height:30px;
	}
	
	.btn {
		width:100px;
		height:30px;
	}
	
	.list {
		float:left;
	}
	
</style>

${requestScope.memberList}
<div class="side">
	<div class="Image">
		<img alt="nothing" src="">
	</div>
	
	<div class="information">
		<ul class="list">
			<li>강아지 이름 : </li>
			<li>강아지 성별 : </li>
			<li>금액 : </li>
		</ul>
		<ul class="list">
			<li>서비스 종류 : </li>
			<li>시작 날짜 : </li>
		</ul>
		<ul class="list">
			<li>종료 날짜 : </li>
			<li>예약상태 : </li>
		</ul>
	</div>
	
	<div class="btns">
		<button type="submit" class="btn" style="background-color:orange;">수정하기</button>
		<button type="submit" class="btn" style="background-color:orange;">상세보기</button>
		<button type="submit" class="btn" style="background-color:orange;">삭제하기</button>
		<br>
		<button type="submit" class="btn" style="background-color:green;">수락</button>
		<button type="submit" class="btn" style="background-color:red;">거절</button>
	</div>
</div>

<script>

</script>