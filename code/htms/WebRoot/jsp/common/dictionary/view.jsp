<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader switchbox="true"   css="css/common/table-list.css" />
	<jsp:include page="../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.common.dictionary.view.title") %>' name='title'/>		
	</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
		<html:tr>
			<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type#}"/></html:td>
			<html:td >						
				<html:select id="dicType" name="dicType"  list="<%=PropKey.DICTIONARY_TYPE_LIST%>" disabled="true">
					<html:option label="typeName" value="typeId" selected="dictionaryViewBean.typeId"/>
				</html:select>							 											
			</html:td>
		</html:tr>
		<html:tr>
			<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.code#}"/></html:td>
			<html:td >	
				<html:value value="dictionaryViewBean.dicCode"/> 											
			</html:td>
		</html:tr>
		<html:tr>
			<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.name#}"/></html:td>
			<html:td >
				<html:value value="dictionaryViewBean.dicName"/>											
			</html:td>
		</html:tr>
		<html:tr>
			<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.desc#}"/></html:td>
			<html:td>
				<html:value value="dictionaryViewBean.dicDesc"/>											
			</html:td>
		</html:tr>
		<html:tr>
			<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.order#}"/></html:td>
			<html:td >
				<html:value value="dictionaryViewBean.showOrder"/>													
			</html:td>
		</html:tr>
		<html:tr>
			<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
			<html:td>
		
			<com:switchbox varValue="dictionaryViewBean.isValidate" talbeName="TB_DICTIONARY" idValue="dictionaryViewBean.dicId" offValue="0" varName="isValidate" onValue="1"  idName="dicId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do" disabled="true"/>									
			</html:td>
		</html:tr>
</html:table>
			
<html:table  cellSpacing="0"  align="center" isHead="false" >
	<html:tr ><html:td >
			<btn:return href="contoller.do?operation=listDictionary"/>							
	</html:td></html:tr>
</html:table>	

	</body>
</html>


