<%@ page language="java" import="java.util.*,com.mobilecn.common.login.LoginBusiness" pageEncoding="UTF-8"%>
<%@ include file="common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(LoginBusiness.isUserLogin(request)==false){
	try{
		response.sendRedirect("login.jsp");
	}catch(Exception ex){
		ex.printStackTrace();
		return;
	}
}else{
%>
<portal:system  systemList="true" currentSystem="true"  scope="session" /> 
<%

/*
先判断用户是否已经登录，如果已经登录，则跳转到系统默认选择的系统；
*/

String currentSysId = (String)request.getAttribute("__systemId");
String indexPath = "jsp/wsites/$[sysCode]/index.jsp?currentSysId=$[__systemId]";
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
}
%>


