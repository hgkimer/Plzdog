<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
 <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	//폼 제출 시 서비스 종류, 요구사항, 강아지 선택 입력 체크
	$("#regBtn").on("click", function(){
		$("#reservationForm").submit(function(){
			var index = $("#serviceSel")[0].selectedIndex;
			if(index == 0){
				//서비스 선택 유효성 체크
				alert("방문과 위탁중 하나의 서비스를 선택해 주세요.");
				$("#serviceSel").focus();
				return false;
			}else{
				var sDate = $("#sDate").val();
				var eDate = $("#eDate").val();
			
				if(sDate > eDate){
					alert("종료 날짜는 서비스 시작 날짜보다 앞설 수 없습니다.");
					return false;
				}else{
					var	sTime = $("#sTime").val();
					var eTime = $("#eTime").val();
					alert("날짜 성공");
					alert(sTime);
					if(sTime >= eTime){
						alert("서비스 종료 시간은 서비스 시작시간 보다 크거나 같을 수 없습니다.");
						return false;
					}else{
						var dogCount = $("input[name=mydog]:checked").length;
						if(dogCount < 1){
							alert("강아지를 선택해 주세요.");
							return false;
						}else{
							return false;
					}
						return false;
				}
					return false;
				}
				return false;
			}
		});//end of submit()
	});//end of #regBtn
	
	
	//날짜 선택을 위한 jQuery ui API
	
	$(".datepicker").datepicker(
			{
			dateFormat:'yy-mm-dd',
	      	minDate : 0,
	        // timepicker 설정
	        timeFormat:'HH:mm:ss',
	        controlType:'select',
	        oneLine:true
			});
	
	//시간 선택을 위한 jQuery ui API
	$('.timepicker').timepicker({
	    timeFormat: 'HH:mm ',
	    interval: 30,
	    minTime: '10',
	    maxTime: '6:00pm',
	    defaultTime: '11',
	    startTime: '10:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	
	//서비스 종류에 따른 금액값을 다른게 넣어주기 위한 JQuery
	$("#serviceSel").on("change", function(){
		var selValue = this.selectedIndex;
		
		if(selValue == 0){
			alert("서비스 종류를 선택하세요!");
		}else if(selValue == 1){
			$("#price").val('${requestScope.sitter.sitter.visitPrice}');
		}else{
			$("#price").val('${requestScope.sitter.sitter.givePrice}');
		}
	});
	//end of #serviceSel
	
	
	//강아지 리스트를 불러오기 위한 AJAX 처리
	$("#dogBtn").on("click", function(){
		$.ajax({
			"url" : "${initParam.rootPath}/member/find_dog_reservation.do",
			"type" : "get",
			"data" : {"email" : $("#memberEmail").val()},
			"dataType" : "json",
			"success" : function(obj){
				var txt = "<br>";
				$(obj).each(function(){
					var dog  = this;
					txt += "&nbsp&nbsp&nbsp&nbsp<input type='checkbox' class='dogChk' name='mydog' value='"+this.dogId+"''/>"+ this.dogName+"&nbsp&nbsp"; 
				});//end of each
				$("#dogBtn").after(txt);
				$("#dogBtn").prop("disabled", "disabled");
			},//end of success
			"error" : function(xhr, status, errorMsg){
				alert("오류가 발생헀습니다. - " + status+", "+errorMsg);
			}//end of error
		});//end of ajax
	});//end of #dogBtn event
	
});//end of document
</script>

		<h2>예약 등록</h2>
		
	<form action="${initParam.rootPath }/member/reservation_add.do" method="post" id="reservationForm" >
		<sec:csrfInput />
			<label for="demand">서비스 종류</label> 
			<select name="demand" id="serviceSel" required >
				<option>서비스를 선택하세요</option>
				<c:forEach var="service" items="${applicationScope.serviceList }">
					<option value="${service.code }">${service.codeName}</option>
				</c:forEach>
			</select> 
			<br>
			<label for="resSDate">시작일 선택</label><br> 
			<input type="datetime" id="sDate" name="resSDate" class="datepicker" required placeholder="클릭 후 시작 날짜를 선택" readonly/>
			<input type="text" name="sTime" class="timepicker" placeholder="시간을 선택해 주세요" required readonly/>
			<br>
		
			<label for="resEDate">종료일 선택</label><br> 
			<input type="text" id="eDate" name="resEDate" class="datepicker" required placeholder="클릭 후 종료 날짜를 선택" readonly/>
			<input type="text" name="eTime" class="timepicker" placeholder="시간을 선택해 주세요" required readonly/><br>
			<label for="resContents">의뢰내용</label><br>
			<textarea rows="5" cols="30" name="resContents" id="resContents" required placeholder="의뢰 내용을 입력하세요"></textarea>
			<br>
			<!--  -->
			<c:choose>
				<c:when test="${requestScope.sitter.email != null }">
					<input type="hidden" name="resStatus" id='resStatus' value="res-3" />
				</c:when>
				<c:otherwise>
					<input type="hidden" name="resStatus" id='resStatus' value="res-1" />
				</c:otherwise>
			</c:choose>
			
			<label for="demand">요구사항 : </label><br>
				<c:forEach var="demand" items="${applicationScope.skillList }">
					<input type="checkbox" name="demand" class="demandChk" value="${demand.code }">${demand.codeName }<br>
				</c:forEach>
			<br>
			<label for="en">돌봄 환경 선택</label><br>
				<c:forEach var="en" items="${applicationScope.enList }">
					<input type="checkbox" name="demand" class="enChk" value="${en.code }">${en.codeName }<br>			
				</c:forEach>
				
			<!-- 로그인한 신청자 이메일을 전달하기 위함. 나중에 hidden 처리 -->
			<input type="text" value='<sec:authentication property="principal.email"/>' name="memberEmail" id="memberEmail"/><br>
			
			<!-- 시터 이메일을 전달하기 위함. 나중에 hidden 처리 -->
			<c:if test='${requestScope.sitter != null}'>
				<input type="text" value='${requestScope.sitter.email }' name="sitterEmail" readonly/><br>
			</c:if>
			
			<!-- jQuery로 서비스 종류에 따라 다른 금액이 들어가게 -->
			<c:if test="${requestScope.sitter != null}">
				<label for="price">금액</label>
				<input type="number" id="price" name="price" value="" readonly><br>
			</c:if>
			
			<!-- 강아지 목록을 불러오는 버튼(AJAX) -->
			<input type="button" id="dogBtn" value="강아지 선택"/> <br>
			 <br>
			 <button type="submit" id="regBtn">등록</button>
	</form>
