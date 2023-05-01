<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.eeit117.wematch.product.model.ProductBean"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Product Update</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="about-section">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-6 col-lg-5 d-flex">
					<div class="img d-flex align-self-stretch align-items-center"
						style="background-image: url(../images/bg_1.jpg);"></div>
				</div>
				<div class="comment-form-wrap pt-5">
					<h3 class="mb-5">修改產品</h3>
					<form action="<c:url value='/product/updateProduct' />"
						method="post" enctype="multipart/form-data" class="p-5 bg-light"
						style="position: relative; border: 1px solid;" id="productAddForm">
						<div id="memo">*欄位為必填</div>
						<div class="form-group">
							<label for="productId">產品ID *</label> <span id="productIdSp"
								class="notice"></span><br />
							<%
								ProductBean productUpdate = (ProductBean) session.getAttribute("productUpdate");
							out.write("<input type='text' value=" + productUpdate.getProductId()
									+ " id='productIdId' class='form-control' name='productId' required='required' readonly onblur='checkProductId()'>");
							%>
						</div>
						<div class="form-group">
							<label for="categorySelect">產品類別 *</label><br /> <select
								name="category" id="categorySelectId" required="required">
								<%
									String[] categories = { "Massager", "Yoga", "Supplement" };
								for (String category : categories) {
									if (category.equals(productUpdate.getCategory())) {
										out.write("<option value='" + category + "' selected>" + category + "</option>");
										continue;
									}
									out.write("<option value='" + category + "'>" + category + "</option>");
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="productName">產品名稱 *</label> <span id="productSp"
								class="notice">checked!</span><br /> <input type='text'
								value="${productUpdate.getProductName() }" id='productNameId'
								class='form-control' name='productName' required='required'
								placeholder='最多20個字元' maxlength='20' autocomplete='on'>
						</div>
						<div class="form-group">
							<label for=productPrice>產品價格 *</label> <span id="priceSp"
								class="notice">checked!</span><br /> <input type="text"
								id="productPriceId" class="form-control" name="price"
								required="required" placeholder="最多6位數" maxlength="6"
								value="${productUpdate.getPrice()}">
						</div>
						<div class="form-group">
							<label for="productStock">庫存 *</label> <span id="stockSp"
								class="notice">checked!</span><br /> <input type="text"
								id="productStockId" class="form-control" name="stock"
								required="required" placeholder="最多不超過99個" maxlength="2"
								value="${productUpdate.getStock()}">
						</div>
						<div class="form-group">
							<label for="productDescription">產品介紹</label><span
								id="descriptionSp" class="notice">checked!</span><br />
							<textarea name="productDescription" id="productDescriptionId"
								cols="30" rows="10" class="form-control" maxlength="200"
								placeholder="最多200個字元">${productUpdate.getProductDescription()}</textarea>
						</div>
						<div class="form-group">
							<label for="thumbnail">產品縮圖</label> <span id="thumbnailSp"
								class="notice">請重新上傳圖片</span>
							<p>
								<input type="file" accept=".jpg, .jpeg, .png" name="thumbnail"
									id="thumbnailId">
							</p>
						</div>
						<div id="thumbnailDisplay" style="width: 200px; height: 200px;">
							<p>
								<img style='width: 200px; height: 200px;' id='thumbnailPreview'
									src='updateProduct/showthumbnail/${productUpdate.getProductId()}'>
							</p>
						</div>
						<div class="form-group">
							<label for="detailImg">產品詳圖</label> <span id="detailImgSp"
								class="notice">請重新上傳圖片</span>
							<p>
								<input type="file" accept=".jpg, .jpeg, .png" name="detailImg"
									id="detailImgId">
							</p>
						</div>
						<div id="detailImgDisplay" style="width: 200px; height: 200px;">
							<p>
								<img style='width: 200px; height: 200px;' id='detailImgPreview'
									src='updateProduct/showDetailImg/${productUpdate.getProductId()}'>
							</p>
						</div>
						<div class="form-group" style="text-align: right;">
							<a id='productUpdateBtn' class="btn py-3 px-4 btn-primary">Commit</a>
						</div>
					</form>
					<div style="text-align: right;">
						<p>
							<a onclick="history.back()"
								class="btn btn-primary px-5 py-3 mt-3">Return</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>

	<script src="../js/ProductUpdatePage.js" type="text/javascript"></script>

</body>
</html>