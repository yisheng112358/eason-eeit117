$('#checkboxGroup input').click(function(){         //只能選取一個時間段
	 if($(this).prop('checked')){
	   $('#checkboxGroup input:checkbox').prop('checked',false);
	   $(this).prop('checked',true);
	   }
	  });


$("#reset").click(function(){                                 //click事件 之後 重製所有圖片
            $("#image1").attr("src","../images/yet.jpg");      
            $("#image2").attr("src","../images/yet.jpg");      
            $("#image3").attr("src","../images/yet.jpg");      
            $("#image4").attr("src","../images/yet.jpg");      
            $("#image5").attr("src","../images/yet.jpg");      
            $("#image6").attr("src","../images/yet.jpg");      
            $("#image7").attr("src","../images/yet.jpg");      
            $("#image8").attr("src","../images/yet.jpg");      
            $("#image9").attr("src","../images/yet.jpg");      
            $("#image10").attr("src","../images/yet.jpg");      
            $("#image11").attr("src","../images/yet.jpg");      
            $("#image12").attr("src","../images/yet.jpg");      
});
