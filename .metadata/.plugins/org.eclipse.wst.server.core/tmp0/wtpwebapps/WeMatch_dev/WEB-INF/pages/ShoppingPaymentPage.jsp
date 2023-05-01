<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="CSSsetting.jsp"%>

<title>選擇付款方式</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target "
	data-offset="300">



		<%@ include file="header.jsp"%>
	<div class="ftco-section ftco-schedule" style="text-align: center;">
		<h1>綠界付款</h1>
		<p>
			<a href='/WeMatch_dev/shoppingCart/greenPay' target="_blank"
				class='btn btn-primary px-5 py-3 mt-3'
				onclick="setTimeout(function(){ location.href = '/WeMatch_dev/product/browse';}, 1000);">ECPay</a>
		</p>
	</div>

</section>
	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>

</body>
</html>