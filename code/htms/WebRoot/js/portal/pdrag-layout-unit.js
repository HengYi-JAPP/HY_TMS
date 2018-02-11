LayoutUnit = Class.create();

LayoutUnit.prototype = {
	
	initialize : function (unitId, parent, element) {
	//初始化
		var unit = this;
		unit.unitId = unitId;
		//unit.unitIntId = unitIntId;
		unit.portletList = []; //创建列组
		//unit.unitIndex = unitIndex;//是下标识
		unit.parent = parent;
		unit.element = element;
	},
	/**
	 * 增加栏目，在布局单元动态加载栏目时，动态地记录加入布局中的栏目信息，记录的数据将在后面拖动中使用。
	 * @param portletId，栏目在数据库的编号
	 * @param isShow，是否显示该栏目，如果close为0，否则为1
	 * @param isOpen，是否展开标识，如果展开为1，缩小或收拢为0
	 * @param isMove，是否可移动标识，如果移动为1，锁定或固定为0
	 * @return 返回新加入的栏目对象
	 **/
	addPortlet : function (unitId,portletId,title,isShow,isOpen, isMove) {
		var unit = this, portletIndex = unit.portletList.length;
		var currentPortlet = null;
		for(var i=0;i<unit.portletList.length;i++){
			currentPortlet=unit.portletList[i];
			if(currentPortlet.portletId==portletId){
				return currentPortlet;
			}
		}
		return unit.portletList[portletIndex] = new Portlet(portletIndex,unit, portletId,title,isShow, isOpen, isMove);
	},
	
	appendPortlet : function (portlet) {
		var unit = this, portletIndex = unit.portletList.length;
		var currentPortlet = null;
		for(var i=0;i<unit.portletList.length;i++){
			currentPortlet=unit.portletList[i];
			if(currentPortlet.portletId==portlet.portletId){
				return currentPortlet;
			}
		}
		
		portlet.portletIndex = portletIndex;
		portlet.parent = this;
		return unit.portletList[portletIndex] = portlet;//new Portlet(portletIndex,unit, portletId,title,isShow, isOpen, isMove);
	},
	
	/**
	 * 在拖动结束之后，将当前栏目加入到目标布局单元（容器）指定的下标中，加入的同时修改栏目中的下标及父级从属对象
	 * @param index，当前栏目加入在目标布局单元（容器）中的指定下标
	 * @param portlet,新加入目标布局单元（容器）中的栏目对象
	 * @return 返回新加入的栏目对象
     **/
	insertPortlet : function (index, portlet) {
		var unit = this, portletList = unit.portletList, i;
		
		if (portlet.parent == unit && portlet.portletIndex < index) index --; //同列向下移动的时候
		for (i = index ; i < portletList.length ; i ++) portletList[i].portletIndex ++;
		
		portlet.parent = unit;
	
		portletList.splice(index, 0, portlet);
		portlet.portletIndex = index;//, portlet.parent = unit;
		
		return portlet;
	},
	
	/**
	 * 在拖动结束之后，从源布局单元（容器）中删除下标指定的栏目，删除的同时修改源布局单元（容器）中其他栏目的下标
	 * @param index，当前删除栏目的指定下标
	 * @return 返回删除栏目对象
     **/
	deletePortlet : function (index) {
		var unit = this, portletList = unit.portletList, i,currentPortlet,delPortlet;
		
		if (index >= portletList.length) return;
		for (i = index + 1; i < portletList.length ; i ++) portletList[i].portletIndex = i - 1;
		return portletList.splice(index, 1)[0];
	}	
};