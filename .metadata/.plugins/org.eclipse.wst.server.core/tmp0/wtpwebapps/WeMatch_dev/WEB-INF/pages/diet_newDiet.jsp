<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增飲食</title>
<%@ include file="CSSsettingout.jsp"%>
<link rel="stylesheet" href="css/diet/home.css">
<script
	src="${pageContext.request.contextPath}/js/diet/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/diet/jquery.qrcode.min.js"></script>
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

div.add_cent {
	width: 600px;
	height: 200px;
	margin: 0 auto;
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
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%@ include file="headerout.jsp"%>

	<section class="ftco-section ftco-services-2" id="services-section">

		<script src="js/jquery-3.5.1.min.js"></script>
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

		<div style="margin-left: 600px; font-size: 300%;">
			新增飲食
			<div class="flex"
				style="display: inline-block; margin-left: 20px; color: black">
				<div class="flex-item">
					<div id="qrcode-canvas"></div>
				</div>
			</div>
		</div>

		<div
			style="margin: 20px 0 0 350px; width: 750px; padding: 15px; height: 120px; border: 1px solid black; color:black">
			<form:form id="addfood" action="addFood" method="post"
				modelAttribute="Food">
				<table>

					<tr>
						<td>日期</td>
						<td>食物類別</td>
						<td>食物名稱</td>
						<td>熱量(大卡)</td>
						<td></td>
					</tr>
					<tr>
						<td><form:input type="date" path="addDate" id="time"
								min="2020-06-22" /></td>
						<td><form:select type="text" path="listType" id="listType">
								<form:option value="NONE" label="請選擇..." />
								<form:options items="${typeList}" />
							</form:select></td>
						<td><form:input id="listNAME" type="text" path="listName" /></td>
						<td><form:input id="caloRIES" type="text" path="calories" /></td>
						<td><button id='sendData'>新增</button></td>
					</tr>

				</table>
			</form:form>
			<input type="button" onclick="oneGo1()" value="1" /> <input
				type="button" onclick="oneGo2()" value="2" /> <input type="button"
				onclick="oneGo3()" value="3" /> <input type="button"
				onclick="oneGo4()" value="4" /> <input type="button"
				onclick="oneGo5()" value="5" /> 
		</div>

		<script>
			//QR Code
			$('#qrcode-canvas').qrcode({
				width : 64,
				height : 64,
				text : 'https://consumer.fda.gov.tw/Food/TFND.aspx?nodeID=178',

			});

			//button事件
			$("#sendData").click(function() {
				alert("新增成功");
			})
			
			//限制不能選擇今天之後的日期
			var date = new Date();
			var year = date.getFullYear();
			var month = ('0' + (date.getMonth() + 1)).slice(-2);
			var day = ('0' + date.getDate()).slice(-2);
			var time = year + '-' + month + '-' + day;
			console.log(time);
			document.getElementById('time').value = time;
			document.getElementById('time').setAttribute('max', time);

			//一鍵輸入
			function oneGo1() {
				document.getElementById("listNAME").value = "肉肉肉";
				document.getElementById("caloRIES").value = "450";
			}
			function oneGo2() {
				document.getElementById("listNAME").value = "柚子";
				document.getElementById("caloRIES").value = "195";
			}
			function oneGo3() {
				document.getElementById("listType").value = "麵食";
				document.getElementById("listNAME").value = "醬油拉麵";
				document.getElementById("caloRIES").value = "718";
			}
			function oneGo4() {
				document.getElementById("listType").value = "餅乾";
				document.getElementById("listNAME").value = "米餅";
				document.getElementById("caloRIES").value = "512";
			}
			function oneGo5() {
				document.getElementById("listType").value = "飲料";
				document.getElementById("listNAME").value ="珍珠奶茶";
				document.getElementById("caloRIES").value = "600";
			}
			
		</script>

	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>