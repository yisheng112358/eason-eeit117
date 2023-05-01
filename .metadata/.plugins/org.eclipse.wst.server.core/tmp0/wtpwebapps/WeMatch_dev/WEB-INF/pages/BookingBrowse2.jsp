<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>Booking</title>
<%@ include file="CSSsetting.jsp"%>
	
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>





</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	

	
<%@ include file="header.jsp"%>
	
	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
		
			<div class="row justify-content-center pb-5">
					
				<div class="col-md-12 heading-section text-center ftco-animate">
				<span style="float:left;"><img width="500" height="500" style="float:left;" src="../images/about.jpg"></span>
					<span class="subheading">BookingNow</span>
				
					<h2 class="mb-4">BookingSystem</h2>
					<p>Enjoy Time For Yourself</p>
					<p>Have Fun Alone</p>
					<br><br>
				<table>
				<tr><td><span style="padding:25px 25px;"><img width="150" height="150"  src="../images/yet.jpg" ></span></td>
				<td><span style="padding:25px 25px;"><img width="150" height="150"  src="../images/select.jpg" ></span></td>
				<td><span style="padding:25px 25px;"><img width="150" height="150"  src="../images/ordered.jpg" ></span></td></tr>
				<br>
				<tr><td><span>可預約</span></td>
				<td><span>預約中</span></td>
				<td><span>已預約</span></td></tr>
				</table>
				</div>
			</div>
			
			<div class="col-md-12 heading-section ftco-animate">
			          	<span class="subheading">A Few Words About Us</span>
			            <h2 class="mb-4" style="font-size: 34px; text-transform: capitalize;">We're Functioning for Almost <span class="number" data-number="20">0</span> Years</h2>
			            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
			            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
			            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
			          </div>

<hr/>
<div>
	<form style="text-align:center;" action="<c:url  value="/bookingcontroller/bookingCheck"/>" method="post" id="form1" name="form1">
	

      
	 
	 <br>	 
	 
	 
	<input type="date" class="date" id="date" name="date" required value="2020-09-22" max="2020-10-10" step="1"> <br />

	    <br/><br/>
	    
	  
        
<div id="checkboxGroup" name="checkboxGroup">
        <label class="timefont">預約時間:          <input name="time" type="checkbox" class="checkbox" value="9"/>9:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="11"/>11:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="13"/>13:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="15"/>15:00</label>
</div>
<!--                       draggable="false" 不被拖動 -->
       </div>                            
	    <br/><br/>
	    
	    <div  id="loaction" style="text-align:center;" >
	   
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells1" id="Dumbbells1" value="Dumbbells1"><img width="150" height="150" id="image1" src="../images/yet.jpg" onclick="myfunction()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells2" id="Dumbbells2" value="Dumbbells2"><img width="150" height="150" id="image2" src="../images/yet.jpg" onclick="myfunction2()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells3" id="Dumbbells3" value="Dumbbells3"><img width="150" height="150" id="image3" src="../images/yet.jpg" onclick="myfunction3()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells4" id="Dumbbells4" value="Dumbbells4"><img width="150" height="150" id="image4" src="../images/yet.jpg" onclick="myfunction4()"></label></span>
		<br/><br/>
		
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells5" id="Dumbbells5" value="Dumbbells5"><img width="150" height="150" id="image5"src="../images/yet.jpg" onclick="myfunction5()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells6" id="Dumbbells6" value="Dumbbells6"><img width="150" height="150" id="image6"src="../images/yet.jpg" onclick="myfunction6()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells7" id="Dumbbells7" value="Dumbbells7"><img width="150" height="150" id="image7" src="../images/yet.jpg" onclick="myfunction7()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells8" id="Dumbbells8" value="Dumbbells8"><img width="150" height="150" id="image8" src="../images/yet.jpg" onclick="myfunction8()"></label></span>
		<br/><br/>
		
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells9" id="Dumbbells9" value="Dumbbells9"><img width="150" height="150" id="image9"src="../images/yet.jpg" onclick="myfunction9()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells10" id="Dumbbells10" value="Dumbbells10"><img width="150" height="150" id="image10" src="../images/yet.jpg" onclick="myfunction10()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells11" id="Dumbbells11" value="Dumbbells11"><img width="150" height="150" id="image11" src="../images/yet.jpg" onclick="myfunction11()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells12" id="Dumbbells12" value="Dumbbells12"><img width="150" height="150" id="image12" src="../images/yet.jpg" onclick="myfunction12()"></label></span>
		
	
		<input style="display:none" type="hidden" id="test1"  value="${D1}">

		<input style="display:none" type="hidden" id="test2"  value="${D2}">

		<input style="display:none" type="hidden" id="test3"  value="${D3}">                                                                             

        <input style="display:none" type="hidden" id="test4"  value="${D4}">
        
        <input style="display:none" type="hidden" id="test5"  value="${D5}">

		<input style="display:none" type="hidden" id="test6"  value="${D6}">

		<input style="display:none" type="hidden" id="test7"  value="${D7}">                                                                             

        <input style="display:none" type="hidden" id="test8"  value="${D8}">
         
        <input style="display:none" type="hidden" id="test9"  value="${D9}">

		<input style="display:none" type="hidden" id="test10"  value="${D10}">

		<input style="display:none" type="hidden" id="test11"  value="${D11}">                                                                             

        <input style="display:none" type="hidden" id="test12"  value="${D12}">

                                                                     
        <br/><br/>                                                                        
		<input type="submit" name="button" id="button" value="預約" >
		<input type="reset" name="button" id="reset" value="重製" >
		
		</div>
		
		<br/><br/>
		

    </form>
 </div>
 

<%@ include file="BookingBrowse1.jsp"%>






<%@ include file="footer.jsp"%>
<%@ include file="JSsetting.jsp"%>
    

<script src="../js/bookinglocationset.js"></script>
<script src="../js/bookingcheck.js"></script>
<script src="../js/bookingcheck2.js"></script>

<script src="../js/bookingcheck-web1.js"></script>
<script src="../js/bookingcheck3.js"></script>
<script src="../js/bookingcheck4.js"></script>

	<script>

     var Today=new Date();

    var x= document.getElementById("date");

    x.setAttribute("value", Today.getFullYear()+"-"+(Today.getMonth()+1)+"-"+"0"+Today.getDate());


     </script>
</body>
</html>
