
// Push and pop not implemented in IE
if (!Array.prototype.push) {
	function array_push() {
		for ( var i = 0; i < arguments.length; i++)
			this[this.length] = arguments[i];
		return this.length;
	}
	Array.prototype.push = array_push;
}
if (!Array.prototype.pop) {
	function array_pop() {
		lastElement = this[this.length - 1];
		this.length = Math.max(this.length - 1, 0);
		return lastElement;
	}
	Array.prototype.pop = array_pop;
}

//2012-3-30
if(!Array.prototype.removeAt){
	function array_removeAt(index) {
		this.splice(index,1); 
	}
	Array.prototype.removeAt = array_removeAt;
}



// confirm("eTree.treelength=");

function ETree(treeName,basePath) {
	var eTree = this;
	eTree.treeArray = new Array();// 存放树形目录中的结点内容和ID，父结点ID，是一个二维数组
	eTree.treelength = 0;// 树结点数组的长度
	eTree.treeName = treeName == undefined || treeName == null ? "eTree"
			: treeName;
	eTree.operations = new Array();
	eTree.basePath = basePath==undefined?"/":basePath;// context base path..

	eTree.checkedArrayLength = 0;
	eTree.alreadyCheckedArray = new Array();
	eTree.nodes = new Array();
	eTree.openNodes = new Array();
	// check box click
	eTree.rootId = "0";

	/**
	 * 根结点，可能有多外根结点
	 * 层次结构，父级结点
	 * 条个结点一层
	 * 结点分为根结点、非叶子结点、叶子结点
	 * 每个结点有图标、选择框、操作（增、删、改、查和附加操作）
	 * 结点选择方式有上下级关联选择、向下关联选择、向上关联选择、无关联选择
	 * 
	 * 
	 */
	//2012-3-30
	eTree.onclickTreeId = new Array();
	
	eTree.tree = null;// 记录树形结点
	eTree.treeId = null;// 记录treeArray中相应位置结点的ID
	eTree.childId = null;// treeArray中相应位置结点的所有子结点的ID
	eTree.parentId = null;// 记录treeArray中相应位置结点的父结点ID
	// 树结点中复选框上下级结点之间的选择关联性。
	// 1）all,上下级均关联。
	// 2）up,向上关联，即选择某一结点时，该结点之上的结点均被选择，如果取消某一结点，同时没有被选择的兄弟结点，则该结点之上的结点将被取消
	// 3）down,向下关联，即选择某一结点时，该结点之下的结点均被选择，如果取消某一结点，则该结点之下的子结点将全部被取消
	// 4)nor,没有关联，选择一个点或取消某一结点与其他结点没有任何关联关系。
	eTree.treeBoxSelectStyle = "nor";

	eTree.createIcons = function(src) {
		var img = new Image();
		img.src = src;
		return img;
	};

	eTree.addNodes = function(id, parentId, name) {
		eTree.treeArray[eTree.treeArray.length] = eTree
				.Node(id, parentId, name);
		eTree.treelength = eTree.treeArray.length;
	};

	eTree.Node = function(pid, pparentId, pname) {
		return {
			id : pid,
			parentId : pparentId,
			name : pname
		};
		/***********************************************************************
		 * var node = this; node.id = id; node.parentId = parentId; node.name =
		 * name; return node;
		 **********************************************************************/
	};

	eTree.addOperation = function(oname, oaddress, otarget, oevent) {
		oevent = oevent == undefined || oevent == null ? "" : oevent;
		otarget = otarget == undefined || otarget == null ? "_blank;" : otarget;
		oname = oname == undefined || oname == null ? "peration name;" : oname;
		oaddress = oaddress == undefined || oaddress == null ? "#" : oaddress;
		eTree.operations[eTree.operations.length] = {
			name : oname,
			address : oaddress,
			target : otarget,
			event : oevent
		};
	};
	eTree.icons = {
		plus : eTree.basePath + "images/treeimg/plus.gif",
		minus : eTree.basePath + "images/treeimg/minus.gif",
		plusbottom : eTree.basePath + "images/treeimg/plusbottom.gif",
		minusbottom : eTree.basePath + "images/treeimg/minusbottom.gif",
		folder : eTree.basePath + "images/treeimg/folder.gif",
		folderopen : eTree.basePath + "images/treeimg/folderopen.gif",
		root : eTree.basePath + "images/treeimg/root.gif",
		line : eTree.basePath + "images/treeimg/line.gif",
		empty : eTree.basePath + "images/treeimg/empty.gif",
		bottom : eTree.basePath + "images/treeimg/bottom.gif",
		joinbottom : eTree.basePath + "images/treeimg/joinbottom.gif",
		join : eTree.basePath + "images/treeimg/join.gif",
		leaf : eTree.basePath + "images/treeimg/leaf.gif"
	};

	eTree.USE_CHECKBOX = 1;
	eTree.USE_LINK = 0;
	eTree.APPEND_OPERATES = true;
	eTree.USE_NODE_IMG = 0;

	// Create the tree
	eTree.createTree = function(arrName, startNode, openNode) {
		var startNode, openNode;
		eTree.initTree();
		eTree.nodes = eTree.treeArray;
		if (eTree.nodes.length > 0) {
			// eTree.preloadIcons();
			if (startNode == null)
				startNode = 0;
			if (openNode != 0 || openNode != null)
				eTree.setOpenNodes(openNode);

			var nodeValues = eTree.nodes[eTree.getArrayId(startNode)];
			var realId = nodeValues.id;
			if (eTree.USE_CHECKBOX)
				document.write("<input type=\"checkbox\" id=\"itemBox"
						+ nodeValues.id + "\" onclick=\"javascript:"
						+ eTree.treeName + ".clickOnBox('" + nodeValues.id
						+ "');\"   />");

			if (eTree.USE_LINK)
				document
						.write("<a href=\""
								+ nodeValues[3]
								+ "\" onmouseover=\"window.status='"
								+ nodeValues.name
								+ "';return true;\" onmouseout=\"window.status=' ';return true;\">");

			if (eTree.USE_NODE_IMG)
				document.write("<img src=\"" + eTree.icons.folderopen
						+ "\" align=\"absbottom\" alt=\"\" />");

			document.write("" + nodeValues.name);

			if (eTree.USE_LINK)
				document.write("</a>");

			if (eTree.APPEND_OPERATES) {
				var opera = ""
				for ( var x = 0; x < eTree.operations.length; x++) {
					opera = eTree.operations[x];
					document.write("&nbsp&nbsp&nbsp&nbsp<a id='opera_"
							+ nodeValues.id + "' name='opera_" + nodeValues.id
							+ "' href='" + opera.address + nodeValues.id + "' target='"
							+ opera.target + "' onclick='javascript:"
							+ opera.event + "'  >  " + opera.name + "</a>");
				}
			}

			document.write("<br />");

			var recursedNodes = new Array();
			eTree.addNode(startNode, recursedNodes);
		}
	};
	// Returns the position of a node in the array
	eTree.getArrayId = function(node) {
		for (i = 0; i < eTree.nodes.length; i++) {
			var nodeValues = eTree.nodes[i];
			if (nodeValues.id == node)
				return i;
		}
	};
	// Puts in array nodes that will be open
	eTree.setOpenNodes = function(openNode) {
		for (i = 0; i < eTree.nodes.length; i++) {
			var nodeValues = eTree.nodes[i];
			if (nodeValues.id == openNode) {
				eTree.openNodes.push(nodeValues.id);
				eTree.setOpenNodes(nodeValues.parentId);
			}
		}
	};
	// Checks if a node is open
	eTree.isNodeOpen = function(node) {
		for (i = 0; i < eTree.openNodes.length; i++)
			if (eTree.openNodes[i] == node)
				return true;
		return false;
	};
	// Checks if a node has any children
	eTree.hasChildNode = function(parentNode) {
		for (i = 0; i < eTree.nodes.length; i++) {
			var nodeValues = eTree.nodes[i];
			if (nodeValues.parentId == parentNode)
				return true;
		}
		return false;
	};
	// Checks if a node is the last sibling
	eTree.lastSibling = function(node, parentNode) {
		var lastChild = 0;
		for (i = 0; i < eTree.nodes.length; i++) {
			var nodeValues = eTree.nodes[i];
			if (nodeValues.parentId == parentNode)
				lastChild = nodeValues.id;
		}
		if (lastChild == node)
			return true;
		return false;
	};

	// Adds a new node to the tree
	eTree.addNode = function addNode(parentNode, recursedNodes) {
		for ( var i = 0; i < eTree.nodes.length; i++) {

			var nodeValues = eTree.nodes[i];
			var realId = nodeValues.id;
			if (nodeValues.parentId == parentNode) {

				var ls = eTree.lastSibling(nodeValues.id, nodeValues.parentId);
				var hcn = eTree.hasChildNode(nodeValues.id);
				var ino = eTree.isNodeOpen(nodeValues.id);

				// Write out line & empty icons
				for (g = 0; g < recursedNodes.length; g++) {
					if (recursedNodes[g] == 1)
						document.write("<img src=\"" + eTree.icons.line
								+ "\" align=\"absbottom\" alt=\"\" />");
					else
						document.write("<img src=\"" + eTree.icons.empty
								+ "\" align=\"absbottom\" alt=\"\" />");
				}

				// put in array line & empty icons
				if (ls)
					recursedNodes.push(0);
				else
					recursedNodes.push(1);

				// Write out join icons
				if (hcn) {
					if (ls) {
						document.write("<a href=\"javascript: "
								+ eTree.treeName + ".openOrClose('"
								+ nodeValues.id + "', 1);\"><img id=\"join"
								+ nodeValues.id + "\" src=\"");
						if (ino)
							document.write("" + eTree.icons.minusbottom);
						else
							document.write("" + eTree.icons.plusbottom);
						document
								.write("\" align=\"absbottom\" alt=\"Open/Close node\" /></a>");
					} else {
						document.write("<a href=\"javascript: "
								+ eTree.treeName + ".openOrClose('"
								+ nodeValues.id + "', 0);\"><img id=\"join"
								+ nodeValues.id + "\" src=\"");
						if (ino)
							document.write("" + eTree.icons.minus);
						else
							document.write("" + eTree.icons.plus);
						document
								.write("\" align=\"absbottom\" alt=\"Open/Close node\" /></a>");
					}
				} else {
					if (ls)
						document.write("<img src=\"" + eTree.icons.joinbottom
								+ "\" align=\"absbottom\" alt=\"\" />");
					else
						document.write("<img src=\"" + eTree.icons.join
								+ "\" align=\"absbottom\" alt=\"\" />");
				}

				if (eTree.USE_CHECKBOX)
					document.write("<input type=\"checkbox\" id=\"itemBox"
							+ nodeValues.id + "\" onclick=\"javascript:"
							+ eTree.treeName + ".clickOnBox('" + nodeValues.id
							+ "');\"  />");

				// Start link
				if (eTree.USE_LINK)
					document
							.write("<a href=\""
									+ nodeValues[3]
									+ "\" target=\"_blank\" onmouseover=\"window.status='"
									+ nodeValues.name
									+ "';return true;\" onmouseout=\"window.status=' ';return true;\">");

				// Write out folder & page icons
				if (eTree.USE_NODE_IMG)
					if (hcn) {
						document.write("<img id=\"icon" + nodeValues.id
								+ "\" src=\"")
						if (ino)
							document.write("" + eTree.icons.folderopen);
						else
							document.write("" + eTree.icons.folder);

						document
								.write("\" align=\"absbottom\" alt=\"Folder\" />");
					} else
						document.write("<img id=\"icon" + nodeValues.id
								+ "\" src=\"" + eTree.icons.page
								+ "\" align=\"absbottom\" alt=\"\" />");

				// Write out node name
				document.write(nodeValues.name);

				// End link
				if (eTree.USE_LINK)
					document.write("</a>");

				// Append link operates
				if (eTree.APPEND_OPERATES) {
					var opera = ""
					for ( var x = 0; x < eTree.operations.length; x++) {
						opera = eTree.operations[x];
						document.write("&nbsp&nbsp&nbsp&nbsp<a id='opera_"
								+ realId + "' name='opera_" + realId
								+ "' href='" + opera.address + realId
								+ "' target='" + opera.target
								+ "' onclick='javascript:" + opera.event
								+ "'  >  " + opera.name + "</a>");
					}
					// document.write("<a id='add' name='add'
					// href='http://www.baidu.com' target='_self'
					// onclick='javascript:leafNodeIconEvent()' > 增加</a> <a
					// id='modify' name='modify' href='http://www.google.com'
					// target='_blank' onclick='javascript:leafNodeIconEvent()'
					// >修改</a> ");
				}

				document.write("<br />");

				// If node has children write out divs and go deeper
				if (hcn) {
					document.write("<div id=\"div" + nodeValues.id + "\"");
					if (!ino)
						document.write(" style=\"display: none;\"");
					document.write(">");
					eTree.addNode(nodeValues.id, recursedNodes);
					document.write("</div>");
				}

				// remove last line or empty icon
				recursedNodes.pop();
			}
		}
	};
	// Opens or closes a node
	/**
	 * 树结点状态是展开还是收拢，进行图示切换
	 * 如果是异常加载，这里需要填写加载的地址，和怎么加加载进来
	 * 
	 * a、需要前缀
	 * b、对应的图标
	 */
	eTree.openOrClose = function(node, bottom) {
		var theDiv = document.getElementById("div" + node);
		var theJoin = document.getElementById("join" + node);
		var theIcon = document.getElementById("icon" + node);

		if (theDiv.style.display == 'none') {
			if (bottom == 1)
				theJoin.src = eTree.icons.minusbottom;// icons[3].src;
			else
				theJoin.src = eTree.icons.minus;// icons[2].src;
			if (eTree.USE_NODE_IMG)
				theIcon.src = eTree.icons.folderopen;// icons[5].src;
			theDiv.style.display = '';
		} else {
			if (bottom == 1)
				theJoin.src = eTree.icons.plusbottom;// iicons[1].src;
			else
				theJoin.src = eTree.icons.plus;// icons[0].src;
			if (eTree.USE_NODE_IMG)
				theIcon.src = eTree.icons.folder;// icons[4].src;
			theDiv.style.display = 'none';
		}
	};
	// 初始化树的各个变量：
	eTree.initTree = function() {
		eTree.treelength = eTree.treeArray.length;
		eTree.tree = new Array(eTree.treelength);// 记录树形结点
		eTree.treeId = new Array(eTree.treelength);// 记录treeArray中相应位置结点的ID
		eTree.childId = new Array(eTree.treelength);// treeArray中相应位置结点的所有子结点的ID
		eTree.parentId = new Array(eTree.treelength);// 记录treeArray中相应位置结点的父结点ID
		// firstLay开始记录第一层结点，以后按层次遍历记录子结点
		// firstLay = new Array(eTree.treelength);
		for ( var i = 0; i < eTree.treelength; i++) {
			eTree.treeId[i] = eTree.treeArray[i].id;
			eTree.parentId[i] = eTree.treeArray[i].parentId;
		}

		// 识别出每个结点的子结点：
		for ( var i = 0; i < eTree.treelength; i++) {
			eTree.childId[i] = new Array(eTree.treelength);
			for ( var n = 0; n < eTree.treelength; n++) {
				eTree.childId[i][n] = -2;// 赋默认值为-2
			}
		}

		var cnIndex;
		for ( var i = 0; i < eTree.treelength; i++) {
			cnIndex = 0;
			for ( var n = 0; n < eTree.treelength; n++) {
				if (eTree.treeId[i] == eTree.parentId[n]) {
					eTree.childId[i][cnIndex] = eTree.treeId[n];
					cnIndex++;
				}
			}
		}
	};

	// 检测是否还有子结点
	eTree.isHasChildNode = function(idIndex) {
		var childCount = 0;
		if (idIndex < 0)
			return 0;
		while (eTree.childId[idIndex][childCount] != -2)
			childCount++;
		return childCount;
	};

	// 获取结点在treeArray或treeId中的位置
	eTree.getNodeIndex = function(nodeId) {
		var m = 0;
		while (m < eTree.treelength) {
			if (nodeId == eTree.treeArray[m].id)
				return m;
			m++;
		}
		return -1;
	};

	// 按层次遍历，当选非叶子结点时，让所有子结点也被选择
	eTree.clickOnBox = function(realId) {
		var box = document.getElementById("itemBox" + realId);
		// confirm("eTree.treeBoxSelectStyle="+eTree.treeBoxSelectStyle);
		if (box.checked)
			box.checked = true;
		else
			box.checked = false;

		eTree.onBoxValues(realId, box.checked);
		if (eTree.treeBoxSelectStyle == 'nor') {
			return;
		}
		var idIndex = eTree.getNodeIndex(realId);
		// confirm("eTree.treeBoxSelectStyle="+eTree.treeBoxSelectStyle);
		if (eTree.treeBoxSelectStyle == 'down'
				|| eTree.treeBoxSelectStyle == 'all') {
			if (eTree.isHasChildNode(idIndex) != 0 || realId == eTree.rootId)
				eTree.onBoxRecurrence(realId, box.checked);
		}
		if (eTree.treeBoxSelectStyle == 'up'
				|| eTree.treeBoxSelectStyle == 'all') {
			if (idIndex != -1)
				eTree.onBoxParent(eTree.parentId[idIndex], realId, box.checked);
		}
	};

	eTree.initOnBox = function(realId) {
		var box = document.getElementById("itemBox" + realId);

		if (box.checked == false)
			box.checked = true;
		// else
		// box.checked=false;

		eTree.onBoxValues(realId, box.checked);
		if (eTree.treeBoxSelectStyle == 'nor') {
			return;
		}
		var idIndex = eTree.getNodeIndex(realId);
		if (eTree.treeBoxSelectStyle == 'down'
				|| eTree.treeBoxSelectStyle == 'all') {
			if (eTree.isHasChildNode(idIndex) != 0 || realId == eTree.rootId)
				eTree.onBoxRecurrence(realId, box.checked);
		}
		if (eTree.treeBoxSelectStyle == 'up'
				|| eTree.treeBoxSelectStyle == 'all') {
			if (idIndex != -1)
				eTree.onBoxParent(eTree.parentId[idIndex], realId, box.checked);
		}
	};

	// 处理父级结点，选中时，父级点也被选中；取消时，只有没有兄弟结点被选中，才能取消
	eTree.onBoxParent = function(pId, orgId, childState) {
		var box = document.getElementById("itemBox" + pId);
		if (box) {
		} else
			return;

		if (childState == false)
			if (eTree.checkBrotherBox(pId, orgId) == 1)
				return;

		box.checked = childState;
		eTree.onBoxValues(pId, box.checked);
		if (pId == eTree.rootId)
			return;

		for ( var i = 0; i < eTree.treelength; i++)
			if (eTree.treeId[i] == pId)
				eTree.onBoxParent(eTree.parentId[i], orgId, childState);
	};

	// 检查是否有兄弟结点被选中
	eTree.checkBrotherBox = function(pId, orgId) {
		for ( var i = 0; i < eTree.treelength; i++)
			if (eTree.parentId[i] == pId && eTree.treeId[i] != orgId) {
				var box = document.getElementById("itemBox" + eTree.treeId[i])
				if (box && box.checked)
					return 1;
			}

		return 0;
	};

	// 处理子结点，子结点选择状态与父结点保持一致
	eTree.onBoxRecurrence = function(realId, childState) {
		var idIndex = eTree.getNodeIndex(realId);
		var box = document.getElementById("itemBox" + realId);
		box.checked = childState;
		eTree.onBoxValues(realId, box.checked);
		var curIndex = 0;
		for ( var i = 0; i < eTree.treelength; i++)
			if (eTree.parentId[i] == realId)
				eTree.onBoxRecurrence(eTree.treeId[i], childState);
	};

	eTree.recordClickIds=function(realId,isAppend){
		if(eTree.onclickTreeId.length==0){
			if(isAppend==true){
				eTree.onclickTreeId[eTree.onclickTreeId.length]=realId;
			}
			return;
		}
		if(isAppend==true){
			for(var i=0;i<eTree.onclickTreeId.length;i++){
				if(eTree.onclickTreeId[i]==realId){
					return;
				}
			}
			eTree.onclickTreeId[eTree.onclickTreeId.length]=realId;
		}else{
			for(var i=0;i<eTree.onclickTreeId.length;i++){
				if(eTree.onclickTreeId[i]==realId){
					eTree.onclickTreeId.removeAt(i);
					return;
				}
			}
		}
		
	};
	eTree.onBoxValues=function(realId,isAppend){
		eTree.recordClickIds(realId,isAppend);
		var boxValues=document.getElementById("treeIds");//.value;
		if(boxValues==undefined){
			//confirm('treeIds undefined');
			return ;
		}
		if(eTree.onclickTreeId.length==0){
			document.getElementById("treeIds").value="";
			return;
		}
		for(var i=0;i<eTree.onclickTreeId.length;i++){
			if(i==0){
				boxValues = eTree.onclickTreeId[i];
			}else{
				boxValues = boxValues + ","+eTree.onclickTreeId[i];
			}
		}
		document.getElementById("treeIds").value=boxValues;
	};


	eTree.addCheckedNode = function(nodeId) {
		eTree.alreadyCheckedArray[eTree.alreadyCheckedArray.length] = nodeId;
	};

	eTree.initCheckedNodes = function() {
		// if(alreadyCheckedArray==null)return ;
		// confirm(eTree.alreadyCheckedArray.length);
		for ( var i = 0; i < eTree.alreadyCheckedArray.length; i++) {
			var box = document.getElementById("itemBox"
					+ eTree.alreadyCheckedArray[i]);
			if(box==undefined || box==null)continue;
			box.checked = true;
			eTree.onBoxValues(eTree.alreadyCheckedArray[i], true);
		}
	}// **/
}
