<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryListBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryDatasBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryDataItemBean"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%
RequestHelper helper = new RequestHelper(request);
String basePath = helper.getBasePath();

%>
<%
ColumnBean columnBean = (ColumnBean)request.getAttribute("columnBean");
if(columnBean==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.columnt.config"));
	columnBean = new ColumnBean();
}

SQLQueryBean queryBean = (SQLQueryBean)request.getAttribute("sqlqueryBean");
if(queryBean==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no1"));
	return;
}
//boolean isShowCaption = queryBean.getIsShowTitle()==null?false:"".equalsIgnoreCase(queryBean.getIsShowTitle().trim());

Map<String,List<SQLQueryListBean>> sqlqueryListMap =(Map<String,List<SQLQueryListBean>>)request.getAttribute("sqlqueryListMap");
if(sqlqueryListMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no2"));
	return;
}
List<SQLQueryListBean>  serviceList =  sqlqueryListMap.get(queryBean.getQueryId());
if(serviceList==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no3"));
	return;
}

Map<String,String> infoIdsMap =(Map<String,String>)request.getAttribute("infoIds");
if(infoIdsMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no4"));
	infoIdsMap = new HashMap<String,String>();
}
Map<String,String> idColumnsMap =(Map<String,String>)request.getAttribute("idColumns");
if(idColumnsMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no5"));
	idColumnsMap = new HashMap<String,String>();
}

Map<String,List<SQLQueryDatasBean>> sqlqueryDatasMap =(Map<String,List<SQLQueryDatasBean>>)request.getAttribute("sqlqueryDatasMap");
if(sqlqueryDatasMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no6"));
	return;
}

List<SQLQueryDatasBean> sqlqueryDatas = sqlqueryDatasMap.get(queryBean.getQueryId());
if(sqlqueryDatas==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.result"));
	return;
}

SQLQueryListBean listBean = null;

%>


<!-- 
1）serviceCofing 服务配置
2）listConfig显示列表配置
3）outputData服务返回数据
4）columnBean栏目配置
 -->
<!-- horizontalAvg -->
 <%
	int showNum = queryBean.getShowNum();
 	int colNum = queryBean.getTitleRowNum();
 	colNum = colNum<1?1:colNum; 	
 	int colSize = serviceList.size();
 	int rowStep = colSize/colNum;
 	rowStep = colSize%colNum==0?rowStep:rowStep+1;
 	int nextStop = 0,nextStart=0;
 	int size=sqlqueryDatas.size();
 	int index = 0;
 	SQLQueryDatasBean dataBean = null;
	SQLQueryDataItemBean itemBean=null,tempBean;
			
	String infoIdName = null,infoIdValue=null,infoIdColumn=null,queryId;
	queryId =queryBean.getQueryId();
	infoIdName = infoIdsMap.get(queryId);
	infoIdColumn = idColumnsMap.get(queryId);
 %>
 
 	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
 	
 	
 <%//对属性列进行按行分组，按组进行循环，每一组是一个完整的小表格
 		for(int row = 0;row<rowStep;row++){
 			
 			for(int col=0;col<colNum;col++){
 			
 			}//for colNum
%>		
	  <!-------------- 显示表格标题 -------------->	
 		<%
 		if(queryBean.getIsShowTitle()==1){ 
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
   		  		dataBean = sqlqueryDatas.get(i);
		%>
		 <tr  class="omit">
		 <% for(int col=0;col<colNum;col++){
   		   		index=row*colNum+col;
   		   		if(index<colSize){
   		   			listBean = serviceList.get(index);
   		   			itemBean =dataBean.getDataItem(listBean.getVarName());
   		   			
   		   			tempBean= dataBean.getDataItem(infoIdColumn); 
 					infoIdValue  = tempBean!=null?tempBean.getValue():infoIdValue;
   		   		}else{
   		   			listBean = null;
   		   			itemBean= null;
   		   		}
		 %>
			 <%if(listBean!=null&&itemBean!=null){ %>
				 <td title="<%=itemBean.getValue() %>" class="contentTdStyle" style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>">
				 	<%if(listBean.getIsView()==1){ %>
			 			<a href="<%=basePath%>jsp/portal/website/plugins/sqlquery/view.jsp?columnId=<%=columnBean.getColumnId() %>&queryId=<%=queryId%>&<%=infoIdName %>=<%=infoIdValue %>" target="<%=listBean.getTarget() %>" style="padding-left:5px;">
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