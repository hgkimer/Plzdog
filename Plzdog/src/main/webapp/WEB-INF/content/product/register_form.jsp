<%@ page contentType="text/html; charset=UTF-8"%>

<h2>제품 등록폼</h2>
<form action="${initParam.rootPath }/product/register.do" method="post">
	<div class="form-group">
		<label for="pId">상품 ID : </label>
		<input type="text" name="productId" id="pId" class="form-control">
	</div>
	<div class="form-group">
		<label for="pName">상품 명 : </label> 
		<input type="text" name="productName" id="pName" class="form-control">
	</div>
	<div class="form-group">
		<label for="pPrice">가격 : </label>
		<input type="text" name="productPrice" id="pPrice" class="form-control">
	</div>
	<input type="submit" value="전송" class="btn btn-default">
</form>
