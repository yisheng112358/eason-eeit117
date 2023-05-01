<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.eeit117.wematch.product.model.ProductBean"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Product Exam</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="about-section">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-6 col-lg-5 d-flex">
					<div class="img d-flex align-self-stretch align-items-center">
						<%
							ProductBean productExam = (ProductBean) session.getAttribute("productExam");
						%>
						<img style='width: 400px; height: 400px;' id='detailImg'
							src='examProduct/showDetailImg/${productExam.getProductId()}'>
					</div>
				</div>
				<div class="col-md-6 col-lg-7 pl-lg-5 py-5">
					<div class="py-md-5">
						<div class="row justify-content-start pb-3">
							<div class="col-md-12 heading-section ftco-animate">
								<span class='subheading' id='category'>${productExam.getCategory()}</span>
								<h2 class='mb-4' id='productName'
									style='font-size: 34px; text-transform: capitalize;'>${productExam.getProductName()}</h2>
								<p id='addDate'>Sell Date: ${productExam.getAddDate()}</p>
								<p id='updateDate'>Last Update:
									${productExam.getUpdateDate()}</p>
								<p id='price'>Price: ${productExam.getPrice()}</p>
								<p id='stock'>Stock: ${productExam.getStock()}</p>
								<p id='productDescription'>${productExam.getProductDescription()}</p>
								<div style="text-align: left;">
									<input type='button'
										onclick='addCart("${productExam.getProductId()}", "${productExam.getProductName()}")'
										class='btn btn-primary px-5 py-3 mt-3' value='Cart'>
								</div>
							</div>
						</div>
					</div>
					<div style="text-align: right;">
						<a onclick="history.back()" class="btn btn-primary px-5 py-3 mt-3">Return</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>
	<script src="../js/ProductExamPage.js" type="text/javascript"></script>

</body>
</html>