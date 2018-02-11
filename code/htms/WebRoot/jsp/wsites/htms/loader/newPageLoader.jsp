<%@ page language="java" import="java.util.*,com.mobilecn.utils.RequestHelper,com.mobilecn.privilege.sysconfig.SysConfigLoader" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>

<portal:system  systemList="true" currentSystem="true"  scope="session" /> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String currentSysCode=  request.getParameter("currentSysCode");
RequestHelper helper = new RequestHelper(request);
String newPageContentUrl = (String)helper.getValueFromAllScopes("newPageContentUrl");
if(newPageContentUrl==null||"".equals(newPageContentUrl.trim())||"null".equalsIgnoreCase(newPageContentUrl.trim())){
	newPageContentUrl="";
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><html:value value="$[__CURRENT_SYSTEM_TAG.sysName] {$jsp.index.title#}"></html:value></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	首页页面布局如下：
	
	                    左                                                     中                                                            右
		******************************************************
		********++++++++++++++++++++++++++++++++++++++********
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
	上	*      *+      |         页头                      |       +*      *
		*      *+      |                     |       +*      *
		*------*+====================================+*------*
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
		*      *+      |         内容                      |       +*      *
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
	中	*      *+  左      |          中                        |   右      +*      *
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
		*------*+====================================+*------*
		*      *+      |                     |       +*      *
	下	*      *+      |         页尾                      |       +*      *
		*      *+      |                     |       +*      *
		*      *+      |                     |       +*      *
		********++++++++++++++++++++++++++++++++++++++********
		******************************************************
	
	
	
	-->
	  </head>
<portal:themes />
<%//if(indexPageContent==null||"".equals(indexPageContent.trim())){ %>
  <body class="index-global-body">
  <html:table id="global-layout" styleClass="index-global-layout">
 		 <html:tr>
 		 	<!--  <html:value value="{$jsp.index.note.layout.left.padding#}"/> -->
    		<html:td id="global-layout-left-padding"  styleClass="index-global-layout-left-padding">
    			<html:table styleClass="global-body-left-content" >
    				<!-- <html:value value="{$jsp.index.note.layout.left.padding.top#}"/> -->
			    	<html:tr> 
			    		<html:td id="global-layout-left-padding-top" styleClass="index-global-layout-left-padding-top">&nbsp;</html:td>
			    	</html:tr> 
			    	<!-- <html:value value="{$jsp.index.note.layout.left.padding.middle#}"/> -->			    		
			    	<html:tr>
			    		<html:td id="global-layout-left-padding-middle"  styleClass="index-global-layout-left-padding-middle">&nbsp;</html:td>
			    	</html:tr> 
			    	<!-- <html:value value="{$jsp.index.note.layout.left.padding.bottom#}"/> -->
			    	<html:tr>
			    		<html:td id="global-layout-left-padding-bottom" styleClass="index-global-layout-left-padding-bottom">&nbsp;</html:td>
			    	</html:tr> 
			    </html:table>
			</html:td>
    		
    		<!-- <html:value value="{$jsp.index.note.layout.body#}"/> -->
    		<html:td id="global-layout-body" styleClass="index-global-layout-body"  valign="top">  
    				<!-- <html:value value="{$jsp.index.note.layout.body.system.loader#}"/>-->
    				
    				<jsp:include page="../common/header.jsp">
						<jsp:param value="<%=newPageContentUrl %>" name="newPageContentUrl"/>
						<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
					</jsp:include>
    				<jsp:include page="../common/body.jsp">
						<jsp:param value="<%=newPageContentUrl %>" name="newPageContentUrl"/>
						<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
					</jsp:include>
			</html:td>
			
			<!-- <html:value value="{$jsp.index.note.layout.right.padding#}"/> -->
    		<html:td id="global-layout-right-padding"  styleClass="index-global-layout-right-padding">
				<html:table styleClass="global-body-right-content" align="center" valign="top">
			    	<!--  <html:value value="{$jsp.index.note.layout.right.padding.top#}"/> -->
			    	<html:tr>
			    		<html:td id="global-layout-right-padding-top" styleClass="index-global-layout-right-padding-top">&nbsp;</html:td>
			    	</html:tr>
			    	<!-- <html:value value="{$jsp.index.note.layout.right.padding.middle#}"/>  -->
			    	<html:tr>
			    		<html:td id="global-layout-right-padding-middle"  styleClass="index-global-layout-right-padding-middle">&nbsp;</html:td>
			    	</html:tr>
			    	<!-- <html:value value="{$jsp.index.note.layout.right.padding.bottom#}"/> -->			    		
			    	<html:tr>
			    		<html:td id="global-layout-right-padding-bottom" styleClass="index-global-layout-right-padding-bottom">&nbsp;</html:td>
			    	</html:tr> 
			    </html:table>
			</html:td>
    	</html:tr> 
  </html:table>
 
  	<jsp:include page="../common/footer.jsp">
		<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
  	</jsp:include>
		
   <html:div id="headerSurfaceBackground" styleClass="headerSurfaceBackground">&nbsp;</html:div>
  
  </body>
   <%//}else{ %>
   <%//=indexPageContent %>
   <%//} %>
</html>

