<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Fitness Space</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style>
.notice {
	color: #ff0000;
	font-size: small;
}

#memo {
	position: absolute;
	right: 0;
	color: #fe9191;
	font-size: small;
	text-align: right;
	padding-right: 50px;
}

.v_code {
	width: 600px;
	margin: 0 auto;
	padding-left: 10px;
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
<link rel="shortcut icon" href="favicon.ico" />
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
		};
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
	
	function submitFunc(){
		if(checkAccount() && checkPwd()){
			return true;
		} else {
			alert("帳號或密碼格式錯誤, 請再確認輸入內容");
			return false;
		}	
	}

	function submitFunc2(){
// 		if(checkAccount() && checkPwd() && validateCode()){
			if(checkAccount() && checkPwd()){
				return true;
			}else{
				alert("所有欄位皆為必填且須遵照規定填寫, 請再次確認輸入內容後送出!!");
				return false;
			} 
 	}

 	//一鍵登入
	function adminkey() {
		document.getElementById("account1").value = "admintest123";
		document.getElementById("pwd1").value = "P@ssw0rd";
		document.getElementById("inputCode").disabled = true;
	}
	function memberkey1() {
		document.getElementById("account1").value = "membertest123";
		document.getElementById("pwd1").value = "P@ssw0rd";
		document.getElementById("inputCode").disabled = true;
	}
	function memberkey2() {
		document.getElementById("account1").value = "visitortest123";
		document.getElementById("pwd1").value = "P@ssw0rd";
		document.getElementById("inputCode").disabled = true;
	}
</script>
<!-- google -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https: //ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300"
	style="background-image: url('images/ind_1.jpg'); background-size: 100%;">
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb" id="schedule-section">
		<div class="container" style="margin-left: 5px; padding-right: 450px;">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h2 class="mb-5" style="margin-left: 90px;">Welcome to 
				<span class="navbar-brand" style="font-size: 38px;">FITNESS SPACE</span>
				</h2>
				<form action="loginsystem.controller" method="post" enctype="multipart/form-data"
				class="p-5 bg-light" style="position: relative; border: 1px solid; margin-left: 10px;"
				onsubmit="return submitFunc2()">
					<div id="memo">*為必填</div>
					<div class="form-group">
						<label for="memberAccount">帳號 *</label> <span id="accountsp" class="notice"></span><br />
						<input type="text" id="account1" class="form-control" name="memberAccount" 
						required="required" maxlength="20" autocomplete="on" onblur="checkAccount()">
						<span>${errors.name}</span>
					</div>
					<div class="form-group">
						<label for="memberPwd">密碼 *</label> <span id="pwdsp" class="notice"></span><br />
						<input type="password" id="pwd1" class="form-control" name="memberPwd" 
						required="required" maxlength="20" onblur="checkPwd()">
						<span>${errors.pwd}</span>
					</div>
						<a href="MemberForgot">忘記密碼？</a>
						<a href='<c:url value="/register"/>' style="position: absolute; right: 0; 
						padding-right: 50px;">尚未註冊？</a>
					<div class="form-group">
						<div class="v_code">
							<div class="code_show">
								<span class="code" id="checkCode" style="-webkit-user-select: none;" unselectable="on"></span>
								<a id="linkbt">看不清換一張</a>
								</div>
								<div class="input_code">
									<label for="inputCode">驗證碼：</label>
									<input type="text" id="inputCode" name="inputCode" required="required" />
									<span id="text_show"></span>
								</div>
							</div>
							<input id="Button1" type="submit" value="登入" class="btn py-3 px-4 btn-primary" style="margin-top: 20px;">
							<span>${errors.msg}</span>
							<!-- 一鍵登入 -->
							<input style="position: absolute; right: 0; margin-right: 50px; margin-top: 20px; background-color: #FFC1E0;"
								class="btn py-3 px-4 btn-primary" type="button" value="Admin" id="Admin" onclick="adminkey()">
							<input style="position: absolute; right: 0; margin-right: 150px; margin-top: 20px; background-color: #FFAD86;"
								class="btn py-3 px-4 btn-primary" type="button" value="M1" id="M1" onclick="memberkey1()">
							<input style="position: absolute; right: 0; margin-right: 227px; margin-top: 20px; background-color: #FFAD86;"
								class="btn py-3 px-4 btn-primary" type="button" value="M2" id="M2" onclick="memberkey2()"> <br />
							<br/>
							<!-- FaceBook -->
							<!-- The JS SDK Login Button -->

							<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
							<div id="status"></div>

							<!-- Load the JS SDK asynchronously -->
							<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
							<!-- Google -->
							<div class="g-signin2" data-onsuccess="onSignin" id="myP"></div>
						</div>
						
<!-- FaceBook -->
<script>

  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    console.log('statusChangeCallback');
    console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
      testAPI();  
    } else {                                 // Not logged into your webpage or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this webpage.';
    }
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : 'xxx',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v8.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };
 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
      document.location.href="http://localhost:8080/WeMatch_dev/homepage";
    });
  }

</script>
<!-- Google -->
<script type="text/javascript">
auth2.attachClickHandler('myP',{},startApp.onSuccess,startApp.onFailure);
   	function onSignIn(googleUser, go, false) {  
   	    // Useful data for your client-side scripts:  
   	    var profile = googleUser.getBasicProfile();
   	    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
  	    console.log('Full Name: ' + profile.getName());
   	    console.log('Given Name: ' + profile.getGivenName());
   	    console.log('Family Name: ' + profile.getFamilyName());
   	    console.log("Image URL: " + profile.getImageUrl());
   	    console.log("Email: " + profile.getEmail());
	
   	    // The ID token you need to pass to your backend:
   	    var id_token = googleUser.getAuthResponse().id_token;
   	    console.log("ID Token: " + id_token);
 		} -->
 	function go(){
 		document.location.href="http://localhost:8080/WeMatch_dev/homepage";
 		console.log("aaaaa")
  	 }
</script>
				</form>
			</div>
		</div>
	</section>

	<div class="col-md-12 text-center">
		<p>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright &copy;
			<script>
      document.write(new Date().getFullYear());
     </script>
			All rights reserved | This template is made with <i
				class="icon-heart color-danger" aria-hidden="true"></i> by <a
				href="https://colorlib.com" target="_blank">Colorlib</a>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		</p>
	</div>

	<%--  <%@ include file="WEB-INF/pages/footerout.jsp"%> --%>
	<%@ include file="JSsettingout.jsp"%>
</body>
</html>
