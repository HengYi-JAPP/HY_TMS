<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.plugins.service.ServiceBean"%>
<%@page import="com.mobilecn.plugins.service.ServiceListBean"%>
<%@page import="com.mobilecn.plugins.service.invoke.ServiceDatasBean"%>
<%@page import="com.mobilecn.plugins.service.invoke.ServiceDataItemBean"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%
ColumnBean columnBean = (ColumnBean)request.getAttribute("columnBean");
if(columnBean==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.columnt.config"));
	columnBean = new ColumnBean();
}

ServiceBean serviceBean = (ServiceBean)request.getAttribute("serviceBean");
if(serviceBean==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.config.no1"));
	return;
}
//boolean isShowCaption = serviceBean.getIsShowTitle()==null?false:"".equalsIgnoreCase(serviceBean.getIsShowTitle().trim());

Map<String,List<ServiceListBean>> serviceListMap =(Map<String,List<ServiceListBean>>)request.getAttribute("serviceListMap");
if(serviceListMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.config.no1"));
	return;
}
List<ServiceListBean>  serviceList =  serviceListMap.get(serviceBean.getServiceId());
if(serviceList==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.config.no3"));
	return;
}
Map<String,List<ServiceDatasBean>> serviceDatasMap =(Map<String,List<ServiceDatasBean>>)request.getAttribute("serviceDatasMap");
if(serviceDatasMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.result.no1"));
	return;
}

List<ServiceDatasBean> serviceDatas = serviceDatasMap.get(serviceBean.getServiceId());
if(serviceDatas==null){
	
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.result.null"));
	return;
}

ServiceListBean listBean = null;
 %>

 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
 	<%  
 		int size=serviceDatas.size();
 		int showNum=serviceBean.getShowNum();
 		ServiceDatasBean dataBean = null;
		ServiceDataItemBean itemBean=null;
			
 		for(int i=0,isize=serviceList.size();i<isize;i++){
 			listBean = serviceList.get(i);
 	%>
	 <tr  class="omit">
	 	<%if(serviceBean.getIsShowTitle()==1){ %>
	 	<td  class="titleStyle"><%=listBean.getTitle()%></t>
	 	<%}%>
	 	<%
	 	for(int j=0;j<size&&j<showNum;j++){
   		  	dataBean = serviceDatas.get(j);
   		  	itemBean =dataBean.getDataItem(listBean.getVarName());
   		  	//itemBean =portletUtil.getDataItem(vars[i],j);
   		  	//if(itemBean==null)continue;
	 	%>
	 	<%if(itemBean!=null){ %>
	 	<td title="<%=itemBean.getAlt() %>" class="contentTdStyle" style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>"><%if(listBean.getIsView()==1){ %><a href="<%=dataBean.getDetailLink() %>" target="<%=listBean.getTarget() %>" style="padding-left:5px;"><%=itemBean.getValue() %></a><%}else{ %><%=itemBean.getValue()%><%} %></td>	
	 	<%}else{ %>
	 	<td class="contentTdStyle">&nbsp;</td>	
	 	<%} %>
	 	<%
	 	}
	 	%>	 	
	 </tr>
 	<% 
 		}
 	%>
 </table>
 
 <!-- 显示更多链接 -->
	<%if(!"".equals(columnBean.getMoreLink().trim())){%>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<tr><td width="100%" align="right" style="padding-right: 20px;color:#0099FF;"> <a href="<%=columnBean.getMoreLink()%>" target="_blank"  style="color:#0099FF;">更多</a></td></tr>
	</table>
	<%}%>