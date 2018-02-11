<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
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
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/htms/common/common.js"/>
		<com:loader css="css/common/table-list-new.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="taskForm" name="taskForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listScheduleTask"/>
		<jsp:include page="../../common/impart/table-banner-new.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.schedule.task.title.list") %>' name='title'/>	
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0" styleClass="edit-talbe">
			<html:tr styleClass="trCell">
				<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.name#}"/></html:td>
				<html:td >
					<html:text name="taskNameSH"  id="taskNameSH"   value="$[taskNameSH]"   maxlength="30"  />					
						<span style="float:right;">
							<btn:search href="javascript:submit('taskForm')"/>
							<btn:reset href="javascript:cleanForm('taskForm','taskTimeUnit,switchbox11')"/>	
						</span>
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/privilege/task/add.jsp"/>
				<btn:delete href="javascript:batch_deletes('taskForm','checkTaskId','','deleteScheduleTask');" />
			
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="scheduleTaskList" bean="taskBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkTaskId" id="checkTaskId" value="taskBean.taskId" />
				</html:td>
			
				<html:td  label="{$jsp.privilege.schedule.task.name#}" >
				
					<html:a href="contoller.do?operation=viewScheduleTask&taskId=$[taskBean.taskId]">
						<html:value value="taskBean.taskName"/>
					</html:a>
				</html:td>
				
				<html:td  label="任务类型" >
						<logic:if condition="$[taskBean.taskType]==1">间隔</logic:if>
						<logic:if condition="$[taskBean.taskType]==2">定时</logic:if>
				</html:td>
				<html:td  label="{$jsp.privilege.schedule.task.timeunit#}" >
						<html:select id="taskTimeUnit" name="taskTimeUnit" disabled="true">
							<html:option label="毫秒" value="1"  selected="$[taskBean.taskTimeUnit]"/>
							<html:option label="秒钟" value="2"  selected="$[taskBean.taskTimeUnit]"/>
							<html:option label="分钟" value="3"  selected="$[taskBean.taskTimeUnit]"/>
							<html:option label="小时" value="4" selected="$[taskBean.taskTimeUnit]" />
							<html:option label="天" value="5"  selected="$[taskBean.taskTimeUnit]"/>
							<html:option label="星期" value="6"  selected="$[taskBean.taskTimeUnit]"/>
							<html:option label="月" value="7"  selected="$[taskBean.taskTimeUnit]"/>							
							<html:option label="季度" value="8"  selected="$[taskBean.taskTimeUnit]"/>
							<html:option label="年" value="9"  selected="$[taskBean.taskTimeUnit]"/>
						</html:select>	
				</html:td>
				<html:td  label="执行时间" >
						<logic:if condition="$[taskBean.taskType]==1"><html:value value="$[taskBean.taskInterval]" />	</logic:if>
						<logic:if condition="$[taskBean.taskType]==2"><html:value value="$[taskBean.taskValue]" />	</logic:if>
				</html:td>
				<html:td  label="{$jsp.privilege.schedule.task.isuse#}" >
						<logic:if condition="$[taskBean.isUse]==0"> 
						       <html:label label="{$jsp.common.status.no#}"></html:label>
						</logic:if>
						<logic:if condition="$[taskBean.isUse]==1"> 
						       <html:label label="{$jsp.common.status.yes#}"></html:label>
						</logic:if>							
				</html:td>
				<html:td  label="{$jsp.privilege.schedule.task.start#}" >
							<html:value value="$[taskBean.startDatetime]"/>		
				</html:td>
				
				<html:td  label="{$jsp.privilege.schedule.task.end#}" >
							<html:value value="$[taskBean.ednDateTime]"/>	
				</html:td>
				
				
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
						<btn:modify href="contoller.do?operation=viewScheduleTask&isModify=true&taskId=$[taskBean.taskId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
						<btn:delete  href="javascript:deleteRow('contoller.do?operation=deleteScheduleTask&checkTaskId=$[taskBean.taskId]')"/>
				</html:td>
				<html:td label="执行" width="80px">
						<btn:delete  value="执行"  href="contoller.do?operation=doScheduleTask&taskId=$[taskBean.taskId]" styleClass="sendcar"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkTaskId" checkId="checkAll"/>	
		<jsp:include page="../../common/invokeMessage.jsp" />
		<com:page formId="taskForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	<!-- 
				<html:td  label="{$jsp.privilege.schedule.task.desc#}"  property="taskDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
						<com:switchbox varValue="taskBean.isValidate" talbeName="TB_CMS_CHANNEL" idValue="taskBean.taskId" offValue="0" varName="isValidate" onValue="1"  idName="taskId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>
				</html:td> -->
	</body>
</html>



