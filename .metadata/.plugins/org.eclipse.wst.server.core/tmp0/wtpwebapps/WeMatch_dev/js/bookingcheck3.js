$("#checkDB").click(function () {

               var result = document.getElementById("result");
							
			    $.ajax({
			        type: "GET",
			        url: "/WeMatch_dev/bookingcontroller/select", 
			           data:{
						
						},
			          success: function (data) {
                       alert("測試26")
                       
                       var txt='';
                       
                       
                       
                     for(var x=0;x<data.date.length;x++){
                     
					 
					 txt += "<tr><td>"+data.date[x]+"</td></tr><tr><td>"+data.time[x]+"</td></tr><tr><td><input type='submit' value='刪除'></td></tr>"
					 
					
					 
					}
					
					console.log("txt"+txt);
					
					$("#result").append(txt);

               

                      

                    
			        }
			    });         
			}); 
			

			
