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
			            <h2 class="mb-4" style="font-size: 34px; text-transform: capitalize;">We're Functioning for Almost <span class="number" data-number="30">0</span> Years</h2>
			            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
			            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
			            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
			          </div>
</div>
</section>
<hr/>


      <section class="ftco-section ftco-no-pb ftco-no-pt ftco-program bg-light" id="programs-section">
      <div class="container"  >
        <div class="row no-gutters" >
          <div class="col-md-4 ftco-animate py-5 nav-link-wrap js-fullheight" >
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link px-4 active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true"><span class="mr-3 flaticon-gym"></span> 巨巨之路</a>

              <a class="nav-link px-4" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false"><span class="mr-3 flaticon-body"></span> 苗條一路</a>

              <a class="nav-link px-4" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false"><span class="mr-3 flaticon-woman"></span> 健美之路</a>

              <a class="nav-link px-4" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false"><span class="mr-3 flaticon-abs"></span> 造肌之路</a>


            </div>
          </div>
          <div class="col-md-8 ftco-animate p-4 p-md-5 d-flex align-items-center js-fullheight">
            
            <div class="tab-content pl-md-5" id="v-pills-tabContent">

              <div class="tab-pane fade show active py-0" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
                <span class="icon mb-3 d-block flaticon-gym"></span>
                <h2 class="mb-4">巨巨之路</h2>    <img width="400" height="400" src="../images/bigh.jpg">
                <p style="font-size:30px;">前往巨巨之路,都是孤獨的</p>
                <p style="font-size:30px">我不是不練,我只是不想練太壯</p>
                
              </div>

              <div class="tab-pane fade py-0" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
                <span class="icon mb-3 d-block flaticon-body"></span>
                <h2 class="mb-4">苗條一路</h2>    <img width="400" height="400" src="../images/biga.jpg">
                <p style="font-size:30px;">苗條一路,有我沒你</p>
                <p style="font-size:30px;">只有非常努力,才能看起來毫不費力</p>
               
              </div>

              <div class="tab-pane fade py-0" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
                <span class="icon mb-3 d-block flaticon-woman"></span>
                <h2 class="mb-4">健美之路</h2>   <img width="400" height="400" src="../images/bigb.jpg">
                <p style="font-size:30px;">健身到了一定境界，何需再看臉,當你不要臉時,你就贏了</p>
                <p style="font-size:30px;">既然沒有俊美的外表,那就去擁有野獸的身體吧</p>
               
              </div>

              <div class="tab-pane fade py-0" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
                <span class="icon mb-3 d-block flaticon-abs"></span>
                <h2 class="mb-4">造肌之路</h2>   <img width="400" height="400" src="../images/bigc.jpg">
                <p style="font-size:30px;">再一下,再一下就好,到底再三小</p>
                <p style="font-size:30px;">我不是在深蹲,就是在深蹲的路上</p>
               
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>

<br><br>


	
	<form style="text-align:center;" action="<c:url  value="/bookingcontroller/bookingCheck"/>" method="post" id="form1" name="form1">

<div>
      <input style="display:none" type="hidden" id="bookingname" name="bookingname"  value="${memberName}"><p style="font-size:30px;">預約者:${memberName}</p>
	 
	 <br>	 
	 
	 
	<input type="date" class="date" id="date" name="date" required value="2020-09-22"  max="2020-10-10" step="1"> <br />

	    <br/><br/>
	    
	  
        
<div id="checkboxGroup" name="checkboxGroup">
        <label class="timefont">預約時間:          <input name="time" type="checkbox" class="checkbox" value="9"/>9:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="11"/>11:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="13"/>13:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="15"/>15:00</label>
</div>

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
		<input type="submit" name="button" id="button" value="預約" style="margin: 80px" >
		<input type="reset" name="button" id="reset" value="重製" >
<!-- 		<input type="button" class="checkbooking" name="button" id="checkbooking" value="查詢" > -->

		</div>
 </form>
 
 
 <% if (memberStatus.equals("2")) {
 	response.sendRedirect("/WeMatch_dev/bookingcontroller/booking2"); 
 }
%>
 
   
<%@ include file="BookingBrowse3.jsp"%>
   
   







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

 console.log(Today.getFullYear())
 console.log(Today.getMonth()+1)
 console.log(Today.getDate())

 

     </script>
     <script>

 $('.checkbooking').click(function(){
		var dateA=document.getElementById("date");
		var date=dateA.value;
		var time=$('input[name=time]:checked').val();
		var nameA=document.getElementById("bookingname");
		var name=nameA.value;

		$.ajax({
type:"GET",
url:"/WeMatch_dev/bookingcontroller/selectbooking",
data:{
	'date':date,
	'time':time,
	'name':name,
},

success:function(data){
console.log("success");
	
}
})
			
})
	   
	   


     </script>
     
     
</body>
</html>
