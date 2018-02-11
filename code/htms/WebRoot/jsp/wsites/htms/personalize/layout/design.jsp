<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.portal.layout.LayoutBean"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	LayoutBean layoutViewBean=(LayoutBean)request.getAttribute("layoutViewBean");
	String layoutId = layoutViewBean==null?"":layoutViewBean.getLayoutId();
	String currentSysCode=  request.getParameter("currentSysCode");
	String channelId =  request.getParameter("channelId");
	String sysId =  request.getParameter("sysId");
	String isDirect = request.getParameter("isDirect");
	isDirect=isDirect==null||"".equals(isDirect)?"":isDirect;
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body style="text-align:center;margin:0px;border:0px;padding:0px;">

<com:loader css="css/common/table-list.css" />
<com:loader  js="js/common/common.js"/>
<html:form id="layoutForm" name="layoutForm" method="post" action="contoller.do">

			<logic:if  condition="'$[layoutViewBean.userDefine]'=='1'">
				<html:hidden id="operation" name="operation" value="save4UserDefineLayout"/>
			</logic:if>
			<logic:if  condition="'$[layoutViewBean.userDefine]'!='1'">
				<html:hidden id="operation" name="operation" value="saveSystemLayoutUserDefineColumns"/>
			</logic:if>
			<html:hidden name="layoutId" id="layoutId"  value="<%=layoutId %>"/>
			<html:hidden   name="sysId" value="sysId" />
			<html:hidden   name="currentSysCode" value="currentSysCode" />
			<html:hidden   name="channelId" value="channelId" />
			<html:hidden   name="isDirect" value="isDirect" />
			
			<html:table  style="width:1024px" style="margin:0 0 0 5px;border:0px;padding:0px;vertical-align:top;" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td colspan="4"  style="width:1000px" >	
						<jsp:include page="../../../../common/impart/table-banner.jsp">
							<jsp:param value='<%=tools.tool.getLocal("jsp.portal.website.personalize.layout.selfdefine") %>' name="title"/>		
						</jsp:include>				
					</html:td>
					
				</html:tr>
			</html:table>
			<html:table  style="width:1000px" style="margin:0 0 0 5px;border:0px;padding:0px;vertical-align:top;"  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.layout.name#}" /></html:td>
					<html:td >	
						<html:value value="layoutViewBean.layoutName"/>						
					</html:td>
					<html:td >
						<btn:save href="javascript:saveLayout();"/>	
						<logic:if  condition="'$[layoutViewBean.userDefine]'=='1'">
						<input id="layoutDesignerPannelSwitch"  class="button-self-style" type="button" name="Submit2423" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.showpannel") %>"  onclick="LayoutDesigner.ShowOrHideDesignPannel(this.id,'layoutDesignerPannelOperationArea');"/>
						</logic:if>
						<logic:if notNull="isDirect">
						<btn:close href="javascript:parent.__myWin.closeWebWindow('userLayoutColumnDefineWind');"/>
						</logic:if>		
						<logic:if isNull="isDirect">
						<btn:return href="contoller.do?operation=loadUserPersonalizeLayoutList&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]"/>
						</logic:if>	
												
				</html:td>
				</html:tr>
			</html:table>
			
			<html:table  style="width:1000px" cellSpacing="0"  align="center" isHead="false" >
				
				<html:tr ><html:td  style="width:1000px">
					<jsp:include page="../../layout/user-layout-designer.jsp">
							<jsp:param value="<%=layoutId %>" name="layoutId"/>
							<jsp:param value="<%=sysId %>" name="sysId"/>
							<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
							<jsp:param value="<%=channelId %>" name="channelId"/>
							<jsp:param value="<%=isDirect %>" name="isDirect"/>
					</jsp:include>						
				</html:td></html:tr>
			</html:table>	
			
	
	</html:form>
	<com:loader   simpleUpload="true"/>
	</body>
</html>

<script type="text/javascript">

function saveLayout(){
	LayoutDesigner.getLayoutTemplate(false);
	LayoutDesigner.publishLayoutTemplate(false);
	submit('layoutForm');
}

</script>
	
