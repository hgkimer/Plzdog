<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#registerCareId").on("click", function(){
		$(".selectCare").hide();
		$(".editCare").hide();
		$(".registerCare").show();
	});	
		
	/* $("#editCareId").on("click", function(){
		$(".selectCare").hide();
		$(".registerCare").hide();
		$(".editCare").show();
	}); */
	$("#selectCareId").on("click", function(){
		$(".editCare").hide();
		$(".registerCare").hide();
		$(".selectCare").show();
	});
	
	$("#addImage").on("click",function(){
		$("#addCare").append("<input type='file' name='careImageList' id='imageCare'/><br>");
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
	
	/* a 태그 자동으로 검정색 */
	a {
		color:inherit;
	}
	
	/* 공간을 나누어 준다. */
	.clear {
		clear:both;
	}
	
	.top {
		width:300px;
		height:100px;
		float:left;
	}
	
	.manageCare {
		width:800px;
		height:800px;
		float:left;
		margin:10px;
	}
	
	.registerCare {
		width:100%;
		height:100%;
		float:left;
		display:none;
	}
	
	.editCare {
		width:100%;
		height:100%;
		float:left;
		display:none;
	}
	
	.selectCare {
		width:100%;
		height:100%;
		float:left;
		display:none;
	}
	
</style>

</head>
<body>

	<button type="button" class="btn btn-default" id='registerCareId' onclick='popupRegisterCare()'>돌봄일지등록겨</button>
	<button type="button" class="btn btn-default" id='editCareId' onclick='popupEditCare()'>돌봄일지수정</button>
	<!-- <button type="button" class="btn btn-default" id='deleteCareId' onclick='popupDeleteCare()'>돌봄일지삭제</button> -->
	<button type="button" class="btn btn-default" id='selectCareId' onclick="location.href='select_care.do?email=${member.email }'">돌봄일지조회</button>
	
	<div class="manageCare">
		
		<div id="registerCare" class="registerCare">
				<form id="addCare" action="${initParam.rootPath }/sitter/insert_care.do" method="post" enctype="multipart/form-data">
					<sec:csrfInput/>
					<input type="number" id="email" name="resId" value='${param.resId }' required readonly/><br>
					날짜 : <input type="date" id="careDate" name="careDate" required="required"/><br>
					내용 : <textarea rows="5" cols="30" id="careContents" name="careContents" required="required"></textarea><br>
					
					<%--careImage --%>
					이미지 추가 : <br>
					<input type="file" name="careImageList" id="imageCare"/><br>
					
					<button id="addImage" type="button">이미지 추가</button>
					<button type="submit">전송</button>
				</form>
		</div>
		
		<div class="editCare">
			수정
		</div>
		
		<div class="selectCare">
			<%-- <c:forEach items="careList" var="care">
				돌봄일지 번호 : ${care.careId }<br>
				돌봄일지 내용 : ${care.careContents }<br>
				예약번호 : ${care.resId }<br>
				<c:forEach items="${care.careImage }" var="CareImage">
					<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="350px"><br>
				</c:forEach>
				<button type="button" class="btn btn-default" id='editCareId' onclick=''>돌봄일지수정</button>
				<button type="button" class="btn btn-default" id='deleteCareId' onclick=''>돌봄일지삭제</button>
			</c:forEach>	 --%>
		</div>
	</div>
</body>
</html>


 <%-- $.ajax({
			"url" : "${initParam.rootPath}/sitter/insert_care.do",
			"type" : "get",
			"dataType" : "json",
			"beforeSend":function(){
			},
			"success" : function(care){
				var txt = "";
				var careImage = "";
				var imageName = new Array();
				$(care).each(function(){
					careImage = this.careImage;
					$(careImage).each(funciton(){
						imageName.push(this.imageName);	
					});
				});//end of each
					txt += "돌봄일지 번호 : "+this.careId+"돌봄일지 내용 : "+this.careContents+"예약번호 :"+this.resId+"강아지 이미지 : <img src='/Plzdog/memberImage/"+imageName+";
				$("#registerCare").html(txt); 
				
			},//end of success 
			"error" : function(xhr, status, errorMsg){
				alert("오류가 발생헀습니다. - " + status+", "+errorMsg);
			}//end of error
		})//end of ajax
	});   --%>