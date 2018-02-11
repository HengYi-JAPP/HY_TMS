<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryListBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryDatasBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryDataItemBean"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<info:sqlquery type="view" 
operation="listWebSiteSQLQueryList" 
cacheScope="request" 
columnBeanCacheName="columnBean" 
sqlqueryListCacheName="sqlqueryListMap" 
sqlqueryDatasCacheName="sqlqueryDatasMap" 
viewQueryBeanCacheName="viewQueryBean"
/>
<%
ColumnBean columnBean = (ColumnBean)request.getAttribute("columnBean");
if(columnBean==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.columnt.config"));
	columnBean = new ColumnBean();
}

SQLQueryBean queryBean = (SQLQueryBean)request.getAttribute("viewQueryBean");
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
1）serviceCofing 查询配置
2）listConfig显示列表配置
3）outputData查询返回数据
4）columnBean栏目配置
 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<!-- 显示标题 -->
 		
  		<tr>
  		 	
			<td class="titleStyle" width="30%" align="center"><%=tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.title") %></td>
			<td class="titleStyle" width="70%"  align="center"><%=tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.content") %></td>
		 </tr>
		<!-- 显示数据 -->
		<%
			int showNum=1;//只有一条数据显示
			SQLQueryDatasBean dataBean = null;
			SQLQueryDataItemBean itemBean=null;
			for(int i=0,size=sqlqueryDatas.size();i<size&&i<showNum;i++){
   		  		dataBean = sqlqueryDatas.get(i);
		%>
		
		 <% 
 		for(int j=0,jsize=serviceList.size();j<jsize;j++){
 			listBean = serviceList.get(j);
 			itemBean =dataBean.getDataItem(listBean.getVarName());
		 %>	
		 	 <tr  class="omit">
		   <td><%=listBean.getTitle() %></td>
		 	<%if(itemBean!=null){ %>
		 	<td><%=itemBean.getValue()%></td>	
		 	<%}else{ %>
		 	<td class="contentTdStyle">&nbsp;</td>	
		 	<%} %>
		 	 </tr>
		 <% 
		 }//for
		 %>
		
		<%
			}//for 
		%>
	</table>
	

	