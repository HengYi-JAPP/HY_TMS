<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
<!--
.myEmailBox{background:#fff;font: 12px/1.5 Arial,Simsun,\588b\4f53;height:115px;}
.personicon {
    background: url(../images/icon.png) -57px -188px no-repeat;
    width: 11px;
    height: 13px;
    display: inline-block;
    float: left;
    margin-top: 2px;
    margin-right: 10px;
}
.mailicon {
    background: url(../images/icon.png) -79px -189px no-repeat;
    width: 17px;
    height: 12px;
    display: inline-block;
    float: left;
    margin-top: 2px;
}
.myEmailBox tr td{float:top;height:28px;line-height:28px;vertial-align:middle;text-align:left;    color: #333333;font-size: 12px;}

-->
</style>
<body style="margin:0px;border:0px;padding:0px;">
<html:table  styleClass="myEmailBox">
	<html:tr>
		<html:td>
			<html:span styleClass="personicon"></html:span>
		</html:td>
		<html:td styleClass="">
			<html:value value="{$website.jsp.specify.accessrecord.hello#}"/> <html:value value="$[userName]"></html:value>!
		</html:td>
	</html:tr>
	<html:tr>
		<html:td colspan="2" style="height:2px;border-bottom: 1px solid #e0e0e0;margin: 10px 0;">
		</html:td>
	</html:tr>
	<html:tr>
		<html:td>
			<html:span styleClass="mailicon"></html:span>
		</html:td>
		<html:td styleClass="">
			<html:value value="{$website.jsp.specify.email.info001#}"/><span style="color:#f68b00;">0</span><html:value value="{$website.jsp.specify.email.info003#}"/>
		</html:td>
	</html:tr>
	<html:tr>
		<html:td>
		</html:td>
		<html:td styleClass="">
			<html:value value="{$website.jsp.specify.email.info002#}"/><span style="color:#f68b00;">0</span>, <span style="color:#31a3e8;"><html:value value="{$website.jsp.specify.email.info004#}"/></span>
		</html:td>
	</html:tr>
	<html:tr>
		<html:td colspan="2" style="height:auto;">
		</html:td>
	</html:tr>
</html:table>
</body>

