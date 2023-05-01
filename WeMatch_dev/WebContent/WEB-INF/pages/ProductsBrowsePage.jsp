<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Product</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Product</span>
					<h2 class="mb-4">Training Product</h2>
					<p>You go far, we help you go further.</p>
				</div>
			</div>
			<div class="ftco-schedule">
				<div class="sidebar-box">
					<div class="search-form" id="searchForm">
						<div class="form-group">
							<span class="icon icon-search"></span> <input type="text"
								id="searchInput" class="form-control"
								placeholder="Type a keyword and enter or select the suggestions">
						</div>
					</div>
					<p id="searchNum">
					<p>
				</div>
				<div class="row">
					<div class="col-md-4 nav-link-wrap">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link ftco-animate active" id="tabMassager"
								data-toggle="pill" href="#v-pills-8" role="tab"
								aria-controls="v-pills-8" aria-selected="true">Massager <span>Massager,
									Fascia gun...</span></a> <a class="nav-link ftco-animate" id="tabYoga"
								data-toggle="pill" href="#v-pills-9" role="tab"
								aria-controls="v-pills-9" aria-selected="false">Yoga <span>Mat,
									Roller...</span>
							</a> <a class="nav-link ftco-animate" id="tabSupplement"
								data-toggle="pill" href="#v-pills-10" role="tab"
								aria-controls="v-pills-10" aria-selected="false">Supplement
								<span>Protein, Vitamin...</span>
							</a> <a class="nav-link ftco-animate" id="tabHelper"
								data-toggle="pill" href="#v-pills-11" role="tab"
								aria-controls="v-pills-11" aria-selected="false">Helper <span>You
									can ask me</span>
							</a>
						</div>
						<div class="form-group">
							<label for="categorySelect">Sort by:</label><br /> <select
								name="category" id="sorttingSelect">
								<option value="HighPriceUp">High Price Up</option>
								<option value="HighPriceDown">High Price Down</option>
								<option value="LatestUp">Latest Up</option>
								<option value="LatestDown" selected>Latest Down</option>
							</select>
						</div>
						<%
							if (memberStatus.equals("2")) {
							out.write(
							"<p style='text-align: center;'><a href='/WeMatch_dev/product/manage' class='btn btn-primary px-5 py-3 mt-3'>Manage</a></p>");
						}
						%>
					</div>
					<div class="col-md-8 tab-wrap">

						<div class="tab-content" id="v-pills-tabContent">

							<div class="tab-pane fade show active" id="v-pills-8"
								role="tabpanel" aria-labelledby="day-8-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentMassager" class="productTable"></table>
								</div>
								<div id="pageMassager" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-9" role="tabpanel"
								aria-labelledby="v-pills-day-9-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentYoga" class="productTable"></table>
								</div>
								<div id="pageYoga" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-10" role="tabpanel"
								aria-labelledby="v-pills-day-10-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentSupplement" class="productTable"></table>
								</div>
								<div id="pageSupplement" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-11" role="tabpanel"
								aria-labelledby="v-pills-day-11-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">

									<!-- 購物小幫手Start -->
									<div class="fixed1" id="tt">
										<h5 class="text-center"
											style="font-weight: bold; color: blue; padding-top: 8px;">Helper</h5>
										<span id='status'></span>
										<textarea cols='60' rows='14' id='serverResponseArea'
											style="margin-left: 15px;"></textarea>
										<br> <span
											style="padding-bottom: 8px; font-weight: bold; color: black; margin-left: 15px;">會員&nbsp;${memberName}：</span><br>
										<input type='text' size="60" id='message'
											style="margin-left: 15px; margin-bottom: 10px;"><br>

										<button id='btnSend' class="btn btn-primary"
											style="margin-left: 15px; margin-bottom: 10px; float: right; margin-right: 15px;">送出</button>
									</div>
									<!-- 購物小幫手End -->

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>
	<script src="../js/ProductBrowserPage.js" type="text/javascript"></script>
	<script src="../js/ProductChat.js" type="text/javascript"></script>

</body>
</html>