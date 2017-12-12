<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                  fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('pZip').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('pMain').value = fullRoadAddr;

               }
       }).open();
       window.close();
}
</script>
<div class="container">
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h2 style="text-align: center">회원 정보 수정</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<form id="updateForm" action="${initParam.rootPath }/member/updateMember.do" method="post" enctype="multipart/form-data">
	<div class="col-lg-6">
			<span id="changeSpan">
				<img id="memberImage" src="${initParam.rootPath }/memberImage/<sec:authentication property='principal.memberImage'/>" class="img-responsive" width="350px">
				<button id="imgChangeBtn" type="button" class="btn btn-success">사진변경</button>
			</span>
			<span id="cancelSpan" style="display: none;">
				<button id="cancelImgChangeBtn" type="button" class="btn btn-success">사진변경취소</button>
				<input type='file' name='imageMember' id='imageMember' class='form-control'>
			</span>
	</div>
	<div class="col-lg-6">
	<div class="form-group">
		<span class="glyphicon glyphicon-envelope"></span><label for="id">Email</label>
		<input type="text" name="email" id="id" class="form-control" value='<sec:authentication property="principal.email"/>' required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-user"></span><label for="name">이름</label>
		<input type="text" name="memberName" id="name" class="form-control" value='<sec:authentication property="principal.memberName"/>' required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-lock"></span><label for="oldPassword">기존 패스워드</label>
		<input type="password" name="oldMemberPassword" id="oldPassword" class="form-control" required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-lock"></span><label for="password">변경할 패스워드</label>
		<input type="password" name="password" id="password" class="form-control" required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-home"></span><label for="pZip">우편번호 : </label>
		<input class="btn btn-default"type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<p></p>
		<input type="number" name="zipcode" id="pZip" class="form-control" value='<sec:authentication property="principal.zipcode"/>' required="required" readonly>
		
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-home"></span><label for="pMain">기본주소 : </label>
		<input type="text" name="mainAddress" id="pMain" class="form-control" value='<sec:authentication property="principal.mainAddress"/>' required="required" readonly>
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-home"></span><label for="pSub">상세주소 : </label>
		<input type="text" name="subAddress" id="pSub" class="form-control" value='<sec:authentication property="principal.subAddress"/>' required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-phone"></span><label for="pPhone">전화번호 : </label>
		<input type="text" name="phoneNum" id="pPhone" class="form-control" value='<sec:authentication property="principal.phoneNum"/>' required="required">
	</div>
	<input type="hidden" name="memberEnable" value='<sec:authentication property="principal.memberEnable"/>'/>
	 </div>
	
	<div class="form-group">
		<button type="submit" class="btn btn-default btn-block">정보수정</button>	
	</div>
	
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>


<script>
//사진 변경 처리
$(document).ready(function(){
	$("#imgChangeBtn").on("click", function(){
		$("#changeSpan").hide().next().show();
	});
	$("#cancelImgChangeBtn").on("click", function(){
		$("#memberImage").val("").parent().hide().prev().show();
	});
});
</script>
