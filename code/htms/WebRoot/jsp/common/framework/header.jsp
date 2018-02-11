<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="com.mobilecn.privilege.user.UserBean,java.text.SimpleDateFormat,java.util.Date"  %>
<%@ page import="consts.*"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	//UserBean userBean = (UserBean)session.getAttribute(SysConsts.USER_BEAN);
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日 ");
	String strDate = formatter.format(date);
	String userName = (String)request.getSession().getAttribute("userName");
%>
 <script type="text/javascript">
 history.go(1);
　　</script>
<div class="header-warp">
<img style="width: 160px;height: 50px; position: absolute;left: 10px;" src="<%=basePath %>images/common/framework/logo.png" />
	<!--<div class="system-logo"><img width="240px" height="72px" src="<%=basePath %>images/common/framework/console-logo.jpg" /></div>
	--><!--<div class="system-logo"><img src="<%=basePath %>console/images/img/oa-logo.gif" /></div>
	<div class="login-info"><img src="<%=basePath %>console/images/img/user.gif" />欢迎您，<%//=userBean.getUserName() %>， <%=strDate %> </div>
	<ul class="operate-bar">
		<li ><img src="<%=basePath %>console/images/img/home.gif" /><a href="<%=basePath %>console/log2Portal.jsp" target="_self">我的门户</a></li>	
		<li ><img src="<%=basePath %>console/images/img/help.gif" /><a href="javascript:void(0);" target="_blank">帮助</a></li>
		<li ><img src="<%=basePath %>console/images/img/exit.gif" /><a href="<%=basePath%>/contoller.do?operation=logout">退出</a></li>
	</ul>	
-->
<ul class="operate-bar">
	<li><%=userName %></li>
	<%
	boolean defaultFetch = false;
	String customerCode = (String) request.getSession().getAttribute("user_customer_code");
	customerCode=customerCode==null?"":customerCode;
	
	//System.out.println(" customerCode  customerCode: "+customerCode);
	
	if(!customerCode.equals("")){
	   defaultFetch=true;  //是否自备车自提
	}
     if(defaultFetch){
     %>
     <li><a style="text-decoration:none;color:#fff;" href="<%=basePath%>/jsp/customerlogout.jsp"><img src="<%=basePath %>images/common/framework/logout.png">注销</a></li>
      <%
     }
     else{
     %>
     <li><a style="text-decoration:none;color:#fff;" href="<%=basePath%>/jsp/logout.jsp"><img src="<%=basePath %>images/common/framework/logout.png">注销</a></li>
	<li><a style="text-decoration:none;color:#fff;" href="<%=basePath%>jsp/privilege/user/changePassword.jsp"  target="mainContent" >修改密码</a></li>
     
     <%
     }
	 %>
	
</ul>
</div>


