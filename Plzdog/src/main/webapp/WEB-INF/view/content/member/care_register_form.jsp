<%@ page contentType="text/html;charset=utf-8"%>

<script type="text/javascript">
$(document).ready(function(){
	if($("#first_category").get(0).selectedIndex==0){
		alert("대분류를 선택하세요");
		//기존 선택(나와있는것들) 초기화-중분류, 소분류, 제품List, 제품정보
		$("#second_category").empty().append("<option value=''>중분류</option>");
		$("#third_category").empty().append("<option value=''>소분류</option>");
		return false;
	}	
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>돌봄일지 등록하기</h3>
<form action="${initParam.rootPath }/care/insert_care.do" method="post">
	<sec:csrfInput/>
	예약 번호 : <input type="number" id="resId" name="resId"><br>
	날짜 : <input type="date" id="careDate" name="careDate"><br>
	내용 : <textarea rows="5" cols="30" id="careContents" name="careContents"></textarea><br>
	
	<button type="submit">전송</button>
</form>

<h3>돌봄일지 이미지 등록</h3>
<form action="${initParam.rootPath }/care/insert_image.do" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
	돌봄일지 번호 : <input type="number" name="careId" id="careId"><br>
	사진 : <input type="file" name="imageCare" id="imageCare"><br>
	<button type="submit">전송</button>
</form>
</body>
</html>