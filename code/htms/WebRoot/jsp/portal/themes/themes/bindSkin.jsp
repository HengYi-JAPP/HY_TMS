<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css" lorbox="true"/>
<html:form id="themesForm" name="themesForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="doAddSkinForThemes"/>
			

			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.themes.bind.title") %>' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.themes.name#}"/></html:td>
					<html:td >	
						<html:value value="themesViewBean.themesName"/> 	
						<html:hidden name="checkThemesId" id="checkThemesId"  value="themesViewBean.themesId"/>										
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.themes.select#}"/></html:td>
					<html:td >		
					<com:lorbox lorBoxName="lorbox" filtDuplicated="true">
						<com:leftbox itemId="skinId" list="canSelectSkin" itemValue="skinId" itemLabel="skinName" boxId="canSelectSkin" orader="false" boxLabel="{$jsp.portal.themes.themes.selectable#}"/>
						<com:rightbox itemId="skinId" list="skinOfThemes" itemValue="skinId" itemLabel="skinName" boxId="selectedSkin"  orader="false"  boxLabel="{$jsp.portal.themes.themes.selected#}"/>
					</com:lorbox>	
							 											
					</html:td>
				</html:tr>			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:lorbox.submit();submit('themesForm')"/>
					
						<btn:return href="contoller.do?operation=listThemes"/>							
				</html:td></html:tr>
			</html:table>	
		

	</html:form>
	
	

	</body>
</html>

							
	