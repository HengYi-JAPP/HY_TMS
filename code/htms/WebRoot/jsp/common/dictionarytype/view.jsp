<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mobilecn.common.dictionarytype.DictionaryTypeBean"%>
<%@page import="consts.PropKey"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	DictionaryTypeBean dictionaryTypeViewBean = (DictionaryTypeBean)request.getAttribute(PropKey.DICTIONARY_TYPE_BEAN);
	dictionaryTypeViewBean = dictionaryTypeViewBean == null ? new DictionaryTypeBean() : dictionaryTypeViewBean;
 %>
 <%@ include file="../../common/impart/taglib.jsp"%>
<html>
	<head>
	<base href="<%=basePath%>">
	<com:loader css="css/common/table-list.css"/>
	<com:loader  js="js/common/common.js"/>
	<com:loader  switchbox="true" ajax="true"/>
	</head>
<body >
	
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.common.dictionary.type.view.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type.code#}"/></html:td>
					<html:td ><html:value value="dictionaryTypeViewBean.typeCode"></html:value></html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type.name#}"/></html:td>
					<html:td ><html:value value="dictionaryTypeViewBean.typeName"/></html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type.desc#}"/></html:td>					
					<html:td ><html:value value="dictionaryTypeViewBean.typeDesc"/></html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
						<com:switchbox varValue="dictionaryTypeViewBean.isValidate" talbeName="TB_DIC_TYPE" idValue="dictionaryTypeViewBean.typeId" offValue="0" varName="isValidate" onValue="1"  idName="typeId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do" disabled="true"/>				
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >						
						<btn:return href="contoller.do?operation=listDictionaryType"/>							
				</html:td></html:tr>
			</html:table>	
	
	</body>
</html>

