<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<%

AreaRepository rep = new AreaRepository();
request.setAttribute("areaTreeList",AreaRepository.getRootNodeList());

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js,jsp/htms/dictionary/route/route.js" validator="true" simpleUpload="true" myWin="true"/>
<com:loader css="css/common/sub-table-list.css"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>
<html:form id="routeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="POST" >
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true"  tree="true"/>	
	<html:hidden id="operation" name="operation" value="addBatchRoute"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.route.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1635" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td>
				<html:select  id="productId"  name="productId"  list="productList" style="width:65px;">
				<html:option  value="productId"  label="productName" selected="true"></html:option><
				</html:select>
			</td>
			<html:td   style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="productTip" style="font-size:12px;">请选择产品。</font>
			</html:td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
			</td>
			<td>
				<html:select  id="factoryId"  name="factoryId"  list="factoryList" style="width:65px;" >
				<html:option  value="factoryId"  label="factoryName"  selected="true"></html:option>
				</html:select>
				<%-- 
				<html:hidden name="area" id="area"  value=""/>
							
				<html:hidden id="areaId" name="areaId" value=""/>	
				<input type="text" name="orderArea" id="orderArea" value="" onblur="document.getElementById('area').value=this.value"/>	
				<btn:button name="Select" href="javascript:void(0);" onclick="selectArea()" typeId="selectArea" value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.select") %>' styleClass="button-self-style"/>
				--%> 
			</td>
			<html:td   style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="factoryTip" style="font-size:12px;">请选择厂区。</font>
			</html:td>
		</tr>
		<tr class="trCell">
			
			<td colspan="3" style="text-align:center;">
				
			
				<btn:save href="javascript:validateRoute(true)"/>
				<btn:return href="contoller.do?operation=listRoute"/>
				<%-- 
				<html:hidden name="area" id="area"  value=""/>
							
				<html:hidden id="areaId" name="areaId" value=""/>	
				<input type="text" name="orderArea" id="orderArea" value="" onblur="document.getElementById('area').value=this.value"/>	
				<btn:button name="Select" href="javascript:void(0);" onclick="selectArea()" typeId="selectArea" value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.select") %>' styleClass="button-self-style"/>
				--%> 
			</td>
			
		</tr>
		<tr class="trCell">
			<td style="text-align:left;vertical-align:middle;background: #f1f1f1;font-size:12px"   colspan="3">			
				<font id="areaTip" style="font-size:12px;">请选择线路目的地。</font>
			</td>
			
		</tr>
		
		
	</table>
	<com:tree  treeList="areaTreeList" treeName="myTree" useCheckBox="true" chooseStyle="nor" cacheElementName="checkAreaId" treeNodeId="areaId" appendNodeOperation="false" useNodeImage="false" expandAll="0" useLink="false" isAsync="true" asyncDataLodaerClass="com.zzy.htms.dictionary.area.AsyncAreaLoader">
		<com:treeNodeMap name="areaName" nodeId="areaId" parentId="parentAreaId" alert="areaName" level="areaLevel"/>
	</com:tree>
	<%--
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:submit('routeForm')"/>
				<btn:return href="contoller.do?operation=listRoute"/>
			</html:td>
		</html:tr>
	</html:table> --%>
</html:form>
