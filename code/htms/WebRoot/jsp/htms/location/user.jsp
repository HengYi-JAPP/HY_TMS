<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<script type="text/javascript">

    function redirectToAuthrization(){
    	window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd9e6eb7cf2b4518a&redirect_uri=http%3a%2f%2fhtms.hengyi.com%2fhtms%2fWeChatIndexServlet&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
    }
     
</script>

<body  onload="redirectToAuthrization();">
	
	
</body>
</html>
