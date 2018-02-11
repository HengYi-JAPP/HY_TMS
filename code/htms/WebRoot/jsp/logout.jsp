<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="consts.SysConsts" %>
<%@ include file="common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String forwardPath =request.getScheme()+"://"+request.getServerName()+"";
 %>

<html:form id="logoutForm" action="<%=forwardPath %>" >
<html:iframe src="http://cas.hengyi.com:8080/logout" style="display:none;" onload="reload()"></html:iframe>
</html:form>
<%
request.removeAttribute(SysConsts.ACCOUNT);
request.getSession().removeAttribute(SysConsts.ACCOUNT);
request.getSession().invalidate();
%>
<script>
function reload(){
	document.getElementById("logoutForm").submit();
}
//3秒后自动跳转到登录页面
window.setTimeout(reload,3000); 
</script>