function validateRoute(isSubmit){ 
		var productId = document.getElementById("productId").value;		
		var factoryId = document.getElementById("factoryId").value;	
		var allowSubmit=true,isCorrect=true;
		var productTip = document.getElementById("productTip");
		if(!productId||productId==''){
			isCorrect= false;
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		productTip.setAttribute("color",isCorrect==true?"green":"red");
		
		var factoryTip = document.getElementById("factoryTip");
		isCorrect= true;
		if(!factoryId||factoryId==''){
			isCorrect= false;
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		factoryTip.setAttribute("color",isCorrect==true?"green":"red");
		
		var areaTip = document.getElementById("areaTip");
		isCorrect= true;
		var cacheArea = document.getElementsByName("checkAreaId")
		if(!cacheArea||cacheArea.length==0){
			isCorrect= false;
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		areaTip.setAttribute("color",isCorrect==true?"green":"red");
		
		if(allowSubmit==true&&isSubmit){
			document.getElementById("routeForm").submit();
		}
			
}