<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coach Introduction</title>
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

h3 {
	display: inline;
}

h3:hover {
	cursor: pointer;
	background: rgba(255, 255, 255, .4);
}

h3:active {
	background: rgba(255, 255, 255, .8);
}

.coachTitle {
	text-align: center;
}

.whitecolor {
	width: 600px;
}

.inputDiv {
	margin-left: 250px;
}

.retrunDiv {
	margin-left: 400px;
}

#return, #return1 {
	display: inline-block;
	padding: 8px 15px;
	font-size: 24px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #46A3FF;
	border: none;
	border-radius: 15px;
	box-shadow: 0 5px #999;
	font-family: 微軟正黑體;
}

#return:hover {
	background-color: #FF7575
}

#return:active {
	background-color: #FF7575;
	box-shadow: 0 2px #666;
	transform: translateY(4px);
}
</style>
<script>
	function checkcoachName() {
		let theCoaObj = document.getElementById("coachName");
		let theCoaObjVal = theCoaObj.value;
		let theCoaObjValLen = theCoaObjVal.length;
		let re = /^[\u4e00-\u9fa5]{2,}$/;
		var textShow = document.getElementById("coachName_span");
		if (theCoaObjVal == "") {
			textShow.innerHTML = "❌姓名不能為空";
			textShow.style.color = "red";
			return false;
		} else if (theCoaObjValLen < 2) {
			textShow.innerHTML = "❌姓名至少兩個字";
			textShow.style.color = "red";
			return false;
		} else if (!re.test(theCoaObjVal)) {
			textShow.innerHTML = "❌姓名必須為中文";
			textShow.style.color = "red";
			return false;
		} else if (re.test(theCoaObjVal) && theCoaObjValLen >= 2) {
			textShow.innerHTML = "✔格式正確";
			textShow.style.color = "green";
			return true;
		} else {
			textShow.innerHTML = "❌格式錯誤";
			textShow.style.color = "red";
			return false;
		}
	}

	function checkcoachNickname() {
		let thecoachNicknameObj = document.getElementById("coachNickname");
		let thecoachNicknameObjVal = thecoachNicknameObj.value;
		let thecoachNicknameObjValLen = thecoachNicknameObjVal.length;
		let coachNicknameCheck = /^[a-zA-Z]{1,}$/;
		var NicknameShow = document.getElementById("coachNickname_span");
		if (thecoachNicknameObjVal == "") {
			NicknameShow.innerHTML = "❌暱稱不能為空";
			NicknameShow.style.color = "red";
			return false;
		} else if (coachNicknameCheck.test(thecoachNicknameObjVal)) {
			NicknameShow.innerHTML = "✔暱稱格式正確";
			NicknameShow.style.color = "green";
			return true;
		} else {
			NicknameShow.innerHTML = "❌暱稱錯誤";
			NicknameShow.style.color = "red";
			return false;
		}

	}

	function checkcoachAge() {
		let theAgeObj = document.getElementById("coachAge");
		let theAgeObjVal = theAgeObj.value;
		let theAgeObjValLen = theAgeObjVal.length;
		let AgeCheck = /^[0-9]{2,}$/;
		var AgeShow = document.getElementById("coachAge_span");
		if (theAgeObjVal == "") {
			AgeShow.innerHTML = "❌年齡不能為空";
			AgeShow.style.color = "red";
			return false;
		} else if (AgeCheck.test(theAgeObjVal)) {
			AgeShow.innerHTML = "✔年齡格式正確";
			AgeShow.style.color = "green";
			return true;
		} else {
			AgeShow.innerHTML = "❌年齡格式錯誤；須為數字";
			AgeShow.style.color = "red";
			return false;
		}
	}

	function checkcourseName() {
		let theCNObj = document.getElementById("courseName");
		let theCNObjVal = theCNObj.value;
		let theCNObjValLen = theCNObjVal.length;
		let res = /^[\u4e00-\u9fa5]{2,}$/;
		var CNShow = document.getElementById("courseName_span");
		if (theCNObjVal == "") {
			CNShow.innerHTML = "❌授課名稱不能為空";
			CNShow.style.color = "red";
			return false;
		} else if (theCNObjValLen < 2) {
			CNShow.innerHTML = "❌授課名稱至少兩個字";
			CNShow.style.color = "red";
			return false;
		} else if (!res.test(theCNObjVal)) {
			CNShow.innerHTML = "❌授課名稱必須為中文";
			CNShow.style.color = "red";
			return false;
		} else if (res.test(theCNObjVal) && theCNObjValLen >= 2) {
			CNShow.innerHTML = "✔格式正確";
			CNShow.style.color = "green";
			return true;
		} else {
			CNShow.innerHTML = "❌格式錯誤";
			CNShow.style.color = "red";
			return false;
		}
	}

	function checkcourseType() {
		let theCTObj = document.getElementById("courseType");
		let theCTObjVal = theCTObj.value;
		let theCTObjValLen = theCTObjVal.length;
		let CTres = /^[\u4e00-\u9fa5]{2,}$/;
		var CTShow = document.getElementById("courseType_span");
		if (theCTObjVal == "") {
			CTShow.innerHTML = "❌授課類別不能為空";
			CTShow.style.color = "red";
			return false;
		} else if (theCTObjValLen < 2) {
			CTShow.innerHTML = "❌授課類別至少兩個字";
			CTShow.style.color = "red";
			return false;
		} else if (!CTres.test(theCTObjVal)) {
			CTShow.innerHTML = "❌授課類別必須為中文";
			CTShow.style.color = "red";
			return false;
		} else if (CTres.test(theCTObjVal) && theCTObjValLen >= 2) {
			CTShow.innerHTML = "✔格式正確";
			CTShow.style.color = "green";
			return true;
		} else {
			CTShow.innerHTML = "❌格式錯誤";
			CTShow.style.color = "red";
			return false;
		}
	}

	function checklicense() {
		let thelicenseObj = document.getElementById("license");
		let thelicenseObjVal = thelicenseObj.value;
		let thelicenseObjValLen = thelicenseObjVal.length;
		let license = /^[\u4e00-\u9fa5][a-zA-Z]{1,}$/;
		var licenseShow = document.getElementById("license_span");
		if (thelicenseObjVal == "") {
			licenseShow.innerHTML = "❌證照不能為空";
			licenseShow.style.color = "red";
			return false;
		} else if (thelicenseObjValLen < 2) {
			licenseShow.innerHTML = "❌證照至少兩個字";
			licenseShow.style.color = "red";
			return false;
		} else {
			licenseShow.innerHTML = "✔格式正確";
			licenseShow.style.color = "green";
			return true;
		}
	}

	function submitFunc(){
		if(checkcoachName() && checkcoachNickname() && checkcoachAge() && checkcourseName() && checkcourseType() && checklicense()){
			return true;
		}else{
			alert("輸入內容有誤, 請再次確認後送出!!");
			return false;
		}
	} 
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Coach</span>
					<h2 class="mb-4">Coach Introduction</h2>
					<p>Choose us, we help you go further.</p>
				</div>
			</div>
			<div class="coachDiv">
				<h2 class="coachTitle">修改教練資料</h2>
				<form action="<c:url value="/editCoach" />" method="POST"
					enctype="multipart/form-data" onsubmit="return submitFunc()">
					<div class="inputDiv">
						<label>照片:</label><br /> <input type="file" name="coachPic" />
					</div>
					<br />
					<div class="inputDiv">
						<label>教練姓名:</label><br /> <input class="whitecolor" type="text"
							name="coachName" value="${coachName}" id="coachName"
							onchange="checkcoachName()" /> <span id=coachName_span></span>
					</div>
					<br />
					<div class="inputDiv">
						<label>教練暱稱:</label><br /> <input class="whitecolor" type="text"
							name="coachNickname" value="${coachNickname}" id="coachNickname"
							onchange="checkcoachNickname()" /> <span id=coachNickname_span></span>
					</div>
					<br />
					<div class="inputDiv">
						<label>年齡:</label><br /> <input class="whitecolor" type="text"
							name="coachAge" value="${coachAge}" id="coachAge"
							onchange="checkcoachAge()" /> <span id=coachAge_span></span>
					</div>
					<br />
					<div class="inputDiv">
						<label>授課名稱:</label><br /> <input class="whitecolor" type="text"
							name="courseName" value="${courseName}" id="courseName"
							onchange="checkcourseName()" /> <span id=courseName_span></span>
					</div>
					<br />
					<div class="inputDiv">
						<label>授課類別:</label><br /> <input class="whitecolor" type="text"
							name="courseType" value="${courseType}" id="courseType"
							onchange="checkcourseType()" /> <span id=courseType_span></span>
					</div>
					<br />
					<div class="inputDiv">
						<label>相關證照:</label><br /> <input class="whitecolor" type="text"
							name="license" value="${license}" id="license"
							onchange="checklicense()" /> <span id=license_span></span>
					</div>
					<br />
					<div class="inputDiv">
						<!-- 						<label>ID:</label><br />  -->
						<input class="whitecolor" type="hidden" name="coachId"
							value="${coachId}" />
					</div>
					<br />
					<div class="retrunDiv">
						<input type="submit" id="return" value="確認修改"> <input
							type="button" id="return1" value="返回教練系統"
							onclick="location.href='/WeMatch_dev/coachAdminPage'">
					</div>
				</form>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>

</body>
</html>