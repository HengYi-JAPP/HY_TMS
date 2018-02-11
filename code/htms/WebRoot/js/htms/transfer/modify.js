
function showOrHideOrderDetail(boxId,displayId){
		var boxValue =document.getElementById(boxId).value
		if(boxValue=='1'){
		document.getElementById(displayId).style.display="block";
	}
	if(boxValue=='0'){
		document.getElementById(displayId).style.display="none";
	}
}

var itemsNos=[];
	/**
	 * 1）当前吨数需要符合格式；
	 * 2）修改后吨数不能大于当前重量；
	 * 3）可分拆数=初始数-当前吨数；
	 * 4）累计数=所有项之和
	 * 5）累计数不能大于40000
	 * @param itemNo
	 * @return
	 */
function validateSplitTonNum(itemNo){
	var splitTonNum=document.getElementById("splitTonNum"+itemNo).value;
	var reg = /^\d+(\.\d{0,3})?$/;
	//var splitTonNumTip =  document.getElementById("splitTonNumTip")
	if(!reg.test(splitTonNum)){
			alertTip("请输入修改后重量，为整数或带3位小数的数");
			document.getElementById("splitTonNum"+itemNo).style.color="red";
			return false;
		}
	var applyNum=parseFloat(document.getElementById("splitTonNum"+itemNo).value);
	var appliableTon=parseFloat(document.getElementById("appliableTon"+itemNo).value);
	var initTon = parseFloat(document.getElementById("initAppliableTon"+itemNo).value);
	if(applyNum > initTon){
		alertTip("修改后重量不能大于当前重量");
		document.getElementById("splitTonNum"+itemNo).style.color="red";
		return false;
	}
	var totalSplitTon ="0.0",tempTon="";
	for(var i=0;i<itemsNos.length;i++){
		splitTonNum=document.getElementById("splitTonNum"+itemsNos[i]).value;
		splitTonNum=splitTonNum?splitTonNum:"0.0";
		totalSplitTon=calculator.add(totalSplitTon,splitTonNum);
	}
	if(totalSplitTon > 40000){
		alertTip("请调整修改后重量，物料累计的重量不能大于40吨.");
		document.getElementById("splitTonNum"+itemNo).style.color="red";
		
		//document.getElementById("splitTotalTon").setAttribute("color", "green");
		//document.getElementById("splitTotalTon").style.color="green";
		return false;
	}
	//document.getElementById("splitTonNumTip").innerHTML="";
	splitTonNum=document.getElementById("splitTonNum"+itemNo).value;
	splitTonNum=splitTonNum?splitTonNum:"0.0";
	
	var initAppliableTon = document.getElementById("initAppliableTon"+itemNo).value+"";
	initAppliableTon=initAppliableTon?initAppliableTon:"0.0";
	//alert("initAppliableTon="+initAppliableTon+",splitTonNum="+splitTonNum);
	
	var newAppliedAmount=calculator.sub(initAppliableTon,splitTonNum);
	document.getElementById("appliableTon"+itemNo).value=newAppliedAmount;
	
	var initTotalTon = document.getElementById("initTotalTon").value+"";
	initTotalTon=initTotalTon?initTotalTon:"0.0";
	

	
	var newAppliableAmount=calculator.sub(initAppliableTon,splitTonNum);
	document.getElementById("totalTon").value=calculator.sub(initTotalTon,totalSplitTon);/*更新可分拆总吨数*/
	document.getElementById("splitTotalTon").value=totalSplitTon;/*更新当前分拆总吨数*/
	
	document.getElementById("splitTonNum"+itemNo).setAttribute("color", "green");
	document.getElementById("splitTonNum"+itemNo).style.color="green";
	return true;
}

function validateSplitPackNum(itemNo){
	var splitPackNum=document.getElementById("splitPackNum"+itemNo).value;
	var reg =/^\d+?$/;
	//var splitPackNumTip =  document.getElementById("splitPackNumTip")
	if(!reg.test(splitPackNum)){
			alertTip("请输入修改后包数，包数需输入整数");
			document.getElementById("splitPackNum"+itemNo).style.color="red";
			return false;
		}
	var applyNum=parseFloat(document.getElementById("splitPackNum"+itemNo).value);
	var appliablePack=parseFloat(document.getElementById("appliablePack"+itemNo).value);
	var initPack = parseFloat(document.getElementById("initAppliablePack"+itemNo).value);
	if(applyNum > initPack){
		alertTip("修改后包数不能大于当前包数");
		document.getElementById("splitPackNum"+itemNo).style.color="red";
		return false;
	}
	var totalSplitPack ="0.0",tempPack="";
	for(var i=0;i<itemsNos.length;i++){
		splitPackNum=document.getElementById("splitPackNum"+itemsNos[i]).value;
		splitPackNum=splitPackNum?splitPackNum:"0.0";
		totalSplitPack=calculator.add(totalSplitPack,splitPackNum);
	}
	
	//document.getElementById("splitPackNumTip").innerHTML="";
	splitPackNum=document.getElementById("splitPackNum"+itemNo).value;
	splitPackNum=splitPackNum?splitPackNum:"0.0";
	
	var initAppliablePack = document.getElementById("initAppliablePack"+itemNo).value+"";
	initAppliablePack=initAppliablePack?initAppliablePack:"0.0";
	//alert("initAppliablePack="+initAppliablePack+",splitPackNum="+splitPackNum);
	
	var newAppliedAmount=calculator.sub(initAppliablePack,splitPackNum);
	document.getElementById("appliablePack"+itemNo).value=newAppliedAmount;
	
	var initTotalPack = document.getElementById("initTotalPack").value+"";
	initTotalPack=initTotalPack?initTotalPack:"0.0";
	

	
	var newAppliableAmount=calculator.sub(initAppliablePack,splitPackNum);
	document.getElementById("totalPack").value=calculator.sub(initTotalPack,totalSplitPack);/*更新可分拆总吨数*/
	document.getElementById("splitTotalPack").value=totalSplitPack;/*更新当前分拆总吨数*/
	
	document.getElementById("splitPackNum"+itemNo).setAttribute("color", "green");
	document.getElementById("splitPackNum"+itemNo).style.color="green";
	return true;
}


	
	function validateForm(){
		var isSubmit= true;	
			
		var tempValue ="",itemNo="";
		for(var i=0;i<itemsNos.length;i++){
			itemNo=itemsNos[i];
			tempValue=document.getElementById("splitTonNum"+itemNo).value;
			tempValue=tempValue?tempValue:"";
			tempValue=tempValue.replace(/\s+/g,"");
			if(tempValue==null||tempValue==''){
				alertTip("请输入修改后重量，为整数或带3位小数的数");
				document.getElementById("splitTonNum"+itemNo).style.color="red";
				return false;
			}
			tempValue=document.getElementById("splitPackNum"+itemNo).value;
			tempValue=tempValue?tempValue:"";
			tempValue=tempValue.replace(/\s+/g,"");
			if(tempValue==null||tempValue==''){
				alertTip("请输入修改后包数，包数需输入整数");
				document.getElementById("splitPackNum"+itemNo).style.color="red";
				return false;
			}
			tempValue=document.getElementById("splitNotice"+itemNo).value;
			tempValue=tempValue?tempValue:"";
			tempValue=tempValue.replace(/\s+/g,"");
			if(tempValue==null||tempValue==''){
				alertTip("请输入备注");
				document.getElementById("splitNotice"+itemNo).style.color="red";
				return false;
			}
			if(!validateSplitTonNum(itemNo)){
				return false;
			}
			if(!validateSplitPackNum(itemNo)){
				return false;
			}
		}
		var splitTotalTo=parseFloat(document.getElementById("splitTotalTon").value);
		if(splitTotalTo > 40000){
			alertTip("请调整修改后重量，修改后重量累计的重量不能大于40吨.");
			document.getElementById("splitTotalTon").style.color="red";
			return false;
		}
		
		if(isSubmit){		
			document.getElementById("modifyForm").submit();
		}
	}