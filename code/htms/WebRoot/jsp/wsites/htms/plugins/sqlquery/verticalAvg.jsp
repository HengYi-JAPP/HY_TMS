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
<!-- verticalAvg -->
 <%//对属性行进行按列分组，先按组平均行进行循环，再按行中列组进行循环，最后按列组中的列进行循环，每一列组是一个完整的小表格，每一行组由是多个列组小表格组成的表格
	int showNum = queryBean.getShowNum();
 	int rowNum = queryBean.getTitleColNum();
 	rowNum = rowNum<1?1:rowNum; 
 	int colSize = serviceList.size();	
 	int colStep = colSize/rowNum;
 	colStep = colSize%rowNum==0?colStep:colStep+1;
 	int index = 0;
 	int size=sqlqueryDatas.size();
 	
 	SQLQueryDatasBean dataBean = null;
	SQLQueryDataItemBean itemBean=null,tempBean;
			
	String infoIdName = null,infoIdValue=null,infoIdColumn=null,queryId;
	queryId =queryBean.getQueryId();
	infoIdName = infoIdsMap.get(queryId);
	infoIdColumn = idColumnsMap.get(queryId);
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
			<%if(queryBean.getIsShowTitle()==1){ %>
				<%if(listBean!=null){ %>
				<td class="titleStyle"><%=listBean.getTitle() %></td>
				<%}else{ %>
				<td class="titleStyle">&nbsp;</td>
				<%}//if else %>
			<%} %>
		
		<% 	
		
		for(int i=0;i<size&&i<showNum;i++){
   		  	dataBean = sqlqueryDatas.get(i);
   		  	if(listBean!=null){
 				itemBean =dataBean.getDataItem(listBean.getVarName());
 				
 				tempBean= dataBean.getDataItem(infoIdColumn); 
 				infoIdValue  = tempBean!=null?tempBean.getValue():infoIdValue;
   		  	}
		%>
			<%if(listBean!=null&&itemBean!=null){ %>
			<td title="<%=itemBean.getValue() %>" class="contentTdStyle"  style="text-align:<%=listBean.getAlign()%>;width:<%=listBean.getWidth()%>">
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

 <!-- 显示更多链接 -->
	<%if(!"".equals(columnBean.getMoreLink().trim())){%>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table-layout">
	<tr><td width="100%" align="right" style="padding-right: 20px;color:#0099FF;"> <a href="<%=columnBean.getMoreLink()%>" target="_blank"  style="color:#0099FF;">更多</a></td></tr>
	</table>
	<%}%>
 