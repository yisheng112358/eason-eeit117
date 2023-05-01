$("#button").click(function(){
	var Dumbbells1=$("input[name='Dumbbells1']:checked").length;   
	var Dumbbells2=$("input[name='Dumbbells2']:checked").length;
	var Dumbbells3=$("input[name='Dumbbells3']:checked").length;
	var Dumbbells4=$("input[name='Dumbbells4']:checked").length;
	var Dumbbells5=$("input[name='Dumbbells5']:checked").length;   
	var Dumbbells6=$("input[name='Dumbbells6']:checked").length;
	var Dumbbells7=$("input[name='Dumbbells7']:checked").length;
	var Dumbbells8=$("input[name='Dumbbells8']:checked").length;
	var Dumbbells9=$("input[name='Dumbbells9']:checked").length;   
	var Dumbbells10=$("input[name='Dumbbells10']:checked").length;
	var Dumbbells11=$("input[name='Dumbbells11']:checked").length;
	var Dumbbells12=$("input[name='Dumbbells12']:checked").length;
	
	var check=$("input[name='time']:checked").length;//判斷有多少個方框被勾選
	
	
	if(check==0){
	 alert("您尚未選取時間喔");
	 return false;//不要提交表單
	}
	else{
	
	  if(Dumbbells1==0 && Dumbbells2==0 && Dumbbells3==0 && Dumbbells4==0 && Dumbbells5==0 && Dumbbells6==0 && Dumbbells7==0 && Dumbbells8==0 && Dumbbells9==0 && Dumbbells10==0 && Dumbbells11==0 && Dumbbells12==0){
	   alert("您尚未選取器材位置");
	   return false;//不要提交表單
	  }
	  else{
	  alert("您已成功預約");
	  return true;//提交表單
	  }
	    
}


})