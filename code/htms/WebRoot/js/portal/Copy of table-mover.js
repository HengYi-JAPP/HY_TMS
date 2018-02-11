/**
 *点击事件触发的对象须直接放置到tr/td之下，否则下面的方法不会起作用
 *--------------------------------------------------------
**/

/**
 * 根据当前对向上移一行
 * 移动方式是，把当前行插入到上一行之前
 *--------------------------------
**/
/*
 * 开始行下标
 */
var startIndex = 1;
function moveUp(obj,params){//上移
	var tr=obj.parentNode.parentNode;//被移动的Tr
	var orderNum=tr.rowIndex;//当前Tr的位置
	var table=obj.parentNode.parentNode.parentNode;//所属的table
	if(1==orderNum-- || table.rows.length==2)return;//table的第一行是标题，当table只有两行或者或当前行index为1时，不移动。
	
	var temp=tr.nextSibling;
	table.insertBefore(table.rows[orderNum],temp);//移动的核心，用当前tr后一个tr来插入tr前一个tr后。
	
	//移动后执行的其他方法。
	moveAttachFunciton(params);
}

/**
 * 把当前移到第一行
 * 移动方式是，把当前行插入到第一行之前
 *--------------------------------
**/
function moveTop(obj,params){//置顶
	var tr=obj.parentNode.parentNode;//被移动的Tr
	var orderNum=tr.rowIndex;//当前Tr的位置
	var table=obj.parentNode.parentNode.parentNode;//所属的table
	if(1==orderNum-- || table.rows.length==2)return;//table的第一行是标题，当table只有两行或者或当前行index为1时，不移动。
	
	var temp=table.rows.item(1);
	table.insertBefore(table.rows[orderNum+1],temp);//移动的核心，用当前tr后一个tr来插入tr前一个tr后。
	
	//移动后执行的其他方法。
	moveAttachFunciton(params);
}

/**
 * 把当前向下移动一行
 * 移动方式是，把下一行插入到当前行之前
 *--------------------------------
**/
function moveDown(obj,params){//下移
	var tr=obj.parentNode.parentNode;
	var orderNum=tr.rowIndex;
	var table=obj.parentNode.parentNode.parentNode;
	orderNum++;
	if(table.rows.length==orderNum || table.rows.length==2)return;
	
	var temp=tr.nextSibling;
	table.insertBefore(temp,table.rows[orderNum-1]);
	
	//移动后执行的其他方法。
	moveAttachFunciton(params);
}

/**
 * 把当前移动到最后一行
 * 移动方式是，把当前行先移到倒数第二行,然后最后两行交换顺序
 *--------------------------------
**/
function moveBottom(obj,params){//置底
	var tr=obj.parentNode.parentNode;
	var orderNum=tr.rowIndex;
	var table=obj.parentNode.parentNode.parentNode;
	orderNum++;
	if(table.rows.length==orderNum || table.rows.length==2)return;
	//先移到倒数第二行
	var temp=table.rows.item(table.rows.length-1);
	table.insertBefore(table.rows[orderNum-1],temp);
	
	//最后两行交换顺序
	temp = table.rows.item(table.rows.length-1);
	var current = table.rows.item(table.rows.length-2);
	table.insertBefore(temp,current);
	
	//移动后执行的其他方法。
	moveAttachFunciton(params);
}
/**#########################################################**/
/**
 * 执行移动后要执行的其他方法
 * 如果在多个地方使用到该方法，可以增中变量标识，也可以在该方法中实现回调用方法，或对该方法进行重写
 *--------------------------------
**/
function moveAttachFunciton(params){
	changeOrderValue(params);
	//changeOrder(obj);
}
/**#########################################################**/
/**
 * 在页面自定义页面排序中，改变各行变量的序号为行号
 * 将各行的行序号（从0开始）赋予按序号编号的页面序号隐藏变量
 *--------------------------------
**/
function changeOrderValue(params){
	if(!params||!params.orderElementName){
		alert("!params||!params.orderElementName");
		return;
	}
	var allElement = document.getElementsByName(params.orderElementName);
	if(!allElement||allElement.length==0){
		alert("!allElement||allElement.length==0");
		return;
	}

	for(var i=0;i<allElement.length;i++){		
		allElement[i].value=allElement[i].parentNode.parentNode.rowIndex;
	}
}