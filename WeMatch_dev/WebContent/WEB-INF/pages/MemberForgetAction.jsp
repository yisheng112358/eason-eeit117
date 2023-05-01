<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
<%@ include file="CSSsettingout.jsp"%>
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

.v_code {
	width: 600px;
	margin: 0 auto;
}

.v_code>input {
	width: 60px;
	height: 36px;
	margin-top: 10px;
}

.code_show {
	overflow: hidden;
}

.code_show span {
	display: block;
	float: left;
	margin-bottom: 10px;
}

.code_show a {
	display: block;
	float: left;
	margin-top: 10px;
	margin-left: 10px;
}

.code {
	font-style: italic;
	background-color: #f5f5f5;
	color: blue;
	font-size: 30px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	padding: 0 5px;
	text-align: center;
}

#inputCode {
	width: 100px;
	height: 30px;
}
}
</style>
<script type="text/javascript">
	function checkPwd1() {
		let thePwdObj = document.getElementById("pwd1");
		let thePwdObjVal = thePwdObj.value;
		let thePwdObjValLen = thePwdObjVal.length;
		let flag3 = false, flag4 = false, flag5 = false;
		let pwdObj = document.getElementById("pwdsp");

		if (thePwdObjVal == "") {
			pwdObj.innerHTML = "密碼不可空白";
			return false;
		} else if (thePwdObjValLen < 8) {
			pwdObj.innerHTML = "密碼至少8個字";
			return false;
		} else {
			for (let i = 0; i < thePwdObjValLen; i++) {
				let ch = thePwdObjVal.charAt(i).toUpperCase();
				if (ch >= "A" && ch <= "Z") {
					flag3 = true;
				} else if (ch >= "0" && ch <= "9") {
					flag4 = true;
				} else if (ch >= "\u0021" && ch <= "\u0040") {
					flag5 = true;
				}
				if (flag3 && flag4 && flag5) {
					break;
				}
			}
			if (flag3 && flag4 && flag5) {
				pwdObj.innerHTML = "密碼格式正確";
				return true;
			} else {
				pwdObj.innerHTML = "密碼格式錯誤";
				return false;
			}
		}
	}
	function checkPwd2() {
		let thePwdObj = document.getElementById("pwd2");
		let thePwdObjVal = thePwdObj.value;
		let thePwdObjValLen = thePwdObjVal.length;
		let flag3 = false, flag4 = false, flag5 = false;
		let pwdObj = document.getElementById("pwdsp2");

		if (thePwdObjVal == "") {
			pwdObj.innerHTML = "密碼不可空白";
			return false;
		} else if (thePwdObjValLen < 8) {
			pwdObj.innerHTML = "密碼至少8個字";
			return false;
		} else {
			for (let i = 0; i < thePwdObjValLen; i++) {
				let ch = thePwdObjVal.charAt(i).toUpperCase();
				if (ch >= "A" && ch <= "Z") {
					flag3 = true;
				} else if (ch >= "0" && ch <= "9") {
					flag4 = true;
				} else if (ch >= "\u0021" && ch <= "\u0040") {
					flag5 = true;
				}
				if (flag3 && flag4 && flag5) {
					break;
				}
			}
			if (flag3 && flag4 && flag5) {
				pwdObj.innerHTML = "密碼格式正確";
				return true;
			} else {
				pwdObj.innerHTML = "密碼格式錯誤";
				return false;
			}
		}
	}
	function submitFunc() {
		if (checkPwd1() && checkPwd2()) {
			return true;
		} else {
			alert("所有欄位皆為必填且須遵照規定填寫, 請再次確認輸入內容後送出!!");
			return false;
		}
	}
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="#">Fitness</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">

					<%
						String memberStatus = "" + (Integer) session.getAttribute("Status");
					if (memberStatus.equals("1") || memberStatus.equals("2")) {
						out.write("<li class='nav-item'><a href='/WeMatch_dev' class='nav-link'><span>Logout</span></a></li>");
					} else {
						out.write("<li class='nav-item'><a href='/WeMatch_dev' class='nav-link'><span>Login</span></a></li>");
					}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">Our Stories</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">忘記密碼</h3>
				<form action="memberforgot.co" method="post" class="p-5 bg-light"
					style="position: relative; border: 1px solid;"
					onsubmit="return submitFunc()">
					<div class="form-group">
						<label for="memberPwd">新密碼 *</label> <span id="pwdsp"
							class="notice"></span><br /> <input type="password" id="pwd1"
							class="form-control" name="memberPwd" required="required"
							placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
							maxlength="20" onblur="checkPwd1()"> <span>${errors.pwd}</span>
					</div>
					<div class="form-group">
						<label for="memberNewPwd">確認密碼 *</label> <span id="pwdsp2"
							class="notice"></span><br /> <input type="password" id="pwd2"
							class="form-control" name="memberNewPwd" required="required"
							placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
							maxlength="20" onblur="checkPwd2()">
					</div>
					<div class="form-group">
						<a href='/WeMatch_dev'>回到登入</a><br /> <input id="Button1"
							type="submit" value="送出" class="btn py-3 px-4 btn-primary">
						<span>${error.msg}</span>
					</div>
				</form>
				<div class="form-group"></div>
			</div>
		</div>
	</section>
	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
</body>
</html>