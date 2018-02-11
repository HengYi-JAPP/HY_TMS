<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ include file="../../common/impart/common.jsp"%>
<%@page import="com.mobilecn.utils.random.IntRandom" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
   String isSuccess=(String) request.getAttribute("ISSUCCESS");
   isSuccess=isSuccess==null?"":isSuccess;
   
   String  errorMessage=(String) request.getAttribute("ERROR_MESSAGE");
   errorMessage=errorMessage==null?"":errorMessage;
 %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="feeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyManagementFee"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<com:loader binder="true"  validator="true" />
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='管理费管理' name="title"/>
	</jsp:include>

	
	<html:table id="1628" styleClass="edit-talbe" >
		<html:tr styleClass="trCell" >
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				<html:label  label="管理费(元/吨)" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<html:text  id="managementFee"  name="managementFee"  value="$[feeBean.managementFee]" />
				<html:hidden id="feeIdSH" name="feeIdSH" value="$[feeBean.feeId]"/>
			</td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:void(0);" onclick="submitFee();"/>
				<btn:close href="javascript:void(0);" onclick="parent.__myWin.closeWebWindow('selectFeeWin')"/>
			</html:td>
		</html:tr>
	</html:table>
	<script>
	
	var result = "<%=isSuccess  %>";
	function submitFee(){
		javascript:submit('feeForm');
		//parent.__myWin.closeWebWindow('selectDriverWin');
		//parent.window.location.href="contoller.do?operation=listOwnCar";
	}
	
	//alert(result);
	if(result=="true"){
	    parent.__myWin.closeWebWindow('selectDriverWin');
		parent.window.location.href="contoller.do?operation=listOwnCar";
	}else{
	   alertTip(errorMessage);
	}
	</script>
	<com:validator formId="feeForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="managementFee"  types="isnull" event="onblur">
			<com:init size="20" maxlength="30" ></com:init>
		</com:vElement>
	</com:validator>	
</html:form>
