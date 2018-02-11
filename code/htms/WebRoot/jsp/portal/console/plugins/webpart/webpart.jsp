<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String nextOperation = request.getParameter("nextOperation");
	nextOperation = nextOperation==null?"":nextOperation;
	String isModify = request.getParameter("nextIsModify");
	isModify = isModify==null?"":isModify;
	String columnLoadType = request.getParameter("columnLoadType");
	String layoutId = request.getParameter("layoutId");
	String sysId = request.getParameter("sysId");
	String channelId = request.getParameter("channelId");
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"   fckeditor="true"/>
<html:form id="columnForm" name="columnForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modify4UserDefineColumn"/>
			
			<html:hidden name="columnId" id="columnId"  value="columnViewBean.columnId"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.webpart.config.title") %>' name='title'/>
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.columnname#}"/></html:td>
					<html:td >
							<html:value  value="columnViewBean.columnName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.columnicon#}"/></html:td>
					<html:td >
						<html:img src="columnViewBean.logo"></html:img>  														
					</html:td>
				</html:tr>							
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.contentwidth#}"/></html:td>
					<html:td >						
						<html:text name="contentWidth" id="contentWidth" styleClass="input-text" size="36"  value="columnViewBean.contentWidth"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.contentheight#}"/></html:td>
					<html:td >
						<html:text name="contentHeight" id="contentHeight" styleClass="input-text" size="36"  value="columnViewBean.contentHeight"/>																		
					</html:td>
				</html:tr>		
				<html:tr  id="contentEditor" style="display:none;" >
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.content#}"/></html:td>
					<html:td colspan="3">
					<com:fckeditor instanceName="content" width="800" height="400" defalutValue="columnViewBean.content"></com:fckeditor>
					</html:td>
				</html:tr>	
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.columndesc#}"/></html:td>
					<html:td colspan="3">
							<html:value  value="columnViewBean.columnDesc" />				
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('columnForm')"/>													
				</html:td></html:tr>
			</html:table>	
	</html:form>
	
	

	</body>
</html>

<script type="text/javascript">
	function showEditior(){

		var ceDisplay=document.getElementById('contentEditor').style.display;
		//alert('ceDisplay='+ceDisplay);
		if(ceDisplay=='block'){
			document.getElementById('contentEditor').style.display='none';
			document.getElementById('editorSwitchButton').innerHTML = '<%=tools.tool.getLocal("jsp.portal.console.plugin.webpart.editorcontent") %>';
		}else{ 
			document.getElementById('contentEditor').style.display='block';
			document.getElementById('editorSwitchButton').innerHTML = '<%=tools.tool.getLocal("jsp.portal.console.plugin.webpart.hideeditor") %>';
		}
	}
	</script>
