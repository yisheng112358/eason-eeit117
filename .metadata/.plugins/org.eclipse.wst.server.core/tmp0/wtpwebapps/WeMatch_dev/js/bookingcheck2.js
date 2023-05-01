$('.timefont').change(function () {
				var dateA=document.getElementById("date");
				var date=dateA.value;
				var time=$('input[name=time]:checked').val();
				var my=document.getElementById("test1");
				
			    $.ajax({
			        type: "GET",
			        url: "/WeMatch_dev/bookingcontroller/bookingCheck2",
				     data:{
							'date':date,
							'time':time
						},

			        success: function (data) {
                       var z = data.D1.includes("Dumbbells1") ;

                      
                       if(z){
                    	    $("#image1").attr("src","../images/ordered.jpg")
					        $("#Dumbbells1").attr("disabled","disabled")
					        $("#image1").attr('onclick','null').unbind('click');
                         }else{
                             $("#image1").attr("src","../images/yet.jpg")
                             $("#Dumbbells1").removeAttr('disabled');
                             $("#image1").attr("onclick","myfunction();");
                            
                         }
                        

                       var z = data.D2.includes("Dumbbells2") ;
                       if(z){
                    	    $("#image2").attr("src","../images/ordered.jpg")
					        $("#Dumbbells2").attr("disabled","disabled")
					        $("#image2").attr('onclick','null').unbind('click');
                         }else{
                             $("#image2").attr("src","../images/yet.jpg")
                             $("#Dumbbells2").removeAttr('disabled');
                             $("#image2").attr("onclick","myfunction2();");
                         }
                         

                       var z = data.D3.includes("Dumbbells3") ;
                       if(z){
                    	    $("#image3").attr("src","../images/ordered.jpg")
					        $("#Dumbbells3").attr("disabled","disabled")
					        $("#image3").attr('onclick','null').unbind('click');
                         }else{
                             $("#image3").attr("src","../images/yet.jpg")
                             $("#Dumbbells3").removeAttr('disabled');
                             $("#image3").attr("onclick","myfunction3();");
                             
                         }

                       var z = data.D4.includes("Dumbbells4") ;
                       if(z){
                    	    $("#image4").attr("src","../images/ordered.jpg")
					        $("#Dumbbells4").attr("disabled","disabled")
					        $("#image4").attr('onclick','null').unbind('click');
                         }else{
                             $("#image4").attr("src","../images/yet.jpg")
                             $("#Dumbbells4").removeAttr('disabled');
                             $("#image4").attr("onclick","myfunction4();");
                             
                         }

                       var z = data.D5.includes("Dumbbells5") ;
                       if(z){
                    	    $("#image5").attr("src","../images/ordered.jpg")
					        $("#Dumbbells5").attr("disabled","disabled")
					        $("#image5").attr('onclick','null').unbind('click');
                         }else{
                             $("#image5").attr("src","../images/yet.jpg")
                             $("#Dumbbells5").removeAttr('disabled');
                             $("#image5").attr("onclick","myfunction5();");
                             
                         }

                       var z = data.D6.includes("Dumbbells6") ;
                       if(z){
                    	    $("#image6").attr("src","../images/ordered.jpg")
					        $("#Dumbbells6").attr("disabled","disabled")
					        $("#image6").attr('onclick','null').unbind('click');
                         }else{
                             $("#image6").attr("src","../images/yet.jpg")
                             $("#Dumbbells6").removeAttr('disabled');
                             $("#image6").attr("onclick","myfunction6();");
                             
                         }

                       var z = data.D7.includes("Dumbbells7") ;
                       if(z){
                    	    $("#image7").attr("src","../images/ordered.jpg")
					        $("#Dumbbells7").attr("disabled","disabled")
					        $("#image7").attr('onclick','null').unbind('click');
                         }else{
                             $("#image7").attr("src","../images/yet.jpg")
                             $("#Dumbbells7").removeAttr('disabled');
                             $("#image7").attr("onclick","myfunction7();");
                             
                         }

                       var z = data.D8.includes("Dumbbells8") ;
                       if(z){
                    	    $("#image8").attr("src","../images/ordered.jpg")
					        $("#Dumbbells8").attr("disabled","disabled")
					        $("#image8").attr('onclick','null').unbind('click');
                         }else{
                             $("#image8").attr("src","../images/yet.jpg")
                             $("#Dumbbells8").removeAttr('disabled');
                             $("#image8").attr("onclick","myfunction8();");
                             
                         }


                       var z = data.D9.includes("Dumbbells9") ;
                       if(z){
                    	    $("#image9").attr("src","../images/ordered.jpg")
					        $("#Dumbbells9").attr("disabled","disabled")
					        $("#image9").attr('onclick','null').unbind('click');
                         }else{
                             $("#image9").attr("src","../images/yet.jpg")
                             $("#Dumbbells9").removeAttr('disabled');
                             $("#image9").attr("onclick","myfunction9();");
                             
                         }

                       var z = data.D10.includes("Dumbbells10") ;
                       if(z){
                    	    $("#image10").attr("src","../images/ordered.jpg")
					        $("#Dumbbells10").attr("disabled","disabled")
					        $("#image10").attr('onclick','null').unbind('click');
                         }else{
                             $("#image10").attr("src","../images/yet.jpg")
                             $("#Dumbbells10").removeAttr('disabled');
                             $("#image10").attr("onclick","myfunction10();");
                             
                         }


                       var z = data.D11.includes("Dumbbells11") ;
                       if(z){
                    	    $("#image11").attr("src","../images/ordered.jpg")
					        $("#Dumbbells11").attr("disabled","disabled")
					        $("#image11").attr('onclick','null').unbind('click');
                         }else{
                             $("#image11").attr("src","../images/yet.jpg")
                             $("#Dumbbells11").removeAttr('disabled');
                             $("#image11").attr("onclick","myfunction11();");
                             
                         }

                       var z = data.D12.includes("Dumbbells12") ;
                       if(z){
                    	    $("#image12").attr("src","../images/ordered.jpg")
					        $("#Dumbbells12").attr("disabled","disabled")
					        $("#image12").attr('onclick','null').unbind('click');
                         }else{
                             $("#image12").attr("src","../images/yet.jpg")
                             $("#Dumbbells12").removeAttr('disabled');
                             $("#image12").attr("onclick","myfunction12();");
                             
                         }

						

						



                    
			            
			                   
			        }
			    });         
			}); 
			

			
