<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

String currentAreaId=request.getParameter("areaId");
AreaRepository rep = new AreaRepository();
String areaName = (String)rep.getFullAreaName(currentAreaId,">>",true);
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css" validator="true"  tree="true"/>
<html:form id="areaForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1641" class="edit-talbe">
		
		<tr class="trCell">
			<td class="edit-talbe-label" id="OECEIPKNKJOGLAFOHPNBHABMMKEGNKEGBFANJFBIEILJEAKMNJKAKFJHNJANAILH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.areacode#}" ></html:label>
			</td>
			<td  id="CMKCBKBOFLNONPJGFFKHLJFGGOOKNGOGBBMKBEKLKAELHCPAPKMMLCELKMMHEENI" colSpan="1" rowSpan="1">
				<html:value  value="areaViewBean.areaCode" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="OLPBPLEPBKIMNNEOIGOPGIMPALGLKHAKLHCHEHFCBKELBICAECCHLPNBKAKICBAJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.areaname#}" ></html:label>
			</td>
			<td  id="GIHCFEEAELPLICHGLMCBMINMCNKECJKCGBBHLEEAGNEFHLJLPCOJOJANNKKCAGKH" colSpan="1" rowSpan="1">
				<html:value  value="areaViewBean.areaName" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FABJOHPKAEEAKHNLIKKGGICOKNJBIGFCFAFNHOINFBPIKOPAFCNALCKONKJFCMBB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.parentareaid#}" ></html:label>
			</td>
			<td  id="NCNIJKMKNAMGAKIBNMCFBEKBMGHHKJBOJJJLMKGNIFHAELPKBKKNNFBFOFOGGLFB" colSpan="1" rowSpan="1">
				<%
				if(areaName!=null){
			 %>
			 	<html:value value="<%=areaName %>"></html:value>
			  <%} %>	
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NKHNFKKHAAFJFLOPEAOKOKBGLLMMNHEGJAFKKGPJENCFAEIBAEHFKMHAHBILBBMO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.arealevel#}" ></html:label>
			</td>
			<td  id="BMPLICLGJICJGNMBOGGNKBAAAHKAIPJLGKPKAOIPAOEIHPPLOPPHAJHKAKNHGONJ" colSpan="1" rowSpan="1">
				<html:value  value="areaViewBean.areaLevel" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="CJBKCOCJNNNJLAFPMGNOHELABMHGNBOKFFNCBENKCHFKKJLJKIEOLHOKACMGOEKJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.arearoute#}" ></html:label>
			</td>
			<td  id="GLGKKBAHLLJCKEKJGLJKFJCMPKAKCICNNOKINFMIMBGIBKCBBOAHKHCCOIBOGOPM" colSpan="1" rowSpan="1">
				<html:value  value="areaViewBean.areaRoute" ></html:value>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listArea"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
