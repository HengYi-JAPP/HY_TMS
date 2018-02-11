<%@ page language="java" import="com.zzy.htms.sap.rfc.server.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%!
protected void forward(HttpServletRequest request,HttpServletResponse response,String relativeUrl){
		RequestDispatcher dispatcher = request.getRequestDispatcher(relativeUrl);
		try {
			dispatcher.forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
				return;
		}
		
}
 %>
<%
//request.setAttribute("userId","1");

try {
		SapServerService.stopServer();
		request.setAttribute("SERVER_MNG_MESSAGE","服务正常停止。");
} catch (Exception e) {
	e.printStackTrace();
	request.setAttribute("SERVER_MNG_MESSAGE","服务已在停止状态。");
	forward( request, response,"manage.jsp");
	return;
}
forward( request, response,"manage.jsp");
%>