<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h3 class="mb-5">會員照片上傳</h3>
				<form Action="MemberPic" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="picture_1">Upload Your Beautiful Pictures1:</label> <input
							type="file" name="picture_1">
					</div>
					<div class="form-group">
						<label for="picture_2">Upload Your Beautiful Pictures2:</label> <input
							type="file" name="picture_2">
					</div>
					<div class="form-group">
						<a href='<c:url value="/MemberPage"/>'>回到會員頁面</a><br />
						<input type="submit" value="上傳" class="btn py-3 px-4 btn-primary">
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
</body>
</html>