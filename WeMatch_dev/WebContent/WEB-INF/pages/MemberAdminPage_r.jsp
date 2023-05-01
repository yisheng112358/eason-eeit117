<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台會員資料</title>
<%@ include file="CSSsettingout.jsp"%>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%@ include file="headerout.jsp"%>
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">後台會員資料</h3>
				<form class="p-5 bg-light"
					style="position: relative; border: 1px solid;" method="post">
					<div class="form-group">
						<label for="memberAccount">會員帳號：</label> <label>${memberAccount}</label>
					</div>
					<div class="form-group">
						<label>姓名：</label> <label for="memberAccount">${memberName}</label>
					</div>
					<div class="form-group">
						<label for="nickname">綽號：</label> <label>${nickname}</label>
					</div>
					<div class="form-group">
						<label for="gender">性別：</label> <label>${gender}</label>
					</div>
					<div class="form-group">
						<label for="memberEmail">Email：</label> <label>${email}</label>
					</div>
<!-- 					<div class="form-group"> -->
<%-- 						<label for="birthdayDate">生日：</label> <label>${birthdayDate}</label> --%>
<!-- 					</div> -->
					<div class="form-group">
						<label for="starSign">星座：</label> <label>${starSign}</label>
					</div>
					<div class="form-group">
						<label for="city">居住/生活城市：</label> <label>${city}</label>
					</div>
					<div class="form-group">
						<label for="bloodType">血型：</label> <label>${bloodType}</label>
					</div>
					<div class="form-group">
						<label for="hobbies">興趣喜好：</label> <label>${hobbies}</label>
					</div>
					<div class="form-group">
						<label for="selfIntro">關於我：</label> <label>${selfinfo}</label>
					</div>
					<div class="form-group">
						<a href="<c:url value='/MemberPage_Adminupdate?account=${memberAccount}'/>">修改</a> <a
							href="<c:url value='/MemberAdminPage'/>">返回</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
</body>
</html>