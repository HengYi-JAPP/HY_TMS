Personalizer = Class.create();
/************************************
个性化操控脚本接口定义
*************************************/
Personalizer.prototype = {	
	initialize : function () {
		//初始化成员
		var personalizer = this;
		/*
		 * 是否个性化标识
		 */
		personalizer.isPersonalize = true;
		
		/*
		 * 布局记录
		 */
		personalizer.layout=new Layout();
		
		/*
		 * 栏目移动器
		 */
		personalizer.mover = new Mover(personalizer.layout);
	},
	/**
	 * 注册布局单元
	 * 将布局单元加入到布局数据中来
	 * @param unitId
	 * @return
	 */
	regUint : function(unitId){
		var personalizer = this;
		personalizer.layout.addUnit(unitId);
	},
	/**
	 * 栏目注册
	 * 将栏目加入到布局及单元中
	 * 下面是否标识其值1表示是，0表示否
	 * @param unitId 布局单元ID
	 * @param columnId 栏目ID
	 * @param title 栏目标题
	 * @param isShow 是否显示
	 * @param isOpen 内容是否展开
	 * @param isMove 是否可以拖曳
	 * @return
	 */
	regColumn : function (unitId,columnId,title,isShow,isOpen, isMove){
		var personalizer = this;
		personalizer.layout.addPortlet(unitId,columnId,title,isShow,isOpen, isMove);
	},
	/**
	 * 栏目拖曳接口
	 * 只有在需要拖曳的栏目中嵌套了该接口的栏目才能有拖曳效果
	 * @param columnId
	 * @return
	 */
	startMove : function(columnId){
		//confirm("columnId="+columnId);
		var personalizer = this;
		personalizer.mover.startMove(columnId);
	},
	/**
	 * 显示栏目停放位置
	 * 该接口显示在栏目拖曳过程中，可能放在哪个位置
	 * 该接口通过要嵌套在页面body的onmousemove事件中，
	 * 或者嵌套在布局加载器外层页面元素的onmousemove事件中
	 * @return
	 */
	showPosition : function(){
		var personalizer = this;
		personalizer.mover.showPositionShadow();
	},
	reSize : function(){
		var personalizer = this;
		personalizer.mover.reSize();
	},
	folderColumnWin : function(windId,columnCode){
		var personalizer = this;
		var obj=document.getElementById(windId+"_content_box");
		if(obj){
			obj.style.display="none";
		}
		obj=document.getElementById(windId+"_unfolderColumnWin");
		if(obj){
			obj.className=columnCode+"_unfolderColumn";
		}
		obj=document.getElementById(windId+"_folderColumnWin");
		if(obj){
			obj.className=columnCode+"_folderColumnHidden";
		}
		var folder_status = 0;
		personalizer.layout.updatePortletStatus(windId,true,0);
		personalizer.mover.reSize();
	},
	unfolderColumnWin : function(windId,columnCode){
		var personalizer = this;
		var obj=document.getElementById(windId+"_content_box");
		if(obj){
			obj.style.display="block";
		}
		obj=document.getElementById(windId+"_unfolderColumnWin");
		if(obj){
			obj.className=columnCode+"_unfolderColumnHidden";
		}
		obj=document.getElementById(windId+"_folderColumnWin");
		if(obj){
			obj.className=columnCode+"_folderColumn";
		}
		var folder_status = 1;
		personalizer.layout.updatePortletStatus(windId,true,1);
		personalizer.mover.reSize();
	},
	closeColumnWin : function(windId){
		var personalizer = this;
		var obj=document.getElementById(windId);
		if(obj){
			obj.style.display="none";
		}else{
			alert("obj is null . windId:"+windId);
		}
		personalizer.layout.updatePortletStatus(windId,false,0);;
		personalizer.mover.reSize();
	}
	
	
}
