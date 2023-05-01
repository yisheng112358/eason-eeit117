<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
<%@ include file="CSSsettingout.jsp"%>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="headerout.jsp" %>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">會員資料</h3>
				<form:form Action="MemberPage_DB" method="post"
					modelAttribute="Member" enctype="multipart/form-data">
					<div class="form-group">
						<label for="memberName">姓名：</label> <input type="text"
							id="memberName" value="林小明" class="form-control"
							name="memberName" maxlength="20" autocomplete="on">
					</div>
					<div class="form-group">
						<label for="nickname">暱稱：</label><input type="text" id="nickname"
							class="form-control" name="nickname" maxlength="20" value="明明"
							autocomplete="on">
					</div>
					<div class="form-group">
						<label for="gender">性別：</label> <select name="gender">
							<option value="M">男生</option>
							<option value="F">女生</option>
							<option value="O">其他</option>
						</select>
					</div>
					<div class="form-group">
						<div id="memo" style="color: red">*輸入Email擔任援備密碼</div>
						<label for="memberEmail">電子郵件：</label> <span id="mailsp"
							class="notice"></span><br /> <input type="email" id="mail1"
							class="form-control" name="memberEmail" onblur="checkMail()"
							value="a1234@mail.com">
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<label for="birthdayDate">生日：</label> <input type="date" -->
<!-- 							name="birthdayDate"> -->
<!-- 					</div> -->
					<div class="form-group">
						<label for="starSign">星座：</label><br /> <select name="starSign">
							<option value="ARI">白羊座</option>
							<option value="TAU">金牛座</option>
							<option value="GEM">雙子座</option>
							<option value="CNC">巨蟹座</option>
							<option value="LEO">獅子座</option>
							<option value="VIR">處女座</option>
							<option value="LIB">天秤座</option>
							<option value="SCO">天蠍座</option>
							<option value="SGR">射手座</option>
							<option value="CAP">摩羯座</option>
							<option value="AGR">水瓶座</option>
							<option value="PSC">雙魚座</option>
						</select>
					</div>
					<div class="form-group">
						<label for="city">居住/生活城市：</label><br /> <select name="city"
							required="required">
							<option value="KLU">基隆市</option>
							<option value="TPH">新北市</option>
							<option value="TPE">臺北市</option>
							<option value="TYC">桃園市</option>
							<option value="HSH">新竹縣</option>
							<option value="HSC">新竹市</option>
							<option value="MAC">苗栗市</option>
							<option value="MAL">苗栗縣</option>
							<option value="TXG">臺中市</option>
							<option value="CWH">彰化縣</option>
							<option value="CWS">彰化市</option>
							<option value="NTC">南投市</option>
							<option value="NTO">南投縣</option>
							<option value="YLH">雲林縣</option>
							<option value="CHY">嘉義縣</option>
							<option value="CYI">嘉義市</option>
							<option value="TNN">臺南市</option>
							<option value="KHH">高雄市</option>
							<option value="IUH">屏東縣</option>
							<option value="PTS">屏東市</option>
							<option value="ILN">宜蘭縣</option>
							<option value="ILC">宜蘭市</option>
							<option value="HWA">花蓮縣</option>
							<option value="HWC">花蓮市</option>
							<option value="TTC">臺東市</option>
							<option value="TTT">臺東縣</option>
							<option value="PEH">澎湖縣</option>
							<option value="KMN">金門縣</option>
							<option value="LNN">連江縣</option>
						</select>
					</div>
					<div class="form-group">
						<label for="bloodType">血型：</label><br /> <select name="bloodType">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="AB">AB</option>
							<option value="O">O</option>
							<option value="Other" selected="selected">Other</option>
						</select>
					</div>
					<div class="form-group">
						<label for="hobbies">興趣喜好：</label><br /> <label for="movie">
							<input type="checkbox" name="hobbies" id="movie" value="movie"
							checked="checked">電影
						</label> <label for="sport"> <input type="checkbox" name="hobbies"
							id="sport" value="sport">運動
						</label> <label for="reading"> <input type="checkbox"
							name="hobbies" id="reading" value="reading">閱讀
						</label> <label for="shopping"> <input type="checkbox"
							name="hobbies" id="shopping" value="shopping">逛街
						</label> <label for="hiking"> <input type="checkbox"
							name="hobbies" id="hiking" value="hiking">踏青
						</label> <label for="travel"> <input type="checkbox"
							name="hobbies" id="travel" value="travel">旅遊
						</label>
					</div>
					<div class="form-group">
						<label for="selfIntro">關於我：</label>
						<textarea name="selfIntro" cols="30" rows="10"
							class="form-control">Hi</textarea>
					</div>
					<div class="form-group">
						<input type="submit" value="更新" class="btn py-3 px-4 btn-primary">
					</div>
				</form:form>
			</div>
		</div>
	</section>
	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
</body>
</html>