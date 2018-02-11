/**
 * 单个删除
 */
;function deleteRow(operation){
	confirmTip("确定删除?",function(){
		window.location.href=operation;
		},function (){
			return;
		});
};

/**
 * 批量删除脚本
 * @param formId 处理的表单ID
 * @param elementId 处理的元素名称，各个元素可能不同ID，要实现批量处理，必须是相同的名称
 * @param operationId 操作隐藏的ID，默认为operation
 * @param operationValue 操作名称值
 * @return
 */
function batch_deletes(formId,elementName,operationId,operationValue,isTree){
	if(formId==undefined||formId==null||formId==""){
		//debug('formId==undefined||formId==null||formId==""');
		alertTip("请选择你要操作的记录。");
		return false;
	}
	
	if(elementName==undefined||elementName==null||elementName==""){
	//	debug('elementName==undefined||elementName==null||elementName==""');
		alertTip("请选择你要操作的记录。");
		return false;
	}
	
	if(operationValue==undefined||operationValue==null||operationValue==""){
		//debug('operationValue==undefined||operationValue==null||operationValue==""');
		alertTip("请选择你要操作的记录。");
		return false;
	}
	
	 var elementObjs = document.getElementsByName(elementName);
	//confirm(checkBoxs.length);
	if(elementObjs==null||elementObjs.length==0){
		//debug('elementObjs==null||elementObjs.length==0,  elementName='+elementName);
		alertTip("请选择你要操作的记录。");
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
			alertTip("请选择你要操作的记录。");
			return false;
		}
	}
	confirmTip("确定删除?",function(){
		var operation = operationId==undefined||operationId==null||operationId==""?"operation":operationId;
		
		document.getElementById(operation).value=operationValue;
		submit(formId);
		},function (){
			return;
	});
}