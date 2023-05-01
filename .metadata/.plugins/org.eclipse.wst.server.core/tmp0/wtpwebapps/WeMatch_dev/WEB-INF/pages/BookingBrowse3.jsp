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

<style type="text/css">
#container {

}
</style>


</head>
<body>



<div class="container" >

   
	<form  action="<c:url  value="/bookingcontroller/selectbooking"/>" method="get" style=" border: 1px solid black; text-align: center; margin:10px auto;float:none">
	
	<input style="display:none" type="hidden" id="bookingname" name="bookingname"  value="${memberName}"><p style="font-size:30px;">預約者:${memberName}</p>
	<input type="submit" name="button" id="button" value="查詢" >
	<br/>
	<br/>
							<table style="font-size:20px" >
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
			
									</tr>
								</thead>
								<tbody>
										<tr>
											<td>&nbsp;</td>
										</tr>
									<c:forEach var="film" items="${films}" varStatus="status" >
										
										
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
												href="<c:url value='/bookingcontroller/deletebooking?id=${film.bookingId}' />">刪除</a></td>
										</tr>
										
									</c:forEach>
								</tbody>
							</table>
						</form>
</div>








    <script src="../js/bookingcheck3.js"></script>



</body>
</html>
