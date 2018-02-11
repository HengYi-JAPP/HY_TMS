<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tools.tool"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%@page import="com.mobilecn.common.log.LogBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
RequestHelper helper = new RequestHelper(request);
LogBean loginLogInfo = (LogBean)helper.getValueFromAllScopes("loginLogInfo");
String logTime=loginLogInfo!=null?loginLogInfo.getLogTime():tools.tool.getDate();

logTime=tools.tool.DateUtil.getEnglishDate(logTime,"dd-MMMM-yyyy",true);

%>
<style>
<!--
.my-access-record{background:#fff;font: 12px/1.5 Arial,Simsun,\588b\4f53;}
.message-user{color:#333333; font-size: 12px;}
.my-access-record td{padding:10px;}
-->
</style>
<body style="background:#fff;height:269xp;">
<html:table styleClass="my-access-record">
	<html:tr>
		<html:td>
			<logic:if isNull="$[userBean.photo]">
				<html:img src="../images/headpic.png"></html:img>
			</logic:if>
			<logic:if notNull="$[userBean.photo]">
				<html:img src="$[userBean.photo]"></html:img>
			</logic:if>
		</html:td>
		<html:td>
			<div class="message-user">
				<p><html:value value="{$website.jsp.specify.accessrecord.hello#}"/> <html:value value="$[userName]"></html:value>!</p>
				<p><html:value value="{$website.jsp.specify.accessrecord.logintip#}"/> <html:value value="$[loginCount]"/><html:value value="{$website.jsp.specify.accessrecord.logintime#}"/></p>
			</div>
		</html:td>
	</html:tr>
	<html:tr>
		<html:td colspan="2"  styleClass="message-user">
			<p class="mt10"> <html:value value="{$website.jsp.specify.accessrecord.currentaddress#}"/> <html:value value="$[logIp]"/></p>
			<p><html:value value="{$website.jsp.specify.accessrecord.lastlogintime#}"/> <%=logTime%></p>
			<p><html:value value="{$website.jsp.specify.accessrecord.lastloginaddress#}"/>  <html:value value="$[loginLogInfo.logIp]"/></p>
		</html:td>
	</html:tr>
</html:table>
</body>
