<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.eeit117.wematch.product.model.ProductBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Fitness Space Homepage</title>
<%@ include file="CSSsettingout.jsp"%>
<style>
.col-md.d-flex.align-self-stretch.ftco-animate.fadeInUp.ftco-animated:hover {
    border: 2px #fe9191 solid;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

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


	<section id="home-section" class="hero">
		<div class="home-slider js-fullheight owl-carousel">
			<div class="slider-item js-fullheight">
				<div class="overlay"></div>
				<div class="container-fluid p-0">
					<div
						class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end"
						data-scrollax-parent="true">
						<div class="one-third order-md-last img js-fullheight"
							style="background-image: url(images/bg_1.jpg);">
							<h3 class="vr" style="background-image: url(images/divider.jpg);">Strength</h3>
						</div>
						<div
							class="one-forth d-flex js-fullheight align-items-center ftco-animate"
							data-scrollax=" properties: { translateY: '70%' }">
							<div class="text">
								<span class="subheading">Fitness Space Can be</span>
								<h1 class="mb-4 mt-3">
									Get A <span>Perfect</span> Body <span>Figure</span>
								</h1>
								<p>
									良好的健康狀況和高度的身體訓練，是有效的腦力<br>勞動的重要條件。
								</p>

								<p>
									<a href="register" class="btn btn-primary px-5 py-3 mt-3">Join
										with us</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="slider-item js-fullheight">
				<div class="overlay"></div>
				<div class="container-fluid p-0">
					<div
						class="row d-flex no-gutters slider-text js-fullheight align-items-center justify-content-end"
						data-scrollax-parent="true">
						<div class="one-third order-md-last img js-fullheight"
							style="background-image: url(images/bg_2.jpg);">
							<h3 class="vr" style="background-image: url(images/divider.jpg);">Workout</h3>
						</div>
						<div
							class="one-forth d-flex js-fullheight align-items-center ftco-animate"
							data-scrollax=" properties: { translateY: '70%' }">
							<div class="text">
								<span class="subheading">Fitness Space Can be</span>
								<h1 class="mb-4 mt-3">
									Pain is <span>Temporary</span> But Glory is <span>Forever</span>
								</h1>
								<p>
									人人都想有健美身材，但是沒人想舉重死人的器材。<br>日復一日的堅持練下去吧，只有活動適量才能保持<br>訓練的熱情和提高運動的技能。
								</p>

								<p>
									<a href="register" class="btn btn-primary px-5 py-3 mt-3">Join
										with us</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-schedule">
		<div class="container-fluid px-4">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<h3 class="subheading">Gallery</h3>
					<h2 class="mb-1">Fitness Photo Show</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-5.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-5.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-6.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-6.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-7.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-7.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-8.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-8.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-services-2" id="services-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Happy &amp; Healthy</span>
					<h2 class="mb-4">Main feature &amp; Site map</h2>
					<p>有健康的身體，才有健康的精神。想要持續健康，僅需要持之以恆的耐心，只要把健身這件事持續不斷的做下去，必然能前往健康的人生道路！</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md d-flex align-self-stretch ftco-animate"
					onclick="location.href='/WeMatch_dev/product/browse';"
					style="cursor: pointer;">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-abs"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">健身產品</h3>
							<p style="text-align: justify; text-justify: inter-ideograph;">「I
								don’t eat for taste, I eat for function.」</p>
							<div style="text-align: right;">
								<br> <br> <br>-- Jay Cutler
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate"
					onclick="location.href='/WeMatch_dev/addCourses';"
					style="cursor: pointer;">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-woman"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">健身課程</h3>
							<p style="text-align: justify; text-justify: inter-ideograph;">「Dream
								more than others think practical. Expect more than others think
								that is possible.」
							<div style="text-align: right;">-- Frank Zane</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate"
					onclick="location.href='/WeMatch_dev/bookingcontroller/booking';"
					style="cursor: pointer;">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-treadmill-machine-with-timer"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">器材預約</h3>
							<p style="text-align: justify; text-justify: inter-ideograph;">「The
								hardest things in life are done the least and provide the most.」</p>
							<div style="text-align: right;">
								<br>-- Greg Plitt
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate"
					onclick="location.href='/WeMatch_dev/diet';"
					style="cursor: pointer;">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">飲食管理</h3>
							<p style="text-align: justify; text-justify: inter-ideograph;">「To
								be a champion you must act like one, act like a champion.」</p>
							<div style="text-align: right;">
								<br> <br>-- Lou Ferrigno
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate"
					onclick="location.href='/WeMatch_dev/video';"
					style="cursor: pointer;">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-gym"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">影片教學</h3>
							<p style="text-align: justify; text-justify: inter-ideograph;">「If
								you spend too much time thinking about a thing, you’ll never get
								it done.」</p>
							<div style="text-align: right;">
								<br>-- Bruce Lee
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate"
					onclick="location.href='/WeMatch_dev/coachPage';"
					style="cursor: pointer;">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-aerobic"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">教練資格</h3>
							<p style="text-align: justify; text-justify: inter-ideograph;">「If
								you don’t learn from your mistakes, then they become regrets.」</p>
							<div style="text-align: right;">
								<br>-- John Cena
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- loader -->
	<!--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> -->


	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>