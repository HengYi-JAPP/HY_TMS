<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeBean"%>
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
1）serviceCofing 查询配置
2）listConfig显示列表配置
3）outputData查询返回数据
4）columnBean栏目配置
 -->
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
			int showNum=queryBean.getShowNum();
			SQLQueryDatasBean dataBean = null;
			SQLQueryDataItemBean itemBean=null,tempBean;
			
			String infoIdName = null,infoIdValue=null,infoIdColumn=null,queryId;
			queryId =queryBean.getQueryId();
			infoIdName = infoIdsMap.get(queryId);
			infoIdColumn = idColumnsMap.get(queryId);
			for(int i=0,size=sqlqueryDatas.size();i<size&&i<showNum;i++){
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
	<!-- 显示更多链接 -->
	<%
	InfoTypeBean typeBean =(InfoTypeBean) request.getAttribute("typeBean");;
	if(typeBean!=null){
		String listLink=typeBean.getListLink();
		listLink= listLink==null?"#":listLink;
		listLink = tools.tool.fillParams(listLink,request);
	%>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<tr><td width="100%" align="right" style="padding-right: 20px;color:#0099FF;"> <a href="<%=listLink%>" target="_blank"  style="color:#0099FF;">更多</a></td></tr>
	</table>
	<%}%>