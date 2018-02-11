<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="consts.SysConsts"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%
String newPageContentUrl = request.getParameter("newPageContentUrl");
System.out.println("newPageContentUrl="+newPageContentUrl);
String currentSysCode=  request.getParameter("currentSysCode");
String currentSysId =request.getParameter("currentSysId");
RequestHelper requestHelper = new RequestHelper(request);
String basePath = requestHelper.getBasePath();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<portal:themes skinType=""/>
	<portal:sysconf code="<%=SysConsts.SYSTEM_LOGO %>" refName="portalSystemLogo"/>
	<script src="<%=basePath %>js/portal/base64.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/portal/portal-loader.js" type="text/javascript"></script>
	<com:loader binder="true" ajax="true" myWin="true"/>
	<script type="text/javascript">
	 history.go(1);
	</script>
	</head>
<body>
<!-- 先加载系统，然后根据系统来加载样式 -->
<html:table styleClass="global-body-header">
   	<html:tr>
   		<!-- 内容体[页头部分][左部] -->
   		<html:td id="header-left" styleClass="global-body-header-left">
   				<!-- logo部分，建议做可以编辑的  -->
				<!-- html:img src="portalSystemLogo" border="0" width="248px" height="114px"/ -->	
   		</html:td>
   		<!-- 内容体[页头部分][中部] -->
   		<html:td id="header-middle"  styleClass="global-body-header-middle">
   			<html:table styleClass="global-body-header-middle-box">
   				<html:tr>
   					<html:td  styleClass="global-body-header-middle-box-top" style="vertical-align:middle">
   						<html:div styleClass="header-top-box">
   							<html:div styleClass="header-top-cell-box">
		   						<html:select id="sysId" name="sysId" styleClass="system-switcher-box"  list="<%=PropKey.__SYSTEM_LIST_TAG%>" > 
		   							<html:option label="sysName" value="sysId" selected="$[__systemId]"></html:option> 	
								</html:select>
							</html:div>
							<html:div styleClass="header-top-cell-box"><span >|&nbsp;</span><html:a href="#"><html:value value="{$website.jsp.specify.header.help#}"/></html:a></html:div>
							<html:div styleClass="header-top-cell-box"><span >|&nbsp;</span><html:a href="$[basePath]jsp/logout.jsp"><html:value value="{$website.jsp.specify.header.logout#}"/></html:a></html:div>
							<html:div styleClass="header-top-cell-box"><span >|&nbsp;</span><html:a href="$[basePath]contoller.do?operation=console_of_myportal" target="_blank"><html:value value="{$website.jsp.specify.header.console#}"/></html:a><span ></html:div>
	   						<html:div styleClass="header-top-cell-box"><a href="javascript:void(0);;"><html:value value="{$website.jsp.specify.header.wellcome#}"/><html:value value="$[userName]"></html:value>.</a></html:div>
   						</html:div>
					</html:td>
   				</html:tr>
   				<html:tr>
   					<html:td styleClass="global-body-header-middle-box-middle">
		   				<html:table styleClass="header-box" >
		   						<html:tr>	
			   						<html:td  styleClass="header-box-left" >
			   							<html:table styleClass="header-logo-box" >
			   								<html:tr>
			   									<html:td   styleClass="header-logo-box-logo">
			   										<html:div styleClass="header-logo"></html:div>
			   									</html:td>
			   									<html:td  styleClass="header-logo-box-name">
			   											<html:table styleClass="header-logo-box-name-box">
						   									<html:tr>
						   										<html:td styleClass="header-logo-box-name-box-name">
						   										<html:value value="{$website.jsp.specify.header.sitename.main#}"/>
						   										</html:td>
						   									</html:tr>
						   									<html:tr>
						   										<html:td styleClass="header-logo-box-name-box-desc">
						   										<html:value value="{$website.jsp.specify.header.sitename.sub#}"/>
						   										</html:td>
						   									</html:tr>
						   								</html:table>
			   									</html:td>
			   									<html:td  styleClass="header-logo-box-name-myportal">
																<html:value value="{$website.jsp.specify.header.myportal#}"/>
			   									</html:td>
			   								</html:tr>
			   							</html:table>
										
									</html:td>		   						
		   							
		   							<html:td  styleClass="header-box-middle" >&nbsp;　　　　　　　　　　　　　　　
		   							</html:td>
		   							<html:td styleClass="header-box-right">
			   						<style type="text/css">	
										.header-box-right-box{float:left;text-align:left;color:white;font: 12px/1.5 Arial,Simsun,\588b\4f53;}
										.header-box-right-box-search{}
										.header-box-right-box-keyword{}
										.searchInput{height: 28px;line-height: 28px;border: 2px solid #0296f0;width: 270px;border-radius: 15px;outline: none;padding: 0 15px;background: #fff;}
										.searchButton{background: url(<%=basePath %>jsp/wsites/<%=currentSysCode%>/images/icon.png) -2px -32px no-repeat;width: 16px;height: 16px;display: inline-block;    position: relative;right: 25px;top: 3px;margin-top: -2px;cursor: pointer;}
										.searchKeyword{color:white;font: 12px/1.5 Arial,Simsun,\588b\4f53;}
										.keyword{color:red;border-bottom:1px dotted green;}
									</style>
		   								<html:table  styleClass="header-box-right-box">
		   									<html:tr>
		   										<html:td styleClass="header-box-right-box-search">
		   											<html:form id="searchForm" name="searchForm" action="$[basePath]/jsp/wsites/$[currentSysCode]/loader/newPageLoader.jsp">		   											
		   											<html:hidden id="currentSysCode" name="currentSysCode"  value="$[currentSysCode]"/>
		   											<html:text id="keyword" name="keyword" styleClass="searchinput" value=""/>
		   											<html:a id="searchButton" href="javascript:void(0);" style="text-decoration:none;"  onclick="doKeywordSearch('keyword','$[currentSysCode]');" target="_blank"><html:div styleClass="searchButton" /></html:a>
		   											<html:hidden id="newPageContentUrl" name="newPageContentUrl" value=""/>
		   											</html:form>
												</html:td>
		   									</html:tr>
		   									<html:tr>
		   										<html:td  styleClass="header-box-right-box-keyword">
		   											<html:value value="{$website.jsp.specify.header.hotword#}"/> <html:a href="javascript:void(0);" styleClass="searchKeyword"><html:value value="{$website.jsp.specify.header.hotword001#}"/></html:a>, <html:a href="javascript:void(0);" styleClass="searchKeyword"><html:value value="{$website.jsp.specify.header.hotword002#}"/></html:a>, 
												</html:td>
		   									</html:tr>
		   								</html:table>
		   						</html:td>
		   						</html:tr>
		   				</html:table>
					</html:td>
   				</html:tr>
   			</html:table>
			
		</html:td>
   		<!-- 内容体[页头部分][右部] -->
   		<html:td id="header-right" styleClass="global-body-header-right">
   			
   		</html:td>
   	</html:tr>
	 <html:tr>
		<html:td styleClass="global-body-header-middle-box-bottom" colspan="3">
			<jsp:include page="banner.jsp">
			<jsp:param value="<%=newPageContentUrl %>" name="newPageContentUrl"/>
			<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
			<jsp:param value="<%=currentSysId %>" name="currentSysId"/>
			</jsp:include>
		</html:td>
	 </html:tr>
</html:table>
<com:ajax triggerEvent="onchange" triggerId="sysId" callBack="__systemReloader"  servlet="ajax/portal" implCalss="com.mobilecn.portal.updater.SystemUpdater">
	<html:param name="operation" value="updateSystem_of_commonSystem"/>
</com:ajax>
</body>
</html>