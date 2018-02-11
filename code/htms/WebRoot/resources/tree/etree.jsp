<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.tree {
	font-family: {$fontFamily};
	font-size: {$fontSize};
	padding: 10px;
	white-space: nowrap;
}
.tree img {
	border: {$imgBorder};
	height: {$imgHeigh};
	width: {$imgWidth};
	vertical-align: text-bottom;
}
.tree a {
	color: {$aColor};
	text-decoration: none;
}
.tree a:hover {
	color: {$aHoverColor};
}
</style>

<script type="text/javascript">
var treeArray = new Array();
		// nodeId | parentNodeId | nodeName | nodeUrl	
{$initializeTreeArray}	
var checkedArrayLength= 0;
var alreadyCheckedArray =  new Array();

{$initializeAlreadyCheckedArray}
// Arrays for nodes and icons
var nodes			= new Array();;
var openNodes	= new Array();
var icons			= new Array(6);

//Images for nodes and icons
var plus_img ="{$plusImg}";
var publsbottom_img="{$plusBottomImg}";
var minus_img="{$minusImg}";
var minusbottom_img ="{$minusBottomImg}";
var folder_img = "{$folderImg}";
var folderopen_img = "{$folderOpenImg}";
var base_img="{$rootImg}";
var line_img="{$lineImg}";
var empty_img="{$emptyImg}";
var bottom_img ="{$bottomImg}";
var joinbottom_img ="{$joinBottomImg}";
var join_img="{$joinImg}";
var page_img="{$leafImg}";

//checkbox 
var USE_CHECKBOX={$useCheckBox};
var USE_LINK ={$useLink};
var APPEND_OPERATES={$isAppendOperate};
var USE_NODE_IMG= {$hiddenNOdeImg};

// Loads all icons that are used in the tree
function preloadIcons() {
	icons[0] = new Image();
	icons[0].src = plus_img;
	icons[1] = new Image();
	icons[1].src = publsbottom_img;
	icons[2] = new Image();
	icons[2].src = minus_img;
	icons[3] = new Image();
	icons[3].src = minusbottom_img;
	icons[4] = new Image();
	icons[4].src = folder_img;
	icons[5] = new Image();
	icons[5].src = folderopen_img;
}
// Create the tree
function createTree(arrName, startNode, openNode) {
	nodes = arrName;
	if (nodes.length > 0) {
		preloadIcons();
		if (startNode == null) startNode = 0;
		if (openNode != 0 || openNode != null) setOpenNodes(openNode);

		var nodeValues = nodes[getArrayId(startNode)];
		var realId = nodeValues[0];
		if(USE_CHECKBOX)
			document.write("<input type=\"checkbox\" id=\"itemBox"+nodeValues[0]+"\" onclick=\"javascript:clickOnBox('"+nodeValues[0]+"');{$checkBoxEvent}\" {$checkBoxClass}  />");
		
		if(USE_LINK)
			document.write("<a href=\"" + nodeValues[3] + "\" onmouseover=\"window.status='" + nodeValues[2] + "';return true;\" onmouseout=\"window.status=' ';return true;\">");
			
		if(USE_NODE_IMG)			
			document.write("<img src=\"" + folderopen_img + "\" align=\"absbottom\" alt=\"\" />");
		
		document.write("" +nodeValues[2]);
		
		if(USE_LINK)
			document.write("</a>");
			
		document.write("<br />");

		var recursedNodes = new Array();
		addNode(startNode, recursedNodes);
	}
}
// Returns the position of a node in the array
function getArrayId(node) {
	for (i=0; i<nodes.length; i++) {
		var nodeValues = nodes[i];
		if (nodeValues[0]==node) return i;
	}
}
// Puts in array nodes that will be open
function setOpenNodes(openNode) {
	for (i=0; i<nodes.length; i++) {
		var nodeValues = nodes[i];
		if (nodeValues[0]==openNode) {
			openNodes.push(nodeValues[0]);
			setOpenNodes(nodeValues[1]);
		}
	} 
}
// Checks if a node is open
function isNodeOpen(node) {
	for (i=0; i<openNodes.length; i++)
		if (openNodes[i]==node) return true;
	return false;
}
// Checks if a node has any children
function hasChildNode(parentNode) {
	for (i=0; i< nodes.length; i++) {
		var nodeValues = nodes[i];
		if (nodeValues[1] == parentNode) return true;
	}
	return false;
}
// Checks if a node is the last sibling
function lastSibling (node, parentNode) {
	var lastChild = 0;
	for (i=0; i< nodes.length; i++) {
		var nodeValues = nodes[i];
		if (nodeValues[1] == parentNode)
			lastChild = nodeValues[0];
	}
	if (lastChild==node) return true;
	return false;
}
// Adds a new node to the tree
function addNode(parentNode, recursedNodes) {
	for (var i = 0; i < nodes.length; i++) {

		var nodeValues = nodes[i];
		var realId = nodeValues[0];
		if (nodeValues[1] == parentNode) {
			
			var ls	= lastSibling(nodeValues[0], nodeValues[1]);
			var hcn	= hasChildNode(nodeValues[0]);
			var ino = isNodeOpen(nodeValues[0]);

			// Write out line & empty icons
			for (g=0; g<recursedNodes.length; g++) {
				if (recursedNodes[g] == 1) document.write("<img src=\""+line_img+"\" align=\"absbottom\" alt=\"\" />");
				else  document.write("<img src=\""+empty_img+"\" align=\"absbottom\" alt=\"\" />");
			}

			// put in array line & empty icons
			if (ls) recursedNodes.push(0);
			else recursedNodes.push(1);
			
			

			// Write out join icons
			if (hcn) {
				if (ls) {
					document.write("<a href=\"javascript: oc('" + nodeValues[0] + "', 1);\"><img id=\"join" + nodeValues[0] + "\" src=\"");
					 	if (ino) document.write(""+minusbottom_img);
						else document.write(""+publsbottom_img);						
					document.write("\" align=\"absbottom\" alt=\"Open/Close node\" /></a>");
				} else {
					document.write("<a href=\"javascript: oc('" + nodeValues[0] + "', 0);\"><img id=\"join" + nodeValues[0] + "\" src=\"");
						if (ino) document.write(""+minus_img);
						else document.write(""+plus_img);
					document.write("\" align=\"absbottom\" alt=\"Open/Close node\" /></a>");
				}
			} else {
				if (ls) document.write("<img src=\""+joinbottom_img+"\" align=\"absbottom\" alt=\"\" />");
				else document.write("<img src=\""+join_img+"\" align=\"absbottom\" alt=\"\" />");
			}
			
			if(USE_CHECKBOX)
				document.write("<input type=\"checkbox\" id=\"itemBox"+nodeValues[0]+"\" onclick=\"javascript:clickOnBox('"+nodeValues[0]+"');{$checkBoxEvent}\"  {$checkBoxClass}/>");
			
			// Start link
			if(USE_LINK)
				document.write("<a href=\"" + nodeValues[3] + "\" target=\"_blank\" onmouseover=\"window.status='" + nodeValues[2] + "';return true;\" onmouseout=\"window.status=' ';return true;\">");
			
			// Write out folder & page icons
			if(USE_NODE_IMG)
			if (hcn) {
				document.write("<img id=\"icon" + nodeValues[0] + "\" src=\"")
				
					if (ino) 
						document.write(""+folderopen_img);
					else 
						document.write(""+folder_img);					
						
				document.write("\" align=\"absbottom\" alt=\"Folder\" />");
			} else document.write("<img id=\"icon" + nodeValues[0] + "\" src=\""+page_img+"\" align=\"absbottom\" alt=\"\" />");
			
			// Write out node name
			document.write(nodeValues[2]);

			// End link
			if(USE_LINK)
				document.write("</a>");
			
			//Append link operates
			if(APPEND_OPERATES)
				document.write("{$appendOperates}");
			
			document.write("<br />");
						
			// If node has children write out divs and go deeper
			if (hcn) {
				document.write("<div id=\"div" + nodeValues[0] + "\"");
				if (!ino) 
					document.write(" style=\"display: none;\"");
				document.write(">");
				addNode(nodeValues[0], recursedNodes);
				document.write("</div>");
			}
			
			// remove last line or empty icon 
			recursedNodes.pop();
		}
	}
}
// Opens or closes a node
function oc(node, bottom) {
	var theDiv = document.getElementById("div" + node);
	var theJoin	= document.getElementById("join" + node);
	var theIcon = document.getElementById("icon" + node);
	
	if (theDiv.style.display == 'none') {
		if (bottom==1) theJoin.src = icons[3].src;
		else theJoin.src = icons[2].src;
		if(USE_NODE_IMG)
		theIcon.src = icons[5].src;
		theDiv.style.display = '';
	} else {
		if (bottom==1) theJoin.src = icons[1].src;
		else theJoin.src = icons[0].src;
		if(USE_NODE_IMG)
		theIcon.src = icons[4].src;
		theDiv.style.display = 'none';
	}
}
// Push and pop not implemented in IE
if(!Array.prototype.push) {
	function array_push() {
		for(var i=0;i<arguments.length;i++)
			this[this.length]=arguments[i];
		return this.length;
	}
	Array.prototype.push = array_push;
}
if(!Array.prototype.pop) {
	function array_pop(){
		lastElement = this[this.length-1];
		this.length = Math.max(this.length-1,0);
		return lastElement;
	}
	Array.prototype.pop = array_pop;
}

///////////////////////////////////////////////////////////////////////
//check box click
var rootId="{$rootId}"
var treeArray//存放树形目录中的结点内容和ID，父结点ID，是一个二维数组
var treelength //树结点数组的长度

var tree//记录树形结点
var treeId //记录treeArray中相应位置结点的ID
var childId//treeArray中相应位置结点的所有子结点的ID
var parentId//记录treeArray中相应位置结点的父结点ID
//************************
//初始化树的各个变量：
function initTree(){
    treelength = treeArray.length;
   
	tree = new Array(treelength);//记录树形结点
	treeId = new Array(treelength);//记录treeArray中相应位置结点的ID
	childId = new Array(treelength);//treeArray中相应位置结点的所有子结点的ID
	parentId = new Array(treelength);//记录treeArray中相应位置结点的父结点ID
	//firstLay开始记录第一层结点，以后按层次遍历记录子结点
	firstLay = new Array(treelength);


	for(var i = 0; i < treelength; i++){
	   treeId[i] = treeArray[i][0];
	   parentId[i] = treeArray[i][1];
	}
	   
	//识别出每个结点的子结点：
	for( var i = 0 ; i < treelength; i ++){
		childId[i] = new Array(treelength);
		for(var n = 0 ; n < treelength; n++){
			childId[i][n] = -2;//赋默认值为-2
		}
	}
	 
	var cnIndex;
	for( var i = 0; i < treelength; i ++){
		cnIndex = 0;
		for(var n = 0; n < treelength; n++){	
			if(treeId[i] == parentId[n]){
				childId[i][cnIndex] = treeId[n];
				cnIndex++;
			}
		}
	}
}

//检测是否还有子结点
function isHasChildNode(idIndex){
	var childCount = 0;
	if(idIndex<0)return 0;
	while(childId[idIndex][childCount] != -2)childCount++;
	return childCount;
}

//获取结点在treeArray或treeId中的位置
function getNodeIndex(nodeId){
   var m = 0;
   while(m < treelength) {
       if(nodeId == treeArray[m][0])return m;
       m++;
   	}
   return -1;
}

//树结点中复选框上下级结点之间的选择关联性。
//1）all,上下级均关联。
//2）up,向上关联，即选择某一结点时，该结点之上的结点均被选择，如果取消某一结点，同时没有被选择的兄弟结点，则该结点之上的结点将被取消
//3）down,向下关联，即选择某一结点时，该结点之下的结点均被选择，如果取消某一结点，则该结点之下的子结点将全部被取消
//4)nor,没有关联，选择一个点或取消某一结点与其他结点没有任何关联关系。
var treeBoxSelectStyle="{$treeBoxSelectStyle}";
//按层次遍历，当选非叶子结点时，让所有子结点也被选择
function clickOnBox(realId){
	var box=document.getElementById("itemBox"+realId);
	
	if(box.checked)
		box.checked=true;	 
	else 
		box.checked=false;
		
	onBoxValues(realId,box.checked);
	if(treeBoxSelectStyle=='nor'){
		return;
	}
	var idIndex = getNodeIndex(realId);
	if(treeBoxSelectStyle=='down'||treeBoxSelectStyle=='all'){		
		if(isHasChildNode(idIndex)!=0||realId==rootId)
			onBoxRecurrence(realId,box.checked);
	}
	if(treeBoxSelectStyle=='up'||treeBoxSelectStyle=='all'){
			if(idIndex!=-1)
				onBoxParent(parentId[idIndex],realId,box.checked);
	}
}

function initOnBox(realId){
	var box=document.getElementById("itemBox"+realId);
	
	if(box.checked==false)
		box.checked=true;	 
	//else 
	//	box.checked=false;
		
	onBoxValues(realId,box.checked);
	if(treeBoxSelectStyle=='nor'){
		return;
	}
	var idIndex = getNodeIndex(realId);
	if(treeBoxSelectStyle=='down'||treeBoxSelectStyle=='all'){		
		if(isHasChildNode(idIndex)!=0||realId==rootId)
			onBoxRecurrence(realId,box.checked);
	}
	if(treeBoxSelectStyle=='up'||treeBoxSelectStyle=='all'){
			if(idIndex!=-1)
				onBoxParent(parentId[idIndex],realId,box.checked);
	}
}

//处理父级结点，选中时，父级点也被选中；取消时，只有没有兄弟结点被选中，才能取消
function onBoxParent(pId,orgId,childState){
	var box=document.getElementById("itemBox"+pId);
	if(box){}
	else
		return;
		
	if(childState==false)
		if(checkBrotherBox(pId,orgId)==1)
			return;

	box.checked=childState;
	
	if(pId==rootId)
		return;
	
	for(var i = 0; i < treelength;i++)
		if(treeId[i]==pId)								
			onBoxParent(parentId[i],orgId,childState);
}

//检查是否有兄弟结点被选中
function checkBrotherBox(pId,orgId){
	for(var i = 0; i < treelength;i++)
		if(parentId[i]==pId&&treeId[i]!=orgId){
			var box = document.getElementById("itemBox"+treeId[i])
			if(box&&box.checked)
				return 1;
		}

	return 0;
}

//处理子结点，子结点选择状态与父结点保持一致
function onBoxRecurrence(realId,childState){
	var idIndex = getNodeIndex(realId);
	var box=document.getElementById("itemBox"+realId);
	box.checked=childState;
	onBoxValues(realId,box.checked);
	var curIndex =0;
	for(var i = 0; i < treelength;i++)
		if(parentId[i]==realId)					
			onBoxRecurrence(treeId[i],childState);
}

function onBoxValues(realId,isAppend){
	var boxValues=document.getElementById("{$treeBoxSelectedId}").value;
	if((boxValues==null||boxValues=='')&&isAppend==true){
		boxValues = realId+"";
	}else{
	  if(isAppend==true&&boxValues.indexOf(realId)==-1){
	  	boxValues =boxValues +","+realId;
	  }
	if(isAppend==false&&boxValues.indexOf(realId)!=-1){	
	  	if(boxValues==realId){
	  		boxValues = "";
	  	}else{
	  		if(boxValues.indexOf(realId+",")!=-1){
	  			boxValues = boxValues.replace(realId+",","");
	  		}else if(boxValues.indexOf(","+realId)!=-1){
		  	  	boxValues = boxValues.replace(","+realId,"");
		  	  }else{
		  	  	boxValues = boxValues.replace(realId,"");
		  	  }
	  	}
	  }
	}	
	document.getElementById("{$treeBoxSelectedId}").value=boxValues;
}

function initCheckedNodes(){
	//if(alreadyCheckedArray==null)return ;
	for(var i = 0;i<checkedArrayLength;i++){
	   //var box=document.getElementById("itemBox"+alreadyCheckedArray[i]);
		//confirm(alreadyCheckedArray[i]);
		//box.checked=true;	
		initOnBox(alreadyCheckedArray[i]);
	}
}
	</script>
<div class="tree">
<script type="text/javascript">
<!--
	initTree();
	createTree(treeArray,rootId);
		
//-->
</script>
<input type="hidden" id="{$treeBoxSelectedId}" name="{$treeBoxSelectedId}" value="">
</div>
<script type="text/javascript">
	initCheckedNodes();
	//clickOnBox('a');
</script>

