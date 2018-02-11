<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%
RequestHelper helper = new RequestHelper(request);
ColumnBean columnBean = (ColumnBean)helper.getValueFromAllScopes("columnBean");
//System.out.println("columnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBean:"+columnBean);
int height=columnBean==null?0:columnBean.getContentHeight();
String contentHeight=height>0?height+"px":"";

int width=(columnBean==null?0:columnBean.getContentWidth());
String contentWidth=width>0?width+"px":"100%";
String style="border:0;margin:0 auto;over-flow:scroll;width:"+contentWidth+";height:"+contentHeight+";";
%>
<body style="margin:0px;border:0;padding:0;">
<!-- 内容是否要考虑加载方式：jsp include ,iframe, async load -->
<info:webPart operation="listWebSiteWebPartIndex"  />
<html:div  style="<%=style %>">
<html:value value="$[webPartViewBean.webContent]"></html:value>
<html:clean name="webPartViewBean" scope="request,session"/>
</html:div>
</body>