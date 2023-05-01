<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
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
<script>
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
function submitFunc(){
	if(checkAccount() && checkPwd()){
		return true;
	}else{
		alert("帳號或密碼格式錯誤, 請再確認輸入內容");
		return false;
	}
}

function submitFunc2(){
	if(checkAccount() && checkPwd()){
		return true;
	}else{
		alert("所有欄位皆為必填且須遵照規定填寫, 請再次確認輸入內容後送出!!");
		return false;
	}
}
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%@ include file="headerout.jsp"%>
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">後台會員新增</h3>
				<form action="Insert" method="post"
					enctype="multipart/form-data" class="p-5 bg-light"
					style="position: relative; border: 1px solid;"
					onsubmit="return submitFunc2()">
					<div class="form-group">
					<a	href="<c:url value='/MemberAdminPage'/>">返回</a><br/>
						<label for="memberAccount">帳號 *</label> <span id="accountsp"
							class="notice"></span><br /> <input type="text" id="account1"
							class="form-control" name="memberAccount" required="required"
							placeholder="請輸入少8個字字母、數字混合字元以內且不可空白(至多20個)" maxlength="20"
							autocomplete="on" onblur="checkAccount()"> <span>${errors.name}</span>
					</div>
					<div class="form-group">
						<label for="memberPwd">密碼 *</label> <span id="pwdsp"
							class="notice"></span><br /><input
							type="password" id="pwd1" class="form-control" name="memberPwd"
							required="required"
							placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
							maxlength="20" onblur="checkPwd()"> <span>${errors.pwd}</span>
					</div>
					<div class="form-group">
						<input id="Button1" type="submit" value="新增"
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