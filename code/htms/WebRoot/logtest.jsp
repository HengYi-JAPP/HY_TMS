<%@ page language="java" import="com.zzy.htms.sap.rfc.server.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//request.setAttribute("userId","1");
SapServerService.startServer();
%>