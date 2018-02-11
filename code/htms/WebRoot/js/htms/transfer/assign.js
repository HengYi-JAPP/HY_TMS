

var itemsNos=[];
/*避免页面没有处理完之前，重复提交标识*/
var isSubmit = false;
function validateAssignForm(){
	var currentCarrierId = document.getElementById("currentCarrierId").value;
	 if(!currentCarrierId){
		// alert("请在保存之前，选择承运商。");
		 alertTip("请在保存之前，选择承运商。");
		// $.DialogByZ.Alert({Title: "提示", Content:"请在保存之前，选择承运商。",BtnL:"确定",FunL:alerts});
	 	 return false;
	 }
	 
 	 var freight=getEstimateFreight();
	 if(!freight){
		 return;
	 }
	 
	/* if(isSubmit==false){
		 isSubmit=true;
		 document.getElementById("splitForm").submit();
	 }*/
	 return true;
}

function submitFrom(){
	if(isSubmit==false){
		 isSubmit=true;
		 document.getElementById("splitForm").submit();
	 }
}

function getEstimateFreight(){
	var areaId=document.getElementById("areaId").value;
	var areaCode="";
	var result =false;
	var applyTime   = document.getElementById("applyTime").value;
	var customerId  = document.getElementById("customerId").value;
    var transId     = document.getElementById("transId").value;
    var corderId    = document.getElementById("corderId").value;
    var shipId      = document.getElementById("shipId").value;
    var corderCode=document.getElementById("corderCode").value;
	var factoryId="";
	var productId="";
	var itemCode = "";
	var applyTonNum="";
	var transDetailId="";
	
	for(var i=0;i<itemsNos.length;i++){
		var tonNum=document.getElementById("appliableTon"+itemsNos[i]).value;
		if(!(tonNum==null||tonNum=="")&&parseFloat(tonNum)>0){
			//alert(tonNum+"  first   " +itemsNos[i]);
			factoryId   +=  document.getElementById("factoryId"+itemsNos[i]).value+",";
			productId   +=  document.getElementById("productId"+itemsNos[i]).value+",";
			itemCode    +=  itemsNos[i]+",";
			applyTonNum +=  document.getElementById("appliableTon"+itemsNos[i]).value+",";
			transDetailId += document.getElementById("transDetailId"+itemsNos[i]).value+",";
		}
	}
	
	if(applyTonNum!=""){
		factoryId =	factoryId.substring(0,factoryId.length-1);
		productId = productId.substring(0,productId.length-1);
		itemCode =	itemCode.substring(0,itemCode.length-1);
		applyTonNum =	applyTonNum.substring(0,applyTonNum.length-1);
		transDetailId= transDetailId.substring(0, transDetailId.length-1);
	}
	
	var basePath = basePath + '/controller.do';
	var parmas = {operation:'ajaxCalculationFreight',"areaId":areaId,"areaCode":areaCode,"customerId":customerId,
			"itemId":transDetailId,"orderId":corderId,"shipId":shipId,"orderCode":corderCode,
			"factoryId":factoryId,"productId":productId,"itemCode":itemCode,"applyTonNum":applyTonNum,"showCarrierPrice":"true","applyTime":applyTime,"transId":transId,"estimateStep":3,"selfFetchStatus":false};
	
	
	var customPrice=document.getElementById("selfFetchOn").checked;
	if(customPrice){	    
	    var freightModel=document.getElementById('freightModel').value;
	    var priceNotice=$('#priceNotice').val();
	    if(freightModel=='1'){
		    var priceType=document.getElementById('priceType').value;
			var priceUnit=document.getElementById('priceUnit').value;
			var customerPrice=document.getElementById('customerPrice').value;
			var carrierPrice=document.getElementById('carrierPrice').value;
			
			parmas = {operation:'ajaxCalculationFreight',"areaId":areaId,"areaCode":areaCode,"customerId":customerId,
					"itemId":transDetailId,"orderId":corderId,"shipId":shipId,"orderCode":corderCode,
					"factoryId":factoryId,"productId":productId,"itemCode":itemCode,"applyTonNum":applyTonNum,"applyTime":applyTime,
					"transId":transId,"customPrice":1,"carrierPrice":carrierPrice,"freightModel":freightModel,"priceNotice":priceNotice,"priceType":priceType,"priceUnit":priceUnit,
					"customerPrice":customerPrice,"estimateStep":"3"};
			        
	    }
	    if(freightModel=='2'){
	        var customerOnePrice=document.getElementById('customerOnePrice').value;
			var carrierOnePrice=document.getElementById('carrierOnePrice').value;
			
			parmas = {operation:'ajaxCalculationFreight',"areaId":areaId,"areaCode":areaCode,"customerId":customerId,
					"itemId":transDetailId,"orderId":corderId,"shipId":shipId,"orderCode":corderCode,
					"factoryId":factoryId,"productId":productId,"carrierOnePrice":carrierOnePrice,"itemCode":itemCode,"applyTonNum":applyTonNum,"applyTime":applyTime,
					"transId":transId,"customPrice":1,"freightModel":freightModel,"customerOnePrice":customerOnePrice,"estimateStep":"3"};
			      
	    }
	}
	
	
	$.ajax({
	    url:basePath,
	    type:'POST', //GET
	    async:false,    //或false,是否异步
	    data:parmas,
	    timeout:5000,    //超时时间
	    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
	    success:function(data,textStatus,jqXHR){
			result=true;
			var resultStr=data.isSuccess;
			if(resultStr==0){
			//	var routeResult=alert(data.msg+"不能继续提交!");
				alertTip(data.msg+"不能继续提交!")
				//$.DialogByZ.Alert({Title: "提示", Content:data.msg+"不能继续提交!",BtnL:"确定",FunL:alerts});
				result=false;
				return false;
			}
			if(resultStr==1){
				confirmTip(data.msg+"是否继续提交?",function(){
					submitFrom();
	  				return true;
				},function(){
					result=false;
					return false;
				});
				/*$.DialogByZ.Confirm({Title: "提示", Content: data.msg+"是否继续提交?",FunL:function() {
	  				$.DialogByZ.Close();
	  				submitFrom();
	  				return true;
	  			},FunR:function(){
	  				$.DialogByZ.Close();
	  				result=false;
					return false;
	  			}});*/
				/*var routeResult=confirm(data.msg+"是否继续提交?");
				if(routeResult==false){
					result=false;
					return false;
				}
				if(routeResult==true){
					return true;
				}*/
			}
	    },
	    error:function(xhr,textStatus){
	    	result=false;
	    }
	})
	
	return result;
}

function validateAsign(){
	var areaId=document.getElementById("areaId").value;
	var result =false;
	
	for(var i=0;i<itemsNos.length;i++){
		var factoryId=document.getElementById("factoryId"+itemsNos[i]).value;
		var productId=document.getElementById("productId"+itemsNos[i]).value;
		
		var basePath = basePath + '/controller.do';
		var parmas = {operation:'getRoute',"areaId":areaId,"factoryId":factoryId,"productId":productId};
		$.ajax({
		    url:basePath,
		    type:'POST', //GET
		    async:false,    //或false,是否异步
		    data:{
			    operation:'getRoute',
			    areaId:areaId,
			    factoryId:factoryId,
			    productId:productId
		    },
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
		    	var jsonMsg = data.isSuccess;
				if(parseInt(jsonMsg) == 1){
					result=true;
				}else{
					//var routeResult=alert("没有找到匹配的线路,"+"不能继续提交!");
					alertTip("没有找到匹配的线路,"+"不能继续提交!");
					//$.DialogByZ.Alert({Title: "提示", Content:"没有找到匹配的线路,"+"不能继续提交!",BtnL:"确定",FunL:alerts});
					result=false;
					return;
					//result=true;
				}
		    	//alert("返回结果"+result);
		    },
		    error:function(xhr,textStatus){
		    	result=false;
		    	//return;
		    	//alert("返回结果 false");
		    }
		})
	}
	
	

	
	if(result){
		 //alert("提交数据");
		validateAssignForm();
	}else{
		// alert("提交数据 else");
	}
	
}


