<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>會員註冊</title>
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
</style>
<script type="text/javascript">
	var code;
	function createCode() {
		code = "";
		var codeLength = 6; //驗證碼的長度
		var checkCode = document.getElementById("checkCode");
		var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		for (var index = 0; index < codeLength; index++) {
			var charNum = Math.floor(Math.random() * 52);
			code += codeChars[charNum];
		}
		if (checkCode) {
			checkCode.className = "code";
			checkCode.innerHTML = code;
		}
	}
	function validateCode() {
		var inputCode = document.getElementById("inputCode").value;
		var textShow = document.getElementById("text_show")
		if (inputCode.length <= 0) {
			textShow.innerHTML = "請輸入驗證碼";
			textShow.style.color = "red";
			return false;
		} else if (inputCode.toUpperCase() != code.toUpperCase()) {
			textShow.innerHTML = "您輸入的驗證碼有誤";
			textShow.style.color = "red";
			createCode();
			return false;
		} else {
			textShow.innerHTML = "驗證碼正確";
			textShow.style.color = "green";
			return true;
		}
	}
	function checkCode() {
		var btn = document.getElementById("Button1");
		btn.onclick = function() {
			validateCode();
		}
	}
	window.onload = function() {
		checkCode();
		createCode();
		document.getElementById("checkCode").onclick = function() {
			createCode();
		}
		linkbt.onclick = function() {
			createCode();
		}
		inputCode.onclick = function() {
			validateCode();
		}
	}
	function checkAccount() {
		let theAccountObj = document.getElementById("account1");
		let theAccountObjVal = theAccountObj.value;
		let theAccountObjValLen = theAccountObjVal.length;
		let flag1 = false, flag2 = false;
		let accountObj = document.getElementById("accountsp");

		if (theAccountObjVal == "") {
			accountObj.innerHTML = "帳號不可空白";
			return false;
		} else if (theAccountObjValLen < 8) {
			accountObj.innerHTML = "帳號至少8個字";
			return false;
		} else {
			for (let i = 0; i < theAccountObjValLen; i++) {
				let ch = theAccountObjVal.charAt(i).toUpperCase();
				if (ch >= "A" && ch <= "Z") {
					flag1 = true;
				} else if (ch >= "0" && ch <= "9") {
					flag2 = true;
				}
				if (flag1 && flag2) {
					break;
				}
			}
			if (flag1 && flag2) {
				accountObj.innerHTML = "帳號格式正確";
				return true;
			} else {
				accountObj.innerHTML = "帳號格式錯誤";
				return false;
			}
		}
	}

	function checkPwd() {
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
	function submitFunc() {
		if (checkAccount() && checkPwd()) {
			return true;
		} else {
			alert("帳號或密碼格式錯誤, 請再確認輸入內容");
			return false;
		}
	}
	function submitFunc2() {
		if (checkAccount() && checkPwd() && validateCode()) {
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
				<h3 class="mb-5">會員註冊</h3>
				<form action="register.controller" method="post"
					enctype="multipart/form-data" class="p-5 bg-light"
					style="position: relative; border: 1px solid;"
					onsubmit="return submitFunc2()">
					<div id="memo">*為必填</div>
					<div class="form-group">
						<label for="memberAccount">帳號 *</label><span id="accountsp"
							class="notice"></span><br /> <input type="text" id="account1"
							class="form-control" name="memberAccount" required="required"
							placeholder="請輸入少8個字字母、數字混合字元以內且不可空白(至多20個)" maxlength="20"
							autocomplete="on" onblur="checkAccount()"><br /> <span>${errors.name}</span>
					</div>
					<div class="form-group">
						<label for="memberPwd">密碼 *</label> <span id="pwdsp"
							class="notice"></span><br /> <input type="password" id="pwd1"
							class="form-control" name="memberPwd" required="required"
							placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
							maxlength="20" onblur="checkPwd()"> <span>${errors.pwd}</span>
					</div>
					<div class="form-group">
						<a href='/WeMatch_dev'>回到登入</a><br />
						<div class="v_code">
							<div class="code_show">
								<span class="code" id="checkCode"
									style="-webkit-user-select: none;" unselectable="on"></span> <a
									id="linkbt">看不清換一張</a>
							</div>
							<div class="input_code">
								<label for="inputCode">驗證碼：</label> <input type="text"
									id="inputCode" name="inputCode" required="required" /> <span
									id="text_show">${errors.incode}</span>
							</div>
						</div>
						<input id="Button1" type="submit" value="送出"
							class="btn py-3 px-4 btn-primary"> <span>${errors.msg}</span>
					</div>
				</form>
			</div>
		</div>
	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>
