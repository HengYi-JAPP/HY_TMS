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

 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
 	<%  
 		int size=sqlqueryDatas.size();
 		int showNum=queryBean.getShowNum();
 		SQLQueryDatasBean dataBean = null;
		SQLQueryDataItemBean itemBean=null,tempBean;
			
		String infoIdName = null,infoIdValue=null,infoIdColumn=null,queryId;
		queryId =queryBean.getQueryId();
		infoIdName = infoIdsMap.get(queryId);
		infoIdColumn = idColumnsMap.get(queryId);
			
 		for(int i=0,isize=serviceList.size();i<isize;i++){
 			listBean = serviceList.get(i);
 	%>
	 <tr  class="omit">
	 	<%if(queryBean.getIsShowTitle()==1){ %>
	 	<td  class="titleStyle"><%=listBean.getTitle()%></t>
	 	<%}%>
	 	<%
	 	for(int j=0;j<size&&j<showNum;j++){
   		  	dataBean = sqlqueryDatas.get(j);
   		  	itemBean =dataBean.getDataItem(listBean.getVarName());
   		  	//itemBean =portletUtil.getDataItem(vars[i],j);
   		  	//if(itemBean==null)continue;
   		  	tempBean= dataBean.getDataItem(infoIdColumn); 
 			infoIdValue  = tempBean!=null?tempBean.getValue():infoIdValue;
	 	%>
	 	<%if(itemBean!=null){ %>
	 	<td title="<%=itemBean.getValue() %>" class="contentTdStyle" style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>">
	 		<%if(listBean.getIsView()==1){ %>
	 		<a href="<%=basePath%>jsp/portal/website/plugins/sqlquery/view.jsp?columnId=<%=columnBean.getColumnId() %>&queryId=<%=queryId%>&<%=infoIdName %>=<%=infoIdValue %>" target="<%=listBean.getTarget() %>" style="padding-left:5px;"><%=itemBean.getValue() %></a>
	 		<%}else{ %>
	 		<%=itemBean.getValue()%><%} %>
	 	</td>	
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