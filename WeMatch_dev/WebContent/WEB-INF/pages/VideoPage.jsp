<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.eeit117.wematch.product.model.ProductBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	response.addHeader("x-frame-options", "ALLOW-FROM https://www.youtube.com/");
%>
<!DOCTYPE html>
<html>

<head>
<title>Video</title>
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

.videoTable {
	color: #000000;
}

.filmtopic {
	color: #0000E3;
	font-weight: bold;
	font-size: 18px;
}

.uptopic {
	color: #A23400;
	font-weight: bold;
	font-size: 25px;
	font-style: italic;
	text-decoration: underline;
}

#intro {
	color: rgb(255, 255, 255);
	font-weight: bolder;
	text-shadow: 3px 3px 3px rgb(0, 0, 0);
}

.fixed1 {
	position: fixed;
	width: 425px;
	border: 3px solid #9999CC;
	bottom: 10px;
	right: 0;
	margin-right: 30px;
	display: none;
	background-color: #F0F0F0;
}
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	​​​​​​​
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/WeMatch_dev/homepage"
				style="padding-top: 0px;">Fitness</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<!-- 				<li class="nav-item"><a href="index.html#home-section" -->
					<!-- 					class="nav-link"><span>Home</span></a></li> -->
					<li class="nav-item"><a
						href="<c:url value='/product/browse' />" class="nav-link"><span>Products</span></a></li>
					<li class="nav-item"><a href="<c:url value='/addCourses' />"
						class="nav-link"><span>Courses</span></a></li>
					<li class="nav-item"><a
						href="<c:url value='/bookingcontroller/booking' />"
						class="nav-link"><span>Schedule</span></a></li>
					<li class="nav-item"><a href="<c:url value='/diet' />"
						class="nav-link"><span>Diet</span></a></li>
					<li class="nav-item"><a href="/WeMatch_dev/video"
						class="nav-link"><span>Videoflix</span></a></li>
					<li class="nav-item"><a href="<c:url value='/coachPage' />"
						class="nav-link"><span>Coach Intro.</span></a></li>
					<li class="nav-item"><a href="<c:url value='/MemberPage' />"
						class='nav-link'><span>Membership</span></a></li>
					<%
						if ((Map<Integer, List<String>>) session.getAttribute("productArrival") == null) {
						Map<Integer, List<String>> productArrival = new HashMap<Integer, List<String>>();
						session.setAttribute("productArrival", productArrival);
					}
					if ((Set<ProductBean>) session.getAttribute("shoppingCarts") == null) {
						Set<ProductBean> carts = new HashSet<ProductBean>();
						session.setAttribute("shoppingCarts", carts);
					}
					Set<ProductBean> oldCarts = (Set<ProductBean>) session.getAttribute("shoppingCarts");
					out.write("<li class='nav-item'><a href='/WeMatch_dev/shoppingCart/cart' class='nav-link'><span>🛒(" + oldCarts.size()
							+ ")</span></a></li>");
					%>

					<%
						String memberStatus = "" + (Integer) session.getAttribute("Status");
					String memberName = (String) session.getAttribute("memberName");
					if (memberStatus.equals("1") || memberStatus.equals("2")) {
						//out.write("<li class='nav-item'><a href='/WeMatch_dev' class='nav-link'><span>Logout</span></a></li>");
						out.write(
						"<li class='nav-item' style='line-height:16px; margin-top: 0px;'><a href='/WeMatch_dev' class='nav-link'><span style='text-align:center;'><span style='font-style:italic; font-size: 14px; font-weight:bold;'>Welcome,&nbsp;"
								+ memberName + "</span><span>Logout</span></span></a></li>");
					} else {
						out.write("<li class='nav-item'><a href='/WeMatch_dev' class='nav-link'><span>Login</span></a></li>");
					}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">Our Stories</h1>
					<!-- 					<p class="breadcrumbs"> -->
					<!-- 						<span class="mr-2"><a href="index.html">Home <i -->
					<!-- 								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a -->
					<!-- 							href="VideoPage.jsp">Videoflix <i -->
					<!-- 								class="ion-ios-arrow-forward"></i></a></span> -->
					<!-- 					</p> -->
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-schedule" id="schedule-section"
		style="padding-bottom: 60px">
		<!-- 		<div class="container"> -->

		<div class="col-md-12 heading-section text-center ftco-animate">
			<span class="subheading">Videoflix</span>
			<h2 class="mb-4">Training Video</h2>
			<p>No pain, no gain.</p>
		</div>

		<!-- 		</div> -->
	</section>

	<section class="ftco-section bg-light" id="blog-section"
		style="padding-top: 50px; padding-bottom: 10px;">
		<div class="container">

			<div class="row d-flex">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<img src="images/v001.jpg" class="block-20" style="height: 45%;">
						<div class="text float-right d-block"
							style="border: grey solid 2px; border-bottom-right-radius: 60px;">
							<div class="d-flex align-items-center pt-2 mb-4 topp">
								<div class="one mr-2">
									<span class="day" id="intro">背部</span>
								</div>
								<div class="two">
									<span class="yr">&nbsp;</span> <span class="mos"
										style="font-weight: bolder;">肌群</span>
								</div>
							</div>
							<h3 class="heading" style="font-weight: bolder; color: orange">背部肌群組成與重要性</h3>
							<p style="color: rgb(95, 92, 92);">核心肌群之一的背部，由多裂肌、豎脊肌、腰方肌等多項肌群組成，當我們站立、起身、前彎時這些肌群就會啟動進行動作，扮演著穩定軀幹的角色。強壯的背部核心肌群不僅能改善一些症狀外同時也能增進在運動上的表現。</p>
							<div class="d-flex align-items-center mt-4 meta">
								<p class="mb-0">
									<a href="#v-pills-10-tab" class="btn btn-primary">Go <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0"></p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<img src="images/v002.jpg" class="block-20" style="height: 45%;">
						<div class="text float-right d-block"
							style="border: grey solid 2px; border-bottom-right-radius: 60px;">
							<div class="d-flex align-items-center pt-2 mb-4 topp">
								<div class="one mr-2">
									<span class="day" id="intro">胸部</span>
								</div>
								<div class="two">
									<span class="yr">&nbsp;</span> <span class="mos"
										style="font-weight: bolder;">肌群</span>
								</div>
							</div>
							<h3 class="heading" style="font-weight: bolder; color: orange">胸部肌群訓練方式</h3>
							<p style="color: rgb(95, 92, 92);">胸部肌肉可分為胸大肌、胸小肌和前鋸肌。相對其他部位的肌群而言，胸部肌群要簡單很多，其重點在於對於胸大肌的訓練，常用徒手方法為伏地挺身以及各種變式，負重訓練可採用飛鳥和臥推的方式刺激。</p>
							<div class="d-flex align-items-center mt-4 meta">
								<p class="mb-0">
									<a href="#v-pills-10-tab" class="btn btn-primary">Go <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0"></p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry">
						<img src="images/v003.jpg" class="block-20" style="height: 45%;">
						<div class="text float-right d-block"
							style="border: grey solid 2px; border-bottom-right-radius: 60px;">
							<div class="d-flex align-items-center pt-2 mb-4 topp">
								<div class="one mr-2">
									<span class="day" id="intro">腿部</span>
								</div>
								<div class="two">
									<span class="yr">&nbsp;</span> <span class="mos"
										style="font-weight: bolder;">肌群</span>
								</div>
							</div>
							<h3 class="heading" style="font-weight: bolder; color: orange">強化腿部肌群好處</h3>
							<p style="color: rgb(95, 92, 92);">大腿主要分為前外側、後側和內側三個肌群。勤練腿部肌群好處相當的多，主要能強化腿部肌群、增強核心肌力、消耗更多的熱量、促進生長激素與睪固酮的濃度、提高新陳代謝等等，因此，腿部肌肉沒練好，幾乎是等於健身無效。</p>
							<div class="d-flex align-items-center mt-4 meta">
								<p class="mb-0">
									<a href="#v-pills-10-tab" class="btn btn-primary">Go <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-schedule" id="schedule-section"
		style="padding-top: 60px">
		<div class="container">
			<!-- 			<div class="row justify-content-center pb-5"> -->
			<!-- 				<div class="col-md-12 heading-section text-center ftco-animate"> -->
			<!-- 					<span class="subheading">Videoflix</span> -->
			<!-- 					<h2 class="mb-4">Training Video</h2> -->
			<!-- 					<p>No pain, no gain.</p> -->
			<!-- 				</div> -->
			<!-- 			</div> -->

			<div>
				<!-- 				<div class="coach-wrap ftco-animate d-sm-flex" -->
				<!-- 					style="padding-top: 10px"> -->
				<!-- 					<div>Last Update</div><br> -->

				<!-- 					<div class="tab-pane fade show active" id="v-pills-6" -->
				<!-- 						role="tabpanel" aria-labelledby="day-6-tab"> -->

				<div class="coach-wrap ftco-animate d-sm-flex"
					style="border-radius: 50px">

					<table id=contentupdate class="updateTable"
						style="margin-left: 35px"></table>
				</div>
				<!-- 					</div> -->
				<!-- 				</div> -->

				<!-- 				<div> -->
				<!-- 					<div class="coach-wrap ftco-animate d-sm-flex" -->
				<!-- 						style="padding-top: 10px"> -->
				<!-- 						<h4>Most View</h4> -->

				<!-- 						<div class="tab-pane fade show active" id="v-pills-7" -->
				<!-- 							role="tabpanel" aria-labelledby="day-7-tab"> -->
				<!-- 							<div class="coach-wrap ftco-animate d-sm-flex"> -->
				<!-- 								Show video most view -->
				<!-- 								<table id=contentview class="viewTable"></table> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>

			<div id="down"></div>
			<div class="ftco-schedule">
				<div class="row">
					<div class="col-md-4 nav-link-wrap">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link ftco-animate active" id="v-pills-8-tab"
								data-toggle="pill" href="#v-pills-8" role="tab"
								aria-controls="v-pills-8" aria-selected="true">背部肌群 <span>BodyBack,
									Go go!!</span></a> <a class="nav-link ftco-animate" id="v-pills-9-tab"
								data-toggle="pill" href="#v-pills-9" role="tab"
								aria-controls="v-pills-9" aria-selected="false">胸部肌群 <span>Chest,
									GJ Ha Ha...</span>
							</a> <a class="nav-link ftco-animate" id="v-pills-10-tab"
								data-toggle="pill" href="#v-pills-10" role="tab"
								aria-controls="v-pills-10" aria-selected="false">腿部肌群 <span>Leg,
									you're leg ker ker...</span>
							</a>

						</div>

						<br>
						<!-- 						<input type="button" value="Delete" -->
						<!-- 							class="btn py-3 px-4 btn-primary" -->
						<!-- 							onclick="location.href='/WeMatch_dev/VideoDeletePage.jsp'" -->
						<!-- 							style="float: right; margin-right: 10px;"> <input -->
						<!-- 							type="button" value="Add" class="btn py-3 px-4 btn-primary" -->
						<!-- 							onclick="location.href='/WeMatch_dev/VideoListPage.jsp'" -->
						<!-- 							style="float: right; margin-right: 5px;"> -->

						<!-- 						<input type="button" value="Admin" -->
						<!-- 							class="btn py-3 px-4 btn-primary" -->
						<!-- 							onclick="location.href='/WeMatch_dev/VideoDeletePage.jsp'" -->
						<!-- 							style="float: right; margin-right: 5px;"> -->


						<%-- 						<form action="/WeMatch_dev/video/admindelete" method="post"> --%>
						<!-- 							<input type="submit" value="Admin" -->
						<!-- 								class="btn py-3 px-4 btn-primary" style="float: right"> -->
						<%-- 						</form> --%>

						<div>
							<%
								if (memberStatus.equals("2")) {
								out.print("<form action='/WeMatch_dev/video/admindelete' method='post'>");
								out.print("<input type='submit' value='Admin' class='btn py-3 px-4 btn-primary' style='float: right'>");
								out.print("</form>");
							} else {
								out.print("<span><input class='btn py-3 px-4 btn-primary' type='button' id='btntest' value='健身影片諮詢室'></span>");
								out.print(
								"<br><br><span style='color:black; font-size:15px;'><span style='font-weight:bold;text-decoration:underline; font-style:italic;'>★健身影片諮詢小提示★</span><br>→&nbsp;想了解三大肌群構造，請輸入\"肌群名稱\"<br>→&nbsp;三大肌群健身風險，請輸入\"肌群名稱+風險\"<br>→&nbsp;健身影片推薦，請輸入\"肌群名稱+級別+推薦\"</span><br><span style='font-weight:bold;color:black; font-size:15px;'>◎&nbsp;Fitness Space感謝您的使用");
							}
							%>
						</div>

					</div>
					<div class="col-md-8 tab-wrap">

						<div class="tab-content" id="v-pills-tabContent">

							<div class="tab-pane fade show active" id="v-pills-8"
								role="tabpanel" aria-labelledby="day-8-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id=contentbodyback class="videoTable"></table>
								</div>
								<div id="pageback" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-9" role="tabpanel"
								aria-labelledby="v-pills-day-9-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentbodychest" class="videoTable"></table>
								</div>
								<div id="pagechest" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-10" role="tabpanel"
								aria-labelledby="v-pills-day-10-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentbodyleg" class="videoTable"></table>
								</div>
								<div id="pageleg" class="text-center"></div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 健身影音諮詢室Start -->
	<div class="fixed1" id="tt">
		<h5 style="font-weight: bold; color: blue; padding-top: 8px;">
			&nbsp;&nbsp;&nbsp;◆&nbsp;健身影音諮詢室<span><button id="cc"
					style="float: right; margin-right: 15px; margin-bottom: 10px; background-color: #BEBEBE; font-size: 14px; font-weight: bold;">close</button></span>
		</h5>

		<!-- 		<button id='btnConn'>開始諮詢</button> -->
		<!-- 		<span id='status'></span> -->
		<textarea cols='45' rows='14' id='serverResponseArea'
			style="margin-left: 15px;" autofocus></textarea>
		<br> <span
			style="padding-bottom: 8px; font-weight: bold; color: black; margin-left: 15px;">會員&nbsp;${memberName}：</span><br>
		<input type='text' size="45" id='message'
			style="margin-left: 15px; margin-bottom: 10px;"><br>

		<button id='btnSend' class="btn btn-primary"
			style="margin-left: 15px; margin-bottom: 10px; float: right; margin-right: 15px;">送出</button>
		<button id='btnClose' class="btn btn-primary"
			style="margin-left: 10px; margin-bottom: 10px; float: right;">諮詢結束</button>
	</div>
	<!-- 健身影音諮詢室End -->

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="js/VideoUpdate.js" type="text/javascript"></script>
	<script src="js/VideoPage.js" type="text/javascript"></script>
	<script src="js/VideoChat.js" type="text/javascript"></script>

</body>

</html>