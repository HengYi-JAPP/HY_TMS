var __contxt_path = null;
function BoxItem(boxId,operation,tableName,idName,idValue,varName,varValue,onValue,offValue,onLabel,offLabel,isSave){
	var item = this;
	item.boxId=boxId;
	item.operation=operation;
	item.tableName=tableName;
	
	item.idName=idName;
	item.idValue=idValue;
	
	item.varName=varName;	
	item.varValue=varValue;
	
	item.onValue=onValue;
	item.offValue=offValue;
	
	item.onLabel = onLabel;
	item.offLabel = offLabel;
	item.isSave = isSave!=undefined&&isSave==false?false:true;
}
function SwitchBox(){
	var sbox =this; 
	sbox.switchStatus=[];
	sbox.add=function(boxId,operation,tableName,idName,idValue,varName,varValue,onValue,offValue,onLabel,offLabel,isSave){
		sbox.switchStatus[sbox.switchStatus.length]=new BoxItem(boxId,operation,tableName,idName,idValue,varName,varValue,onValue,offValue,onLabel,offLabel,isSave);
	};
	sbox.saveSwitchStatus=function(boxId){
		if(boxId==undefined ||boxId==null||boxId==''){
			return;
		}
		var boxObj = document.getElementById(boxId);
		if(boxObj==undefined||boxObj==null){
			return;
		}
		var boxStatus = sbox.findBoxStatus(boxId);
		if(boxStatus==undefined||boxStatus==null){
			return;
		}
		var operation=boxStatus.operation,
		tableName=boxStatus.tableName,
		idName=boxStatus.idName,
		idValue=boxStatus.idValue,
		varName=boxStatus.varName,
		varValue=boxStatus.varValue,
		onValue=boxStatus.onValue,
		offValue=boxStatus.offValue,
		onLabel=boxStatus.onLabel,
		offLabel=boxStatus.offLabel;
		var boxLabel = document.getElementById(boxId+"_Label");
		if(boxObj.tagName=='A'){
				
		}else{
			if(boxObj.checked==true||boxObj.checked=='on'){		
				boxObj.value=onValue;
				boxLabel.innerHTML=onLabel;
			}else{		
				boxObj.value=offValue;
				boxLabel.innerHTML=offLabel;
			}
		}
		varValue=boxObj.value;
		if(boxStatus.isSave){
			var paramter = "operation="+operation;
			paramter = paramter+ "&tableName="+tableName;
			paramter = paramter+ "&idName="+idName;
			paramter = paramter+ "&idValue="+idValue;
			paramter = paramter+ "&varName="+varName;
			paramter = paramter+ "&varValue="+varValue;
			
			var ajax = new Ajax();
			//confirm(__contxt_path+__ajax_url+"paramter:"+paramter);
			ajax.ajaxRequest(__contxt_path+__ajax_url,paramter,"GET",null);
		}
	};
	
	sbox.findBoxStatus=function(boxId){
		var temp = null;
		for(var i =0;i<sbox.switchStatus.length;i++){
			temp = sbox.switchStatus[i];
			if(temp.boxId==boxId){
				return temp;
			}
		}
		return null;
	};
	sbox.setChecked=function (boxId){
		if(boxId==undefined ||boxId==null||boxId==''){
			return;
		}
		
		if(document.getElementById(boxId)==undefined||document.getElementById(boxId)==null){
			return;
		}
		var boxStatus = sbox.findBoxStatus(boxId);
		if(boxStatus==undefined||boxStatus==null){
			return;
		}
		var varValue = document.getElementById(boxId).value;
		//var checkBoxValue =document.getElementById(checkedValueId).value;
		//confirm('checkedValueId='+checkedValueId+',checkBoxValue='+checkBoxValue+',checkedValue='+checkedValue);
		if(checkedValue==undefined ||checkedValue==null||checkedValue==''){
		}else{
			if(varValue==boxStatus.onValue){
				document.getElementById(boxId).setAttribute('checked',true);
			}
		}
	};
}

var __switch_box = new SwitchBox();

