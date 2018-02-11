var templIndex = 1;
	function splitTransfer(){
		var transferTempl = document.getElementById("DIVTMPL").innerHTML;
		
		var currentChild = transferTempl.replace(new RegExp("DIVTABTMPL","gm"),"DIVTABTMPL_"+templIndex);
		currentChild = currentChild.replace(new RegExp("DIVTONTMPL","gm"),"DIVTONTMPL_"+templIndex);
		currentChild = currentChild.replace(new RegExp("DIVPACKTMPL","gm"),"DIVPACKTMPL_"+templIndex);
		currentChild = currentChild.replace(new RegExp("INDEX","gm"),""+templIndex);
		var tempDiv = document.createElement("div");
		tempDiv.innerHTML=currentChild;
		
		var divInnerHtml =  document.getElementById("childTransfer");
		divInnerHtml.appendChild(tempDiv);
		templIndex++;
		//document.getElementById("childTransfer").innerHTML=divInnerHtml;
	}
	function deleteTransfer(transferId,objIndex){
		var currentObj = document.getElementById(transferId);
		if(transferId&&currentObj){
			var tempNum = document.getElementById("DIVTONTMPL_"+objIndex).value;
			var currentTonAmount=document.getElementById("currentApplyTonNum").value;
			currentTonAmount=calculator.add(currentTonAmount,tempNum);
			document.getElementById("currentApplyTonNum").value=currentTonAmount;
			
			var packNum = parseInt(document.getElementById("DIVPACKTMPL_"+objIndex).value);
			packNum=packNum<0?0:packNum;
			var currentPackAmount=parseInt(document.getElementById("currentApplyPackNum").value);			
			currentPackAmount=currentPackAmount<0?0:currentPackAmount;
			document.getElementById("currentApplyPackNum").value=currentPackAmount+packNum;
			
			currentObj.parentNode.removeChild(currentObj);
		}
	}
	
	function validateTonSplitNum(obj){
		if(!obj||!obj.value){
			return;
		}
		var tester=/^\d+(\.\d{0,3})?$/;
		if(!tester.test(obj.value)){
			obj.style.color="red";
			obj.setAttribute("color","red");
			alert("请输入正确的吨数，吨数为整数或保留三位的小数。");
			obj.focus();
				return;
		}else{
		
			//var res =calculator.sub("40.00",obj.value);
			if(parseFloat(obj.value)>parseFloat("40.00")){
				obj.style.color="red";
				obj.setAttribute("color","red");
				alert("输入的吨数不能大于40。");
				obj.value="";
				obj.focus();
				return;
			}
			obj.style.color="green";
			obj.setAttribute("color","green");
			
			var tonsNum = document.getElementsByName("splitTonNum");
			 if(!tonsNum){
			 	return;
			 }
			 
			var currentTonAmount=document.getElementById("initApplyTonNum").value;
			var tempNum=null;
			  for(var i=0;i<tonsNum.length;i++){
				  tempNum=tonsNum[i].value;
				  tempNum=tempNum?tempNum:"0.0";
				  currentTonAmount=calculator.sub(currentTonAmount,tempNum);
			  }
			  document.getElementById("currentApplyTonNum").value=currentTonAmount;
		}
	}
	function validatePackSplitNum(obj){
		if(!obj||!obj.value){
			return;
		}
		var tester=/^\d+$/;
		if(!tester.test(obj.value)){
			obj.style.color="red";
			obj.setAttribute("color","red");
			alert("请输入正确的包数，包数为整数。");
			obj.focus();
		}else{
			obj.style.color="green";
			obj.setAttribute("color","green");
			
			var splitPackNum = document.getElementsByName("splitPackNum");
			 if(!splitPackNum){
			 	return;
			 }
			 
			var initApplyPackNum=parseInt(document.getElementById("initApplyPackNum").value);
			
			var currentAmount=initApplyPackNum<0?0:initApplyPackNum;
			var tempNum=0;
			  for(var i=0;i<splitPackNum.length;i++){
				  tempNum=parseInt(splitPackNum[i].value);
				  tempNum=tempNum<0||!tempNum?0:tempNum;
				  currentAmount=currentAmount-tempNum;
			  }
			 
			  document.getElementById("currentApplyPackNum").value=currentAmount;
		}
	}
	function validateSplit(){
		 var tonsNum = document.getElementsByName("splitTonNum");
		 var packsNum = document.getElementsByName("splitPackNum");
		 
		 if(!tonsNum||!packsNum){
		 	return false;
		 }
		 for(var i=0;i<tonsNum.length;i++){
		 	if(tonsNum[i].id=='DIVTONTMPL'){
		 		continue;
		 	}
		 	if(!tonsNum[i].value){
		 		alert("请输入吨数，吨数为整数或保留三位的小数。");
		 		tonsNum[i].focus();
		 		return false;		 		
		 	}
		 	if(!packsNum[i].value){
		 		alert("请输入包数，包数为整数。");
		 		packsNum[i].focus();
		 		return false;		 
		 	}
		 }
		  var DIVTMPL = document.getElementById("DIVTMPL");
		 DIVTMPL.parentNode.removeChild(DIVTMPL);
		 document.getElementById("splitForm").submit();
		 return true;
	}