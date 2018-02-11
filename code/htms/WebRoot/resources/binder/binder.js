/**
 * 动态绑定方法
 * @param elementId 需要绑定元素的ID
 * @param eventName 绑定的事件名
 * @param triggleEvent 绑定的目标事件
 * @param isFalse，是否为
 * @return
 */
function __dynamicBindObjectEvent(elementId,  triggleEvent,func, isFalse){
	
	var targetObj = document.getElementById(elementId);
	if(targetObj==undefined||targetObj==null){
		//confirm("targetObj==undefined||targetObj==null");
		return;
	}	
	if(targetObj.attachEvent){//IE
		//confirm("elementId="+elementId+",triggleEvent[0]="+triggleEvent[0]+",func="+func);
		targetObj.attachEvent(triggleEvent[0], func);
	}else{//FF
		//confirm("func="+func);
		targetObj.addEventListener(triggleEvent[1] || triggleEvent[0].replace(/^on/, ""), func, isFalse || false);
	}
}