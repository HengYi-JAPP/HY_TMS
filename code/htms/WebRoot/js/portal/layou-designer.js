DesignObject = Class.create();
DesignObject.prototype = {
	initialize : function (rowIndex,colIndex,cellObj) {
		var designObj = this;
		designObj.rowIndex=rowIndex;
		designObj.colIndex=colIndex;
		designObj.cellObj=cellObj;
	}
}

LayoutDesigner = Class.create();
/************************************
布局设计器类定义,行列分拆、删除、合并，还存在BUG
*************************************/
LayoutDesigner.prototype = {	
	initialize : function (name) {
	//初始化成员
	var designer = this;
	designer.LIST_TITLE_LABEL="表格标题";
	designer.USAGE_LABEL="使用方式：先在单元格中建立一个选区，再点击上面按钮";
	designer.REST_LABEL="请设置宽和高";
	designer.CANNOT_DELETE_ROW_LABEL="最后一个行，不能被删除。";
	designer.CANNOT_DELETE_COL_LABEL="最后一列，不能被删除。";
	designer.SURE_LABEL="确定";
	designer.CANNCEL_LABEL="取消";
	designer.WIDTH_LABEL="宽度";
	designer.HEIGHT_LABEL="高度";
	designer.SHOW_PANNEL="显示设计面版";
	designer.HIDDEN_PANNEL="隐藏设计面版";
	
	/*设计器名称*/
	designer.name=name?name:"designer";
	designer.isIE = isIE();
	
	
	/*定义设计表格*/
	designer.layoutPannelMain = null;
	designer.layoutPannelTable = null;
	designer.layoutPannelTitle=null;
	designer.layoutPannelUsage=null;
	
	designer.tdObj = null;
	designer.trObj = null;
	designer.tableObj = null;
	designer.layoutId = null;
	
	designer.selectTdObject =null;
	
	designer.layouMetrix = null;
	designer.rowIndex = 0;
	designer.colIndex = 0;
	
	designer.layout =  new Layout();
	/**
	 * 栏目定义栏目盒单元ID
	 */
	designer.layoutSandBoxSystemColumnId = "__layoutSandBox_SystemColumn";
	designer.mover = new Mover(designer.layout,false);
	//designer.mover.isReSize=false;
	},
	initLayoutPannel:function(){
		var designer = this;
		designer.layoutPannelTable =document.getElementById(designer.layoutId);
		designer.layoutPannelTable.setAttribute("onmousemove",designer.name+".mover.showPositionShadow();");
		designer.layoutPannelTable.onmousemove=designer.name+".mover.showPositionShadow();";
		var isIe = /msie/i.test(navigator.userAgent); 		
    	isIe?(designer.layoutPannelTable.onmousemove = function() { eval(designer.name+".mover.showPositionShadow();"); }):designer.layoutPannelTable.setAttribute("onmousemove",designer.name+".mover.showPositionShadow();");
    	designer.layoutPannelTable.className="finelinetable";
	},
	/*创建初始表格*/
	createDefaultPannel:function(rowLen,colLen){
		
		var designer = this;
		var rowNum=  rowLen?rowLen:2;
		var colNum=  colLen?colLen:2;
		rowNum=  rowNum<0?2:rowNum;
		colNum=  colNum<0?2:colNum;

		designer.layoutPannelTable = document.createElement("table");
	
		//designer.layoutPannelTable.setAttribute("onmousemove",designer.name+".mover.showPositionShadow();");
		//designer.layoutPannelTable.onmousemove=designer.name+".mover.showPositionShadow();";
		var isIe = /msie/i.test(navigator.userAgent); 
		//isIe?(colObject.onclick = function() { eval(designer.name+".clickElement(this);"); }):colObject.setAttribute("onclick",designer.name+".clickElement(this);");
    	//isIe?(designer.layoutPannelTable.onmousemove = function() { eval(designer.name+".mover.showPositionShadow();"); }):designer.layoutPannelTable.setAttribute("onmousemove",designer.name+".mover.showPositionShadow();");
    	//designer.layoutId = randomChar();/*该值由页面传过来*/
		designer.layoutPannelTable.id=designer.layoutId;
		
		designer.layoutPannelTable.className="finelinetable";
		//designer.layoutPannelTable.style="";
		var counter=0;
		for(var row = 0;row < rowNum;row++){
			var rowObject = document.createElement("tr");
			//confirm("createDefaultPannel");
			rowObject.id=randomChar();
			//confirm("rowObject.id="+rowObject.id);
			rowObject.className="";
			//rowObject.style="";
			for(var col = 0;col<colNum;col++){
				var colObject = document.createElement("td");
				colObject.id=randomChar();
				counter++;
				colObject.className="";
				colObject.setAttribute("width","50%");
				colObject.setAttribute("height","50%");
				colObject.setAttribute("onclick",designer.name+".clickElement(this);");
				
				   var isIe = /msie/i.test(navigator.userAgent); 
				    //isIe?(colObject.onclick = function() { eval(designer.name+".clickElement(this);"); }):colObject.setAttribute("onclick",designer.name+".clickElement(this);");
				   // colObject.onclick=(isIe?(designer.name+".clickElement(this);"):"");;
				    if(isIe){
				    	colObject.onclick=designer.name+".clickElement(this);";
				    	//colObject.onclick = function() { eval(designer.name+".clickElement(this);");
				    }else{
				    	colObject.setAttribute("onclick",designer.name+".clickElement(this);");
				    }
//				isIe?(colObject.onmousemove = function() { eval(designer.name+".mover.showPositionShadow();"); }):colObject.setAttribute("onmousemove",designer.name+".mover.showPositionShadow();");
				//colObject.style="";
				
				colObject.innerHTML= designer.createContainerWind(colObject.id);//+"<br>"+colObject.id;
				rowObject.appendChild(colObject);
				
				designer.addUnit(colObject.id)
				//designer.layout.addUnit(colObject.id);
			}
			designer.layoutPannelTable.appendChild(rowObject);
		}
		// confirm("unitList.length="+designer.layout.unitsList.length);
		
		//confirm("createDefaultPannel");
		designer.layoutPannelTitle = document.createElement("div");
		designer.layoutPannelTitle.innerHTML = designer.LIST_TITLE_LABEL;
		designer.layoutPannelUsage = document.createElement("div");
		designer.layoutPannelUsage.id="tabletitle"
		designer.layoutPannelUsage.innerHTML = designer.USAGE_LABEL+"<br>";
		

		designer.layoutPannelMain=document.getElementById("layoutDesignerPannel");
		if(designer.layoutPannelMain==undefined||designer.layoutPannelMain==null){
			confirm("__layoutDesignerPannel");
		}
		
		temObject = document.createElement("div");
		//temObject.appendChild(designer.layoutPannelUsage);
		//temObject.appendChild(designer.layoutPannelTitle);
		temObject.appendChild(designer.layoutPannelTable);
		//confirm(temObject.innerHTML);
		designer.layoutPannelMain.innerHTML=temObject.innerHTML;
		
		//designer.tableObj = designer.layoutPannelTable;
		//designer.averageWidthAndHeight();
	},//createDefaultPannel
	
	createContainerWind:function (containerId){
		var designer = this;
		var  containerHTML ="<div><a href=\"javascript:void(0);\" onclick=\""+designer.name+".showSetPartSizeWin('"+containerId+"');\">"+designer.REST_LABEL+"</a></div>";
		return containerHTML;
	},//createContainerWind
	
	design:function (){
		var designer = this;
		//confirm("designer=");
		if (!designer.getDesignObj()){
			confirm("getDesignObj=false");
			return false;
		}
		//confirm("designer.setLayouMetrix()");
		//
		designer.setLayouMetrix();
		designer.tableObj=document.getElementById(designer.layoutId);
		var args=designer.design.arguments;
		var type = args[0];
		var num = args[1];
		//confirm("type="+type+",num="+num);
		switch (type){
			case "insertrow_up":
				designer.insertRow('up',num);
				break;
			case "insertrow_down":
				designer.insertRow('down',num);
				break;
			
			case "insertcol_left":
				designer.insertCol('left',num);
				break;
			case "insertcol_right":
				designer.insertCol('right',num);
				break;
			case "colsplit":
				designer.splitCol(num);
				break;
			case "rowsplit":
				designer.splitRow(num);
				break;
			case "deleterow":
				designer.deleteRow();
				break;
			case "deletecol":
				designer.deleteCol();
				break;
			case "merge":
				designer.mergeCell(num);
				break;
			default:
				break;
		}
		//designer.cleanUpEmptyRowsAndColumns();
		designer.averageWidthAndHeight();
		designer.canncelSelectElement();
		designer.tableObj=document.getElementById(designer.layoutId);
	},//design
	
	mergeAttributes:function (newCell,oldCell){
		var designer = this;
		if(newCell==undefined ||newCell ==null||oldCell==undefined ||oldCell ==null){
			return;
		}
		if(designer.isIE){
			newCell.mergeAttributes(oldCell);
		}else{	
			for(var k=0;k<oldCell.attributes.length;k++){
				//confirm(oldCell.attributes[k].name+"="+oldCell.attributes[k].value);
				newCell.setAttribute(oldCell.attributes[k].name,oldCell.attributes[k].value);
			}
		}
	},
	
	
	/** 
	 * 获取元素绝对位置
	 * @param object 元素对象，不可空
	 * 
	 * @return 返回(x,y)坐标表示的元素绝对位置
	 **/
	rePosition : function (object) {
		if(object==null)return { x : 0, y : 0 };
		var $x = $y = 0;
		try{
			do {
				$x += object.offsetLeft;
				$y += object.offsetTop;
			} while ((object = object.offsetParent)); // && o.tagName != "BODY"
	
		}
		catch (e) {
			alert(e.name + ": " + e.message+",object="+object);
		}
		return { x : $x, y : $y };
	},
	
	getSelectionBoundaryElement:function(isStart) {
	    var range, sel, container;
	    if (document.selection) {
	        range = document.selection.createRange();
	        range.collapse(isStart);
	        return range.parentElement();
	    } else {
	        sel = window.getSelection();
	        if (sel.getRangeAt) {
	            if (sel.rangeCount > 0) {
	                range = sel.getRangeAt(0);
	            }
	        } else {
	            // Old WebKit
	            range = document.createRange();
	            range.setStart(sel.anchorNode, sel.anchorOffset);
	            range.setEnd(sel.focusNode, sel.focusOffset);

	            // Handle the case when the selection was selected backwards (from the end to the start in the document)
	            if (range.collapsed !== sel.isCollapsed) {
	                range.setStart(sel.focusNode, sel.focusOffset);
	                range.setEnd(sel.anchorNode, sel.anchorOffset);
	            }
	       }

	        if (range) {
	           container = range[isStart ? "startContainer" : "endContainer"];

	           // Check if the container is a text node and return its parent if so
	           return container.nodeType === 3 ? container.parentNode : container;
	        }   
	    }
	},
	/*
	 *  获得布局表格中选中的单元格
	 */
 	getSelectedTdObj:function(){
		var designer = this; 
		if(designer.selectTdObject){
			return designer.selectTdObject;
		}
		//var selectedNodes =designer.getSelectedNodes();
		//confirm("selectedNodes.length="+selectedNodes.length);
		var selectObject= designer.getSelectionBoundaryElement(true);//document.all? document.selection.createRange().parentElement() : ( window.getSelection || document.getSelection )().focusNode.parentNode;
		//var selectObject= document.all? document.selection.createRange().parentElement(): window.getSelection().focusNode.parentNode;
		confirm("selectObject.tagName="+selectObject.tagName);
		var mousePosition = designer.rePosition(selectObject);
		var objPosition = null,offsetWidth=0,offsetHeight=0;
		
		designer.tableObj=document.getElementById(designer.layoutId);
		var selectTdObject = null;
		for (var i=0;i<designer.tableObj.rows.length;i++){
			var tmp_row=designer.tableObj.rows[i];
			for (var n=0;n<tmp_row.cells.length;n++){
			    var tmp_cell=tmp_row.cells[n];
			    objPosition =designer.rePosition(tmp_cell);
			    offsetWidth = tmp_cell.offsetWidth;
			    offsetHeight = tmp_cell.offsetHeight;
			    tmp_cell.style.backgroundColor="";
			   // confirm("\n mousePosition.x="+mousePosition.x+",mousePosition.y="+mousePosition.y+"\n objPosition.x="+objPosition.x+",objPosition.y="+objPosition.y+"\n offsetWidth="+offsetWidth+",offsetHeight="+offsetHeight);
				if (mousePosition.x>objPosition.x && mousePosition.y>objPosition.y && mousePosition.x<(objPosition.x+offsetWidth) && mousePosition.y<(objPosition.y+offsetHeight)){//初始化当初选中元素的下标					
					tmp_cell.style.backgroundColor="#f0f8ff";
					selectTdObject = tmp_cell;
				}
				
				
			}//for
		}//for
		return selectTdObject;
	
	},//getSelectedTdObj
	clickElement:function(obj){
		//confirm("hello");
		if(obj==undefined||obj==null||obj==''){
			return;
		}
		var designer = this; 		
		
		designer.tableObj=document.getElementById(designer.layoutId);
		
		var selectTdObject = null;
		for (var i=0;i<designer.tableObj.rows.length;i++){
			var tmp_row=designer.tableObj.rows[i];
			for (var n=0;n<tmp_row.cells.length;n++){
			    var tmp_cell=tmp_row.cells[n];			   
			    tmp_cell.style.backgroundColor="";
			   // confirm("\n mousePosition.x="+mousePosition.x+",mousePosition.y="+mousePosition.y+"\n objPosition.x="+objPosition.x+",objPosition.y="+objPosition.y+"\n offsetWidth="+offsetWidth+",offsetHeight="+offsetHeight);
				if (tmp_cell==obj){//初始化当初选中元素的下标					
					tmp_cell.style.backgroundColor="#f0f8ff";
					designer.selectTdObject = tmp_cell;
				}
			}//for
		}//for
	},
	bindClickElement:function(cellElement){
		var designer = this;
		 var isIe = /msie/i.test(navigator.userAgent); 
		    if(isIe){
		    	cellElement.onclick=designer.name+".clickElement(this);";
		    }else{
		    	cellElement.setAttribute("onclick",designer.name+".clickElement(this);");
		    }
	},
	canncelSelectElement:function(){		
		var designer = this; 		
		designer.tableObj=document.getElementById(designer.layoutId);
		//var eventName="onclick"
		for (var i=0;i<designer.tableObj.rows.length;i++){
			var tmp_row=designer.tableObj.rows[i];
			for (var n=0;n<tmp_row.cells.length;n++){
			    var tmp_cell=tmp_row.cells[n];			   
			    tmp_cell.style.backgroundColor="";	
			    tmp_cell.setAttribute("onclick",designer.name+".clickElement(this);");
			   
			    designer.bindClickElement(tmp_cell);

			}//for
		}//for
	},
	/*
	 *  初始化选中的表格、行、单元格
	 * @初始化成功返回true，否则返回false
	 */
	getDesignObj:function(){
		var designer = this;
		//confirm("tdObj.tagName=aaa");	
		var tdObj=designer.getSelectedTdObj();
		//confirm("tdObj.tagName="+tdObj);	
		if (tdObj==undefined||tdObj==null || tdObj.tagName != "TD"){
			//confirm("return false");		
			return false;
		}
		
		var trObj=tdObj.parentElement;
		//confirm("trObj.tagName="+trObj.tagName);
		if (trObj==undefined||trObj==null || trObj.tagName != "TR"){
			return false;
		}
		var tableObj=trObj.parentElement;	
		//confirm("tableObj.tagName="+tableObj.tagName);
		if (tableObj!=undefined&&tableObj!=null&&tableObj.tagName == "TBODY"){
			tableObj=tableObj.parentElement;
		}
		//confirm("tableObj.tagName="+tableObj.tagName);
		if (tableObj==undefined||tableObj==null || (tableObj.tagName != "TABLE")){
			return false;
		}
		
		designer.tdObj=tdObj;
		designer.trObj=trObj;
		designer.tableObj=tableObj;
		return true;
	},
	

	setLayouMetrix:function(){
		var designer = this;
		designer.layouMetrix = new Array();
		for (var i=0;i<designer.tableObj.rows.length;i++){
			designer.layouMetrix[i]=new Array();
		}
		
		for (var i=0;i<designer.tableObj.rows.length;i++){
			var tmp_row=designer.tableObj.rows[i];
			var tmp_y=0;
			for (var n=0;n<tmp_row.cells.length;n++){
			    var tmp_cell=tmp_row.cells[n];
				if (designer.tdObj==tmp_cell){//初始化当初选中元素的下标
					designer.rowIndex=i;
					tmp_y=designer.colIndex=designer.getMetrixColIndex(i,tmp_y);
				}
				
				for (var c=0;c<tmp_cell.colSpan;c++){
					for (var r=0;r<tmp_cell.rowSpan;r++){
						var tmp_ir=i+r;
						var tmp_y=designer.getMetrixColIndex(tmp_ir,tmp_y);
						if (c==0 && r==0) var tmp_obj=new DesignObject(i,tmp_y,tmp_cell);
						designer.layouMetrix[tmp_ir][tmp_y]=tmp_obj;
					}
				}
				tmp_y++;
			}//for
		}//for
	},//setLayouMetrix
	
	
	getMetrixColIndex:function(rowIndex,colIndex){
		var designer = this;
		if (!designer.layouMetrix[rowIndex][colIndex]){
			return colIndex;
		}else {
			return designer.getMetrixColIndex(rowIndex,colIndex+1);
		}
	},//getMetrixIndex

	
	//----------------------------------------------------------------------------------------------------------	
	/**
	 * 表格中插入行
	 * 在指定表格中插入指定的行数
	 *----------------------------------------------------
	 */
	insertRow : function (what,num){
		var designer = this;
		var rowIndex = designer.rowIndex;
		/*向上插入行，改为在当前行的下面一行插入*/		
		var currRowIndex = (what=='up') ? rowIndex : (rowIndex + 1);		
		
		//var currRowIndex = rowIndex;//(what=='up') ? rowIndex : (rowIndex + 1);
		/*最后一行的下面插入行*/
	
		var targetMetrixElement=designer.layouMetrix[designer.rowIndex];
		var lastObj= null;
		var tempObj = null;
			for (var n=0;n<num;n++){
				var newRow=designer.tableObj.insertRow(currRowIndex);
				
				var i=targetMetrixElement.length;
				//confirm("targetMetrixElement.length="+targetMetrixElement.length);
				lastObj= null;
				while (i>0){
					i--;
					
					tempObj = targetMetrixElement[i];
					//confirm("targetMetrixElement.length="+targetMetrixElement.length+" ,tempObj.cellObj.rowSpan="+tempObj.cellObj.rowSpan);
					if(lastObj&&tempObj.cellObj.id==lastObj.cellObj.id){
						continue;
					}
					//confirm("targetMetrixElement.length="+targetMetrixElement.length);
					if(tempObj.cellObj.rowSpan>1){
						tempObj.cellObj.rowSpan+=1;
						
						if(what=='up'&&(tempObj.cellObj.parentElement.rowIndex-1)==designer.rowIndex){
							var newCell=newRow.insertCell();				
							designer.mergeAttributes(newCell,tempObj.cellObj);	
							newCell.id=tempObj.cellObj.id;
							designer.bindClickElement(newCell);
							
							newCell.innerHTML=tempObj.cellObj.innerHTML;	
							newCell.rowSpan=tempObj.cellObj.rowSpan;
							newCell.colSpan=tempObj.cellObj.colSpan;
							
							//newRow.appendChild(tempObj.cellObj);
							tempObj.cellObj.parentElement.removeChild(tempObj.cellObj);							
						}
					}else{
						var newCell=newRow.insertCell();				
						designer.mergeAttributes(newCell,tempObj.cellObj);	
						newCell.id=randomChar();
						designer.bindClickElement(newCell);
						newCell.innerHTML=designer.createContainerWind(newCell.id);	
						newCell.rowSpan=1
						newCell.colSpan=tempObj.cellObj.colSpan;
						
						designer.addUnit(newCell.id);
					}
					//confirm("targetMetrixElement.length="+targetMetrixElement.length);
					lastObj=tempObj;
					
				}
			}
		
	},//insertRow	
	
	/*
	 * 在选中的单元格左或右插入列
	 */
	insertCol:function (what,num){
		var designer = this;
		var rowIndex=0;
		while (rowIndex<designer.layouMetrix.length){
			var tmpCellObj=designer.layouMetrix[rowIndex][designer.colIndex].cellObj;
			rowIndex+=tmpCellObj.rowSpan
			if (tmpCellObj.colSpan==1){
				var cellIndex=(what=="right")?(tmpCellObj.cellIndex+1):tmpCellObj.cellIndex;
				for (var n=0;n<num;n++){
					var newCell=tmpCellObj.parentElement.insertCell(cellIndex);
					//newCell.innerHTML="&nbsp;";
					designer.mergeAttributes(newCell,tmpCellObj);
					newCell.id=randomChar();
					designer.bindClickElement(newCell);
					newCell.innerHTML=designer.createContainerWind(newCell.id);
					
					designer.addUnit(newCell.id);
				}
			}else{
				tmpCellObj.colSpan+=num;
			}
		}
	},//insertCol
	
	/*
	 * 对选中的单元格进行分拆
	 */
	splitCol: function (num){
		if (num<2){
			return false;
		}
		var designer = this;
		var rowIndex=0;
		var count=0;
		var temp2;
		var colSpanAmount = 0,colAmount=0,maxAmount=0;
		var lastEl = null,nextEl=null;
		var allRowColSpan = [];
		if(designer.tdObj.colSpan>=num){
			for (var n=0;n<num-1;n++){
				var newCell=designer.tdObj.parentElement.insertCell(designer.tdObj.cellIndex);
				//newCell.innerHTML="&nbsp;";
				designer.mergeAttributes(newCell,tmpCellObj);
				newCell.colSpan=1;
				newCell.id=randomChar();
				designer.bindClickElement(newCell);
				newCell.innerHTML=designer.createContainerWind(newCell.id);
				
				designer.addUnit(newCell.id);
			}
			//if(designer.tdObj.colSpan>num){
				designer.tdObj.colSpan =designer.tdObj.colSpan-(num-1);
			//}
			return;
		}		
		
		rowIndex=0;
		var relativeColSpan=0;
		if(designer.tdObj.colSpan<num&&designer.tdObj.colSpan>1){
			relativeColSpan=num-designer.tdObj.colSpan;
		}else{
			relativeColSpan=num-1;
		}
		/*在选中位置先增加列表*/
		var isAdd = true;
		while (rowIndex<designer.layouMetrix.length){
			var tmpCellObj=designer.layouMetrix[rowIndex][designer.colIndex].cellObj;
			if (tmpCellObj==designer.tdObj&&isAdd==true){
				/*在选中位置增加列*/
				for (var n=0;n<num-1;n++){
					var newCell=tmpCellObj.parentElement.insertCell(designer.tdObj.cellIndex);
					//newCell.innerHTML="&nbsp;";
					designer.mergeAttributes(newCell,tmpCellObj);
					newCell.colSpan=1;
					newCell.id=randomChar();
					designer.bindClickElement(newCell);
					newCell.innerHTML=designer.createContainerWind(newCell.id);
					
					designer.addUnit(newCell.id);
				}
				designer.tdObj.colSpan =1;
				isAdd = false;
			}else{
				tmpCellObj.colSpan+=relativeColSpan;
			}
			
			rowIndex+=tmpCellObj.rowSpan;
		}//while		
	},//splitCol
	
	splitRow : function (num){
		if (num<1){
			return false;
		}
		var designer = this;
		while (num>0){
			var colIndex=0;
			var rowIndex=designer.rowIndex+designer.tdObj.rowSpan-1;
			var tmpIndex=0;
			while (colIndex<designer.layouMetrix[rowIndex].length){
				var tmpMetrixElement=designer.layouMetrix[rowIndex][colIndex]
				if(designer.tdObj.rowSpan>1){
					if (tmpMetrixElement.cellObj==designer.tdObj){
						var newCell=designer.tableObj.rows[rowIndex].insertCell(tmpIndex);
						//newCell.innerHTML="&nbsp;";
						//confirm();
						designer.mergeAttributes(newCell,designer.tdObj);
						newCell.rowSpan=1;
						newCell.colSpan=designer.tdObj.colSpan;
						newCell.id=randomChar();
						designer.bindClickElement(newCell);
						newCell.innerHTML=designer.createContainerWind(newCell.id);
						
						designer.addUnit(newCell.id);
					}
					if (rowIndex==tmpMetrixElement.rowIndex){
						tmpIndex++;
					}
				}else {
					if (tmpMetrixElement.cellObj==designer.tdObj){
						var newRow=designer.tableObj.insertRow(designer.rowIndex+1);
						newRow.id=randomChar();
						var newCell=newRow.insertCell(0);
						designer.mergeAttributes(newCell,designer.tdObj);
						newCell.id=randomChar();
						designer.bindClickElement(newCell);
						newCell.innerHTML=designer.createContainerWind(newCell.id);
						newCell.colSpan=designer.tdObj.colSpan;
						//newCell.innerHTML="&nbsp;";
						designer.addUnit(newCell.id);
					}else{ 
						tmpMetrixElement.cellObj.rowSpan+=1;
					}
				}
				colIndex+=tmpMetrixElement.cellObj.colSpan;
			}
			if(designer.tdObj.rowSpan>1){
				designer.tdObj.rowSpan-=1;
			}
			num-=1;
		}
	},//splitRow
	/**
	 * 表格中删除行
	 *----------------------------------------------------
	 */
	deleteRow: function (){
		/*
		 * 删除行
		 * 先删除所在单元格所在的行，
		 * 再修改其他横跨该行的单元格的行跨度数,要减少一
		 * 行变化了，可能引起列数的变化
		 */
		var designer = this;	
		//var tempColSpans = [];
		if(designer.tableObj.rows.length==1){			
			confirm(designer.CANNOT_DELETE_ROW_LABEL);
			return;
		}
		
		var colIndex=0,rowIndex=0,continueDeleteCount=0,tempDesignObj=null;
		while (colIndex<designer.layouMetrix[designer.rowIndex].length){
			var tmpCellObj=designer.layouMetrix[designer.rowIndex][colIndex].cellObj;
			//tempColSpans[tempColSpans.length]=tmpCellObj.colSpan;
			if (tmpCellObj.rowSpan > 1){
				tmpCellObj.rowSpan-=1;	
				
				if (tmpCellObj.parentElement.rowIndex == designer.rowIndex){
					if (tmpCellObj.cellIndex<designer.trObj.cells.length-1){
						var cellIndex=designer.layouMetrix[designer.rowIndex+1][colIndex+tmpCellObj.colSpan].cellObj.cellIndex;
					}else{
						var cellIndex=designer.tableObj.rows[designer.rowIndex+1].cells.length;
					}
					//var newCell=designer.tableObj.rows[designer.rowIndex+1].insertCell(cellIndex);
					var newCell=designer.tableObj.rows[designer.rowIndex+1].insertCell(cellIndex);
					//confirm("tmpCellObj.cellIndex="+tmpCellObj.cellIndex+", cellIndex="+cellIndex);
					designer.mergeAttributes(newCell,tmpCellObj);
					newCell.colSpan=tmpCellObj.colSpan;
					newCell.rowSpan=tmpCellObj.rowSpan;
					newCell.id=tmpCellObj.id;//randomChar();
					designer.bindClickElement(newCell);
					newCell.innerHTML=tmpCellObj.innerHTML;// designer.createContainerWind(newCell.id);	
					
					/*增加修改了元素，矩阵中的数据也要进行更新*/
					for(var i=0;i<tmpCellObj.rowSpan;i++){
						designer.layouMetrix[designer.rowIndex+i+1][tmpCellObj.cellIndex].cellObj=newCell;
					}					
				}
			}else{
				designer.deleteUnitColumn(tmpCellObj.id);				
				tmpCellObj.parentElement.deleteCell(tmpCellObj.cellIndex);				
			}
			//tmpCellObj.parentElement.deleteCell(tmpCellObj.cellIndex);
			colIndex+=tmpCellObj.colSpan;
		}		
		
		designer.tableObj.deleteRow(designer.trObj.rowIndex);		

		
		designer.reCalculateSpan();
	},//deleteRow
	reCalculateSpan : function(){
		var designer = this;
		designer.reCalculateRowSpan();
		designer.reCalculateColSpan();
	},
	reCalculateColSpan : function(){
		var designer = this;
		/*
		 * 检查行与列的跨度是否合法，不合法需要修改
		 * 1)检查行跨度，每一列的单元格式的行跨度之和必须等总行数，如果小于新当前行要加，如果大于新当前行要减
		 * 2)根据前当前行的列跨度之和来检测其他各行的列跨度，如果不相等，则说明被删除的行的中包括其他行跨列，其他行对应单元格的列跨度数要减少，减少数为减少的单元格数。
		 */
		if(designer.tableObj.rows.length==1&&designer.tableObj.rows[0].cells.length==1){
			designer.tableObj.rows[0].cells[0].colSpan=1;
			designer.tableObj.rows[0].cells[0].rowSpan=1;
			return;
		}
		var isStop=true,rowSpanCount=0,currSpan=0;
		colIndex=0;
		var flagRow = null,lastObj=null;
		if(designer.rowIndex==0&&designer.layouMetrix.length>1){
			flagRow=designer.layouMetrix[1];
		}else {
			flagRow=designer.layouMetrix[0];
		}
		//confirm("flagRow.length="+flagRow.length);
		
		colIndex=0;
		var maxColCellIndex=0,currCellIndex=0,minPrivColSpan=0,nextCellObj=null;
		var isMinusColSpan= true;
		//confirm("flagRow.length="+flagRow.length);
		while (colIndex<flagRow.length){
		//while (flagRow[colIndex]){	
			isMinusColSpan= true;
			currCellIndex=0;
			minPrivColSpan=0,tempPrivColSpan=0;
			for(var rowIndex=0;rowIndex<designer.layouMetrix.length;rowIndex++){
				//if(rowIndex==designer.rowIndex){
				//	continue;
				//}
				var tmpCellObj=designer.layouMetrix[rowIndex][colIndex];
				//confirm("designer.layouMetrix.length="+designer.layouMetrix.length+" ,rowIndex="+rowIndex+" , colIndex="+colIndex+" ,tmpCellObj.cellObj.colSpan="+tmpCellObj.cellObj.colSpan);
				/*同列单元格中只要有一个单元格的列跨度为1，即不用调整；只有所有单元格的列跨度都大于1且有共度部分的跨度大于1时，才需要调整（减少）所有列的跨度*/	
				if(tmpCellObj.cellObj.colSpan>1){//不要引用tmpCellObj.colSpan，因为有变化，可能不准确了
					currCellIndex=0;
					lastObj=null;
					var n=0;
					//confirm("111 currCellIndex="+currCellIndex);
					/*获取当前单元格在当前行的的开始下标*/	
					for(var n=0;n<colIndex;n++){					
						nextCellObj = designer.layouMetrix[rowIndex][n].cellObj;
						/*除了相同元素的列跨度不能重复加，同时，当前单元格的列跨度也不能加入*/
						if(lastObj&&nextCellObj.id==lastObj.id||(nextCellObj.id==designer.layouMetrix[rowIndex][colIndex].cellObj.id)){
							continue;
						}
						
						currCellIndex+=nextCellObj.colSpan;
						lastObj=nextCellObj;
					}
						
					//confirm("222 currCellIndex="+currCellIndex+", tmpCellObj.cellObj.colSpan="+tmpCellObj.cellObj.colSpan);
					if(currCellIndex>maxColCellIndex){
						maxColCellIndex=currCellIndex;
					}
					tempPrivColSpan =currCellIndex+tmpCellObj.cellObj.colSpan;
					if(minPrivColSpan==0){
						minPrivColSpan = tempPrivColSpan;
					}else if(tempPrivColSpan<minPrivColSpan&&tempPrivColSpan>maxColCellIndex){
						/*获取同列单元格中的最小结束下标，但须满足同列单元格中的最小结束下标大于同列单元格中的最大开始下标*/	
						minPrivColSpan=tempPrivColSpan;
					}
					//confirm("currCellIndex="+currCellIndex+" ,minPrivColSpan="+minPrivColSpan+" ,maxColCellIndex="+maxColCellIndex);
				}else{
					isMinusColSpan= false;
					break;
				}				
			}//for
			
			//confirm("isMinusColSpan="+isMinusColSpan+" ,minPrivColSpan="+minPrivColSpan+" ,maxColCellIndex="+maxColCellIndex+" ,minusSpan="+minusSpan);
			/*从前面的检测中检测到需要调整列跨度，且共同跨度部分的跨度值大于1，则进和跨度调整*/	
			if(isMinusColSpan==true&&minPrivColSpan>maxColCellIndex+1){
				/*计算跨度调整幅度*/
				var minusSpan = minPrivColSpan-(maxColCellIndex+1);
				
				for(var rowIndex=0;minusSpan>0&&rowIndex<designer.layouMetrix.length;rowIndex++){
					//if(rowIndex==designer.rowIndex){
					//	continue;
					//}
					var tmpCellObj=designer.layouMetrix[rowIndex][colIndex];
					if(tmpCellObj.cellObj.id===lastObj){/*因为矩阵中有重复的元素，所以要避免重复减少*/
						continue;
					}
					tmpCellObj.cellObj.colSpan-=minusSpan;	
					lastObj = tmpCellObj.cellObj.id;
				}				
			}			
			colIndex++;
		}	
		
	},//reCalculateSpan
	

	deleteCol : function (){
		var designer = this;
		
		var isLastCol = true;
		for(var r=0;r<designer.tableObj.rows.length;r++){
			if(designer.tableObj.rows[0].cells.length>1){
				isLastCol = false;
			}
		}
		if(isLastCol){
			confirm(designer.CANNOT_DELETE_COL_LABEL);
			return ;
		}
		
		
		var rowIndex=0;
		while (rowIndex<designer.layouMetrix.length){
			var tmpCellObj=designer.layouMetrix[rowIndex][designer.colIndex].cellObj;
			rowIndex+=tmpCellObj.rowSpan
			//if(tmpCellObj.rowSpan>1){
			//	tmpCellObj.rowSpan=tmpCellObj.rowSpan-1;
			//}
			if (tmpCellObj.colSpan==1){
				designer.deleteUnitColumn(tmpCellObj.id);
				tmpCellObj.parentElement.deleteCell(tmpCellObj.cellIndex);					
			}else{
				tmpCellObj.colSpan-=1;
			}
		}		
	},//deleteCol
    
    mergeCell : function (what){
    	var designer = this;
    	//confirm("what="+what);
    	var sourceUnit,targetUnit;
		switch (what){
			case "up":
				var tmpObj=designer.checkToMerge(-1,0);
				//confirm("designer.tdObj.cellIndex="+designer.tdObj.cellIndex);
				if (!tmpObj){
					return false;
				}
				/*if (designer.tdObj.innerHTML != "&nbsp;"){
					tmpObj.cellObj.innerHTML+=designer.tdObj.innerHTML;
				}*/
				sourceUnit=designer.getDropCell(designer.trObj.rowIndex,designer.tdObj.cellIndex);					
				targetUnit=tmpObj.cellObj;
				designer.mergeUnitColumn(sourceUnit.id, targetUnit.id);
				
				tmpObj.cellObj.rowSpan+=designer.dropCell(designer.trObj.rowIndex,designer.tdObj.cellIndex,'r');
				
				break;
			case "down":
				var tmpObj=designer.checkToMerge(designer.tdObj.rowSpan,0);
				if (!tmpObj){
					return false;
				}
				/**if (tmpObj.cellObj.innerHTML != "&nbsp;"){
					designer.tdObj.innerHTML+=tmpObj.cellObj.innerHTML;
				}*/
				
				sourceUnit=designer.getDropCell(designer.trObj.rowIndex+designer.tdObj.rowSpan,tmpObj.cellObj.cellIndex);					
				targetUnit=designer.tdObj;
				designer.mergeUnitColumn(sourceUnit.id, targetUnit.id);
				
				designer.tdObj.rowSpan+=designer.dropCell(designer.trObj.rowIndex+designer.tdObj.rowSpan,tmpObj.cellObj.cellIndex,'r');
				break;
			case "left":
				var tmpObj=designer.checkToMerge(0,-1);
				if (!tmpObj){
					return false;
				}
				/*if (designer.tdObj.innerHTML != "&nbsp;"){
					tmpObj.cellObj.innerHTML+=designer.tdObj.innerHTML;
				}*/
				
				sourceUnit=designer.getDropCell(designer.trObj.rowIndex,designer.tdObj.cellIndex);					
				targetUnit=tmpObj.cellObj;
				designer.mergeUnitColumn(sourceUnit.id, targetUnit.id);
				
				tmpObj.cellObj.colSpan+=designer.dropCell(designer.trObj.rowIndex,designer.tdObj.cellIndex,'c');
				break;
			case "right":
				var tmpObj=designer.checkToMerge(0,designer.tdObj.colSpan);
				if (!tmpObj){
					return false;
				}
				/*if (tmpObj.cellObj.innerHTML != "&nbsp;"){
					designer.tdObj.innerHTML+=tmpObj.cellObj.innerHTML;
				}*/
				sourceUnit=designer.getDropCell(designer.trObj.rowIndex,designer.tdObj.cellIndex+1);					
				targetUnit=designer.tdObj;
				designer.mergeUnitColumn(sourceUnit.id, targetUnit.id);
				designer.tdObj.colSpan+=designer.dropCell(designer.trObj.rowIndex,designer.tdObj.cellIndex+1,'c');
				break;
			default :
				break;
		}
		designer.reCalculateSpan();
     },//mergeCell
/*
  * 检测是否可以合并
  */
     checkToMerge : function (rowIndex,colIndex){
    	var designer = this;
		/*最顶行不能向上合并和最尾行不能向下合并*/
		if (!designer.layouMetrix[designer.rowIndex+rowIndex]){
			return false;
		}
		var tmpCellObj=designer.layouMetrix[designer.rowIndex+rowIndex][designer.colIndex+colIndex];
		if (!tmpCellObj){
			return false;
		}
		if (rowIndex!=0){
			/*不是当前行单元格不能合并；将合并的两个单元格的列跨度不一致，不能合并*/
			if (tmpCellObj.colIndex!=designer.colIndex || tmpCellObj.cellObj.colSpan!=designer.tdObj.colSpan){
				return false;
			}
		}else if (colIndex != 0){
			/*不是当前行不能合并，将合并的两个单元格的行跨度不一致，不能合并*/
			if (tmpCellObj.rowIndex!=designer.rowIndex || tmpCellObj.cellObj.rowSpan!=designer.tdObj.rowSpan){
				return false;
			}
		}
		return tmpCellObj;
	},//checkToMerge
	/**
	 * 获得删除的元素
	 * @param rowIndex
	 * @param colIndex
	 * @return
	 */
	getDropCell:function (rowIndex,colIndex){
		var designer = this;
		var trObj=designer.tableObj.rows[rowIndex];
		if (!trObj){
			return null;
		}
		return trObj.cells[colIndex];
		
	},
	
	dropCell:function (rowIndex,colIndex,kind){
		var designer = this;
		var trObj=designer.tableObj.rows[rowIndex];
		if (!trObj){
			return false;
		}
		var rowSpans=trObj.cells[colIndex].rowSpan;
		var colSpans=trObj.cells[colIndex].colSpan;
		trObj.deleteCell(colIndex);
		
		
		if (kind=="r"){
			return rowSpans;
		}else if (kind=="c"){
			return colSpans;
		}
	},

	reCalculateRowSpan : function(){
		
		var designer = this;
		/*
		 * 检查行与列的跨度是否合法，不合法需要修改
		 * 1)检查行跨度，每一列的单元格式的行跨度之和必须等总行数，如果小于新当前行要加，如果大于新当前行要减
		 * 2)根据前当前行的列跨度之和来检测其他各行的列跨度，如果不相等，则说明被删除的行的中包括其他行跨列，其他行对应单元格的列跨度数要减少，减少数为减少的单元格数。
		 */
		if(designer.tableObj.rows.length==1&&designer.tableObj.rows[0].cells.length==1){
			designer.tableObj.rows[0].cells[0].colSpan=1;
			designer.tableObj.rows[0].cells[0].rowSpan=1;
			return;
		}
		for(var rowIndex = 0;rowIndex<designer.tableObj.rows.length;rowIndex++){
			if(designer.tableObj.rows[rowIndex].cells.length==0){
				designer.tableObj.deleteRow(rowIndex);
			}
		}
		
		var rowIndex = 0,colIndex;
		var isMinusRowSpan= true;
		var maxRowIndex=0,currCellIndex=0,minPrivRowSpan=0,tempPrivRowSpan=0,nextCellObj=null;
		for(var rowIndex=0;rowIndex <designer.layouMetrix.length;rowIndex++){
			isMinusRowSpan= true;
			currCellIndex=0;
			minPrivRowSpan=0,tempPrivRowSpan=0;
			//confirm("designer.layouMetrix[rowIndex].length="+designer.layouMetrix[rowIndex].length);
			for(var colIndex=0;colIndex<designer.layouMetrix[rowIndex].length;colIndex++){
				//if(colIndex==designer.colIndex){
				//	continue;
				//}
				
				var tmpCellObj=designer.layouMetrix[rowIndex][colIndex];
				//confirm("designer.layouMetrix.length="+designer.layouMetrix[rowIndex].length+" ,rowIndex="+rowIndex+" , colIndex="+colIndex+" ,tmpCellObj.cellObj.rowSpan="+tmpCellObj.cellObj.rowSpan);
				/*同列单元格中只要有一个单元格的列跨度为1，即不用调整；只有所有单元格的列跨度都大于1且有共度部分的跨度大于1时，才需要调整（减少）所有列的跨度*/	
				if(tmpCellObj.cellObj.rowSpan>1){//不要引用tmpCellObj.colSpan，因为有变化，可能不准确了
					currCellIndex=0;
					lastObj=null;
					var n=0;
					//confirm("111 currCellIndex="+currCellIndex);
					/*获取当前单元格在当前行的的开始下标*/	
					for(var n=0;n<rowIndex;n++){					
						nextCellObj = designer.layouMetrix[n][colIndex].cellObj;
						/*除了相同元素的列跨度不能重复加，同时，当前单元格的列跨度也不能加入*/
						if(lastObj&&nextCellObj.id==lastObj.id||(nextCellObj.id==designer.layouMetrix[rowIndex][colIndex].cellObj.id)){
							continue;
						}
						
						currCellIndex+=nextCellObj.rowSpan;
						lastObj=nextCellObj;
					}
						
					//confirm("222 currCellIndex="+currCellIndex+", tmpCellObj.cellObj.colSpan="+tmpCellObj.cellObj.colSpan);
					if(currCellIndex>maxRowIndex){
						maxRowIndex=currCellIndex;
					}
					tempPrivRowSpan =currCellIndex+tmpCellObj.cellObj.rowSpan;
					if(minPrivRowSpan==0){
						minPrivRowSpan = tempPrivRowSpan;
					}else if(tempPrivRowSpan<minPrivRowSpan&&tempPrivRowSpan>maxRowIndex){
						/*获取同列单元格中的最小结束下标，但须满足同列单元格中的最小结束下标大于同列单元格中的最大开始下标*/	
						minPrivRowSpan=tempPrivRowSpan;
					}
					//confirm("currCellIndex="+currCellIndex+" ,minPrivColSpan="+minPrivColSpan+" ,maxColCellIndex="+maxColCellIndex);
				}else{
					isMinusRowSpan= false;
					break;
				}				
			}//for
			
			//confirm("isMinusColSpan="+isMinusColSpan+" ,minPrivColSpan="+minPrivColSpan+" ,maxColCellIndex="+maxColCellIndex+" ,minusSpan="+minusSpan);
			/*从前面的检测中检测到需要调整列跨度，且共同跨度部分的跨度值大于1，则进和跨度调整*/	
			if(isMinusRowSpan==true&&minPrivRowSpan>maxRowIndex+1){
				/*计算跨度调整幅度*/
				var minusSpan = minPrivRowSpan-(maxRowIndex+1);
				
				for(var colIndex=0;minusSpan>0&&colIndex<designer.layouMetrix[rowIndex].length;colIndex++){
					//if(colIndex==designer.colIndex){
					//	continue;
					//}
					var tmpCellObj=designer.layouMetrix[rowIndex][colIndex];
					if(tmpCellObj.cellObj.id===lastObj){/*因为矩阵中有重复的元素，所以要避免重复减少*/
						continue;
					}
					tmpCellObj.cellObj.rowSpan-=minusSpan;	
					lastObj = tmpCellObj.cellObj.id;
				}				
			}			
			rowIndex++;
		}//for
	
	},//reCalculateRowSpan
	
	//getUnitLoader:function(unitId){
	//	var designer = this;
	//	return "<a href='"+unitId+"'>loader</a>"; 
	//},//getUnitLoader
	
	showSetPartSizeWin:function(tdId){
		var designer = this;
		var tdObj = document.getElementById(tdId);
		var width = tdObj.width,height=tdObj.height;
		tdObj.innerHTML="<br><div id='"+tdId+"_setPartSizeWin' style='displaye:inline;'><div style='float:left;'>"+designer.WIDTH_LABEL+"<input type='text' id='"+tdId+"_tdWidth' value='"+width+"'/></div><div>"+designer.HEIGHT_LABEL+"<input type='text' id='"+tdId+"_tdHeight' value='"+height+"'/></div><div><input type='button'  value='"+designer.SURE_LABEL+"' onclick='"+designer.name+".setPartSize(\""+tdId+"\")'/><input type='button'  value='"+designer.CANNCEL_LABEL+"' onclick='"+designer.name+".cancelSetPartSize(\""+tdId+"\")'/></div></div>"
	},//showSetPartSizeWin

	setPartSize:function (tdId){
		var designer = this;
		var tdObj = document.getElementById(tdId);
		var tempObj = document.getElementById(tdId+"_setPartSizeWin");
		
		var tdWidth = document.getElementById(tdId+"_tdWidth").value;
		
		var tdHeight = document.getElementById(tdId+"_tdHeight").value;
		if(tdWidth!=undefined&&tdWidth!=null&&tdWidth!=""){
			tdObj.setAttribute('width', tdWidth);
		}
		if(tdHeight!=undefined && tdHeight!=null && tdHeight!=""){
			tdObj.setAttribute('height', tdHeight);
		}
		
		tdObj.removeChild(tempObj);//
		//tdObj.innerHTML=designer.createContainerWind(tdId);
	},//setPartSize
	cancelSetPartSize:function (tdId){
		var designer = this;
		var tdObj = document.getElementById(tdId);
		var tempObj = document.getElementById(tdId+"_setPartSizeWin");
		tdObj.removeChild(tempObj);//
		tdObj.innerHTML=designer.createContainerWind(tdId);
	},
	averageWidthAndHeight:function(){
		var designer = this,tempObj=null;
		var colCount=0,rowCount,avWidth,avHeight;
			
	
		for(var colIndex=0;colIndex<designer.tableObj.rows[0].cells.length;colIndex++){
			tempObj=designer.tableObj.rows[0].cells[colIndex];
			colCount+=tempObj.colSpan;
		}
		/*if(100%colCount==0){
			avWidth = 100/colCount;				
		}else{
			avWidth=(100-(100%colCount))/colCount;				
		}*/
		
		
		rowCount=designer.tableObj.rows.length;
		/*if(100%rowCount==0){
			avHeight = 100/rowCount;				
		}else{
			avHeight=(100-(100%rowCount))/rowCount;				
		}*/
		//avHeight = avHeight+"%";
		
		var cellWidth=0,cellHeight=0;
		for(var rowIndex=0;rowIndex<designer.tableObj.rows.length;rowIndex++){
			for(var colIndex=0;colIndex<designer.tableObj.rows[rowIndex].cells.length;colIndex++){
				tempObj=designer.tableObj.rows[rowIndex].cells[colIndex];
				cellWidth = 100*tempObj.colSpan;				
				cellHeight = 100*tempObj.rowSpan;
				
				cellWidth = (cellWidth/colCount).toFixed(2);
				cellHeight =(cellHeight/rowCount).toFixed(2);
				
				tempObj.setAttribute("width",cellWidth+"%");
				tempObj.setAttribute("height",cellHeight+"%");
			}
		}

	},//averageWidthAndHeight
	ShowOrHideDesignPannel:function(switchBtnId,operaId) {
		var designer = this;
	    try {
	        var pannel = document.getElementById(operaId);
	        if (pannel.style.display != "none") {
	        	pannel.style.display = "none";
	        	pannel.setAttribute("width","0");
	        	pannelView = document.getElementById("layoutDesignerPannel");
	        	pannelView.parentElement.setAttribute("width","98%");
	        	switchBtn=document.getElementById(switchBtnId);
	        	switchBtn.value=designer.SHOW_PANNEL;
	        }else {
	        	pannel.style.display = "";
	        	pannel.setAttribute("width","20%");
	        	pannelView.parentElement.setAttribute("width","80%");
	        	switchBtn=document.getElementById(switchBtnId);
	        	switchBtn.value=designer.HIDDEN_PANNEL;
	        }
	    }
	    catch (ee) {
	        //alert(ee.massage);
	    }
	},//ShowOrHideDesignPannel
	/**
	 * -----------------------------------
	 *  与模板数据交互
	 * -----------------------------------
	 * */
	getLayoutTemplate:function(isSubmit){
		
		var designer = this;
		//if(designer.tableObj==undefined||designer.tableObj==null){
			designer.tableObj = document.getElementById(designer.layoutId);
		//}
		//if(designer.tableObj==undefined||designer.tableObj==null){
		//	return ;
		//}
		
		var tempLayout = document.createElement("table"),tempTr,tempTd,currTr,currTd;
		//designer.mergeAttributes(tempLayout,designer.tableObj);
		var cssText = "border:0;margin:0;padding:0;cellSpacing:0;cellPadding:0;width:100%;height:100%;";
		tempLayout.id = designer.tableObj.id;
		tempLayout.setAttribute("width","100%");
		tempLayout.setAttribute("height","100%");
		tempLayout.setAttribute("style",cssText);
		if(designer.isIE){
			tempLayout.style.cssText = cssText;
		}
		for(var rowIndex=0;rowIndex<designer.tableObj.rows.length;rowIndex++){ 
			currTr = designer.tableObj.rows[rowIndex];
			
			tempTr = document.createElement("tr");
			designer.mergeAttributes(tempTr,currTr);
			for(var colIndex=0;colIndex<currTr.cells.length;colIndex++){
				currTd=currTr.cells[colIndex];
				
				tempTd = document.createElement("td");
				tempTd.setAttribute("onclick",designer.name+".clickElement(this);");
				designer.mergeAttributes(tempTd,currTd);
				tempTd.id = currTd.id;
				tempTd.colSpan= currTd.colSpan;
				tempTd.rowSpan= currTd.rowSpan;
				tempTd.style.backgroundColor="";
				tempTd.setAttribute("valign","top");
				tempTd.innerHTML= designer.getUnitLoader(designer.layoutId,currTd.id);
				
				tempTr.appendChild(tempTd);
				
				designer.addUnit(tempTd.id);
			}
			tempLayout.appendChild(tempTr);
		}
		var tempDiv = document.createElement("div");
		tempDiv.appendChild(tempLayout);
		var currentSysCode="<%String currentSysCode=  request.getParameter(\"currentSysCode\");%>";
		document.getElementById("layoutDesignerTemplateContent").value=currentSysCode+tempDiv.innerHTML;
		var saveValueArea = document.getElementById("saveValueArea");
		 
		var unitList =designer.layout.unitsList,unitId,columnList,columnId;
		var valueElement,checkElement,tempValue;
		 //confirm("unitList.length="+unitList.length);
		for(var i=0;i<unitList.length;i++){			 
			 unitId = unitList[i].unitId;
			 if(unitId==designer.layoutSandBoxSystemColumnId){
				 continue;
			 }
			 if(!document.getElementById(unitId))
			 {
				 continue;
			 }
			 columnList = unitList[i].portletList;
			 designer.appendSaveValueArea(unitId,"unitId",unitId);
			// alert(",unitId="+unitId+",columnList.length="+columnList.length);
			 for(var j = 0;j<columnList.length;j++){
				 
				 columnId = columnList[j].portletId;
				// alert("columnId="+columnId);
				 designer.appendSaveValueArea(columnId,"columnId",columnId);
				 designer.appendSaveValueArea(columnId+"_unit","columnUnitId",unitId);
				 
				 checkElement = document.getElementById(columnId+"_isShow").checked;
				 //confirm("_isShow="+checkElement);
				 tempValue = checkElement==true||checkElement=='on'||checkElement=='checked'?"1":"0";
				 designer.appendSaveValueArea(columnId+"_showValue","isShow",tempValue);
				 
				 checkElement = document.getElementById(columnId+"_isOpen").checked;
				// confirm("_isOpen="+checkElement);
				 tempValue = checkElement==true||checkElement=='on'||checkElement=='checked'?"1":"0";
				 designer.appendSaveValueArea(columnId+"_openValue","isOpen",tempValue);
				 
				 checkElement = document.getElementById(columnId+"_isMove").checked;				
				 tempValue = checkElement==true||checkElement=='on'||checkElement=='checked'?"1":"0";
				 designer.appendSaveValueArea(columnId+"_moveValue","isMove",tempValue);
				 //confirm("_isMove="+checkElement);
				 
				 designer.appendSaveValueArea(columnId+"_orderValue","showOrder",j+1);
			 }
		 }
		//confirm(tempDiv.innerHTML);
		if(isSubmit){
		document.getElementById("layoutDesignerForm").submit();
		}
		return tempDiv.innerHTML;
		
	},
	/**
	 * 发布布局模块
	 * 1）增加必要的脚本变量
	 * 2）把模块复制到到生产目录
	 * @return
	 */
	publishLayoutTemplate:function(isSubmit){
		var designer = this;
		designer.tableObj = document.getElementById(designer.layoutId);
		var tempLayout = document.createElement("table"),tempTr,tempTd,currTr,currTd;
		var cssText = "border:0;margin:0;padding:0;cellSpacing:0;cellPadding:0;width:100%;height:100%;";
		tempLayout.id = designer.tableObj.id;
		tempLayout.setAttribute("width","100%");
		tempLayout.setAttribute("height","100%");
		tempLayout.setAttribute("style",cssText);
		if(designer.isIE){
			tempLayout.style.cssText = cssText;
		}
		 var isIe = /msie/i.test(navigator.userAgent); 	
		for(var rowIndex=0;rowIndex<designer.tableObj.rows.length;rowIndex++){ 
			currTr = designer.tableObj.rows[rowIndex];
			
			tempTr = document.createElement("tr");
			designer.mergeAttributes(tempTr,currTr);
			for(var colIndex=0;colIndex<currTr.cells.length;colIndex++){
				currTd=currTr.cells[colIndex];
				
				tempTd = document.createElement("td");				
				designer.mergeAttributes(tempTd,currTd);
				tempTd.style.backgroundColor="";
			    if(isIe){
			    	tempTd.onclick="";//"personalizer.clickElement(this);";
			    }else{
			    	//tempTd.setAttribute("onclick","personalizer.clickElement(this);");
			    	tempTd.setAttribute("onclick","");
			    }
				tempTd.id = currTd.id;
				tempTd.colSpan= currTd.colSpan;
				tempTd.rowSpan= currTd.rowSpan;
				tempTd.setAttribute("valign","top");
				tempTd.innerHTML= designer.getUnitLoader(designer.layoutId,currTd.id);
				
				tempTr.appendChild(tempTd);
				
				//designer.addUnit(tempTd.id);
			}
			tempLayout.appendChild(tempTr);
		}
		var tempDiv = document.createElement("div");
		tempDiv.appendChild(tempLayout);
		var currentSysCode="<%String currentSysCode=  request.getParameter(\"currentSysCode\");%>";
		document.getElementById("layoutPublishTemplateContent").value=currentSysCode+tempDiv.innerHTML;
		if(isSubmit){
		document.getElementById("operation").value="publishLayout";		
		document.getElementById("layoutDesignerForm").submit();
		}
	},
	getUnitLoader:function(layoutId,unitId){
		var unitLoader ="<jsp:include flush=\"true\" page=\"unitLoader.jsp\"><jsp:param name=\"currentSysCode\" value=\"<%=currentSysCode%>\"></jsp:param><jsp:param name=\"layoutId\" value=\""+layoutId+"\"></jsp:param> <jsp:param name=\"unitId\" value=\""+unitId+"\"/></jsp:param></jsp:include>";
		    return unitLoader;
	},
	appendSaveValueArea:function(tempId,tempName,tempValue){
		var tempIdValue =tempId+"_saveValue";
		 var valueElement=  document.getElementById(tempIdValue);
		 
		 if(!valueElement){
			 valueElement = document.createElement("input");
			 valueElement.setAttribute("type", "hidden");
			 valueElement.setAttribute("name", tempName);
			 valueElement.id = tempIdValue;
			 valueElement.value = tempValue?tempValue:tempId;
			 var saveValueArea = document.getElementById("saveValueArea");
			 saveValueArea.appendChild(valueElement);
		 }else{
			 valueElement.setAttribute("name", tempName);
			 valueElement.value = tempValue?tempValue:tempId;
		 }
	},
	
	defineColumns:function(){
		var pannelObject = document.getElementById("layoutDesignerPannel");
		if(pannelObject==undefined||pannelObject==null||pannelObject==''){
			return;
		}
		
		
		sandboxObject = document.getElementById("__columnSandBox");
		if(sandboxObject==undefined||sandboxObject==null||sandboxObject==''){
			return;
		}
		//pannelObject.style.width="80%";
		sandboxObject.style.display="block";
		sandboxObject.style.overflow="scroll";
		//sandboxObject.style.width="20%";
		
		var designer = this;
		
		designer.tableObj = document.getElementById(designer.layoutId);
				
		for(var rowIndex=0;rowIndex<designer.tableObj.rows.length;rowIndex++){ 
			currTr = designer.tableObj.rows[rowIndex];
			
			for(var colIndex=0;colIndex<currTr.cells.length;colIndex++){
				currTd=currTr.cells[colIndex];				
				designer.layout.addUnit(currTd.id);
			}			
		}
		designer.layout.addUnit(designer.layoutSandBoxSystemColumnId);
		//designer.layout.addPortlet("allColumns","portletId1","pt-111","1","1", "1");
		//designer.layout.addPortlet("allColumns","portletId2","pt-222","1","1", "1");
		//designer.layout.addPortlet("allColumns","portletId3","pt-333","1","1", "1");
		//confirm("designer.layout.length="+designer.layout.unitsList.length);
		designer.mover = new Mover(designer.layout,false);
		//designer.mover = new Mover(designer.layout);
		
	},
	
	
	/**
	 * 新增布局单元，加到数据结构中去
	 * @param unitId
	 * @return
	 */
	addUnit:function(unitId){
		var designer = this;
		designer.layout.addUnit(unitId);
	},
	/**
	 * 删除，即把栏目归还到栏目选择盒
	 * @param unitId
	 * @return
	 */
	deleteUnitColumn:function(unitId){		
		var designer = this;
		designer.layout.mergeUnit(unitId,designer.layoutSandBoxSystemColumnId);
		designer.layout.deleteUnit(unitId);
	},
	/**
	 * 合并时进行栏目合并
	 * @param sourceUnitId
	 * @param targetUnitId
	 * @return
	 */
	mergeUnitColumn:function(sourceUnitId,targetUnitId){
		var designer = this;
		designer.layout.mergeUnit(sourceUnitId,targetUnitId);
		designer.layout.deleteUnit(sourceUnitId);
	},
	resetWidthNHeight:function(){
		var designer = this;
		designer.tableObj = document.getElementById(designer.layoutId);
		var tempTr,tempTd,currTr,currTd;
		var width = 0,height=0,tdId='',setPartSizeWin=null;
		
		for(var rowIndex=0;rowIndex<designer.tableObj.rows.length;rowIndex++){ 
			currTr = designer.tableObj.rows[rowIndex];
			for(var colIndex=0;colIndex<currTr.cells.length;colIndex++){
				currTd=currTr.cells[colIndex];
				tdId=currTd.id;
				setPartSizeWin=document.getElementById(tdId+"_setPartSizeWin");
				if(!setPartSizeWin){
				width = currTd.width,height=currTd.height;
				currTd.innerHTML= currTd.innerHTML+"<br><div id='"+tdId+"_setPartSizeWin' style='displaye:inline;'><div style='float:left;'>"+designer.WIDTH_LABEL+"<input type='text' id='"+tdId+"_tdWidth' value='"+width+"'/></div><div>"+designer.HEIGHT_LABEL+"<input type='text' id='"+tdId+"_tdHeight' value='"+height+"'/></div><div><input type='button'  value='"+designer.SURE_LABEL+"' onclick='"+designer.name+".setPartSize(\""+tdId+"\")'/><input type='button'  value='"+designer.CANNCEL_LABEL+"' onclick='"+designer.name+".cancelSetPartSize(\""+tdId+"\")'/></div></div>";
				}
			}
		}
		
	}
	
	
	
}//

