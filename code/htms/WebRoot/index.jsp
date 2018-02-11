<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String indexPath = "jsp/index.jsp";
indexPath=tools.tool.fillParams(indexPath,request);
indexPath=basePath+indexPath;
try{
if(indexPath.indexOf("$[sysCode]")!=-1||indexPath.indexOf("//")!=-1){
	out.print("You have not specify target system,or specify target system not exist!");
}
response.sendRedirect(indexPath);
}catch(Exception ex){
	ex.printStackTrace();
	return;
}
%>