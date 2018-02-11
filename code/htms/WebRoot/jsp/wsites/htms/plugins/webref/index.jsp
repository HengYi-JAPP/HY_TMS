<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tools.tool"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%
RequestHelper helper = new RequestHelper(request);
ColumnBean columnBean = (ColumnBean)helper.getValueFromAllScopes("columnBean");
//System.out.println("columnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBean:"+columnBean);
int height=columnBean.getContentHeight();
String contentHeight=height>0?height+"px":"100%";

int width=columnBean.getContentWidth();
String contentWidth=width>0?width+"px":"100%";
String style="width:"+contentWidth+";height:"+contentHeight+";";
%>
<!-- 内容是否要考虑加载方式：jsp include ,iframe, async load -->
<info:webRef operation="listWebSiteWebRefIndex"  cacheName="webRefViewBean_$[columnId]"/>


<html:iframe src="$[webRefViewBean_$[columnId].refLink]" width="<%=contentWidth %>" height="<%=contentHeight %>" style="<%=style %>" onload="" scrolling="no" marginWidth="0" marginHeight="0"  frameBorder="0" vSpace="0" hSpace="0" allowTransparency="true" ></html:iframe>

