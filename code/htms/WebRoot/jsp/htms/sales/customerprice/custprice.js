	function validateTransPrice(isSubmit){ 
		var priceType = document.getElementById("priceType").value;		
		var priceUnit = document.getElementById("priceUnit").value;			
		var priceStart = document.getElementById("priceStart").value;				
		var priceEnd = document.getElementById("priceEnd").value;
		
		var freightModel = document.getElementById("freightModel").value;		
		var customerPrice = document.getElementById("customerPrice").value;				
		var carrierPrice = document.getElementById("carrierPrice").value;		
		
		var customerOnePrice = document.getElementById("customerOnePrice").value;	
		var carrierOnePrice = document.getElementById("carrierOnePrice").value;
		var allowSubmit=true,isCorrect=true;
		var tester=/^\d+(\.\d{0,2})?$/;
		
		
		var typeTip = document.getElementById("typeTip");
		if(priceType==null||priceType==''||priceUnit==null||priceUnit==''){	
			isCorrect=false;
		}else{
			isCorrect=true;
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		typeTip.setAttribute("color",isCorrect==true?"green":"red");
		
		/*检验区间*/
		isCorrect=true;
		var priceTip = document.getElementById("priceTip");
		if(priceStart==null||priceStart==''){	
			isCorrect=false;
		}else{
			isCorrect=tester.test(priceStart);
		}
		
		if(priceEnd!=null&&priceEnd!=''){
			isCorrect=tester.test(priceEnd);
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		priceTip.setAttribute("color",isCorrect==true?"green":"red");
		
		/*检验单价计价模式*/
		isCorrect=true;
		var singleTip = document.getElementById("singleTip");
		if(freightModel=='1'){
			if((customerPrice==null||customerPrice=='')||(carrierPrice==null||carrierPrice=='')){
				isCorrect=false;
			}else{
				isCorrect=tester.test(customerPrice);
				isCorrect=isCorrect?tester.test(carrierPrice):isCorrect;
			}
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		singleTip.setAttribute("color",isCorrect==true?"green":"red");
		
		/*检验一口价计价模式*/
		isCorrect=true;
		var allTip = document.getElementById("allTip");
		if(freightModel=='2'){
			if((customerOnePrice==null||customerOnePrice=='')||(carrierOnePrice==null||carrierOnePrice=='')){	
				isCorrect=false;
			}else{
				isCorrect=tester.test(customerOnePrice);
				isCorrect=isCorrect?tester.test(carrierOnePrice):isCorrect;
			}
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		allTip.setAttribute("color",isCorrect==true?"green":"red");
		
		if(allowSubmit==true&&isSubmit){
			if(freightModel=='1'){//单价计价模式,将一口价中的值置空
				document.getElementById("customerOnePrice").value='';	
				document.getElementById("carrierOnePrice").value='';
			}
				
			if(freightModel=='2'){//一口价计价模式,将单价中的值置空
				document.getElementById("customerPrice").value='';	
				document.getElementById("carrierPrice").value='';
			}
			
			document.getElementById("customerPriceForm").submit();
		}
	}
	
	
	function selectOption(selectObj,selectedValue){
		if(!selectedValue){
			return;
		}
		var options=document.getElementById(selectObj).options;
		if(!options){
			return;
		}
		var tempValue = null;
		for(var i=0;i<options.length;i++){
			tempValue = options[i].value;
			if(!tempValue){
				continue;
			}
			if(tempValue==selectedValue){
				options[i].selected = true; 
				break;
			}
		}
	}
	
	function selectFreightModel(modelId,modelValue){
		document.getElementById("singlePrice").style.display="none";
		document.getElementById("allPrice").style.display="none";
		document.getElementById(modelId).style.display="block";
		if(modelValue=='1'){
			document.getElementById("singleModel").checked="true";
		}
		if(modelValue=='2'){
			document.getElementById("allModel").checked="true";
		}
		document.getElementById("freightModel").value=modelValue;
	}
	
	function validatePrice(obj){
		if(!obj||!obj.value){
			return;
		}
		var tester=/^\d+(\.\d{0,2})?$/;
		if(!tester.test(obj.value)){
			obj.style.color="red";
			obj.setAttribute("color","red");
			alertTip("请输入正确的运价，运价为整数或保留两位小数。");
			//obj.focus();
		}else{
			obj.style.color="green";
			obj.setAttribute("color","green");
			
		}
	}
	
	
	function validateBatchCustomerPrice(isSubmit,switchOperation){ 
		var priceType = document.getElementById("priceType").value;		
		var priceUnit = document.getElementById("priceUnit").value;			
		var priceStart = document.getElementById("priceStart").value;				
		var priceEnd = document.getElementById("priceEnd").value;	
		
		var freightModel = document.getElementById("freightModel").value;
		
		var allowSubmit=true,isCorrect=true;
		var tester=/^\d+(\.\d{0,2})?$/;
		
		var typeTip = document.getElementById("typeTip");
		if(priceType==null||priceType==''||priceUnit==null||priceUnit==''){	
			isCorrect=false;
		}else{
			isCorrect=true;
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		typeTip.setAttribute("color",isCorrect==true?"green":"red");
		
		/*检验区间*/
		isCorrect=true;
		var priceTip = document.getElementById("priceTip");
		if(priceStart==null||priceStart==''){	
			isCorrect=false;
		}else{
			isCorrect=tester.test(priceStart);
		}
		
		if(priceEnd!=null&&priceEnd!=''){
			isCorrect=tester.test(priceEnd);
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		priceTip.setAttribute("color",isCorrect==true?"green":"red");
		
		/*校验客户名称*/
		isCorrect=true;
		var customerId=document.getElementById("customerId").value;
		var customerTip = document.getElementById("customerTip");
		if(customerId==null||customerId==''){	
			isCorrect=false;
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		customerTip.setAttribute("color",isCorrect==true?"green":"red");
		
		isCorrect=true;
		if(checkBatchPrice("batchCustomerPrice","batchCarrierPrice",allowSubmit)==false){
			isCorrect=false;
			alertTip("没有输入运价不能保存。请在列表中输入客户运价或承运商运价。");
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		if(allowSubmit==true&&isSubmit){
			
			if(freightModel&&freightModel=='1'){
				document.getElementById("operation").value="addBatchSingleCustomerPrice";
			}
			if(freightModel&&freightModel=='2'){
				document.getElementById("operation").value="addBatchAllCustomerPrice";
			}	
		
			document.getElementById("transPriceForm").submit();
		}
	}
	
	function checkBatchPrice(customerPricesName,carrierPricesName,allowSubmit){
		var customerPrices=document.getElementsByName(customerPricesName);
		var carrierPrices=document.getElementsByName(carrierPricesName);
		var bindRoutes=document.getElementsByName("bindRouteId");
		
		if(!customerPrices||customerPrices.length==0||!carrierPrices||carrierPrices.length==0){
			//alert(batchPricesName+"!prices||prices.length==0");
			return false;
		}
		var removeObjs=[];
		var notNull=false;
		for(var i=0;i<customerPrices.length;i++){
				if((customerPrices[i].value==null||customerPrices[i].value=='')&&(carrierPrices[i].value==null||carrierPrices[i].value=='')){
					removeObjs[removeObjs.length]=customerPrices[i];
					removeObjs[removeObjs.length]=carrierPrices[i];
					removeObjs[removeObjs.length]=bindRoutes[i];
					continue;
				}
				//alert(batchPricesName+",true,prices.length="+prices.length);
				notNull= true;
		}
		if(allowSubmit&&notNull){
			for(var i =0;i<removeObjs.length;i++){
				removeObjs[i].parentNode.removeChild(removeObjs[i]);
			}
		}else{
			removeObjs=[];
		}
		//alert(batchPricesName+",false,prices.length="+prices.length);
		return notNull;
	}
	