<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<style>
#mySidebar {
	display:none;
}
</style>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="well well-sm">
				<label>이메일 ${requestScope.sitter.sitter.email }</label><br>
				<label>학교${requestScope.sitter.sitter.school }</label><br>
				<img src="${initParam.rootPath }/certificationImage/${requestScope.sitter.sitter.certification }"
					width="200px"
				/><br>
				<label>서비스 지역${requestScope.sitter.sitter.serviceAddress }</label><br>
				<label>방문 가격${requestScope.sitter.sitter.visitPrice }</label><br>
				<label>위탁 가격${requestScope.sitter.sitter.givePrice }</label>
			</div>
		</div>
		<div class="col-lg-4"></div>
		
	</div>
</div>