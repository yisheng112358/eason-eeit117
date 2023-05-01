<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


table-->.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 20px;
}

.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 8px; //
	設定單元格內邊距 line-height: 1.42857143;
	vertical-align: top;
	border-top: 1px solid #ddd;
	//
	每條記錄的頂部都有一條1畫素的細線
}

.table>thead>tr>th {
	vertical-align: bottom;
	border-bottom: 2px solid #ddd;
	//
	thead有1條2畫素寬的橫線
}

.table>tbody+tbody {
	border-top: 2px solid #ddd;
	//
	如果表格有2個tbody，兩者指間會有1條2畫素寬的橫線
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
		<%@ include file="headerout.jsp"%>
					
					<!-- 重複加選的錯誤提示 -->
				<div align="center">
					<%
						String errorInfo = (String) request.getAttribute("errorMessage");
					if (errorInfo != null) {
					%>
					<script type="text/javascript" language="javascript">
		   					alert("<%=errorInfo%>");
						window.location = 'addCourses';
					</script>
					<%
						}
					%>
				</div>
	
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h1 align="center">
					待選課程區 <a
						href="http://localhost:8080/WeMatch_dev/download/pdf/CoursesIT.pdf"
						target="_blank" class="badge badge-warning"
						style="width: 115px; font-size: 20px">操作說明<span
						style="font-size: 10px">下載</span></a>
				</h1>
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
						<c:forEach var="courses" items="${listCurriculum}">
							<tr align="center">
								<td align="center">${courses.coursesName}</td>
								<td align="center">${courses.coursesWeek}</td>
								<td align="center">${courses.sectionNumber}</td>
								<td align="center">${courses.classRoom}</td>
								<td align="center">${courses.numberPeople}</td>
								<td align="center">${courses.regNumber}</td>
								<td align="center">${courses.coursesBalance}</td>
								<td><a
									href="addCurriculumBtn?coursesId=${courses.coursesId}"> <input
										type="submit" value="➕"></a></td>
							</tr>
						</c:forEach>
					</table>


					<h2 align="center">已選所有課程（課表）👁‍🗨</h2>
					<table class="table table-striped">
						<tr align="center" color="brack">
							<th>課表代號</th>
							<th>會員代號</th>
							<th>課程代號</th>
							<th>課程名稱</th>
							<th>上課星期</th>
							<th>課程節數</th>
							<th>上課教室</th>
						</tr>
						<c:forEach var="curriculum" items="${listCurriculum2}">
							<tr align="center">
								<td align="center">${curriculum.curriculumId}</td>
								<td align="center">${curriculum.memberId}</td>
								<td align="center">${curriculum.coursesId}</td>
								<td align="center">${curriculum.coursesName}</td>
								<td align="center">${curriculum.coursesWeek}</td>
								<td align="center">${curriculum.sectionNumber}</td>
								<td align="center">${curriculum.classRoom}</td>
							</tr>
						</c:forEach>
					</table>
					<div style="background-color: #ffffff" align="center">
						<a href="ListCourses"> <input width="10px"
							class="btn py-3 px-4 btn-primary" type="submit" value="退選" /></a>
					</div>
				</div>
	</section>

	<%
		if (memberStatus.equals("2")) {
		response.sendRedirect("/WeMatch_dev/newCourses");
	}
	%>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
	
</body>
</html>
