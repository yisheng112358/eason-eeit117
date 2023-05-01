<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>	


</head>
<body>
<setion >
<div >
	<form action="" method="get" class="p-5 bg-light" style=" border: 1px solid black; text-align: center; margin:10px 900px 10px 10px;float:none">
							<table style="font-size:20px"  >
								<thead>
									<tr>
										<th>序號</th>
										<th>&nbsp;&nbsp;</th>
                                        <th>日期</th>
                                        <th>&nbsp;&nbsp;</th>
										<th>時間</th>
										<th>&nbsp;&nbsp;</th>
										<th>名字</th>
										<th></th>


					<th> <a href="<c:url value='/bookingcontroller/select'/>">查詢</a> </th> 

					
					
					
									</tr>
								</thead>
								<tbody>
										<tr>
											<td>&nbsp;</td>
										</tr>
									<c:forEach var="film" items="${films}" varStatus="status" >
										
										<c:if test="${status.count <11}">
										<tr>
											<td>${status.count}</td>
											<td>&nbsp;&nbsp;</td>
											<td>${film.bookingDate}</td>
											<td>&nbsp;&nbsp;</td>
											<td>${film.bookingTime}點鐘</td>
											<td>&nbsp;&nbsp;</td>
											<td>${film.bookingName}</td>

											<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><a
												href="<c:url value='/bookingcontroller/delete?id=${film.bookingId}' />">刪除</a></td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</form>
</div>

<!-- <div style = "position:relative;top:-560px;left:650px;"> -->
<div>
	<form action="" method="get" class="p-5 bg-light"
							style=" border: 1px solid black; text-align: center;margin:10px 900px 10px 10px;">
							<table style="font-size:20px" >
								<thead>

								</thead>
								<tbody>
										<tr>
											<td>&nbsp;</td>
										</tr>
									<c:forEach var="film" items="${films}" varStatus="status" >
										
										<c:if test="${status.count >10 && status.count<21}">
										<tr>
											<td>${status.count}</td>
											<td>&nbsp;&nbsp;</td>
											<td>${film.bookingDate}</td>
											<td>&nbsp;&nbsp;</td>
											<td>${film.bookingTime}點鐘</td>
											<td>&nbsp;&nbsp;</td>
											<td>${film.bookingName}</td>

											<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><a
												href="<c:url value='/bookingcontroller/delete?id=${film.bookingId}' />">刪除</a></td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</form>
</div>
</setion>




    <script src="../js/bookingcheck3.js"></script>


</body>
</html>
