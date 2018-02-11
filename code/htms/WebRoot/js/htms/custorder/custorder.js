
function showOrHideOrderDetail(boxId,displayId){
	var boxValue =document.getElementById(boxId).value;
	if(boxValue=='1'){
		document.getElementById(displayId).style.display="block";
		document.getElementById("selfFetch").value=1;
	}
	if(boxValue=='2'){
		document.getElementById(displayId).style.display="block";
		document.getElementById("selfFetch").value=2;
	}
	if(boxValue=='0'){
		document.getElementById(displayId).style.display="none";
		document.getElementById("selfFetch").value=0;
	}
}

var itemsNos=[];

	function validateApplyTonNum(itemNo){
		var applyTonNum=document.getElementById("applyTonNum"+itemNo).value;
		var reg = /(^$)|(^\d+(\.\d{0,3})?$)/;
		//var applyTonNumTip =  document.getElementById("applyTonNumTip")
		if(!reg.test(applyTonNum)){
				alertTip("请输入申请数，为整数或带3位小数的数");
				//alert("请输入申请数，为整数或带3位小数的数");
				//document.getElementById("applyTonNum"+itemNo).setAttribute("color", "red");
				document.getElementById("applyTonNum"+itemNo).style.color="red";
				return false;
			}
		
		var applyNum=parseFloat(document.getElementById("applyTonNum"+itemNo).value);
		var appliableAmount=parseFloat(document.getElementById("initAppliableAmount"+itemNo).value);
		if(applyNum > appliableAmount){
			alertTip("申请数不能超过可申请数量");
			//alert("申请数不能超过可申请数量");
			document.getElementById("applyTonNum"+itemNo).style.color="red";
			return false;
		}
		//document.getElementById("applyTonNumTip").innerHTML="";
		applyTonNum=document.getElementById("applyTonNum"+itemNo).value;
		applyTonNum=applyTonNum?applyTonNum:"0.0";
		
		var initAppliedAmount = document.getElementById("initAppliedAmount"+itemNo).value+"";
		initAppliedAmount=initAppliedAmount?initAppliedAmount:"0.0";
		//alert("initAppliedAmount="+initAppliedAmount+",applyTonNum="+applyTonNum);
		
		var newAppliedAmount=calculator.add(initAppliedAmount,applyTonNum);
		document.getElementById("appliedAmount"+itemNo).value=newAppliedAmount;
		
		var initAppliableAmount = document.getElementById("initAppliableAmount"+itemNo).value+"";
		initAppliableAmount=initAppliableAmount?initAppliableAmount:"0.0";
		
	
		
		var newAppliableAmount=calculator.sub(initAppliableAmount,applyTonNum);
		document.getElementById("appliableAmount"+itemNo).value=newAppliableAmount;
		
		document.getElementById("applyTonNum"+itemNo).setAttribute("color", "green");
		document.getElementById("applyTonNum"+itemNo).style.color="green";
		return true;
	}

	function validateApplyPackNum(itemNo){
		var applyPackNum=document.getElementById("applyPackNum"+itemNo).value;
		var reg = /(^$)|(^\d+?$)/;
		/*if(!applyPackNum){
			alert("请输入包数。");
			document.getElementById("applyPackNum"+itemNo).style.color="red";
			return false;
		}*/
		if(!reg.test(applyPackNum)){
				alertTip("包数需输入整数");	
				//alert("包数需输入整数");
				document.getElementById("applyPackNum"+itemNo).style.color="red";
				return false;
			}
		
		document.getElementById("applyPackNum"+itemNo).style.color="green";
		return true;
	}
	/**
	 * 贸易商自提检验
	 * @return
	 */
	function validateTrader(isSelfFetchCar){
		var selfFetch=document.getElementById("selfFetch");
		//console.log(selfFetch.value);
    	if(!(selfFetch.value=='1'||selfFetch.value=='2')){
    		return true
    	}
		var fetchDriver=document.getElementById("fetchDriver").value;
		fetchDriver=fetchDriver?fetchDriver:"";
		fetchDriver=fetchDriver.replace(/\s+/g,"");
		var isPass =true;
		if(fetchDriver==null||fetchDriver==''){
			document.getElementById("fetchDriverTip").innerHTML="请输入司机姓名。";
			//document.getElementById("fetchDriver").focus();
			isPass = false;
		}
		
		var fetchMobile=document.getElementById("fetchMobile").value;
		fetchMobile=fetchMobile?fetchMobile:"";
		fetchMobile=fetchMobile.replace(/\s+/g,"");
		if(fetchMobile==null||fetchMobile==''){
			document.getElementById("fetchMobileTip").innerHTML="请输入联系方式。";
			//document.getElementById("fetchMobile").focus();
			isPass = false;
		}
		var fetchCar="";
		try{
			try{
				fetchCar=document.getElementById("fetchCar").value;
				fetchCar=fetchCar?fetchCar:"";
			}catch(error){
				if(fetchCar==""){
					fetchCar=document.getElementById("fetchCar").selected;
				}
			}
			//alert("isFetchisFetchisFetch   "+fetchCar);
			fetchCar=fetchCar.replace(/\s+/g,"");
		}catch(errException){
			
		}
		if(fetchCar==null||fetchCar==''){
			document.getElementById("fetchCarTip").innerHTML="请输入自提车牌号。";
			//document.getElementById("fetchCar").focus();
			isPass = false;
		}
		
		return isPass;
	}
	
	/*function doValidate(isTraders){
		var caddrId=document.getElementById("caddrId").value;
		if(!caddrId){
			document.getElementById("caddrIdTip").innerHTML="请选择或输入发货地址。";
			return false;
		}
		var factoryId = document.getElementById("factoryId").value;
		var productId = document.getElementById("productId").value;
		if((factoryId==null||factoryId=="")||(productId==null||productId=="")){
			alert("没有找到匹配的线路,请与物流公司联系");
			validateForm(isTraders);
		}else{
		var selectCaddrId = document.getElementById("caddrId"); 
		var index = selectCaddrId.selectedIndex; 
		var caddrId= selectCaddrId.options[index].value;
		var optionId = selectCaddrId.options[index].id;
		var areaId = document.getElementById("areaId").value;
			areaId=optionId;
		var basePath = basePath + '/controller.do';
		var parmas = {operation:'getRoute',"areaId":areaId,"factoryId":factoryId,"productId":productId};
		Ajax.get(basePath,parmas,function(msg){
			var jsonMsg = JSON.parse(msg);
			if(parseInt(jsonMsg.isSuccess) == 1){
				//isSubmit= true;
				validateForm(isTraders);
			}else{
				alert("没有找到匹配的线路,请与物流公司联系");
				//isSubmit= false;
				validateForm(isTraders);
			}
		});
		}
	}*/
		var submitSwitch=true;
		


function getEstimateFreight(){
		var areaId=document.getElementById("areaId").value;
		var areaCode="";
		var result =false;
		var applyTime=document.getElementById("createTime").value;
		var customerId=document.getElementById("customerId").value;

		var corderId=document.getElementById("corderId").value;
		var orderCode=document.getElementById("orderCode").value;
		
		
		
		var customerCode=document.getElementById("customerCode").value;
		
		var factoryId="";
		var productId="";
		var itemCode = "";
		var applyTonNum="";
		var codetailId="";
		
		for(var i=0;i<itemsNos.length;i++){
			var tonNum=document.getElementById("applyTonNum"+itemsNos[i]).value;
			if(!(tonNum==null||tonNum=="")&&parseFloat(tonNum)>0){
				//alert(tonNum+"  first   " +itemsNos[i]);
				factoryId   +=  document.getElementById("factoryId"+itemsNos[i]).value+",";
				productId   +=  document.getElementById("productId"+itemsNos[i]).value+",";
				itemCode    +=  document.getElementById("itemCode"+itemsNos[i]).value+",";
				applyTonNum +=  document.getElementById("applyTonNum"+itemsNos[i]).value+",";
				codetailId +=  document.getElementById("codetailId"+itemsNos[i]).value+",";
			}
		}
		
		if(applyTonNum!=""){
			factoryId =	factoryId.substring(0,factoryId.length-1);
			productId = productId.substring(0,productId.length-1);
			itemCode =	itemCode.substring(0,itemCode.length-1);
			applyTonNum =	applyTonNum.substring(0,applyTonNum.length-1);		
			codetailId=codetailId.substring(0,codetailId.length-1);		
		}
		
		var selfFetchStatus="false";
		try{
			selfFetchStatus=document.getElementById("selfFetchOn").checked;
			if(selfFetchStatus==null||selfFetchStatus==""){
				selfFetchStatus = "false";
			}
		}catch(err){
			selfFetchStatus = "false";
		}
		
		var selfFetchType="1";
		try{
			selfFetchType=document.getElementById("selfFetchOn").value;
			if(selfFetchType==null||selfFetchType==""){
				selfFetchType = "1";
			}
		}catch(err){
			selfFetchType = "1";
		}
		
		//alert("selfFetchType selfFetchType "+selfFetchStatus+"    " +selfFetchType+"  "+customerCode);
		
		
		
		var basePath = basePath + '/controller.do';
		var parmas = {operation:'ajaxCalculationFreight',"orderId":corderId,"orderCode":orderCode,"itemId":codetailId,"areaId":areaId,"areaCode":areaCode,"customerId":customerId,
				"factoryId":factoryId,"productId":productId,"itemCode":itemCode,"selfFetchStatus":selfFetchStatus,"customerCode":customerCode,"selfFetchType":selfFetchType,"applyTonNum":applyTonNum,"applyTime":applyTime};
		$.ajax({
		    url:basePath,
		    type:'POST', //GET
		    async:false,    //或false,是否异步
		    data:parmas,
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
				//result=true;
				confirmTip(data.msg+"是否继续提交?",function(){
					submitFrom();
				},function (){
					result=false;
				});
				
				/*var routeResult=confirm(data.msg+"是否继续提交?");
				if(routeResult==false){
					result=false;
					return false;
				}
				if(routeResult==true){
					return true;
				}*/
		    },
		    error:function(xhr,textStatus){
		    	result=false;
		    }
		})
		
		return result;
	}


   function validateMarketAvailableNum(){
	   var applyTonNum=null;
	   var marketAvailableNum=null;
	   var result=false;
	   for(var i=0;i<itemsNos.length;i++){
			if(validateApplyTonNum(itemsNos[i])==false){
				return false;	
			}
			if(validateApplyPackNum(itemsNos[i])==false){
				return false;	
			}
			applyTonNum=document.getElementById("applyTonNum"+itemsNos[i]).value;
			marketAvailableNum=document.getElementById("marketAvailableNum"+itemsNos[i]).value;
			
			if(applyTonNum!=''&&applyTonNum!=null&&marketAvailableNum!=''&&marketAvailableNum!=null&&parseInt(marketAvailableNum)<parseInt(applyTonNum)){
				//console.log(marketAvailableNum+"    "+applyTonNum);
				result= true;
				break;
			}else{
				result= false;
			}
		}
	   
	   
	   var freight=getEstimateFreight();
		if(!freight){
			return false ;
		}
	   /*
	   if(result){
		   confirmTip("申请数量超过建议可申请数量，是否继续提交?",function(){
				var freight=getEstimateFreight();
				if(!freight){
					return false ;
				}
				return true;
			},function (){
				return false;
			});
	   }else{
		   var freight=getEstimateFreight();
			if(!freight){
				return false ;
			}
	   }*/
	   
   }
   
	
	
	function validateForm(isTraders,isFetch,isSelfFetchCar){	
		var isSubmit= true;	
		
		if(isSubmit==false){
			return false;
		}
		var empty=true;
		var applyTonNum=null;
		var applyPackNum=null;
		for(var i=0;i<itemsNos.length;i++){
			if(validateApplyTonNum(itemsNos[i])==false){
				return false;	
			}
			if(validateApplyPackNum(itemsNos[i])==false){
				return false;	
			}
			applyTonNum=document.getElementById("applyTonNum"+itemsNos[i]).value;
			applyPackNum=document.getElementById("applyPackNum"+itemsNos[i]).value;
			if(applyTonNum!=''&&applyTonNum!=null){
				empty=false;
			}
		}
		if(empty){
			alertTip("至少输入一项申请数");
			//alert("至少输入一项申请数");
			return false;
		}
		
		
		
		var caddrId=document.getElementById("caddrId").value;
		if(!caddrId){
			document.getElementById("caddrIdTip").innerHTML="请选择或输入发货地址。";
			isSubmit= false;
		}
		
		//alert(isTraders+"    "+isFetch);
		if((isTraders==1&&isFetch=="true")||isSelfFetchCar=="true"){
			if(validateTrader(isSelfFetchCar)==false){
				isSubmit = false;	
			}
		}
		
		
		if(isSubmit){
			var pointShip="";
			//不同的装运点不能同时申请
			for(var i=0;i<itemsNos.length;i++){
				applyTonNum=document.getElementById("applyTonNum"+itemsNos[i]).value;
				if(applyTonNum!=''&&applyTonNum!=null){
					if(pointShip==""){
						pointShip=$("#shipPoint"+itemsNos[i]).val();
						//alert(pointShip);
					}else{
						var elsePointShip=$("#shipPoint"+itemsNos[i]).val();
						if(pointShip!=elsePointShip){
							alertTip("不相同的装运点 不能同时提交申请");
							//alert("不相同的装运点 不能同时提交申请！");
							return ;
						}
					}
				}
			}
			
			validateMarketAvailableNum();
		/*	//提交之前删除订单为空的tr行
			for(var i=0;i<itemsNos.length;i++){
				applyTonNum=document.getElementById("applyTonNum"+itemsNos[i]).value;
				if(applyTonNum==''||applyTonNum==null){
					var trid="applyTrInfor"+itemsNos[i];
					$("#"+trid).remove();
				}
			}	
         if(submitSwitch){
			//alert("提交");
			document.getElementById("custOrderForm").submit();
			submitSwitch=false;
          }*/
		}
	}
	
	function submitFrom(){
		//提交之前删除订单为空的tr行
		for(var i=0;i<itemsNos.length;i++){
			applyTonNum=document.getElementById("applyTonNum"+itemsNos[i]).value;
			if(applyTonNum==''||applyTonNum==null){
				var trid="applyTrInfor"+itemsNos[i];
				$("#"+trid).remove();
			}
		}	
     if(submitSwitch){
    	 submitSwitch=false;
		document.getElementById("custOrderForm").submit();
      }
	}
	
/*	function changeNum(typeName,itemNo){
		var applyTonNum=document.getElementById("applyTonNum"+itemNo).value;
			applyTonNum=applyTonNum?applyTonNum:"0.0";
			
			var appliedAmount = document.getElementById("appliedAmount"+itemNo).value;
			appliedAmount=appliedAmount?appliedAmount:"0.0";
			
			var newAppliedAmount=calculator.add(applyTonNum,appliedAmount);
			document.getElementById("showAppliedAmount"+itemNo).value=newAppliedAmount;
			
			var appliableAmount = document.getElementById("appliableAmount"+itemNo).value;
			appliableAmount=appliableAmount?appliableAmount:"0.0";
			
			var orderAmount = document.getElementById("orderAmount").value;
			orderAmount=orderAmount?orderAmount:"0.0";
			
			var newAppliableAmount=calculator.sub(orderAmount,newAppliedAmount);
			document.getElementById("showAppliableAmount").value=newAppliableAmount;
	}*/