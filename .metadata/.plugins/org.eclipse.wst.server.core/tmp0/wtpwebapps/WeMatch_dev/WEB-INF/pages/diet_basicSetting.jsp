<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>基本設定</title>
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

container2 {
	max-width: 767.98px
}

body {
	color: black;
}

.find {
	border: 1px solid black;
	width: 800px;
	height: 1000px;
	background-color: #FF69B4;
	margin: 50px auto;
}

.find1 {
	border: 1px solid black;
	width: 700px;
	height: 300px;
	margin: auto;
}

.div1 {
	width: 500px;
	height: 450px;
	background-color: #FFA488;
	margin: 0 auto;
}

.div3 {
	width: 750px;
	height: 200px;
	background-color: #FFC8B4;
	margin: 50px auto;
}

input.bmrinput {
	border: 1px solid black;
	border-top: none;
	border-left: none;
	border-right: none;
	outline: none;
	box-shadow: none;
	background-color: inherit;
}

input[type="button"]:active {
	background: #00F;
	background: inherit;
}

input[type="button"]:focus {
	border: 2px solid #00F;
	background: inherit;
}

button {
 	border: 1px solid black; 
	outline: none;
	box-shadow: none;
	background-color: #FFA488;
}

button:hover {
 	background-color: black; 
	color: white;
}

th, td {
	border: 1px black solid;
	padding: 2px 10px 2px 10px;
}

.sum {
	width: 250px;
	height: 700px;
	margin: auto;
	margin-left: 700px;
	position: absolute;
	display: inline-block;
}

div.sum-bbmr {
	border: 1px solid black;
	width: 100px;
	height: 50px;
	background-color: black;
	color: white;
	position: absolute;
	z-index: 9;
	margin: 405px 0 0 10px;
	font-size: 230%;
}

div.sum-btdee {
	border: 1px solid black;
	width: 100px;
	height: 50px;
	background-color: black;
	color: white;
	position: absolute;
	z-index: 7;
	margin: 650px 0 0 10px;
	font-size: 230%;
}

div.sum-bmr {
	position: absolute;
	width: 200px;
	height: 200px;
	margin: 420px 20px 0 20px;
	background-color: #FFA488;
}

div.sum-tdee {
	position: absolute;
	width: 200px;
	height: 200px;
	margin: 665px 20px 0 20px;
	background-color: #FFA488;
}

#bmrnum {
	font-size: 320%;
	position: absolute;
	margin-top: 70px;
}

#tdeenum {
	font-size: 320%;
	position: absolute;
	margin-top: 70px;
}

.home {
	position: absolute;
	margin-top: 50px;
	margin-left: 20px;
	background-color: white;
	font-size: 150%;
	font-color: black;
	color: black;
}

.home:hover {
	background-color: #FFA488;
	color: white;
}

.base {
	position: absolute;
	margin-top: 90px;
	margin-left: 20px;
	background-color: white;
	font-size: 150%;
	color: white;
}

.base:hover {
	background-color: #FFA488;
}

.food {
	position: absolute;
	margin-top: 130px;
	margin-left: 20px;
	background-color: white;
	font-size: 150%;
}

.food:hover {
	background-color: #FFA488;
}

.count {
	position: absolute;
	margin-top: 170px;
	margin-left: 20px;
	background-color: white;
	font-size: 150%;
}

.count:hover {
	background-color: #FFA488;
}
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%@ include file="headerout.jsp"%>

	<section class="ftco-section ftco-services-2" id="services-section">

		<div class="home">
			<a href="diet">飲食首頁</a>
		</div>
		<div class="base">
			<a href="diet_basicSetting">基本設定</a>
		</div>
		<div class="food">
			<a href="diet_newDiet">新增飲食</a>
		</div>
		<div class="count">
			<a href="diet_queryCalories">查詢熱量</a>
		</div>

		<div style="margin-left: 600px; font-size: 300%">基本設定</div>

		<div class="container">
			<div class="comment-form-wrap pt-5"
				style="padding: 10px; position: relative;">

				<div class="p-5 bg-light"
					style="position: absolute; border: 1px solid;">

					<table style="position: absolute; margin: 20px 0 0 0;">
						<tr>
							<th colspan="2">BMR(基礎代謝率)計算公式</th>
						</tr>
						<tr>
							<td>男</td>
							<td>(13.7×體重(公斤))+(5.0×身高(公分))-(6.8×年齡)+66</td>
						</tr>
						<tr>
							<td>女</td>
							<td>(9.6×體重(公斤))+(1.8×身高(公分))-(4.7×年齡)+655</td>
						</tr>
					</table>

					<table style="margin: 20px 0 0 500px;">
						<tr>
							<th colspan="3">TDEE(每日總消耗熱量)計算公式</th>
						</tr>
						<tr>
							<td>活動量</td>
							<td>敘述</td>
							<td>計算方式</td>
						</tr>
						<tr>
							<td>久坐</td>
							<td>一直坐著沒什麼運動</td>
							<td>BMR*1.2</td>
						</tr>
						<tr>
							<td>輕量</td>
							<td>每週輕鬆地運動3~5天</td>
							<td>BMR*1.375</td>
						</tr>
						<tr>
							<td>中度</td>
							<td>每週中等強度地運動3~5天</td>
							<td>BMR*1.55</td>
						</tr>
						<tr>
							<td>高度</td>
							<td>每週高強度地運動6~7天</td>
							<td>BMR*1.725</td>
						</tr>
						<tr>
							<td>非常高度</td>
							<td>勞力密集的工作或每天訓練1次或以上</td>
							<td>BMR*1.9</td>
						</tr>
					</table>
				</div>

				<div class="p-5 bg-light"
					style="position: absolute; border: 1px solid; margin: 470px 0 0 100px; font-size: 120%">

					性別 <input type="radio" id="man" name="gender" value="man">男生
					<input type="radio" id="vrouw" name="gender" value="vrouw">女生<br />
					年齡 <input type="text" class="bmrinput" id="age" size="10"
						placeholder="請輸入年齡">歲<br /> 身高 <input type="text"
						class="bmrinput" id="length" size="10" placeholder="請輸入身高">公分<br />
					體重 <input type="text" class="bmrinput" id="weight" size="10"
						placeholder="請輸入體重">公斤<br /> 運動量 <input type="radio"
						id="level1" name="activity" value="level1">久坐 <input
						type="radio" id="level2" name="activity" value="level2">輕量
					<input type="radio" id="level3" name="activity" value="level3">中度
					<input type="radio" id="level4" name="activity" value="level4">高度
					<input type="radio" id="level5" name="activity" value="level5">非常高度<br />

					<button id="bsum" onclick="judgment()">計算</button>
					<br />
				</div>

				<div class="sum">

					<div class="sum-bmr">
						<div id="bmrnum">???</div>
					</div>
					<div class="sum-tdee">
						<div id="tdeenum">???</div>
					</div>

					<div class="sum-bbmr">BMR</div>
					<div class="sum-btdee">TDEE</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<script>
			function judgment(id) {
				//BMR計算
				var length = parseFloat($("#length").val());
				var weight = parseFloat($("#weight").val());
				var age = parseFloat($("#age").val());
				var gender = $("input[name='gender']:checked").val();
				var BMRCalculation = 0;
				if (gender == "man") {
					BMRCalculation = 10 * weight + 6.25 * length - 5 * age + 5;
				} else {
					BMRCalculation = 10 * weight + 6.25 * length - 5 * age
							- 161;
				}

				//TDEE計算
				var activity = $("input[name='activity']:checked").val();
				var TDEECalculation = 0;

				if (activity == "level1") {
					TDEECalculation = BMRCalculation * 1.2
				} else if (activity == "level2") {
					TDEECalculation = BMRCalculation * 1.375
				} else if (activity == "level3") {
					TDEECalculation = BMRCalculation * 1.55
				} else if (activity == "level4") {
					TDEECalculation = BMRCalculation * 1.725
				} else if (activity == "level5") {
					TDEECalculation = BMRCalculation * 1.9
				}
				//新增到指定區塊
				var ck = document.getElementById("bsum");
				bmrnum.innerHTML = Math.round(BMRCalculation) + "cal";
				tdeenum.innerHTML = Math.round(TDEECalculation) + "cal";
			}
		</script>

	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
</body>
</html>