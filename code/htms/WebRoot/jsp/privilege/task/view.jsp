<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
	<com:loader  js="js/common/common.js"/>
	<com:loader css="css/common/sub-table-list.css"  switchbox="true" validator="true"/>
	<html:form id="taskForm" name="taskForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyScheduleTask"/>
			<jsp:include page="../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.schedule.task.title.view") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.name#}"/></html:td>
					<html:td >
							<html:hidden name="taskId" id="taskId"   value="$[scheduleTaskBean.taskId]"/>	
							<html:value value="$[scheduleTaskBean.taskName]"/>													
					</html:td>
				</html:tr>			
								
				
				<html:tr  >
				    <td class="edit-talbe-label"  >
						任务类型
					</td>
					<td>
						<logic:if condition="$[scheduleTaskBean.taskType]==1"> 
						   <html:radio id="taskType" name="taskType" value="1" checked="checked" />间隔
						   <html:radio id="taskType" name="taskType" value="2"  />定时
						</logic:if>
						<logic:if condition="$[scheduleTaskBean.taskType]==2"> 
						   <html:radio id="taskType" name="taskType" value="1"  />间隔
						   <html:radio id="taskType" name="taskType" value="2"  checked="checked" />定时
						</logic:if>
					</td>
					
			    </html:tr>	
			    
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.timeunit#}"/></html:td>
					<html:td >
						<html:select id="taskTimeUnit" name="taskTimeUnit" disabled="true">
							<html:option label="毫秒" value="1"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
							<html:option label="秒钟" value="2"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
							<html:option label="分钟" value="3"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
							<html:option label="小时" value="4" selected="$[scheduleTaskBean.taskTimeUnit]" />
							<html:option label="天" value="5"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
							<html:option label="星期" value="6"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
							<html:option label="月" value="7"  selected="$[scheduleTaskBean.taskTimeUnit]"/>							
							<html:option label="季度" value="8"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
							<html:option label="年" value="9"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
						</html:select>													
					</html:td>
				</html:tr>	
					<logic:if condition="$[scheduleTaskBean.taskType]==1"> 
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.interval#}"/></html:td>
					<html:td >
							<html:value value="$[scheduleTaskBean.taskInterval]" />													
					</html:td>
				</html:tr>
				</logic:if>
				
				<logic:if condition="$[scheduleTaskBean.taskType]==2"> 	
				<html:tr>
					<html:td styleClass="edit-talbe-label">执行时间</html:td>
					<html:td >
							<html:value value="$[scheduleTaskBean.taskValue]" />													
					</html:td>
				</html:tr>
				</logic:if>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.class#}"/></html:td>
					<html:td >
							<html:value value="$[scheduleTaskBean.taskClass]"/>													
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.isuse#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isUse"  varValue="$[scheduleTaskBean.isUse]" idValue="isUse" offValue="0" varName="isUse" onValue="1"  idName="isUse" offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"  isSave="false" disabled="true" />																		
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.start#}"/></html:td>
					<html:td >
							<html:value value="$[scheduleTaskBean.startDatetime]"/>												
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.end#}"/></html:td>
					<html:td >
							<html:value value="$[scheduleTaskBean.ednDateTime]"/>												
					</html:td>
				</html:tr>	
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="$[scheduleTaskBean.isValidate]" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" disabled="true" />									
					</html:td>	
				</html:tr>
							
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.desc#}"/></html:td>
					<html:td >
							<html:value value="$[scheduleTaskBean.taskDesc]"/>														
					</html:td>
				</html:tr>		
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('taskForm')"/>
						<btn:return href="contoller.do?operation=listScheduleTask"/>							
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="taskForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="taskCode"  types="isnull,number-letter-underline" event="onblur">
				<com:init size="36" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="taskName"  types="isnull" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="taskUrl"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="defaultOrder"  types="none" event="onblur">
				<com:init size="36" maxlength="60" initValue="10000"></com:init>
			</com:vElement>
			<com:vElement id="defaultClass"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="showHeight"  types="none" event="onblur">
				<com:init size="8" maxlength="5" initValue="800"></com:init>
			</com:vElement>
			<com:vElement id="selectedClass"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
		</com:validator>
	</html:form>
	
	

	</body>
</html>


