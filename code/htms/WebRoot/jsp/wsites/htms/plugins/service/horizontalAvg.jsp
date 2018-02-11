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
<!-- horizontalAvg -->
  <%
	int showNum = serviceBean.getShowNum();
 	int colNum = serviceBean.getTitleRowNum();
 	colNum = colNum<1?1:colNum; 	
 	int colSize = serviceList.size();
 	int rowStep = colSize/colNum;
 	rowStep = colSize%colNum==0?rowStep:rowStep+1;
 	int nextStop = 0,nextStart=0;
 	int size=serviceDatas.size();
 	int index = 0;
 	ServiceDatasBean dataBean = null;
	ServiceDataItemBean itemBean=null;
 %>
 
 	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
 	
 	
 <%//对属性列进行按行分组，按组进行循环，每一组是一个完整的小表格
 		for(int row = 0;row<rowStep;row++){
 			
 			for(int col=0;col<colNum;col++){
 			
 			}//for colNum
%>		
	  <!-------------- 显示表格标题 -------------->	
 		<%
 		if(serviceBean.getIsShowTitle()==1){ 
 		%>
  		<tr>
  		 	<%for(int col=0;col<colNum;col++){
   		   		index=row*colNum+col;
   		   		if(index<colSize){
   		   		listBean = serviceList.get(index);
   		   	%>
				<td  class="titleStyle" style="width:<%=listBean.getWidth()%>"><%=listBean.getTitle() %></td>
			<%}else{%>
				<td  class="titleStyle">&nbsp;</td><!-- 补足空标题，否表格不完成 -->
			<%
				}//if(index<colSize)
	   		 }//for
		    %>	    	
		 </tr>
		<%
		}//IsShowTitle()==1 
		%> 
		
		<!-------------- 显示表格内容 -------------->	
		<%
			
			for(int i=0;i<size&&i<showNum;i++){
   		  		dataBean = serviceDatas.get(i);
		%>
		 <tr  class="omit">
		 <% for(int col=0;col<colNum;col++){
   		   		index=row*colNum+col;
   		   		if(index<colSize){
   		   			listBean = serviceList.get(index);
   		   			itemBean =dataBean.getDataItem(listBean.getVarName());
   		   		}else{
   		   			listBean = null;
   		   			itemBean= null;
   		   		}
		 %>
			 <%if(listBean!=null&&itemBean!=null){ %>
				 <td title="<%=itemBean.getValue() %>" class="contentTdStyle" style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>">
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
		 	<%	}//else 
		 	}//for
		 %>
		 </tr>
		<%
			}//for 
		 }//for col
		%>
	</table>
<!-- 显示更多链接 -->
	<%if(!"".equals(columnBean.getMoreLink().trim())){%>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<tr><td width="100%" align="right" style="padding-right: 20px;color:#0099FF;"> <a href="<%=columnBean.getMoreLink()%>" target="_blank"  style="color:#0099FF;">更多</a></td></tr>
	</table>
	<%}%>