<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/impart/common.jsp"%>
<%
String invokeMessage=(String) request.getAttribute("INVOKE_MESSAGE");
 invokeMessage=invokeMessage==null?"":invokeMessage;
%>

<script type="text/javascript">

var invokeMessage="<%=invokeMessage %>" ;
if(invokeMessage!=null&&invokeMessage!=""){
   // alert(invokeMessage);
   alertTip(invokeMessage);
}
</script>

