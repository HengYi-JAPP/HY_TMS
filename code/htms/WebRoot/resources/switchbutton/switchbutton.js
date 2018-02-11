var __contxt_path = null;
function StatusItem(buttonBoxId,labelId,statusValue,nextStatusValue,statusLabel,statusOrder,isAuthorized){
	var item = this;
	item.buttonBoxId=buttonBoxId;
	item.labelId=labelId;
	item.statusValue=statusValue;
	item.nextStatusValue=nextStatusValue;
	
	item.statusLabel=statusLabel;
	item.statusOrder=statusOrder;
	
	item.isAuthorized=isAuthorized!=undefined&&isAuthorized==false?false:true;	
	/*item.varValue=varValue;
	
	item.onValue=onValue;
	item.offValue=offValue;
	
	item.onLabel = onLabel;
	item.offLabel = offLabel;
	item.isSave = isSave!=undefined&&isSave==false?false:true;*/
}
//operation,tableName,idName,idValue,varName,varValue,onValue,isSave
function SwitchButton(){
	var sbox =this; 
	sbox.operation=null;
	sbox.tableName=null;
	sbox.idName=null;
	sbox.idValue=null;
	sbox.statusName=null;
	sbox.statusValue=null;
	sbox.isSave=null;
	
	sbox.checkBoxSuffix = "_CHKBOX";
	sbox.labelSuffix = "_Label";
	sbox.switchStatus=[];
	
	/**
	 * 增加切换状态及按钮信息
	 */
	sbox.addStatus=function(buttonBoxId,labelId,statusValue,nextStatusValue,statusLabel,statusOrder,isAuthorized){
		sbox.switchStatus[sbox.switchStatus.length]=new StatusItem(buttonBoxId,labelId,statusValue,nextStatusValue,statusLabel,statusOrder,isAuthorized);
	};
	/**
	 * 配置切换状态时的数据更新信息
	 */
	sbox.setting=function(operation,tableName,idName,idValue,statusName,statusValue,isSave){
		sbox.operation=operation;
		sbox.tableName=tableName;
		sbox.idName=idName;
		sbox.idValue=idValue;
		sbox.statusName=statusName;
		sbox.statusValue=statusValue;
		sbox.isSave=isSave!=undefined&&isSave==false?false:true;
	};
	/**
	 * 每个按钮上触发的切换事件
	 */
	sbox.doSwitch=function(buttonBoxId){
		var boxStatus = sbox.findBoxStatus(buttonBoxId);
		if(boxStatus==undefined||boxStatus==null){
			return;
		}
		if(!boxStatus.isAuthorized){
			return;
		}
		if(sbox.showStatusButton(boxStatus)){
			sbox.saveSwitchStatus(boxStatus);
		}
		
	};
	/**
	 * 保存当前的状态值
	 */
	sbox.saveSwitchStatus=function(boxStatus){
		if(boxStatus==undefined||boxStatus==null){
			return;
		}
		
		/*
		 * 修改当前值
		 */
		sbox.statusValue = boxStatus.nextStatusValue;
		//alert("boxStatus.nextStatusValue="+boxStatus.nextStatusValue)
		var operation=sbox.operation,
		tableName=sbox.tableName,
		idName=sbox.idName,
		idValue=sbox.idValue,
		statusName=sbox.statusName,
		statusValue=sbox.statusValue;
		if(sbox.isSave){
			var paramter = "operation="+operation;
			paramter = paramter+ "&tableName="+tableName;
			paramter = paramter+ "&idName="+idName;
			paramter = paramter+ "&idValue="+idValue;
			paramter = paramter+ "&varName="+statusName;
			paramter = paramter+ "&varValue="+statusValue;
			
			var ajax = new Ajax();
			//confirm(__contxt_path+__ajax_url+"paramter:"+paramter);
			var requestUrl = null;
			if(__contxt_path==undefined||__contxt_path==null||__contxt_path==''||__contxt_path=='null'){
				requestUrl = __ajax_url;
			}else{
				requestUrl = __contxt_path+__ajax_url;
			}
			ajax.ajaxRequest(requestUrl,paramter,"GET",null);
		}
	};
	
	sbox.findBoxStatus=function(buttonBoxId){
		var temp = null;
		for(var i =0;i<sbox.switchStatus.length;i++){
			temp = sbox.switchStatus[i];
			if(temp.buttonBoxId==buttonBoxId){
				return temp;
			}
		}
		return null;
	};
	/**
	 * 显示切换按钮
	 */
	sbox.showStatusButton=function (boxStatus){
		if(boxStatus==undefined ||boxStatus==null||boxStatus==''){
			return false;
		}
		var tempStatus=null,tempElement=null,nextStatus=null;
		var hasNext = false;
		for(var i =0;i<sbox.switchStatus.length;i++){
			tempStatus = sbox.switchStatus[i];
			if(tempStatus.statusValue&&boxStatus.nextStatusValue&&tempStatus.statusValue==boxStatus.nextStatusValue){
				nextStatus=tempStatus;
				hasNext = true;
			}
			
			tempElement=document.getElementById(tempStatus.buttonBoxId);
			if(tempElement&&tempElement.style){
				tempElement.style.display="none";
			}
			tempElement=document.getElementById(tempStatus.labelId);
			if(tempElement&&tempElement.style){
				tempElement.style.display="none";
			}
			
		}
		/*
		 * 如果存在下一状态，则显示；如果不存在，则维持原样不改变。
		 */
		nextStatus =hasNext?nextStatus:boxStatus;
		
		
		tempElement=document.getElementById(nextStatus.buttonBoxId);
		if(tempElement&&tempElement.style){
			tempElement.style.display="block";
		}
		tempElement=document.getElementById(nextStatus.labelId);
		if(tempElement&&tempElement.style){
			tempElement.style.display="block";
			tempElement.innerHTML=nextStatus.statusLabel;
		}
		
		return hasNext;
		
	};
	
	sbox.load=function(){
		var tempElement=null;
		for(var i =0;i<sbox.switchStatus.length;i++){
			tempStatus = sbox.switchStatus[i];
			
			if(sbox.statusValue&&tempStatus.statusValue&&tempStatus.statusValue==sbox.statusValue){	
				//alert("tempStatus.buttonBoxId="+tempStatus.buttonBoxId+", tempStatus.labelId="+tempStatus.labelId);
				tempElement=document.getElementById(tempStatus.buttonBoxId);
				if(tempElement&&tempElement.style){
					tempElement.style.display="block";
				}else{
				}
				tempElement=document.getElementById(tempStatus.labelId);
				if(tempElement&&tempElement.style){
					tempElement.style.display="block";
					tempElement.innerHTML=tempStatus.statusLabel;
				}
			}
			
		}
	};
	
}

//var __switch_button = new SwitchButton();

