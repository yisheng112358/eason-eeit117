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

table{ background-color:#FFF7FB}
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

table {
	margin-left: auto;
	margin-right: auto;
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
					<h2 class="mb-4">訂購完成</h2>
					<p>購買明細</p>
				</div>
			</div>
		</div>

		<!-- ***************** 購物車程頁面ReceiverResultPage式碼 開始 ***************** -->


		<div style="text-align: center;">
			<table style="border: 3px #cccccc solid;" cellpadding="10" border='1';>
				<tr>
					<th colspan="6" style="font-size:200%">訂單資訊</th>
				</tr>
				<tr>
					<td>receiverName</td>
					<td>receiverPhone</td>
					<td>receiverAddress</td>
					<td>receiverEmail</td>
					<td>receiverNotes</td>
					<td>totalPrice</td>

				</tr>

				<tr>
					<td>${receiverName}</td>
					<td>${receiverPhone}</td>
					<td>${receiverAddress}</td>
					<td>${receiverEmail}</td>
					<td>${receiverNotes}</td>
					<td>${totalPrice}</td>

				</tr>
			</table>
			<br>
			<table style="border: 3px #cccccc solid;" cellpadding="10" border='1'>
				<tr>
					<th colspan="2"style="font-size:200%">品項</th>
				</tr>
				<tr>
					<td>receiverGoods1</td>
					<td>GoodsAmount1</td>
				</tr>
				<tr>
					<td>${receiverGoods1}</td>
					<td>${GoodsAmount1}</td>
				</tr>
				<tr>
					<td>receiverGoods2</td>
					<td>GoodsAmount2</td>
				</tr>
				<tr>
					<td>${receiverGoods2}</td>
					<td>${GoodsAmount2}</td>
				</tr>
			</table>

		</div>
		<br>
		<a href="ProductsBrowsePage.jsp"
			class="btn btn-lg btn-block btn-secondary text-white">繼續購物</a>
<br>
		<!-- ***************** 購物車頁面ReceiverResultPage程式碼 結束 ***************** -->

		<%@ include file="footer.jsp"%>
		<%@ include file="JSsetting.jsp"%>

		<script src="js/ProductBrowserPage.js" type="text/javascript"></script>
</body>
</html>