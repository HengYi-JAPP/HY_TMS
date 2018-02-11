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
<!-- verticalAvg -->
<%//对属性行进行按列分组，先按组平均行进行循环，再按行中列组进行循环，最后按列组中的列进行循环，每一列组是一个完整的小表格，每一行组由是多个列组小表格组成的表格
	int showNum = serviceBean.getShowNum();
 	int rowNum = serviceBean.getTitleColNum();
 	rowNum = rowNum<1?1:rowNum; 
 	int colSize = serviceList.size();	
 	int colStep = colSize/rowNum;
 	colStep = colSize%rowNum==0?colStep:colStep+1;
 	int index = 0;
 	int size=serviceDatas.size();
 	
 	ServiceDatasBean dataBean = null;
	ServiceDataItemBean itemBean=null;
 %>
 
 	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
 		<%
 		for(int row = 0;row<rowNum;row++){
 		%>
 		<tr><!-- 先显示行,再按列 -->
		<% 
		for(int col = 0;col<colStep;col++){
			index= col*rowNum+row;
			if(index<colSize){
				listBean = serviceList.get(index);
			}else{
				listBean=null;
			}
		%>
			<%if(serviceBean.getIsShowTitle()==1){ %>
				<%if(listBean!=null){ %>
				<td class="titleStyle"><%=listBean.getTitle() %></td>
				<%}else{ %>
				<td class="titleStyle">&nbsp;</td>
				<%}//if else %>
			<%} %>
		
		<% 	
		
		for(int i=0;i<size&&i<showNum;i++){
   		  	dataBean = serviceDatas.get(i);
   		  	if(listBean!=null){
 				itemBean =dataBean.getDataItem(listBean.getVarName());
   		  	}
		%>
			<%if(listBean!=null&&itemBean!=null){ %>
			<td title="<%=itemBean.getValue() %>" class="contentTdStyle"  style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>">
				<%if(listBean.getIsView()==1){ %>
	 			<a href="<%=dataBean==null?"":dataBean.getDetailLink() %>" target="<%=listBean.getTarget() %>" style="padding-left:5px;">
	 				<%=itemBean.getValue() %>
	 			</a>
		 		<%}else{ %>
		 			<%=itemBean.getValue()%>
		 		<%} %>
			</td>	
			<%}else{ %>
			<td class="contentTdStyle">&nbsp;</td>		
			<%}//if else %>
		<%} %>
		<% 
		}//for rowNum
		%>
 		</tr>
 		<%
 		}//for row
 		%>	 		
	</table>

 