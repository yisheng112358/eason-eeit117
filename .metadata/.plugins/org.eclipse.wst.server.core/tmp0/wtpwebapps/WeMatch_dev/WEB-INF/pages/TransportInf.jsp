<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<style>
.notice {
	color: #ff0000;
	font-size: small;
}

#memo {
	position: absolute;
	right: 0;
	color: #ff0000;
	font-size: small;
	text-align: right;
	padding-right: 50px;
}

.flex {
	display: flex;
	align-items: center;
	justify-content: center;
	widows: 600px;;
	height: 300px;
	background-color: #eee;
}

table{
margin-left:auto; 
margin-right:auto;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
	<%@ include file="header.jsp"%>
	
	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Cart</span>
					<h2 class="mb-4">寄送資訊</h2>
					<p>請填寫收件人資訊</p>
				</div>
			</div>
		</div>

		<!-- ***************** 購物車程頁面OrderTransportPage式碼 開始 ***************** -->
	<div style="text-align:center;">

			<form:form action="addTransportInformation" method="POST" modelAttribute="transportInformation">
		<table>
			<tr>
				<td><form:label path="receiverName">姓名：</form:label></td>
				<td><form:input path="receiverName" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverPhone">電話：</form:label></td>
				<td><form:input path="receiverPhone" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverAddress">地址：</form:label></td>
				<td><form:input path="receiverAddress" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverEmail">信箱：</form:label></td>
				<td><form:input path="receiverEmail" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverNote">備註：</form:label></td>
				<td><form:input path="receiverNote" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:button value="Send">確認送出訂單</form:button></td>
			</tr>
		</table>
	</form:form>
	
	</div>
		<!-- ***************** 購物車頁面OrderTransportPage程式碼 結束 ***************** -->

		<%@ include file="footer.jsp"%>
		<%@ include file="JSsetting.jsp"%>

		<script src="js/ProductBrowserPage.js" type="text/javascript"></script>
</body>
</html>