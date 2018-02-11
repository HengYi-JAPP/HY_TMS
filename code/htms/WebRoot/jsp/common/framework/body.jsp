<%@ page language="java"  import="java.util.*,com.mobilecn.privilege.privilege.PrivilegeBean,com.mobilecn.privilege.processor.PrivilegeUtils" pageEncoding="utf-8"%>
<%@ include file="../impart/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String wellcome =basePath+ "jsp/common/framework/welcome.jsp";
	%>
<%
List menus = new ArrayList();
String account=(String)request.getSession().getAttribute("account");
account=account==null||"".equals(account.trim())?"":account;
PrivilegeUtils privUtils = new PrivilegeUtils(request);
List list = privUtils.getMenus(account);

//System.out.println("list.size()="+list.size());
//for(int i=0,size=list.size();i<size;i++){
	//System.out.println("\n\n"+list.get(i));
//}
request.setAttribute("menus",list);
//System.out.println("\n\n\n\n\n ================================================");
%>
<%--
PrivilegeBean bean = new PrivilegeBean();
bean.setPrivId("001");
bean.setPrivName("字典类型管理");
bean.setPrivParentId("003");
bean.setPrivOrder("1");
bean.setPrivAddr("contoller.do?operation=listDictionaryType&curpage=1&typeCodeSH=&typeNameSH=");
menus.add(bean);

 bean = new PrivilegeBean();
bean.setPrivId("002");
bean.setPrivName("字典管理");
bean.setPrivParentId("003");
bean.setPrivOrder("2");
bean.setPrivAddr("contoller.do?operation=listDictionary&curpage=1&dicCodeSH=&dicNameSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("003");
bean.setPrivName("权限系统管理");
bean.setPrivParentId("-1");
bean.setPrivOrder("3");
bean.setPrivAddr("contoller.do?operation=listSystem&curpage=1&sysNameSH=");
menus.add(bean);

 bean = new PrivilegeBean();
bean.setPrivId("004");
bean.setPrivName("角色管理");
bean.setPrivParentId("003");
bean.setPrivOrder("4");
bean.setPrivAddr("contoller.do?operation=listRole&curpage=1&roleNameSH=");
menus.add(bean);

 bean = new PrivilegeBean();
bean.setPrivId("005");
bean.setPrivName("用户管理");
bean.setPrivParentId("003");
bean.setPrivOrder("5");
bean.setPrivAddr("contoller.do?operation=listUser&curpage=1");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("007");
bean.setPrivName("数据源管理");
bean.setPrivParentId("003");
bean.setPrivOrder("7");
bean.setPrivAddr("contoller.do?operation=listDatasource&curpage=1&dbsNameSH=");
menus.add(bean);


bean = new PrivilegeBean();
bean.setPrivId("008");
bean.setPrivName("机构管理");
bean.setPrivParentId("003");
bean.setPrivOrder("8");
bean.setPrivAddr("contoller.do?operation=listOrganization&curpage=1&orgNameSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("009");
bean.setPrivName("系统管理");
bean.setPrivParentId("003");
bean.setPrivOrder("9");
bean.setPrivAddr("contoller.do?operation=listSystem&curpage=1&sysNameSH=&sysCodeSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("091");
bean.setPrivName("用户组管理");
bean.setPrivParentId("003");
bean.setPrivOrder("91");
bean.setPrivAddr("contoller.do?operation=listGroup&curpage=1&groupNameSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("92");
bean.setPrivName("权限管理");
bean.setPrivParentId("003");
bean.setPrivOrder("92");
bean.setPrivAddr("contoller.do?operation=listPrivilege&curpage=1&privNameSH=&privCodeSH");
menus.add(bean);




bean = new PrivilegeBean();
bean.setPrivId("0032");
bean.setPrivName("子系统管理");
bean.setPrivParentId("-1");
bean.setPrivOrder("2");
bean.setPrivAddr("contoller.do?operation=listSystem&curpage=1&sysNameSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("201");
bean.setPrivName("用户组管理");
bean.setPrivParentId("0032");
bean.setPrivOrder("1");
bean.setPrivAddr("contoller.do?operation=listGroup&curpage=1&groupNameSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("201");
bean.setPrivName("角色管理");
bean.setPrivParentId("0032");
bean.setPrivOrder("2");
bean.setPrivAddr("contoller.do?operation=listRole&curpage=1&roleNameSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("203");
bean.setPrivName("权限管理");
bean.setPrivParentId("0032");
bean.setPrivOrder("3");
bean.setPrivAddr("contoller.do?operation=listPrivilege&curpage=1&privNameSH=&privCodeSH");
menus.add(bean);


bean = new PrivilegeBean();
bean.setPrivId("204");
bean.setPrivName("信息类型");
bean.setPrivParentId("0032");
bean.setPrivOrder("3");
bean.setPrivAddr("contoller.do?operation=listInfoType&curpage=1&infoTypeNameSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("205");
bean.setPrivName("信息管理");
bean.setPrivParentId("0032");
bean.setPrivOrder("3");
bean.setPrivAddr("contoller.do?operation=listNews&curpage=1&titleSH=");
menus.add(bean);

bean = new PrivilegeBean();
bean.setPrivId("206");
bean.setPrivName("系统管理");
bean.setPrivParentId("0032");
bean.setPrivOrder("3");
bean.setPrivAddr("contoller.do?operation=listSystem&curpage=1&sysNameSH=");
menus.add(bean);
request.setAttribute("menus",list);
//request.setAttribute("menus",menus);

--%>
<html:page title="Console of EthERNet Web Sites ">


		<com:loader  css="css/framework-new.css" js="js/console/index/index.js"/>	
		<html:table border="0" styleClass="system-main-layout-table" width="100%" height="100%">	    	
	    	<html:tr>
		    	<html:td id="leftTD" styleClass="system-main-left" >
		    		<html:div id="menuDiv" styleClass="system-scroll-box" ></html:div>
		    	</html:td>	
		    	<html:td styleClass="system-main-hide-bar">
		    		<html:span title="{$jsp.common.framework.body.span.title#}" onclick="ShowOrHideMenu(this)">
		    			<html:img id="showOrHideImage" src="images/common/framework/shrink-left.png" style="cursor:hand"/>
		    		</html:span>
		    	</html:td>
	    		<html:td styleClass="system-main-right">
	    			<html:iframe src="<%=wellcome%>" id="mainContent" name="mainContent" width="100%" frameBorder="0" scrolling="auto" onload="return false;" />
	    		</html:td>	
	    	</html:tr>
	    </html:table>
		<com:loader funMenu="true"/>
		<com:funMenu contenLoaderId="mainContent" menuBoxId="menuDiv" menuBoxTitle="{$jsp.common.framework.body.menu.title#}" menuList="menus" itemId="privId" itemName="privName" itemUrl="privAddr" itemParentId="privParentId" itemShowOrder="privOrder"/>
</html:page>