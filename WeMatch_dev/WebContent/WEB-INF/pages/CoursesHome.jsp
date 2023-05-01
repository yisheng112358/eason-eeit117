<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<title>Courses</title>
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
<!--table-->
.table {
  width: 100%;
  max-width: 100%;
  margin-bottom: 20px;
}
.table > thead > tr > th,
.table > tbody > tr > th,
.table > tfoot > tr > th,
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  padding: 8px;  //設定單元格內邊距
  line-height: 1.42857143;
  vertical-align: top;
  border-top: 1px solid #ddd;  //每條記錄的頂部都有一條1畫素的細線
}
.table > thead > tr > th {
  vertical-align: bottom;
  border-bottom: 2px solid #ddd; //thead有1條2畫素寬的橫線
}
.table > tbody + tbody {
  border-top: 2px solid #ddd;  //如果表格有2個tbody，兩者指間會有1條2畫素寬的橫線
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
	<%@ include file="headerout.jsp"%>
	
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<div align="center">
					<h3 class="mb-5">目前課程查詢🏠</h3>
					<table class="table table-striped">
						<tr align="center" color="brack">
							<th>課程名稱</th>
							<th>上課星期</th>
							<th>課程節數</th>
							<th>上課教室</th>
							<th>可報人數</th>
							<th>已報人數</th>
							<th>剩餘人數</th>
							<th>操作</th>
						</tr>	
						<c:forEach var="courses" items="${listCourses}">
							<tr align="center">
								<td>${courses.coursesName}</td>
								<td>${courses.coursesWeek}</td>
								<td>${courses.sectionNumber}</td>
								<td>${courses.classRoom}</td>
								<td>${courses.numberPeople}</td>
								<td>${courses.regNumber}</td>
								<td>${courses.coursesBalance}</td>
								<td><a href="editCourses?coursesId=${courses.coursesId}">📝</a>
									<a href="#" onclick="if(confirm('您確定要刪除${courses.coursesName}這門課程嗎?'))location.href='<c:url value="/deleteCourses?coursesId=${courses.coursesId}"/>'">❌</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div style="background-color: #ffffff">
						 <a href="newCourses"><input width="10px" padding="100px" class="btn py-3 px-4 btn-primary" type="submit" value="新增課程" /></a>
					</div>
				</div>
	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
	
</body>
</html>
