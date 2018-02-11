<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" switchButton="" myWin="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="newsForm" name="newsForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listNews"/>
		<jsp:include page="../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.news.list.title") %>' name='title'/>	
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.news.title#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="titleSH" id="titleSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('newsForm')"/>
						<btn:reset href="javascript:cleanForm('newsForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/console/plugins/news/add.jsp"/>
				<btn:delete href="javascript:batchDelete('newsForm','checkInfoId','','deleteNews');" />
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.NEWS_LIST%>" bean="newsBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkInfoId" id="checkInfoId" value="newsBean.infoId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.plugin.news.title#}" >
				<html:a href="contoller.do?operation=viewNews&infoId=$[newsBean.infoId]">
					<html:value value="newsBean.title"/>
				</html:a>				
				</html:td>
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="newsBean.isValidate" talbeName="TB_CMS_INFO_COLUMN" idValue="newsBean.infoId" offValue="0" varName="isValidate" onValue="1"  idName="infoId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do" isSave="true"/>						
				</html:td>
				<html:td label="{$jsp.portal.console.plugin.news.aprrovestatus#}" >
					<com:switchButton talbeName="TB_CMS_INFO_COLUMN" idValue="newsBean.infoId" statusName="APPROVESTATUS" idName="INFOID" statusValue="newsBean.approveStatus" isSave="true">
						<com:switchStatus  typeId="passaudit"  statusLabel="{$jsp.portal.console.plugin.news.aprrovestatus.draft#}" statusValue="0" nextStatusValue="1" />
						<com:switchStatus   typeId="untoauditing"  statusLabel="{$jsp.portal.console.plugin.news.aprrovestatus.pass#}" statusValue="1" nextStatusValue="2"/>
						<com:switchStatus   typeId="transmitaudit"  statusLabel="{$jsp.portal.console.plugin.news.aprrovestatus.reapprove#}" statusValue="2" nextStatusValue="0"/>											
					</com:switchButton>				
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewNews&isModify=true&infoId=$[newsBean.infoId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteNews&checkInfoId=$[newsBean.infoId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkInfoId" checkId="checkAll"/>	
		<com:page formId="newsForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




