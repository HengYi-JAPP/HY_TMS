<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<%@page import="com.zzy.htms.user.HtmsUserBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Tranderitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
 
 List<FactoryBean>  factoryList=FactoryRepository.getFactoryList();
request.setAttribute("factoryList",factoryList);
HtmsUserBean factoryNameBean = (HtmsUserBean)request.getAttribute("fetchPrivilegeViewBean");
String factoryName = factoryNameBean.getFactoryName();
String[] factoryNames = factoryName.split(",");
%>
<head><base href="<%=basePath%>"></head>

<com:loader  js="js/common/common.js,jsp/htms/logistic/fetchprivilege/fetchprivilege.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="fetchPrivilegeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	
	<html:hidden id="operation" name="operation" value="modifyFetchPrivilege"/>
	<html:hidden id="userId" name="userId" value="$[fetchPrivilegeViewBean.userId]"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='修改贸易商自提权限' name="title"/>
	</jsp:include>
	
	<html:table id="1647" styleClass="edit-talbe">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
			<html:label label="贸易商"></html:label>
			</html:td>
			<td colSpan="2" rowSpan="1">
				<html:value value="$[fetchPrivilegeViewBean.userName]"/>
			</td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="厂区" ></html:label>
			</html:td>
			<html:td width="36%">
			<%	if(factoryList!=null){
				FactoryBean factoryBean = null;
				String targetFactoryName = null;
				Boolean checked = false;
				for(int i=0;i<factoryList.size();i++){
					factoryBean = factoryList.get(i);
					for(int j=0;j<factoryNames.length;j++){
						targetFactoryName = factoryNames[j];
						if(factoryBean.getFactoryName().equals(targetFactoryName)){
							checked = true;
							break;
						}else{
							checked = false;
						}
					}
				if(checked){%>
					<html:checkbox id="factoryIdSH"  name="factoryIdSH"  label="<%=factoryBean.getFactoryName() %>"  value="<%=factoryBean.getFactoryId() %>" checked="true"/>
			<% 	}else{ %>
					<html:checkbox id="factoryIdSH"  name="factoryIdSH"  label="<%=factoryBean.getFactoryName() %>"  value="<%=factoryBean.getFactoryId() %>"/>
			<% 	}
			 }}%>
			</html:td>
			<html:td   style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="checkBoxTip" style="font-size:12px;">请选择厂区。</font>
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:validateFetchPrivilege(true)"/>
				<btn:return href="contoller.do?operation=listFtechPrivilege"/>
			</html:td>
		</html:tr>
	</html:table>
	
</html:form>
