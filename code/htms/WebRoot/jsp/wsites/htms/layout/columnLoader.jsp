<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.layout.LayoutBean"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="consts.PropKey"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String currentSysCode=  request.getParameter("currentSysCode");
String channelId =  request.getParameter("channelId");
String sysId =  request.getParameter("sysId");
String layoutId = request.getParameter("layoutId");
String unitId = request.getParameter("unitId");
String isDirect =  request.getParameter("isDirect");
String columnId = null;

ColumnBean columnBean = (ColumnBean)request.getAttribute("unitColumnBean");
if(columnBean!=null){
columnId=columnBean.getColumnId();
%>    
		<table id="<%=columnId %>" style="width:100%;margin:0px 0px 8px 0px;border:0px;padding:0px;" cellSpacing="0">		  
		  <tr>
		  	 <%
		    if(columnBean.getUserDefine()==1){
		    		/*用户自定义的栏目，提供修改、删除功能*/
		    %>
		    	<td  bgcolor="#cccccc" onmousedown="LayoutDesigner.mover.startMove('<%=columnId %>');"><%=columnBean.getColumnName() %></td>
		 		<td  bgcolor="#cccccc" align="center"><a href="<%=basePath %>contoller.do?operation=view4UserDefineColumn&isModify=true&channelId=<%=channelId %>&layoutId=<%=layoutId %>&columnId=<%=columnId %>&sysId=<%=columnBean.getSysId() %>&currentSysCode=<%=currentSysCode %>&isDirect=<%=isDirect %>"><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.modify") %></a></td>
	   			<td  bgcolor="#cccccc"  align="center"><a href="<%=basePath %>contoller.do?operation=delete4UserDefineColumn&channelId=<%=channelId %>&layoutId=<%=layoutId %>&columnId=<%=columnId %>&sysId=<%=columnBean.getSysId() %>&currentSysCode=<%=currentSysCode %>&columnId=<%=columnId %>&sysId=<%=columnBean.getSysId() %>&isDirect=<%=isDirect %>"><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.delete") %></a></td>
		    <%}else{ %>
		    	<td  bgcolor="#cccccc" colspan="3" onmousedown="LayoutDesigner.mover.startMove('<%=columnId %>');"><%=columnBean.getColumnName() %></td>
		   <%} %>
		  </tr>
		    <tr>
		    <td><input  type="checkbox" id="<%=columnId %>_isShow" <%if(columnBean.getDefaultShow()==1){ %>checked="checked"<%} %> onclick="LayoutDesigner.layout.setPortletStatus('<%=columnId %>','show',this.checked?1:0);"/><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.show") %></td>
		    <td><input  type="checkbox" id="<%=columnId %>_isOpen" <%if(columnBean.getDefaultOpen()==1){ %>checked="checked"<%} %>  onclick="LayoutDesigner.layout.setPortletStatus('<%=columnId %>','open',this.checked?1:0);"/><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.open") %></td>
		     <td><input  type="checkbox" id="<%=columnId %>_isMove" <%if(columnBean.getDefaultMove()==1){ %>checked="checked"<%} %>  onclick="LayoutDesigner.layout.setPortletStatus('<%=columnId %>','move',this.checked?1:0);"/><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.move") %></td>
		  </tr>
		</table>
		<script type="text/javascript">
		  LayoutDesigner.layout.addPortlet("<%=unitId %>","<%=columnId %>","<%=columnBean.getColumnName() %>",<%=columnBean.getDefaultShow()%>,<%=columnBean.getDefaultOpen()%>, <%=columnBean.getDefaultMove()%>);
		</script>
		
<%
}
%> 