<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.location.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
List<User> wxUserViewList = (List<User>)request.getAttribute("wxUserViewList");
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="wxUserFrom"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='查看微信用户管理' name="title"/>
	</jsp:include>
	<table>
		<tr class="trCell">
		</tr>
	</table>
	<html:table styleClass="edit-talbe">
		<%	User user = null;
		if(wxUserViewList!=null&&!wxUserViewList.isEmpty()){
			if(wxUserViewList.size()>0){
			user = (User)wxUserViewList.get(0);
		%>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="用户昵称" ></html:label>
			</html:td >
			<html:td width="35%">
				<html:value value="<%=user.getNickName() %>"></html:value>
			</html:td>
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="车队信息" ></html:label>
			</html:td >
			<html:td>
				<html:value value="<%=user.getCarrierName()%>"></html:value>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="司机名称" ></html:label>
			</html:td >
			<html:td>
				<html:value value="<%=user.getAssociateDriverName()%>"></html:value>
			</html:td>
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="司机手机号" ></html:label>
			</html:td >
			<html:td>
				<html:value value="<%=user.getAssociateDriverMobile() %>"></html:value>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="司机身份证号" ></html:label>
			</html:td >
			<html:td colspan="3">
				<html:value value="<%=user.getAssociateDriverIdNum()%>"></html:value>
			</html:td>
		</html:tr>
		<%}%>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="车牌号" ></html:label>
			</html:td >
			<html:td colspan="3">
		<%for(int i=0;i<wxUserViewList.size();i++){
			user = (User)wxUserViewList.get(i);
		%>
				<html:value value="<%=user.getAssociateVehicleNo()%>"/><br/>
		<%} %>
			</html:td>
		</html:tr>
		<%} %>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr>
			<html:td >
				<btn:return href="contoller.do?operation=listWXUser"/>
			</html:td>
		</html:tr>
	</html:table>
	
</html:form>
