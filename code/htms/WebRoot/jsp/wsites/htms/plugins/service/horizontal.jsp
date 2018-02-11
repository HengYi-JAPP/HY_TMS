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

<!-- 
1）serviceCofing 服务配置
2）listConfig显示列表配置
3）outputData服务返回数据
4）columnBean栏目配置
 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<!-- 显示标题 -->
 		<%
 		if(serviceBean.getIsShowTitle()==1){
 		 %>
  		<tr>
  		 	<%
	   		 for(int i =0,size=serviceList.size();i<size;i++){
	   		 	listBean = serviceList.get(i);
			%>
			<td class="titleStyle"  style="width:<%=listBean.getWidth()%>"><%=listBean.getTitle() %></td>
			<%	
		   	}//for
		    %>
		 </tr>
		<%} %> 
		<!-- 显示数据 -->
		<%
			int showNum=serviceBean.getShowNum();
			ServiceDatasBean dataBean = null;
			ServiceDataItemBean itemBean=null;
			for(int i=0,size=serviceDatas.size();i<size&&i<showNum;i++){
   		  		dataBean = serviceDatas.get(i);
		%>
		 <tr  class="omit">
		 <% 
 		for(int j=0,jsize=serviceList.size();j<jsize;j++){
 			listBean = serviceList.get(j);
 			itemBean =dataBean.getDataItem(listBean.getVarName());
		 %>
		 	<%if(itemBean!=null){ %>
		 	<td title="<%=itemBean.getAlt() %>" class="contentTdStyle" style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>" >
		 		<%if(listBean.getIsView()==1){ %>
		 			<a href="<%=dataBean==null?"":dataBean.getDetailLink() %>" target="<%=listBean.getTarget() %>" style="padding-left:5px;">
		 				<%=itemBean.getValue() %>
		 			</a>
		 		<%}else{ %>
		 			<%=itemBean.getValue()%>
		 		<%} %>
		 		</td>	
		 	<%}else{ 
		 		//System.out.println("vars[j]="+vars[j]);
		 	%>
		 	<td class="contentTdStyle">&nbsp;</td>	
		 	<%} %>
		 <% 
		 }//for
		 %>
		 </tr>
		<%
			}//for 
		%>
	</table>
	<!-- 显示更多链接 -->
	<%if(!"".equals(columnBean.getMoreLink().trim())){%>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<tr><td width="100%" align="right" style="padding-right: 20px;color:#0099FF;"> <a href="<%=columnBean.getMoreLink()%>" target="_blank"  style="color:#0099FF;">更多</a></td></tr>
	</table>
	<%}%>