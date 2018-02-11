/* 是否显示调试信息的开头，false 不显示， true 显示*/
var isDebug = true;

/**
 * 调试信息
 * @param message 需要显示的信息
 * @return
 */
function debug(message){
	if(!isDebug){
		return;
	}
	confirm(message);
}

function showMessage(message){
	confirm(message);
}

/*function showMessage(message){
	$.DialogByZ.Alert({Title: "提示", Content:message,BtnL:"确定",FunL:function() {
		$.DialogByZ.Close();
	}});
}*/


/**
 * 提交表单
 * @param formId 需要提交的表单ID
 * @return
 */
function submit(formId,isAttached){  
	//return false;
	if(formId==undefined||formId==null||formId==""){
		debug('formId==undefined||formId==null||formId==""');
		return;
	}
	var form = document.getElementById(formId);
	if(form==undefined||form==null){
		debug('form==undefined||form==null');
		return;
	}
	var normal = isAttached==undefined||isAttached==false?true:!isAttached;
	if(isAttached){
		if (form.fireEvent) {//for ie  
		    if (form.fireEvent('onsubmit')){  
		    	form.submit();  
		    }     
		} else if (document.createEvent){  
		    var ev = document.createEvent('HTMLEvents');  
		    ev.initEvent('submit', false, true);  
		    form.dispatchEvent(ev);  
		}  
	}else{
		form.submit();
	}
	//var sb = form.onsubmit;
	//debug("sb="+sb);
	
	//form.submit();
}
/**
 * 重置表单值
 * 把指定表单中的元素重置为初始化的值，但不一定是全部清空
 * @param formId
 * @return
 */
function reset(formId){      
	if(formId==undefined||formId==null||formId==""){
		debug('formId==undefined||formId==null||formId==""');
		return false;
	}
	var form = document.getElementById(formId);
	if(form==undefined||form==null){
		debug('form==undefined||form==null');
		return false;
	}
	
	form.reset();
	return false;
}
/**
 * 根据按键事件来触发调用指定方法
 * @param keyCode 按键编号
 * @param funName 需要调用的方法
 * @param params 调用所需要参数，如果是多个参数通过数组存放
 * @return
 */
function keydown(keyCode,funName,params){
	if(keyCode==undefined||keyCode==null||keyCode==""){
		debug('keyCode==undefined||keyCode==null||keyCode==""');
		return;
	}
	if(funName==undefined||funName==null||funName==""){
		debug('funName==undefined||funName==null||method==""');
		return;
	}
	if(window.event.keyCode == keyCode){
		 var  method=eval(funName); /*此处可能存在浏览器兼容性问题*/
		 debug(method);
		 new method(params);
     }
}

/**
 * 方法：trim 
 * 描述：把字符串中的空格过滤掉
 * 返回：无;
 */
String.prototype.trim = function() {   
	return this.replace(/(^\s*)|(\s*$)/g, "");   
}
/**
 * 清空表单值
 * 把指定的表单中各个表单元素的值置为空值或HTML默认值。
 * escapeComponent 传入参数为字符串，例如"componentId1,componentId2,componentId3",执行重置方法后，Id为componentId1,componentId2,componentId3的表单元素，不会被重置
 * @param formId,escapeComponent
 * @return
 */
function cleanForm(formId,escapeComponent){
	if(formId==undefined||formId==null||formId==""){
		debug('formId==undefined||formId==null||formId==""');
		return false;
	}
	
	var form = document.getElementById(formId);
	if(form==undefined||form==null){
		debug('form==undefined||form==null');
		return false;
	}	
	var escapeComponentArray=new Array();
	if(escapeComponent==undefined||escapeComponent==null||escapeComponent==""){
		
	}else{
		escapeComponentArray=escapeComponent.split(",");
	}
    for(var i=0; i<form.elements.length; i++){
    	var markForm=false;
    	for(j=0;j<escapeComponentArray.length;j++){    		
    		if(form.elements[i].id==escapeComponentArray[j]){
    			markForm=true;
        	}
    	}
    	if(!markForm){
    		if(form.elements[i].type == "text"){
                form.elements[i].value = "";
            }else if(form.elements[i].type == "password"){
                form.elements[i].value = "";
            }else if(form.elements[i].type == "radio"){
                form.elements[i].checked = false;
            } else if(form.elements[i].type == "checkbox"){
                form.elements[i].checked = false;
            }else if(form.elements[i].type == "select-one"){
            	if(form.elements[i].options[0]){
            		form.elements[i].options[0].selected = true;
            	}
            }else if(form.elements[i].type == "select-multiple"){    
                for(var j = 0; j < form.elements[i].options.length; j++){
                    form.elements[i].options[j].selected = false;
                }
            }else if(form.elements[i].type == "file"){
                //form.elements[i].select();
                //document.selection.clear();             
                // for IE, Opera, Safari, Chrome
                var file = form.elements[i];
                 if (file.outerHTML) {
                     file.outerHTML = file.outerHTML;
                 } else {
                     file.value = "";  // FF(包括3.5)
                }
            }else if(form.elements[i].type == "textarea"){
                form.elements[i].value = "";
            }
    	}
        
    }
}
/**
 * 批量删除脚本
 * @param formId 处理的表单ID
 * @param elementId 处理的元素名称，各个元素可能不同ID，要实现批量处理，必须是相同的名称
 * @param operationId 操作隐藏的ID，默认为operation
 * @param operationValue 操作名称值
 * @return
 */
function batchDelete(formId,elementName,operationId,operationValue,isTree){
	if(formId==undefined||formId==null||formId==""){
		debug('formId==undefined||formId==null||formId==""');
		return false;
	}
	
	if(elementName==undefined||elementName==null||elementName==""){
		debug('elementName==undefined||elementName==null||elementName==""');
		return false;
	}
	
	if(operationValue==undefined||operationValue==null||operationValue==""){
		debug('operationValue==undefined||operationValue==null||operationValue==""');
		return false;
	}
	
	 var elementObjs = document.getElementsByName(elementName);
	//confirm(checkBoxs.length);
	if(elementObjs==null||elementObjs.length==0){
		debug('elementObjs==null||elementObjs.length==0,  elementName='+elementName);
		return false;
	}
	if(!isTree){
		/*非树元素需要进行验证*/
		var isSelect = false;
		for(var i = 0;i<elementObjs.length;i++){
			if(elementObjs[i].checked){
				isSelect = true;
			}
		}	
		if(isSelect==false){
		//	showMessage("请选择你要操作的记录。");
			return false;
		}
	}
	var operation = operationId==undefined||operationId==null||operationId==""?"operation":operationId;
	
	document.getElementById(operation).value=operationValue;
	submit(formId);
}

function doSingleCopy(formId,elementName,operationId,operationValue,isTree){
	if(formId==undefined||formId==null||formId==""){
		debug('formId==undefined||formId==null||formId==""');
		return false;
	}
	
	if(elementName==undefined||elementName==null||elementName==""){
		debug('elementName==undefined||elementName==null||elementName==""');
		return false;
	}
	
	if(operationValue==undefined||operationValue==null||operationValue==""){
		debug('operationValue==undefined||operationValue==null||operationValue==""');
		return false;
	}
	
	 var elementObjs = document.getElementsByName(elementName);
	//confirm(checkBoxs.length);
	if(elementObjs==null||elementObjs.length==0){
		debug('elementObjs==null||elementObjs.length==0,  elementName='+elementName);
		return false;
	}
	if(!isTree){
		/*非树元素需要进行验证*/
		var isSelect = false;
		var selectCount=0;
		for(var i = 0;i<elementObjs.length;i++){
			if(elementObjs[i].checked){
				isSelect = true;
				selectCount++;
			}
		}	
		if(isSelect==false){
			showMessage("Please select the records you want to copy!");
			return false;
		}
		if(selectCount>1){
			showMessage("Only one record can be copied at a time,Please select the records you want to operation!");
			return false;
		}
	}
	var operation = operationId==undefined||operationId==null||operationId==""?"operation":operationId;
	
	document.getElementById(operation).value=operationValue;
	submit(formId);
}
/**
 * 在提交之前须选择
 * 
 * @param elementName
 * @param formId
 * @param operationId
 * @param operationValue
 * @return
 */
function checkBeforeSubmit(formId,elementName,operationId,operationValue,isSingle,isCheck){
	if(elementName==null||elementName==""||elementName=="null"||
			formId==null||formId==""||formId=="null" ||
			operationValue==null||operationValue==""||operationValue=="null"){
		debug('请正确填写调用该法所需要的参数！');
		return false;
	}
	var elementObjs = document.getElementsByName(elementName);
	//confirm(checkBoxs.length);
	if(elementObjs==null||elementObjs.length==0){
		debug('所指定的元素不存在，请确认元素名称['+elementName+']是否正确');
		return false;
	}
	
	if(isCheck==undefined||isCheck==true){
		var isSelect = false;
		var selectCount = 0;
		for(var i = 0;i<elementObjs.length;i++){
			if(elementObjs[i].checked){
				selectCount++;
				isSelect = true;
			}
		}	
		
		
		if(isSelect==false){
			showMessage("请选择你要操作的记录。");
			return false;
		}
	}
	
	if(isSingle&&selectCount>1){
		showMessage("该操作只能选择一条记录。");
		return false;
	}
	
	var operation = operationId==undefined||operationId==null||operationId==""?"operation":operationId;
	
	document.getElementById(operation).value=operationValue;
	submit(formId);
}

/*禁页面刷新，因为从新增页面保存后回到列表页面刷新或重新加载，会二次提交，增加重复记录
document.onkeydown = function()
{
     if(event.keyCode==116) {
    	 event.keyCode=0;
    	 event.returnValue = false;
     }
}
document.oncontextmenu = function() {event.returnValue = false;}*/
/**
 * 显示开关
 */
function displaySwitcher(switchTarget) {
	if(switchTarget==undefined||switchTarget==null){
		return ;
	}
	var targegObj = null;
	if(typeof(switchTarget)=="object"){
		targegObj = switchTarget ;
	}else{
		targegObj = document.getElementById(switchTarget);
	}
	if(targegObj==undefined||targegObj==null||targegObj.style==undefined){
		return;
	}
	
    
    if (targegObj.style.display == "none") {
    	targegObj.style.display = ""
    } else {
    	targegObj.style.display = "none";
    }
}

/**
 * 打开新窗口
 * @param owurl 打开窗口地址
 * @param openType 打开类型；默认打开窗口；fullscreen，全屏打开；tab在标签页打开
 * @return
 */
function opengWindow(owurl,openType){ 
	if(!openType){
		window.open(owurl);
	}else if(openType=="fullscreen"){
		var tmp=window.open("about:blank","","fullscreen=1") 
		tmp.moveTo(0,0); 
		tmp.resizeTo(screen.width+20,screen.height); 
		tmp.focus(); 
		tmp.location=owurl; 
	}else if(openType=="tab"){
		 var tempLink=document.createElement("a");
		 
		 tempLink.setAttribute('href', owurl);
		 tempLink.setAttribute("target", "_blank");
		 document.body.appendChild(tempLink);
		 tempLink.click();
		 document.body.removeChild(tempLink);
	}else{
		window.open(owurl);
	}
} 

/**
 * 重新调整页面框架的高度
 * @return
 */
function reSizePageFrameworkHeight() {
	//alert("document.body.scrollHeight="+document.body.scrollHeight);
	var maxHeight=document.body.scrollHeight;//+spanHeight;
	var layoutSpan=60,channelSpan=140,systemSpan=340;
	var layoutHeight =maxHeight + layoutSpan;
	var channelHeight =maxHeight + channelSpan;
	var systemHeight =maxHeight + systemSpan;
	//confirm("mover.maxHeightx="+mover.maxHeight);

		var loader=parent.document.getElementById("__layoutLoader");
		if(loader){
			loader.style.height=layoutHeight+"px";
			loader.height=layoutHeight+"px";
			
			loader=parent.parent.document.getElementById("__channelLoader");
			if(loader){
				loader.style.height=channelHeight+"px";
				loader.height=channelHeight+"px";
			}
			
			loader=parent.parent.parent.document.getElementById("__systemLoader");
			if(loader){
				loader.style.height=systemHeight+"px";
				loader.height=systemHeight+"px";
			}
		}else{
			loader=parent.document.getElementById("__channelLoader");
			if(loader){
				loader.style.height=channelHeight+"px";
				loader.height=channelHeight+"px";
			}
			
			loader=parent.parent.document.getElementById("__systemLoader");
			if(loader){
				loader.style.height=systemHeight+"px";
				loader.height=systemHeight+"px";
			}
		}
}
/**
 * 关闭窗口
 * @return
 */
function winClose(){
	var winParent = window;
	while(winParent.top!=winParent.self){
		winParent = winParent.parent;
	}
	if(winParent){
		winParent.close();
	}
}

function selectItemByValue(selectId, itemValue) { 
	if(!itemValue||!selectId){
		//alert("!objSelect,selectId="+selectId);
		return;
	}
	//判断是否存在 
	var objSelect=document.getElementById(selectId);//.value=hostTypeId;
	if(!objSelect){
		//alert("!objSelect,selectId="+selectId);
		return;
	}
	var isExit = false; 
	for (var i = 0; i < objSelect.options.length; i++) { 
		if (objSelect.options[i].value == itemValue) { 
			objSelect.options[i].selected = true; 
			if(objSelect.fireEvent) {
                objSelect.fireEvent('onchange');
            } else if(objSelect.change){
                objSelect.change();
            }else{
            	ev = document.createEvent("HTMLEvents");  
				ev.initEvent("change", false, true);  
				objSelect.dispatchEvent(ev);  
            }
			isExit = true; 
			break; 
		} 
	} 
} 
