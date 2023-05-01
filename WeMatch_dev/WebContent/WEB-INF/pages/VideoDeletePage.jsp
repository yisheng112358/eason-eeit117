<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Administer Videolist</title>
<%@ include file="CSSsetting.jsp"%>
<style>
thead th {
    font-size: 18px;
    font-weight: bold;
    line-height: 19px;
    padding: 0px 2px 10px 2px;
    color:#000000;
    text-decoration: underline;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

<%@ include file="header.jsp"%>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Videoflix List</span>
					<h2 class="mb-4">Administer Videolist</h2>
					<p>More video, more powerful.</p>
				</div>
			</div>
			<div class="ftco-schedule">
				<div class="row">
					<div class="col-md-4 nav-link-wrap">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link ftco-animate active" id="v-pills-8-tab"
								data-toggle="pill" href="#v-pills-8" role="tab"
								aria-controls="v-pills-8" aria-selected="true">Video List <span>Oh
									no, plz don't kill me!!</span>
							</a>

						</div>

						<!-- 						<form action="<c:url value="/video/adminadd"/>" -->
						<!-- 							method="get"> -->
						<!-- 							<input type="submit" value="Add" -->
						<!-- 								class="btn py-3 px-4 btn-primary" -->
						<!-- 								style="float: right; margin-right: 5px"> -->
						<!-- 						</form> -->

<!-- 						<input type="button" value="Add" class="btn py-3 px-4 btn-primary" -->
<!-- 							onclick="location.href='/WeMatch_dev/VideoListPage.jsp'" -->
<!-- 							style="float: right; margin-right: 5px;" /> -->
						<input type="button" value="Add" class="btn py-3 px-4 btn-primary"
							onclick="location.href='/WeMatch_dev/videolist'"
							style="float: right; margin-right: 5px;" />

					</div>


					<div class="tab-pane fade show active" id="v-pills-8"
						role="tabpanel" aria-labelledby="day-8-tab">
						<form action="<c:url value="/video/admindelete"/>"
							method="post" class="p-5 bg-light"
							style="position: relative; border: 1px solid black; text-align: center">												
							
							<table>
								<thead>
									<tr>
										<th>序號</th>
 								   <!-- <th>影片序號</th> -->
										<th>影片主題</th>
										<th>影片網址</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td>&nbsp;</td>
										</tr>
									<c:forEach var="film" varStatus="status" items="${films}">
										<tr>
											<td>${status.count}</td>
<%-- 											<td>${film.videoId}</td> --%>
											<td>${film.videoName}</td>
											<td>${film.videoLink}</td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td>
									   <%-- <a href="<c:url value='/video/delete?id=${film.videoId}' />" onclick="delConfirm()">刪除</a></td> --%>
											<a href="#" onclick="if(confirm('您確定要刪除此筆資料嗎?'))location.href='<c:url value="/video/delete?id=${film.videoId}" />'">刪除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>

				</div>
			</div>
		</div>
	</section>

<!-- 	<div id="ftco-loader" class="show fullscreen"> -->
<!-- 		<svg class="circular" width="48px" height="48px"> -->
<%-- 			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" --%>
<%-- 				stroke-width="4" stroke="#eeeeee" /> --%>
<%-- 			<circle class="path" cx="24" cy="24" r="22" fill="none" --%>
<%-- 				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg> --%>
<!-- 	</div> -->

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>
	<script src="../js/VideoDelete.js" type="text/javascript"></script>

</body>

</html>