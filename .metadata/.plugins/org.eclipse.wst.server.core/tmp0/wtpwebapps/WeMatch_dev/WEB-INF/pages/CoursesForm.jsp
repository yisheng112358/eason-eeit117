<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsettingout.jsp"%>
<title>Courses</title>
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

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
<script>
function insertCourses() {
	document.getElementById("coursesName2").value = "甩油大作戰";
	document.getElementById("coursesWeek2").value = "星期一";
	document.getElementById("sectionNumber2").value = "第一節";
	document.getElementById("classRoom2").value = "B123";
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
					<h3 class="mb-5">
						新增/編輯 課程💬 & <a href="CoursesHome" style="color: black";>🔎查詢 &</a>

						<input
							type="button" id="return3" value="✍預設" onclick="insertCourses()">
					</h3>
					<form:form action="saveCourses" method="post"
						modelAttribute="courses" enctype="multipart/form-data"
						class="p-5 bg-light"
						style="position: relative; border: 1px solid;"
						onsubmit="return submitFunc()">
						<div id="memo">*為必填</div>
						<form:hidden path="coursesId" />
						<div class="form-group">
							<label for="coursesName">課程名稱 *</label> <span id="coursesName"
								class="notice"></span><br />
							<form:input type="text" id="coursesName2" class="form-control"
								path="coursesName" name="coursesWeek" required="required"
								maxlength="20" onblur="checkPwd()"></form:input>
						</div>
						<div class="form-group">
							<label for="coursesWeek">上課星期 *</label> <span id="coursesWeek"
								class="notice"></span><br />
							<form:input type="text" id="coursesWeek2" class="form-control"
								path="coursesWeek" name="coursesWeek" required="required"
								maxlength="20" onblur="checkPwd()"></form:input>
						</div>
						<div class="form-group">
							<label for="sectionNumber">課程節數 *</label> <span
								id="sectionNumber" class="notice"></span><br />
							<form:input type="text" id="sectionNumber2" class="form-control"
								path="sectionNumber" name="sectionNumber" required="required"
								maxlength="20" onblur="checkPwd()"></form:input>
						</div>
						<div class="form-group">
							<label for="classRoom">上課教室 *</label><span id="classRoom"
								class="notice"></span><br />
							<form:input type="text" id="classRoom2" class="form-control"
								path="classRoom" name="classRoom" required="required"
								maxlength="20" onblur="checkPwd()"></form:input>
						</div>
						<div class="form-group">
							<label for="numberPeople">可報人數 *</label>
							<span id="numberPeople" class="notice"></span><br/>
							<form:input type="text" id="numberPeople" class="form-control"
								path="numberPeople" name="numberPeople" required="required"
								maxlength="20" onblur="check_numpeople()"></form:input>
						</div>
						<div class="form-group">
							<label for="regNumber">已報人數 *</label>
							<span style="color:red;"> ${errors.regNumber}</span>
							<span id="regNumber" class="notice"></span><br />
							<form:input type="text" id="regNumber" class="form-control"
								path="regNumber" name="regNumber" required="required"
								maxlength="20" onblur="check_numpeople()" ></form:input>
						</div>
						<div class="form-group">
							<label for="coursesBalance">剩餘人數 *</label>
							<span style="color:red;"> ${errors.coursesBalance}</span><span
								id="coursesBalance" class="notice"></span><br />
							<form:input type="text" id="coursesBalance" class="form-control"
								path="coursesBalance" name="coursesBalance" required="required"
								maxlength="20" onblur="check_numpeople()" ></form:input>
						</div>

						<div class="form-group">
							<input id="button1" type="submit" value="送出" 
								class="btn py-3 px-4 btn-primary"> <span></span>
						</div>

					</form:form>
				</div>
			</div>
		</section>

		<%@ include file="footerout.jsp"%>
		<%@ include file="JSsettingout.jsp"%>
</body>
</html>
