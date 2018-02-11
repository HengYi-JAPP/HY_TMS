<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="consts.SysConsts" %>
<%@ include file="common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String forwardPath =request.getScheme()+"://"+request.getServerName()+"";
 %>

<%
request.removeAttribute(SysConsts.ACCOUNT);
request.getSession().removeAttribute(SysConsts.ACCOUNT);
request.getSession().invalidate();
%>
<script>
function reload(){
   var url="<%=basePath %>"+"jsp/login.jsp";
   // alert(url);
	window.location.href=url; 
}
//3秒后自动跳转到登录页面
window.setTimeout(reload,1); 
</script>