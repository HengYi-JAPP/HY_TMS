<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

String SERVER_MNG_MESSAGE =(String)request.getAttribute("SERVER_MNG_MESSAGE");
SERVER_MNG_MESSAGE= SERVER_MNG_MESSAGE==null?"请通过下面按钮进行操作。":SERVER_MNG_MESSAGE.trim();
 %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<script type="text/javascript">
<!--
function setAction(type){
var formAction = "";
if(type=="start"){
	formAction="<%=basePath%>jsp/htms/server/startServer.jsp"
}
if(type=="stop"){
	formAction="<%=basePath%>jsp/htms/server/stopServer.jsp";
}

document.getElementById("jcoServer").action=formAction;
document.getElementById("jcoServer").submit();
}
//-->
</script>
<html:form id="jcoServer"    action="startServer.jsp"  method="POST" >
	<com:loader  simplendar="true"  />
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='JCO Sever管理' name="title"/>
	</jsp:include>
	
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
			<%=SERVER_MNG_MESSAGE %>
			</html:td>
		</html:tr>
		<html:tr >
			<html:td height="28px">
			
			</html:td>
		</html:tr>
		<html:tr >
			<html:td >
			<btn:exportdossier href="javascript:void(0);" onclick="setAction('start');" name="启动" value="启动"/>
			
			<btn:lastone href="javascript:void(0);" onclick="setAction('stop');"  name="停止" value="停止"/>
			</html:td>
		</html:tr>
	</html:table>


</html:form>
