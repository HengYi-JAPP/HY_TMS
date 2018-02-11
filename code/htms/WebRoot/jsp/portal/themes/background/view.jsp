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
<com:loader css="css/common/table-list.css"/>
<html:form id="bgdForm" name="bgdForm" method="post" action="contoller.do">
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.background.view.title") %>' name='title'/>
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.background.type#}"/></html:td>
					<html:td >
							<html:radio name="bgdType" id="bgdType"  value="1" checked="bgdViewBean.bgdType"  /><html:label label="{$jsp.portal.themes.background.image#}"/> <html:radio name="bgdType" id="bgdType"  checked="bgdViewBean.bgdType"   value="2"  />  <html:label label="{$jsp.portal.themes.background.color#}"/>	
					</html:td>
				</html:tr>
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"> <html:label label="{$jsp.portal.themes.background.code#}"/></html:td>
					<html:td >
							<html:value  value="bgdViewBean.bgdCode"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.background.name#}"/></html:td>
					<html:td >
							<html:value value="bgdViewBean.bgdName"/>													
					</html:td>							
				</html:tr>
				<html:tr>	
					<html:td align="right" styleClass="edit-content-label"><html:label label="{$jsp.portal.themes.background.icon#}"/></html:td>
					<html:td>					
						<html:value  value="bgdViewBean.bgdIcon"/>
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td align="right" styleClass="edit-content-label"><html:label label="{$jsp.portal.themes.background.background#}"/></html:td>
					<html:td>					
						<html:value  value="bgdViewBean.bgdContent"/>
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.background.desc#}"/></html:td>
					<html:td >
							<html:value value="bgdViewBean.bgdDesc"/>	
					</html:td>
				</html:tr>
				
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listBackground"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>


	</body>
</html>

