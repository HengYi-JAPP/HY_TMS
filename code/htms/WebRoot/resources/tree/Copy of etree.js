function ETree(){
	var eTree = this;
	eTree.treeIcons={};
	eTree.treeNodes=[];
	eTree.checkedNodes=[];
	
	eTree.isTable=false;
	
	//eTree.CHECK='1';
	//eTree.UNCHECK='3';
	//eTree.SIMCHECK='5';
	
	eTree.CHECK='';
	eTree.UNCHECK='';
	eTree.SIMCHECK='';

	eTree.DPX="";
	eTree.JPX="";
	eTree.IPX="";
	eTree.BPX="";
	eTree.BVPX="";
	
	//eTree.DPX="div";
	//eTree.JPX="join";
	//eTree.IPX="icon";
	//eTree.BPX="_TREEBOX_";
	//eTree.BVPX="_CBOXV_";
	
	//eTree.BSS="all";
	//eTree.ASS="all";
	//eTree.DSS="down";
	//eTree.USS="up";
	//eTree.NSS="nor";
	
	eTree.BSS="";
	eTree.ASS="";
	eTree.DSS="";
	eTree.USS="";
	eTree.NSS="";
	// Opens or closes a node
	/**
	 * 树结点状态是展开还是收拢，进行图示切换
	 * 如果是异常加载，这里需要填写加载的地址，和怎么加加载进来
	 * 
	 * a、需要前缀
	 * b、对应的图标
	 */
	eTree.openOrClose = function(node, bottom) {
		if(eTree.isTable==true){
			var theTr = document.getElementById("_TB_" + node);
			var theJoin = document.getElementById(eTree.JPX + node);
			var theIcon = document.getElementById(eTree.IPX + node);
			
			if (theTr.cd=== 'none') {
				theTr.cd=''							
			} else {
				theTr.cd= 'none';	
			}
			
			var treeNode = null,childId=null,elementTr=null,tempNodes=[];
			tempNodes[0]=node;
			/**
			 * 此处如果要提升效率，需要把一维的数据结构改进为链表结构或增加控制标识。
			 */
			for(var i=0;i<tempNodes.length;i++){
				for(var j=0;j<eTree.treeNodes.length;j++){
					treeNode=eTree.treeNodes[j];				
					if(tempNodes[i]==treeNode.nid){	
						for(var m=0;m<treeNode.chr.length;m++){
							childId=treeNode.chr[m].cid;
							elementTr=document.getElementById("_TB_" + childId);
							if(elementTr==undefined||elementTr==null||elementTr==''){
								continue;
							}
							elementTr.style.display =theTr.cd;
							
							if(treeNode.chr[m].chc==true){
								tempNodes[tempNodes.length]=treeNode.chr[m].cid;
							}
						}
						
						theJoin = document.getElementById(eTree.JPX + treeNode.nid);
						theIcon = document.getElementById(eTree.IPX + treeNode.nid);
						if(elementTr==undefined||elementTr==null||elementTr==''){
							elementTr=document.getElementById("_TB_" + treeNode.nid);
						}
						if (elementTr.style.display == 'none') {
							if (bottom == 1)
								theJoin.src = eTree.treeIcons.bottomCloseJoin;// iicons[1].src;
							else
								theJoin.src = eTree.treeIcons.closeJoin;// icons[0].src;
							if (eTree.USE_NODE_IMG)
								theIcon.src = eTree.treeIcons.node;// icons[4].src;
							//theTr.style.display = '';				
						} else {
							if (bottom == 1)
								theJoin.src = eTree.treeIcons.bottomOpenJoin;// icons[3].src;
							else
								theJoin.src = eTree.treeIcons.openJoin;// icons[2].src;
							if (eTree.USE_NODE_IMG)
								theIcon.src = eTree.treeIcons.node;// icons[5].src;							
							//theTr.style.display = 'none';
						}
						break;
					}
				}
			}
		}else{
			var theDiv = document.getElementById(eTree.DPX + node);
			var theJoin = document.getElementById(eTree.JPX + node);
			var theIcon = document.getElementById(eTree.IPX + node);
	
			if (theDiv.style.display == 'none') {
				if (bottom == 1)
					theJoin.src = eTree.treeIcons.bottomOpenJoin;// icons[3].src;
				else
					theJoin.src = eTree.treeIcons.openJoin;// icons[2].src;
				if (eTree.USE_NODE_IMG)
					theIcon.src = eTree.treeIcons.node;// icons[5].src;
				theDiv.style.display = '';
			} else {
				if (bottom == 1)
					theJoin.src = eTree.treeIcons.bottomCloseJoin;// iicons[1].src;
				else
					theJoin.src = eTree.treeIcons.closeJoin;// icons[0].src;
				if (eTree.USE_NODE_IMG)
					theIcon.src = eTree.treeIcons.node;// icons[4].src;
				theDiv.style.display = 'none';
			}
		}
	};
	
	eTree.COB = function(nodeId) {
		//confirm("nodeId="+nodeId);
		var box = document.getElementById(eTree.BPX + nodeId);
		var boxValue = document.getElementById(eTree.BVPX + nodeId);
		
		if (boxValue.value ==eTree.UNCHECK){
			boxValue.value =eTree.CHECK;
			box.src=eTree.treeIcons.checked;	
		}else{
			boxValue.value =eTree.UNCHECK;
			box.src=eTree.treeIcons.unchecked;	
		}
		var node = null;
		for(var j=0;j<eTree.treeNodes.length;j++){
			node=eTree.treeNodes[j];			
			if(node.nid==nodeId){
				break;
			}
		}
		
		if(node==null||node.nid!=nodeId){
			return;
		}
		
		eTree.changeBoxStatus(node, boxValue.value);
		if (eTree.BSS == eTree.NSS) {
			return;
		}
		
		// confirm("eTree.treeBoxSelectStyle="+eTree.treeBoxSelectStyle);
		if (eTree.BSS == eTree.DSS||eTree.BSS == eTree.ASS) {
			eTree.changeDownBoxStatus(node, boxValue.value)
		}
		if (eTree.BSS == eTree.USS||eTree.BSS == eTree.ASS) {
			eTree.changeUpBoxStatus(node, boxValue.value)
		}
		
	};
	/**
	 * 对于选中的元素，记录；对于未选中的元素，删除；
	 */
	eTree.changeBoxStatus = function(node,statusValue) {
		var box = document.getElementById(eTree.BPX + node.nid);
		var boxValue = document.getElementById(eTree.BVPX + node.nid);
		//confirm("node.nid="+node.nid+",statusValue="+statusValue);
		/*修改当前元素状态*/
		boxValue.value = statusValue;
		node.cs=statusValue;
		if (statusValue ==eTree.CHECK){	
			box.src=eTree.treeIcons.checked;	
		}else if (statusValue ==eTree.UNCHECK){
			box.src=eTree.treeIcons.unchecked;	
		}else{
			box.src=eTree.treeIcons.simchecked;	
		}
		
		var isExist=false;
		var index=-1;
		/*检测当前元素是否存在*/
		for(var i=0;i<eTree.checkedNodes.length;i++){
			index = i;
			if(eTree.checkedNodes[i].nid==node.nid){
				isExist=true;				
				break;
			}
		}
		
		if(statusValue==eTree.UNCHECK){
			if(isExist==true&&index>-1){
				/*存在，则删除*/
				eTree.checkedNodes.splice(index,1);
			}			
		}else{			
			if(isExist==false){
				/*不存在，则加入*/
				eTree.checkedNodes[eTree.checkedNodes.length]=node;
			}
		}
	};
	
	eTree.changeDownBoxStatus = function(node,statusValue) {
		var tempNodes =[];		
		tempNodes[0]=node;
		
		var treeNode,childCount=0;
		for(var i=0;i<tempNodes.length;i++){
			childCount=0;
			for(var j=0;j<eTree.treeNodes.length;j++){
				treeNode=eTree.treeNodes[j];			
				if(tempNodes[i].nid==treeNode.pid){
					eTree.changeBoxStatus(treeNode, statusValue);
					tempNodes[tempNodes.length]=treeNode;
					childCount++;
					if(childCount==tempNodes[i].chr.length){
						break;
					}
					//break;
				}
			}
		}
	};

	eTree.changeUpBoxStatus = function(node,statusValue) {
		if(statusValue==eTree.CHECK){
			eTree.setCheckedStatus2UpBox(node,statusValue);
		}
		if(statusValue==eTree.UNCHECK){
			eTree.setUncheckedStatus2UpBox(node,statusValue);
		}
	};
	
	eTree.setCheckedStatus2UpBox= function(node,statusValue) {
		var tempNodes =[];		
		tempNodes[0]=node;
		///confirm("changeUpBoxStatus:parentId="+node.pid);
		var treeNode,childId,selectCount=0;
		var cancelFlag=true;
		var tempNode = null;
		for(var i=0;i<tempNodes.length;i++){
			tempNode=tempNodes[i];
			for(var j=0;j<eTree.treeNodes.length;j++){
				treeNode=eTree.treeNodes[j];
				
				if(tempNode.pid==treeNode.nid){						
					tempNodes[tempNodes.length]=treeNode;
					/*检测上级结点的状态，全选、半选、不选三种；
					 * 如果当前状态是取消，则检查上级结点有没有其他选中的子结点，如果有则是半选，否则半选；
					 * 如果当前状态是选中，则检查上级结点有没有未选中的子结点，如果则是有半选，否则全选；*/
						for(var m=0;m<treeNode.chr.length;m++){
							childId=treeNode.chr[m].cid;
							//cancelFlag=false;
							for(var n=0;n<eTree.checkedNodes.length;n++){
								if(childId==eTree.checkedNodes[n].nid&&eTree.checkedNodes[n].cs== eTree.CHECK){
									selectCount++;
									//cancelFlag=true;
									break;
								}
							}
							//if(cancelFlag==true){
							//	break;
							//}
						}
						//confirm("selectCount="+selectCount+",treeNode.chr.length="+treeNode.chr.length);
						if(selectCount==treeNode.chr.length){
							eTree.changeBoxStatus(treeNode, statusValue);
						}else{
							eTree.changeBoxStatus(treeNode, eTree.SIMCHECK)
						}						
						selectCount=0;	
					break;
				}//if
			}
		}
	};
	
	eTree.setUncheckedStatus2UpBox = function(node,statusValue) {
		var tempNodes =[];		
		tempNodes[0]=node;
		//confirm("setUncheckedStatus2UpBox:parentId="+node.pid);
		var treeNode,childId,selectCount=0,cancelFlag=true,tempNode = null;
		for(var i=0;i<tempNodes.length;i++){
			tempNode=tempNodes[i];
			//confirm("------------->tempNode="+tempNodes[i]+"   ,tempNode.pid="+tempNode.pid);
			for(var j=0;j<eTree.treeNodes.length;j++){
				treeNode=eTree.treeNodes[j];	
				
				if(tempNode.pid==treeNode.nid){						
					tempNodes[tempNodes.length]=treeNode;
					/*检测上级结点的状态，全选、半选、不选三种；
					 * 如果当前状态是取消，则检查上级结点有没有其他选中的子结点，如果有则是半选，否则半选；
					 * 如果当前状态是选中，则检查上级结点有没有未选中的子结点，如果则是有半选，否则全选；*/
					
					for(var m=0;m<treeNode.chr.length&&cancelFlag==true;m++){
						childId=treeNode.chr[m].cid;							
						for(var n=0;n<eTree.checkedNodes.length;n++){								
							if(childId==eTree.checkedNodes[n].nid){
								//confirm("childId="+childId+"   ,eTree.checkedNodes[n].nid="+eTree.checkedNodes[n].nid);								
								cancelFlag=false;
								break;
							}
						}
						if(cancelFlag==false){
							break;
						}
					}
					
					if(cancelFlag==false){
						eTree.changeBoxStatus(treeNode, eTree.SIMCHECK);							
					}else{
						eTree.changeBoxStatus(treeNode,statusValue);
					}
					break;
				}//if
			}
		}
	};
	eTree.getCheckedNode = function() {
		return eTree.checkedNodes;
	};
}