<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryListBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryDatasBean"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryDataItemBean"%>
<%@page import="consts.PropKey"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%
RequestHelper helper = new RequestHelper(request);
String basePath = helper.getBasePath();

%>
<info:sqlquery type="list" operation="listWebSiteSQLQueryList" cacheScope="request" columnBeanCacheName="columnBean" sqlqueryConfigCacheName="sqlqueryConfigList"  sqlqueryListCacheName="sqlqueryListMap" sqlqueryDatasCacheName="sqlqueryDatasMap" pageCtlCacheName="pageCtl" infoIdCacheName="infoIds" idColumnNameCacheName="idColumns"/>
<html>
	<head>
		
		<base href="<%=basePath%>">
	</head>
	<body>
<%
ColumnBean columnBean = (ColumnBean)request.getAttribute("columnBean");
if(columnBean==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.service.no.columnt.config"));
	columnBean = new ColumnBean();
}


List<SQLQueryBean> sqlqueryConfigList = (List<SQLQueryBean>)request.getAttribute("sqlqueryConfigList");
//SQLQueryBean queryBean = (SQLQueryBean)request.getAttribute("sqlqueryBean");
if(sqlqueryConfigList==null||sqlqueryConfigList.size()<1){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no1"));
	return;
}
//boolean isShowCaption = queryBean.getIsShowTitle()==null?false:"".equalsIgnoreCase(queryBean.getIsShowTitle().trim());

Map<String,List<SQLQueryListBean>> sqlqueryListMap =(Map<String,List<SQLQueryListBean>>)request.getAttribute("sqlqueryListMap");
if(sqlqueryListMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no2"));
	return;
}

Map<String,String> infoIdsMap =(Map<String,String>)request.getAttribute("infoIds");
if(infoIdsMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no4"));
	infoIdsMap = new HashMap<String,String>();
}
Map<String,String> idColumnsMap =(Map<String,String>)request.getAttribute("idColumns");
if(idColumnsMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no6"));
	idColumnsMap = new HashMap<String,String>();
}


Map<String,List<SQLQueryDatasBean>> sqlqueryDatasMap =(Map<String,List<SQLQueryDatasBean>>)request.getAttribute("sqlqueryDatasMap");
if(sqlqueryDatasMap==null){
	out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.result"));
	return;
}
List<SQLQueryListBean>  serviceList = null;
List<SQLQueryDatasBean> sqlqueryDatas = null;
SQLQueryListBean listBean = null;

%>

<!-- 
1）serviceCofing 查询配置
2）listConfig显示列表配置
3）outputData查询返回数据
4）columnBean栏目配置
 -->
<%
	SQLQueryBean queryBean = null;
	String infoIdName = null,infoIdValue=null,infoIdColumn=null,queryId;
	for(int n=0,nsize=sqlqueryConfigList.size();n<nsize&&n<1;n++){
		queryBean = sqlqueryConfigList.get(n);
		if(queryBean==null){
			out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no1"));
			continue;
		}
		queryId =queryBean.getQueryId();
		infoIdName = infoIdsMap.get(queryId);
		infoIdColumn = idColumnsMap.get(queryId);
		
		serviceList =  sqlqueryListMap.get(queryId);
		if(serviceList==null){
			out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.config.no3"));
			continue;
		}
		
		sqlqueryDatas = sqlqueryDatasMap.get(queryId);
		if(sqlqueryDatas==null){
			out.print(tools.tool.getLocal("mydbc.system.portal.website.plugin.sqlquery.no.result"));
			continue;
		}
 %>
 <html:form id="queryListForm" name="queryListForm" method="post" action="contoller.do">
 <html:hidden name="operation" id="operation" value="listWebSiteSQLQueryList"/>
<html:hidden name="columnId" id="columnId" value="columnId"/>
<html:hidden name="queryId" id="queryId" value="queryId"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<!-- 显示标题 -->
 		<%
 		if(queryBean.getIsShowTitle()==1){
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
			
			SQLQueryDatasBean dataBean = null;
			SQLQueryDataItemBean itemBean=null,tempBean;
			for(int i=0,size=sqlqueryDatas.size();i<size;i++){
   		  		dataBean = sqlqueryDatas.get(i);
		%>
		 <tr  class="omit">
		 <% 
 		for(int j=0,jsize=serviceList.size();j<jsize;j++){
 			listBean = serviceList.get(j);
 			itemBean =dataBean.getDataItem(listBean.getVarName());
 			tempBean= dataBean.getDataItem(infoIdColumn); 
 			infoIdValue  = tempBean!=null?tempBean.getValue():infoIdValue;
		 %>
		 	<%if(itemBean!=null){ %>
		 	<td title="<%=itemBean.getValue() %>" class="contentTdStyle" style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>" >
		 		<%if(listBean.getIsView()==1){ %>
		 			<a href="<%=basePath%>jsp/portal/website/plugins/sqlquery/view.jsp?columnId=<%=columnBean.getColumnId() %>&queryId=<%=queryId%>&<%=infoIdName %>=<%=infoIdValue %>" target="<%=listBean.getTarget() %>" style="padding-left:5px;">
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
	<com:page formId="queryListForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
</html:form>
	<%}%>
	</body>
</html>