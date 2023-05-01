<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食系統</title>
<%@ include file="CSSsettingout.jsp"%>
<link rel="stylesheet" href="css/diet/home.css">
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
}

div.home-tr {
	width: 700px;
	height: 150px;
	margin: 40px auto;
}

div.home-base {
	width: 180px;
	height: 58px;
	margin: 0 10px 0 10px;
	background-color: #FFA488;
	display: inline-block;
	color: black;
	font-size: 250%
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%@ include file="headerout.jsp"%>

	<section class="ftco-section ftco-services-2" id="services-section">

		<div class="container">
			<div class="comment-form-wrap pt-5"
				style="padding: 10px; position: relative;">
				<a style="font-size: 600%; margin-left: 350px">飲食系統</a><br>
				<div class="home-tr">
					<div class="home-base" style="margin-left: 50px">
						<a style="color: black;" href="diet_basicSetting">&nbsp;基本設定</a>
					</div>
					<div class="home-base">
						<a style="color: black;" href="diet_newDiet">&nbsp;新增飲食</a>
					</div>
					<div class="home-base">
						<a style="color: black;" href="diet_queryCalories">&nbsp;查詢熱量</a>
					</div>
				</div>
			</div>
		</div>

	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>