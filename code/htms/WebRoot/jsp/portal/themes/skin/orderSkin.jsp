<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/portal/table-mover.js"/>
		<com:loader css="css/common/table-list.css" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="skinForm" name="skinForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="updateSkinOrder"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.skin.order.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="skinList" bean="skinBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="{$jsp.portal.themes.skin.order#}" width="30px" style="text-align:center;"  property="showOrder"/>
				<html:td  label="{$jsp.portal.themes.skin.code#}"  property="skinCode" />
				<html:td  label="{$jsp.portal.themes.skin.name#}"  property="skinName" />
				<html:td  label="{$jsp.portal.themes.skin.desc#}"  property="skinDesc" />
				<html:td label="{$jsp.portal.themes.skin.showorder#}" align="center">
					<html:hidden   name="showOrder" value="skinBean.showOrder" />
					<html:hidden   name="skinId" id="skinId" value="skinBean.skinId" />
					<html:span onclick="moveTop(this,{orderElementName:'showOrder'})" style="cursor:hand"><html:label label="{$jsp.portal.themes.themes.showorder.top#}"/></html:span>
					<html:span onclick="moveUp(this,{orderElementName:'showOrder'})" style="cursor:hand"><html:label label="{$jsp.portal.themes.themes.showorder.forward#}"/></html:span>
					<html:span onclick="moveDown(this,{orderElementName:'showOrder'})" style="cursor:hand"><html:label label="{$jsp.portal.themes.themes.showorder.after#}"/></html:span>
					<html:span onclick="moveBottom(this,{orderElementName:'showOrder'})" style="cursor:hand"><html:label label="{$jsp.portal.themes.themes.showorder.bottom#}"/></html:span>
				</html:td>
			</html:tr>
		</html:table>	
		<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('skinForm')"/>		
						<btn:return href="contoller.do?operation=listSkin&themesId=$[themesId]"/>								
				</html:td></html:tr>
			</html:table>	
		
	</html:form>
	
	</body>
</html>




