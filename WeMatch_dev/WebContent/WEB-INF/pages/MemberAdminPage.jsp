<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
<%@ include file="CSSsettingout.jsp"%>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="headerout.jsp"%>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">會員管理資料</h3>
				<form class="p-5 bg-light" action="preInsert.do"
					style="position: relative; border: 1px solid;" method="post">
					<table class="form-group">
						<div class="form-group">
							<input type="submit" value="新增" class="btn py-3 px-4 btn-primary">
						</div>
						<thead>
							<tr>
								<th>序號</th>
								<th>編號</th>
								<th>帳號</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="status" var="result" items="${results}">
								<tr>
									<td>${status.count}</td>
									<td>${result.memberId}</td>
									<td>${result.memberAccount}</td>
									<td><a
										href="<c:url value='/preUpdate?id=${result.memberId}' />">查詢</a>
										<a href="#" onclick="if(confirm('您確定要刪除此筆資料嗎?'))location.href='<c:url value="/delete?id=${result.memberId}" />'">刪除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
</html>
