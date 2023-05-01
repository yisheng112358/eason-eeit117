<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tw.eeit117.wematch.product.model.ProductBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

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
									out.write(
											"<li class='nav-item'><a href='/WeMatch_dev' class='nav-link'><span>Login</span></a></li>");
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
				<!-- 				<p class="breadcrumbs"> -->
				<!-- 					<span class="mr-2"><a href="index.html">Home <i -->
				<!-- 							class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a -->
				<!-- 						href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog -->
				<!-- 						Single <i class="ion-ios-arrow-forward"></i> -->
				<!-- 					</span> -->
				<!-- 				</p> -->
			</div>
		</div>
	</div>
</section>