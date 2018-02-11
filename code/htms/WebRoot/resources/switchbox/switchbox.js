var __contxt_path = null;
function BoxItem(boxId,boxName,operation,tableName,idName,idValue,varName,varValue,onValue,offValue,onLabel,offLabel,isSave){
	var item = this;
	item.boxId=boxId;
	item.boxName=boxName;
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
	sbox.checkBoxSuffix = "_CHKBOX";
	sbox.labelSuffix = "_Label";
	sbox.switchStatus=[];
	sbox.add=function(boxId,boxName,operation,tableName,idName,idValue,varName,varValue,onValue,offValue,onLabel,offLabel,isSave){
		sbox.switchStatus[sbox.switchStatus.length]=new BoxItem(boxId,boxName,operation,tableName,idName,idValue,varName,varValue,onValue,offValue,onLabel,offLabel,isSave);
	};
	sbox.setSingleSelected=function(boxName,boxId){
		var tempId = null;
		var boxStatus = null,boxLabel,boxValue,boxObj;
		
		for(var i =0;i<sbox.switchStatus.length;i++){
			boxStatus = sbox.switchStatus[i];
			if(boxName!=boxStatus.boxName){
				continue;
			}
			tempId=boxStatus.boxId;
			
			boxObj = document.getElementById(tempId+sbox.checkBoxSuffix);
			boxValue = document.getElementById(tempId);
			boxLabel = document.getElementById(tempId+sbox.labelSuffix);
			
			//boxObj.setAttribute('checked','');
			
			boxObj.checked=false;
			boxValue.value=boxStatus.offValue;
			boxLabel.innerHTML=boxStatus.offLabel;
			if(tempId==boxId){
				boxObj.setAttribute('checked',true);
				boxObj.checked=true;
				boxValue.value=boxStatus.onValue;
				boxLabel.innerHTML=boxStatus.onLabel;
			}
		}
	};
	sbox.saveSwitchStatus=function(boxId){
		if(boxId==undefined ||boxId==null||boxId==''){
			return;
		}
		var boxObj = document.getElementById(boxId+sbox.checkBoxSuffix);
		if(boxObj==undefined||boxObj==null){
			return;
		}
		
		var boxValue = document.getElementById(boxId);
		if(boxValue==undefined||boxValue==null){
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
		var boxLabel = document.getElementById(boxId+sbox.labelSuffix);
		if(boxObj.tagName=='A'){
				
		}else{
			if(boxObj.checked==true||boxObj.checked=='on'){		
				boxValue.value=onValue;
				boxLabel.innerHTML=onLabel;
			}else{		
				boxValue.value=offValue;
				boxLabel.innerHTML=offLabel;
			}
		}
		varValue=boxValue.value;
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
		//var checkBoxValue =document.getElementById(boxId+sbox.checkBoxSuffix).value;
		//confirm('checkedValueId='+checkedValueId+',checkBoxValue='+checkBoxValue+',checkedValue='+checkedValue);
		//if(checkedValue==undefined ||checkedValue==null||checkedValue==''){
		//}else{
			if(varValue==boxStatus.onValue){
				document.getElementById(boxId+sbox.checkBoxSuffix).setAttribute('checked',true);
			}else{
				document.getElementById(boxId+sbox.checkBoxSuffix).setAttribute('checked',false);
			}
		//}
	};
}

var __switch_box = new SwitchBox();

