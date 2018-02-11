<%@ page language="java" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";


 %>
<link href="<%=basePath %>console/css/style.css" rel="stylesheet" />
<table class="system-main-layout-table">
	<tr>
		<td id="leftTD" class="system-main-left">
			<div id="menuDiv" class="system-scroll-box" ></div>
		</td>
		<td class="system-main-hide-bar">
			<span title="关闭/打开左栏" onclick="ShowOrHideMenu(this)">
			<img src="console/images/img/show-hide-btn.gif" style="cursor:hand"/></span>
		</td>
		<td class="system-main-right"><iframe id="mainContent" width="100%" 
				frameborder="0" scrolling="auto" src="<%=basePath %>console/jsp/common/framework/welcome.jsp"></iframe>
		</td>
	</tr>
</table>

<script type="text/javascript">
function MenuItem(initItem){
	var item = this;
	item.id=initItem.id;
	item.name=initItem.name;
	item.parentId=initItem.parentId;
	item.showOrder=initItem.showOrder==undefined||initItem.showOrder==null?0:initItem.showOrder;
	item.url=initItem.url;
	
	item.icons="";
	
	item.level=initItem.level==undefined||initItem.level==null?0:initItem.level;
	item.isRoot=false;
	item.isLeaf=false;
	item.isAppend=false;
	item.htmlElement=null;
	item.childContainer=null;
}
var _systemMenus = [	
		
		new MenuItem({ id : "001", parentId : "-1" , name : "字典类型管理" ,   showOrder:1, url : "<%=basePath %>contoller.do?operation=listDictionaryType&curpage=1&typeCodeSH=&typeNameSH="}),
		new MenuItem({ id : "002", parentId : "-1" , name : "字典管理" ,   showOrder:2, url : "<%=basePath %>contoller.do?operation=listDictionary&curpage=1&dicCodeSH=&dicNameSH="}),
		
		new MenuItem({ id : "003", parentId : "-1" , name : "系统管理" ,   showOrder:3, url : "<%=basePath %>contoller.do?operation=listSystem&curpage=1&sysNameSH="}),
		new MenuItem({ id : "004", parentId : "-1" , name : "角色管理" ,   showOrder:4, url : "<%=basePath %>contoller.do?operation=listRole&curpage=1&roleNameSH="}),
		new MenuItem({ id : "005", parentId : "-1" , name : "用户管理" ,   showOrder:5, url : "<%=basePath %>contoller.do?operation=listUser&curpage=1&userNameSH=&accountSH"}),
		new MenuItem({ id : "006", parentId : "-1" , name : "同步管理" ,   showOrder:6, url : "<%=basePath %>console/jsp/lwsync/list.jsp"}),
		new MenuItem({ id : "007", parentId : "-1" , name : "数据源管理" ,   showOrder:7, url : "<%=basePath %>contoller.do?operation=listDatasource&curpage=1&dbsNameSH="})
	];
	
</script> 
<script type="text/javascript" src="<%=basePath %>console/js/menu.js"></script>

