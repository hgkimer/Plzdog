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
		
		var checkboxValues = new Array();

		$("input[name='checkSitter']:checked").each(function() {
		    checkboxValues.push($(this).val());
		});
		
		$.ajax({
			"url" : "${initParam.rootPath}/member/find_sitter.do",
			"type" : "get",
			"data" : {"selectService" : $("#selectServiceId").val() , "checkArray" : checkboxValues},
			"dataType" : "json",
			"beforeSend":function(){
				/* alert(selectService);
				alert(checkboxValues);
				alert(allData); */
				//선택된 것이 0번 index면 전송하지 않는다.
				if($("#selectServiceId").get(0).selectedIndex==0){
					alert("서비스를 선택하세요");
					return false;
				}
			},
			"success" : function(list){
				var txt = "";
				$(list).each(function(){
					var skillList = this.sitter.skillList;
					var visitName ='-';
					var giveName = '-';
					$(skillList).each(function(){
						if(this.code.codeName == '방문돌봄'){
							visitName = this.code.codeName;
						}
						if(this.code.codeName == '위탁돌봄'){
							giveName = this.code.codeName;
						}
					}); 					
					txt += "<tr><td><img src='/Plzdog/memberImage/"+this.memberImage+"' width='150px'></td><td>"+this.memberName+"</td><td>"+this.mainAddress+this.subAddress+"</td><td>"+this.sitter.serviceAddress+"</td><td>"+giveName+"</td><td>"+visitName+"</td><td><a href='/Plzdog/member/goToProfile.do?email="+this.email+"'>프로필로가기</a></td></tr>";	
				});//end of each
				
				$("#listTbody").html(txt); 
				
			},//end of success 
			"error" : function(xhr, status, errorMsg){
				alert("오류가 발생헀습니다. - " + status+", "+errorMsg);
			}//end of error
		})//end of ajax
	});
	$("#editCareId").on("click", function(){
		$(".selectCare").hide();
		$(".registerCare").hide();
		$(".editCare").show();
	});
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

	<button type="button" class="btn btn-default" id='registerCareId' onclick='popupRegisterCare()'>돌봄일지등록</button>
	<button type="button" class="btn btn-default" id='editCareId' onclick='popupEditCare()'>돌봄일지수정</button>
	<!-- <button type="button" class="btn btn-default" id='deleteCareId' onclick='popupDeleteCare()'>돌봄일지삭제</button> -->
	<button type="button" class="btn btn-default" id='selectCareId' onclick='popupSelectCare()'>돌봄일지조회</button>
	
	<div class="manageCare">
		
		<div class="registerCare">
			<h3>돌봄일지 등록하기</h3>
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
			조회
		</div>
	</div>
</body>
</html>