Portlet = Class.create();
Portlet.prototype = {	
//门户、页面、布局、布局单元、栏目、栏目在单元中的顺序，用户
	initialize : function (portletIndex, uparent, portletId,title,isShow, isOpen, isMove) {
	//初始化
		var portlet = this, temp;
		/*栏目下标的顺序位置*/
		portlet.portletIndex = portletIndex;
		portlet.parent = uparent;
		//portlet.unitIntId = unitIntId==undefined||unitIntId==null?parent.unitIntId : unitIntId;
		
		portlet.portletId =  portletId;//+"_"+parent.unitId;
		//portlet.portletDbId = portletId;
		portlet.title = title;
		
		
		portlet.isShow = isShow==undefined||isShow==null?"1":(isShow=='0'?isShow:"1");;
		portlet.isOpen = isOpen==undefined||isOpen==null?"1":(isOpen=='0'?isOpen:"1");;
		portlet.isMove = isMove==undefined||isMove==null?"1":(isMove=='0'?isMove:"1");
		portlet.element = null;//document.getElementById(portletId);
	}		
};