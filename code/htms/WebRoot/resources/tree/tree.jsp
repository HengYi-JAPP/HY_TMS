<script LANGUAGE="JavaScript">
// Global variables 
// ****************
//
//使用时，把有相应结构的数据放到TreeNode类的实体中，把所有实体能过一个List数组传过来
//注意：TreeNode结点中，一定要含有nodeId和parentId，而且这两个属性应该有树形的相关性。
//这两个属性应必须是同一类型的值(数字、字符等)
//
var rootId="{$rootId}"
var treeArray//存放树形目录中的结点内容和ID，父结点ID，是一个二维数组
var treelength //树结点数组的长度
 
 
//USETEXTLINKS = 1 
USE_NODE_LINK={$enableNodeLink}//是否要在项目的文字名称上加链接，如果不，则只在图标上加链接 
USE_LEAF_LINK={$enableItemLink}//是否要在项目的文字名称上加链接，如果不，则只在图标上加链接 
USER_CHECKBOX={$isCheckBox}//是否在结点前面显示复选框的标识
indexOfEntries = new Array 
nEntries = 0 
doc = document 
browserVersion = 0 
selectedFolder=0
spanDefine = "<span style='{$leafFontSize}{$leafFontColor}'>"
fldSpanDefine = "<span style='{$fontSize}{$fontColor}'>";

var tree//记录树形结点
var treeId //记录treeArray中相应位置结点的ID
var childId//treeArray中相应位置结点的所有子结点的ID
var parentId//记录treeArray中相应位置结点的父结点ID
//firstLay开始记录第一层结点，以后按层次遍历记录子结点
var firstLay //= new Array(treelength);

//initialize Tree Array
//***************************************
{$initializeTreeArray}


//Defing Folder
//***************************************************
function Folder(folderDescription, hreference,realId) //constructor 
{ 
  //constant data 
  this.desc = folderDescription 
  this.hreference = hreference 
  this.id = -1   
  this.navObj = 0  
  this.iconImg = 0  
  this.nodeImg = 0  
  this.folderBox=0
  this.realId = realId
  this.isLastNode = 0 
 
  //dynamic data 
  this.isOpen = true 
  this.iconSrc = "{$openNodeIcon}";//"images/folderopen.gif"   
  this.children = new Array 
  this.nChildren = 0 
 
  //methods 
  this.initialize = initializeFolder 
  this.setState = setStateFolder 
  this.addChild = addChild 
  this.createIndex = createEntryIndex 
  this.hide = hideFolder 
  this.display = display 
  this.renderOb = drawFolder 
  this.totalHeight = totalHeight 
  this.subEntries = folderSubEntries 
  this.outputLink = outputFolderLink 
} 
 
//改变目录状态，会引发图标的改变
function setStateFolder(isOpen) 
{ 
  var subEntries 
  var totalHeight 
  var fIt = 0 
  var i=0 
 
  if (isOpen == this.isOpen) 
    return 
 
  if (browserVersion == 2)  
  { 
    totalHeight = 0 
    for (i=0; i < this.nChildren; i++) 
      totalHeight = totalHeight + this.children[i].navObj.clip.height 
      subEntries = this.subEntries() 
    if (this.isOpen) 
      totalHeight = 0 - totalHeight 
    for (fIt = this.id + subEntries + 1; fIt < nEntries; fIt++) 
      indexOfEntries[fIt].navObj.moveBy(0, totalHeight) 
  }  
  this.isOpen = isOpen 
  propagateChangesInState(this) 
} 
 
 //改变结点图标和目录图标
function propagateChangesInState(folder) 
{   
  var i=0 
 
  if (folder.isOpen) 
  { 
    if (folder.nodeImg){ 
      if (folder.isLastNode){ 
        folder.nodeImg.src = "{$openIcon}";//"images/mlastnode.gif" 为HTML元素对象
      }else{ 
        folder.nodeImg.src = "{$openIcon}";//"images/mnode.gif" 
      }
    }//if (folder.nodeImg)
    
    folder.iconImg.src = "{$openNodeIcon}";//"images/folderopen.gif"    
    for (i=0; i<folder.nChildren; i++) 
       folder.children[i].display() 
  } 
  else 
  { 
    if (folder.nodeImg){
      if (folder.isLastNode){ 
        folder.nodeImg.src = "{$closeIcon}";//"images/plastnode.gif" 
      }else {
        folder.nodeImg.src = "{$closeIcon}";//"images/pnode.gif" 
      }
    }//if (folder.nodeImg)
    
    folder.iconImg.src = "{$closeNodeIcon}";//"images/folderclosed.gif" 
    for (i=0; i<folder.nChildren; i++) 
      folder.children[i].hide() 
  }  
} 

// 隐藏结点
function hideFolder() 
{ 
  if (browserVersion == 1) { 
    if (this.navObj.style.display == "none") 
      return 
    this.navObj.style.display = "none" 
  } else { 
    if (this.navObj.visibility == "hiden") 
      return 
    this.navObj.visibility = "hiden" 
  } 
   
  this.setState(0) 
} 
 
 //初始化目录信息
function initializeFolder(level, lastNode, leftSide) 
{ 
	var j=0 
	var i=0 
	var numberOfFolders 
	var numberOfDocs 
	var nc 
      
  nc = this.nChildren 
   
  this.createIndex() //为目录创建一个ID值，并将其放入对应的数组位置中
 
  var auxEv = "" 
 
 // if (browserVersion > 0) 
 //   auxEv = "<a href='javascript:clickOnNode("+this.id+")' {$linkClass}>" 
 // else 
 //   auxEv = "<a {$linkClass}>" 
 
  if (level>0) //如果不是根结点，才进行下面的操作
    if (lastNode) //the last 'brother' in the children array 
    {      
      this.renderOb(leftSide + auxEv + "<img name='nodeIcon" + this.id + "' src='{$closeIcon}' width={$iconWidth} height={$iconHeigh} border=0   style='cursor:hand' onClick='javascript:clickOnNode("+this.id+");{$onIconEvent};'>") 
      leftSide = leftSide + "<img src='{$horizoneLineIcon}' width={$iconWidth} height={$iconHeigh}>"  
      this.isLastNode = 1 
    } 
    else 
    { 
      this.renderOb(leftSide + auxEv + "<img name='nodeIcon" + this.id + "' src='{$closeIcon}' width={$iconWidth} height={$iconHeigh} border=0  style='cursor:hand' onClick='javascript:clickOnNode("+this.id+");{$onIconEvent};'>") 
      leftSide = leftSide + "<img src='{$vertLineIcon}' width={$iconWidth} height={$iconHeigh}>" 
      this.isLastNode = 0 
    } 
  else //是根结点，不需要画左边
    this.renderOb("")
   
  if (nc > 0) //说明有子节点
  { 
    level = level + 1 
    for (i=0 ; i < this.nChildren; i++)  
    { 
      if (i == this.nChildren-1) //如果是最后一个节点，将特殊处理(左边的图不一样)
        this.children[i].initialize(level, 1, leftSide) 
      else 
        this.children[i].initialize(level, 0, leftSide) //递归调用
      } 
  } 
} 
 
function drawFolder(leftSide) 
{ 
  if (browserVersion == 2) { 
    if (!doc.yPos) 
      doc.yPos=8 
    doc.write("<layer id='folder" + this.id + "' top=" + doc.yPos + " {$layerClass}  visibility=hiden>") 
  } 
   
  doc.write("<table ") 
  
  if (browserVersion == 1) 
    doc.write(" id='folder" + this.id + "' style='position:block;' {$tableClass} ") 
    
  doc.write(" border=0 cellspacing=0 cellpadding=0>") 
  doc.write("<tr {$trClass}><td>") 
  doc.write(leftSide) 

  if(USER_CHECKBOX)
  	doc.write("<input id='itemBox"+this.realId +"' type='checkbox'  onclick=\"javascript:clickOnBox('"+this.realId+"');{$checkBoxEvent}\" {$checkBoxClass} />") ;
  	
  doc.write("<img name='folderIcon" + this.id + "' ") 
  doc.write("src='" + this.iconSrc+"' border=0 style='cursor:hand' onClick='javascript:clickOnFolder("+this.id+");{$onNodeIconEvent};'>") 
  doc.write("</td><td valign='middle nowrap' {$tdClass}>") 
  
  if (USE_NODE_LINK) 
  { 
    this.outputLink() 
    doc.write(this.desc + "</a>") 
  }else 
    doc.write(this.desc) 
    
  doc.write("{$nodeOperates}")
  doc.write("</td>") 
  doc.write("</tr>")  
  doc.write("</table>") 
   
  if (browserVersion == 2) { 
    doc.write("</layer>") 
  } 
 
  if (browserVersion == 1) { 
    this.navObj = doc.all["folder"+this.id] 
    this.iconImg = doc.all["folderIcon"+this.id] 
    this.nodeImg = doc.all["nodeIcon"+this.id] 
    if(USER_CHECKBOX)
    this.folderBox=doc.all["itemBox"+this.realId];
  } else if (browserVersion == 2) { 
    this.navObj = doc.layers["folder"+this.id] 
    this.iconImg = this.navObj.document.images["folderIcon"+this.id] 
    this.nodeImg = this.navObj.document.images["nodeIcon"+this.id] 
    if(USER_CHECKBOX)
    this.folderBox=document.getElementById("itemBox"+this.realId);
    doc.yPos=doc.yPos+this.navObj.clip.height 
  } 
} 

//为目录加上链接，它将输出链接的前部，也就是<a href="***">这部分，后半部分要在使用它后加上
function outputFolderLink() 
{ 
  if (this.hreference) 
  { 
    doc.write("<a href='" + this.hreference + "'  {$linkClass} TARGET=\"right\" ") 
    if (browserVersion > 0) 
      doc.write("onClick='javascript:clickOnFolder("+this.id+")'") 
    doc.write(">") 
  } 
  else 
    doc.write("<a  {$linkClass}>") 
//  doc.write("<a href='javascript:clickOnFolder("+this.id+")'>")   
} 
 
 //添加一个子节点
function addChild(childNode) 
{ 
  this.children[this.nChildren] = childNode 
  this.nChildren++   
  return childNode 
} 
 
function folderSubEntries() 
{ 
  var i = 0 
  var se = this.nChildren 
 
  for (i=0; i < this.nChildren; i++){ 
    if (this.children[i].children) //is a folder 
      se = se + this.children[i].subEntries() 
  } 
 
  return se 
} 
 
 
// Definition of class Item (a document or link inside a Folder) 
// ************************************************************* 
 
 //
function Item(itemDescription, itemLink,realId) // Constructor 
{ 
  // constant data 
  this.desc = itemDescription 
  this.link = itemLink 
  this.id = -1 //initialized in initalize() 
  this.navObj = 0 //initialized in render() 
  this.itemBox = 0;
  this.realId = realId
  this.iconImg = 0 //initialized in render() 
  this.iconSrc = "{$leafNodeIcon}";//"images/leafNode.gif" 
 
  // methods 
  this.initialize = initializeItem 
  this.createIndex = createEntryIndex 
  this.hide = hideItem 
  this.display = display 
  this.renderOb = drawItem 
  this.totalHeight = totalHeight 
} 
 
function hideItem() 
{ 
  if (browserVersion == 1) { 
    if (this.navObj.style.display == "none") 
      return 
    this.navObj.style.display = "none" 
  } else { 
    if (this.navObj.visibility == "hiden") 
      return 
    this.navObj.visibility = "hiden" 
  }     
} 
 
function initializeItem(level, lastNode, leftSide) 
{  
  this.createIndex()   
 
  if (level>0) 
    if (lastNode) //the last 'brother' in the children array 
    { 
      this.renderOb(leftSide + "<img src='{$horizoneLineIcon}' width={$iconWidth} height={$iconHeigh}>") 
      leftSide = leftSide + "<img src='{$horizoneLineIcon}' width={$iconWidth} height={$iconHeigh}>"  
    } 
    else 
    { 
      this.renderOb(leftSide+"<img src='{$horizoneLineIcon}' width={$iconWidth} height={$iconHeigh}>") 
      leftSide = leftSide + "<img src='{$horizoneLineIcon}' width={$iconWidth} height={$iconHeigh}>" 
    } 
  else 
    this.renderOb("")   
} 
 
function drawItem(leftSide) 
{ 
  var auxEv = "" 
  var temp = this.desc
  temp = temp.substring(spanDefine.length, temp.length)
 
  auxEv = "<a href=\"javascript:getItemNodeId('"+temp+"')\"  {$linkClass}>" 
  
  if (browserVersion == 2) 
    doc.write("<layer id='item" + this.id + "' top=" + doc.yPos + " visibility=hiden {$layerClass}>") 
     
  doc.write("<table ") 
  
  if (browserVersion == 1) 
    doc.write(" id='item" + this.id + "' style='position:block;'  {$tableClass} ") 
    
  doc.write(" border=0 cellspacing=0 cellpadding=0>") 
  doc.write("<tr {$trClass}><td>") 
  doc.write(leftSide) 
  if(USER_CHECKBOX)
   doc.write("<input id='itemBox"+this.realId +"' type='checkbox'  onclick=\"javascript:clickOnBox('"+this.realId+"');{$checkBoxEvent}\" {$checkBoxClass} />") 
   
  doc.write("<img id='itemIcon"+this.id+"' ") 
  doc.write("src='"+this.iconSrc+"' border=0  style='cursor:hand'  onClick='javascript:getItemNodeId('"+temp+"');{$leafNodeIconEvent}'>")
  doc.write("</td><td valign='middle nowrap' {$tdClass}>") 
  
  if (USE_LEAF_LINK) 
    doc.write("<a href=" + this.link + "  {$linkClass} >" + this.desc + "</a>") 
  else 
    doc.write(this.desc) 
    
  doc.write("{$leafOperates}")
  doc.write("</td>") 
  doc.write("</tr>") 
  doc.write("</table>") 
   
  if (browserVersion == 2) 
    doc.write("</layer>") 
 
  if (browserVersion == 1) { 
    this.navObj = doc.all["item"+this.id] 
    this.iconImg = doc.all["itemIcon"+this.id] 
    if(USER_CHECKBOX)
    this.itemBox =doc.all["itemBox"+this.realId] 
  } else if (browserVersion == 2) { 
    this.navObj = doc.layers["item"+this.id] 
    this.iconImg = this.navObj.document.images["itemIcon"+this.id] 
    if(USER_CHECKBOX)
    this.itemBox = document.getElementById("itemBox"+this.realId);
    doc.yPos=doc.yPos+this.navObj.clip.height 
  } 
} 
 
 function getItemNodeId(itemId){
 confirm(itemId)
 }
 
 
// Methods common to both objects (pseudo-inheritance) 
// ******************************************************** 
 //设置元素为可见
function display() 
{ 
  if (browserVersion == 1) 
    this.navObj.style.display = "block" 
  else 
    this.navObj.visibility = "show" 
} 
 
//为当前对象分配一个ID值，并将其放入对应的数组中
function createEntryIndex() 
{ 
  this.id = nEntries 
  indexOfEntries[nEntries] = this 
  nEntries++ 
} 
 
// total height of subEntries open 
function totalHeight() //used with browserVersion == 2 
{ 
  var h = this.navObj.clip.height 
  var i = 0 
   
  if (this.isOpen) //is a folder and _is_ open 
    for (i=0 ; i < this.nChildren; i++)  
      h = h + this.children[i].totalHeight() 
 
  return h 
} 
 
 
// Events 
// ********************************************************* 
function clickOnFolder(folderId) 
{ 
  var clicked = indexOfEntries[folderId] 
  //confirm("clickOnFolder");
  if (!clicked.isOpen) 
    clickOnNode(folderId) 
 
  return  
 
  if (clicked.isSelected) 
    return 
} 
 
function clickOnNode(folderId) 
{ 
 //confirm("clickOnNode");
  var clickedFolder = 0 
  var state = 0 
  clickedFolder = indexOfEntries[folderId] 
  state = clickedFolder.isOpen 
  clickedFolder.setState(!state) //open<->close  
} 
 
 //初始化整棵树，并显示树
function initializeDocument() 
{ 
  if (doc.all) 
    browserVersion = 1 //IE4   
  else 
    if (doc.layers) 
      browserVersion = 2 //NS4 
    else 
      browserVersion = 0 //other 
 
  foldersTree.initialize(0, 1, "") //初始化根结点为第0级，是最后一个节点，左边没有信息。
  foldersTree.display() //设置根节点为可见
  
  if (browserVersion > 0) 
  { 
    doc.write("<layer top="+indexOfEntries[nEntries-1].navObj.top+"  {$layerClass} >&nbsp;</layer>") 
 
    // close the whole tree 
    clickOnNode(0) 
    // open the root folder 
    clickOnNode(0) 
  } 
} 
 
// Auxiliary Functions for Folder-Treee backward compatibility 
// ********************************************************* 
 
 //添加一个目录 ， 第一个参数为目录名称，第二个是目录链接到的目标(可选)
function gFld(description, hreference,realId) 
{ 
  folder = new Folder(description, hreference,realId) 
  return folder 
} 

//添加一个链接节点，第一个参数决定链接页面的出现方式，1表示链接内容在一个新窗口中打开；
//第二个参数是节点的描述信息，第三个为链接的目标地址
function gLnk(target, description, linkData,realId) 
{ 
  fullLink = "" 
  fullLink = "'http://"+linkData+"' target="+target+" "
//  if (target==0) 
//  { 
//    fullLink = "'"+linkData+"' target=\"right\"" 
//  } 
//  else 
//  { 
//    if (target==1) 
//       fullLink = "'http://"+linkData+"' target=_blank" 
//    else 
//       fullLink = "'http://"+linkData+"' target=\"right\"" 
//  } 
 
  linkItem = new Item(description, fullLink,realId)   
  return linkItem 
} 
 
 //添加一个子目录到目录下。第一个参数为父目录，第二个参数为子目录
function insFld(parentFolder, childFolder) 
{ 
  return parentFolder.addChild(childFolder) 
} 
 
 //添加一个
function insDoc(parentFolder, childDocument) 
{ 
  parentFolder.addChild(childDocument) 
} 
 
//Draw Tree
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


var tsIndex = 0;//全局变量，记录tree数组中元素的个数
//画出第一层结点:
function drawFirstLay(treeRoot){
   var j,i, flag = 0;
	for(i = 0 ; i < treelength; i++){
		flag = 0;
		for(j = 0; j < treelength; j ++){
		  if(treeId[j] == parentId[i]){	
		    flag = 1;	   
			  continue;
		  }
		}
		if(flag == 0){
		    tree[tsIndex] = drawNode(getNodeIndex(treeId[i]),treeRoot);
			firstLay[tsIndex] = treeId[i];
			 tsIndex++;
		}
	}
//		confirm("have draw first tree!\n"+firstLay);
}

//按层次遍历，画出子结点
function drawChildNode(nodeId,parentNode){
	var idIndex = getNodeIndex(nodeId);
	if(hasChildNode(idIndex)==0)return ;

	var ciIndex = 0, currentId = -2, currIndex = -1;
	currentId= childId[idIndex][ciIndex];
	while(currentId != -2){
		currIndex =getNodeIndex(currentId);
		tree[tsIndex] = drawNode(currIndex,parentNode);
		firstLay[tsIndex] = treeId[currIndex];
		tsIndex++;

		ciIndex++;
		currentId= childId[idIndex][ciIndex];
	}
}
  
//画出事棵树:
function drawTree(){
	drawFirstLay(foldersTree);
	for(var n = 0; n < tsIndex; n++){
		drawChildNode(firstLay[n],tree[n]);
	}
}

//画单个结点：
function drawNode(idIndex,parentNode){
	if(hasChildNode(idIndex) != 0){
		return insFld(parentNode,gFld(fldSpanDefine+treeArray[idIndex][2],treeArray[idIndex][3],treeArray[idIndex][0]));	
	}else{
  		return insDoc(parentNode, gLnk(treeArray[idIndex][4], spanDefine +treeArray[idIndex][2],treeArray[idIndex][3],treeArray[idIndex][0]));
	}
}

//检测是否还有子结点
function hasChildNode(idIndex){
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


//按层次遍历，当选非叶子结点时，让所有子结点也被选择
function clickOnBox(realId){
	var box=document.getElementById("itemBox"+realId);
	
	if(box.checked)
		box.checked=true;	 
	else 
		box.checked=false;
		
	var idIndex = getNodeIndex(realId);
	if(hasChildNode(idIndex)!=0||realId==rootId)
		onBoxRecurrence(realId,box.checked);
	
	if(idIndex!=-1)
		onBoxParent(parentId[idIndex],realId,box.checked);
}

//处理父级结点，选中时，父级点也被选中；取消时，只有没有兄弟结点被选中，才能取消
function onBoxParent(pId,orgId,childState){
	var box=document.getElementById("itemBox"+pId);
	
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
	
	var curIndex =0;
	for(var i = 0; i < treelength;i++)
		if(parentId[i]==realId)					
			onBoxRecurrence(treeId[i],childState);
}
//Commit
//*************************
initTree();
foldersTree =gFld("<span style='{$rootFontSize}{$rootFontColor}'>{$rootName}","",rootId)//树的根结点
drawTree();
initializeDocument();


//*************************************************************
//test function

function iconCloseEvent(){
	alert("{$iconCloseEvent}'");
}

function onNodeIconEvent(){
	alert("{$onNodeIconEvent}'");
}
function onIconEvent(){
	alert("{$onIconEvent}");
}
function nodeIconOpenEvent(){
	alert("{$nodeIconOpenEvent}'");
}
function leafNodeIconEvent(){
	alert("leafNodeIconEvent");
}

</script>
	