<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.layout.LayoutBean"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="consts.PropKey"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<ColumnBean> layoutColumn = (List<ColumnBean>)request.getAttribute("layoutColumn");
layoutColumn = layoutColumn==null?new ArrayList<ColumnBean>(0):layoutColumn;
String currentSysCode=  request.getParameter("currentSysCode");
String channelId =  request.getParameter("channelId");
String sysId =  request.getParameter("sysId");
String layoutId = request.getParameter("layoutId");
String unitId = request.getParameter("unitId");
String isDirect =  request.getParameter("isDirect");
//unitId=unitId==null||"".equals(unitId.trim())?"__layoutSandBox_SystemColumn":unitId;
//String is4Designer =(String) request.getSession().getAttribute("is4Designer");
//is4Designer = is4Designer==null?"false":is4Designer.trim();
boolean haveColumn= false;
if(layoutColumn!=null&&layoutColumn.size()>0){
	tools.tool.sortList(layoutColumn,"defaultOrder",false);
	ColumnBean columnBean = null;
		for(int i =0,size=layoutColumn.size();i<size;i++){   			
			columnBean=layoutColumn.get(i);
			if(!columnBean.getUnitId().equals(unitId))continue;
			haveColumn= true;
			
			request.setAttribute("unitColumnBean",columnBean);
%>    
		<jsp:include page="columnLoader.jsp">
			<jsp:param value="<%=sysId %>" name="sysId"/>
			<jsp:param value="<%=channelId %>" name="channelId"/>
			<jsp:param value="<%=layoutId %>" name="layoutId"/>
			<jsp:param value="<%=unitId %>" name="unitId"/>
			<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
			<jsp:param value="<%=isDirect %>" name="isDirect"/>
		</jsp:include>
<%	   		
	
   	}//for
}

if(haveColumn==false){//if(portletList!=null)
%> 
<script type="text/javascript">
		  LayoutDesigner.layout.addUnit("<%=unitId %>");
</script>
<%}%>