

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
<!--
.my-access-record{background:#fff;font: 12px/1.5 Arial,Simsun,\588b\4f53;}
.message-user{color:#333333; font-size: 12px;}
.my-access-record td{padding:10px;}

.new-icon{
	background: url(<%=basePath%>jsp/wsites/htms/images/icon.png) -7px -189px;
	display: inline-block;
    width: 14px;
    height: 12px;
    margin-right: 5px;
    cursor: pointer;
    }
-->
</style>
<body style="margin:0px;border:0px;padding:0px;">
<html:table styleClass="$[columnCode]news-index-box"  isHead="false" style="float:top;vertical-align:top;height:265px;margin:0px;border:0px;padding:0px;">
	<html:tr style="vertical-align:top;float:top;height:28px;vertical-align:middle;">	
		<html:td styleClass=""  style="padding-left:10px;height:28px;vertical-align:middle;">
			<html:span styleClass="new-icon"/>
		</html:td>
		<html:td styleClass=""  style="height:28px;vertical-align:middle;">
		<html:a styleClass="" style="color:#333333;font:12px/1.5 Arial,Simsun,\588b\4f53;text-decoration: none;height:28px;vertical-align:middle;" href='javascript:void(0);' target="_blank">
			<html:value value="{$website.jsp.specify.toremain.info001#}"/> <span style="color:#31a3e8;;"><html:value value="{$website.jsp.specify.toremain.info002#}"/></span>
		</html:a>	
		</html:td>
	</html:tr>	
	<html:tr style="vertical-align:top;float:top;height:28px;vertical-align:middle;">	
		<html:td styleClass=""  style="padding-left:10px;height:28px;vertical-align:middle;">
			<html:span styleClass="new-icon"/>
		</html:td>
		<html:td styleClass=""  style="height:28px;vertical-align:middle;">
		<html:a styleClass="" style="color:#333333;font:12px/1.5 Arial,Simsun,\588b\4f53;text-decoration: none;height:28px;vertical-align:middle;" href='javascript:void(0);' target="_blank">
			<html:value value="{$website.jsp.specify.toremain.info003#}"/><span style="color:#f68b00;"><html:value value="{$website.jsp.specify.toremain.info005#}"/></span><html:value value="{$website.jsp.specify.toremain.info004#}"/> <span style="color:#31a3e8;;"><html:value value="{$website.jsp.specify.toremain.info002#}"/></span>
		</html:a>	
		</html:td>
	</html:tr>	
	<html:tr style="vertical-align:top;float:top;height:28px;vertical-align:middle;">	
		<html:td styleClass=""  style="padding-left:10px;height:28px;vertical-align:middle;">
			<html:span styleClass="new-icon"/>
		</html:td>
		<html:td styleClass=""  style="height:28px;vertical-align:middle;">
		<html:a styleClass="" style="color:#333333;font:12px/1.5 Arial,Simsun,\588b\4f53;text-decoration: none;height:28px;vertical-align:middle;" href='javascript:void(0);' target="_blank">
			<html:value value="{$website.jsp.specify.toremain.info006#}"/><span style="color:#f68b00;"><html:value value="{$website.jsp.specify.toremain.info007#}"/></span> <span style="color:#31a3e8;;"><html:value value="{$website.jsp.specify.toremain.info002#}"/></span>
		</html:a>	
		</html:td>
	</html:tr>	
	<html:tr style="vertical-align:top;float:top;height:28px;vertical-align:middle;">	
		<html:td styleClass=""  style="padding-left:10px;height:28px;vertical-align:middle;">
			<html:span styleClass="new-icon"/>
		</html:td>
		<html:td styleClass=""  style="height:28px;vertical-align:middle;">
		<html:a styleClass="" style="color:#333333;font:12px/1.5 Arial,Simsun,\588b\4f53;text-decoration: none;height:28px;vertical-align:middle;" href='javascript:void(0);' target="_blank">
			<html:value value="{$website.jsp.specify.toremain.info008#}"/><span style="color:#31a3e8;;" ><html:value value="{$website.jsp.specify.toremain.info002#}"/></span>
		</html:a>	
		</html:td>
	</html:tr>	
	<html:tr style="vertical-align:top;float:top;height:28px;vertical-align:middle;">	
		<html:td styleClass=""  style="padding-left:10px;height:28px;vertical-align:middle;">
			<html:span styleClass="new-icon"/>
		</html:td>
		<html:td styleClass=""  style="height:28px;vertical-align:middle;">
		<html:a styleClass="" style="color:#333333;font:12px/1.5 Arial,Simsun,\588b\4f53;text-decoration: none;height:28px;vertical-align:middle;" href='javascript:void(0);' target="_blank">
			<html:value value="{$website.jsp.specify.toremain.info003#}"/><span style="color:#f68b00;"><html:value value="{$website.jsp.specify.toremain.info005#}"/></span><html:value value="{$website.jsp.specify.toremain.info004#}"/> <span style="color:#31a3e8;;"><html:value value="{$website.jsp.specify.toremain.info002#}"/></span>
		</html:a>	
		</html:td>
	</html:tr>	
	<html:tr style="vertical-align:top;float:top;height:28px;vertical-align:middle;">	
		<html:td styleClass=""  style="padding-left:10px;height:28px;vertical-align:middle;">
			<html:span styleClass="new-icon"/>
		</html:td>
		<html:td styleClass=""  style="height:28px;vertical-align:middle;">
		<html:a styleClass="" style="color:#333333;font:12px/1.5 Arial,Simsun,\588b\4f53;text-decoration: none;height:28px;vertical-align:middle;" href='javascript:void(0);' target="_blank">
			<html:value value="{$website.jsp.specify.toremain.info006#}"/><span style="color:#f68b00;"><html:value value="{$website.jsp.specify.toremain.info007#}"/></span> <span style="color:#31a3e8;;"><html:value value="{$website.jsp.specify.toremain.info002#}"/></span>
		</html:a>	
		</html:td>
	</html:tr>
	<html:tr style="vertical-align:top;height:auto;">	
		<html:td style="height:auto;">
		</html:td>
		<html:td>
		
		</html:td>
	</html:tr>	
</html:table>
</body>
