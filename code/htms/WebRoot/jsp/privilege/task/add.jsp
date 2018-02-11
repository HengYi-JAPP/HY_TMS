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
<com:loader  js="js/common/common.js,resources/simpleupload/jquery-min.js,js/htms/task/task.js"/>
<com:loader css="css/common/sub-table-list.css"  switchbox="true" validator="true" simplendar="true" />

<body>

	
	<html:form id="taskForm" name="taskForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addScheduleTask"/>
			<jsp:include page="../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.schedule.task.title.add") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.name#}"/></html:td>
					<html:td >
							<html:text name="taskName" id="taskName" styleClass="input-text"/>													
					</html:td>
				</html:tr>			
				
				<html:tr  >
				    <td class="edit-talbe-label"  >
						任务类型 5
					</td>
					<td>
						<!--<com:switchbox boxId="isUrgent" varValue="0" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName=""  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" />
						-->
						  <html:hidden name="taskTimeUnit" id="taskTimeUnit"  value="5" />
						<html:radio id="taskType" name="taskType" value="1" checked="checked" onchange="showOrHideForm('interavlInputForm','cycleInputForm',this);"/>间隔
						<html:radio id="taskType" name="taskType" value="2"  onchange="showOrHideForm('cycleInputForm','interavlInputForm',this);" />定时
					</td>
					
			    </html:tr>	
			  
		        <html:tr id="interavlInputForm1" >
				    <html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.timeunit#}"/></html:td>
					<html:td >
							<html:select id="taskTimeUnitInteravl" name="taskTimeUnitInteravl" onchange="unitChange(this);">
								<html:option label="毫秒" value="1"  selected="true"/>
								<html:option label="秒钟" value="2" />
								<html:option label="分钟" value="3" />
								<html:option label="小时" value="4" />
								<html:option label="天" value="5" />
						     </html:select>		
					</html:td>
				</html:tr>
			
				<html:tr id="interavlInputForm2" >
						<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.interval#}"/></html:td>
						<html:td >
								<html:text name="taskInterval" id="taskInterval" styleClass="input-text"/>													
						</html:td>
				</html:tr>	
		 
		        <html:tr  id="cycleInputForm1">
				    <html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.timeunit#}"/></html:td>
					<html:td >
							<html:select id="taskTimeUnitCycle" name="taskTimeUnitCycle" onchange="hideOrShowTime(this);">
								<html:option label="天"   value="5"   selected="true"/>
								
						     </html:select>		
					</html:td>
				</html:tr>
				 <html:tr id="cycleInputForm2" >
				    <html:td styleClass="edit-talbe-label">执行时间</html:td>
					<html:td >
					         <html:hidden name="taskValue" id="taskValue"  />
							 <html:div id="hourTxt"    style="float:left;"> <html:text name="hourId" id="hourId" onchange="changeValue();" styleClass="input-text" style="width:30px;" />时</html:div>
							 <html:div id="minuteTxt"  style="float:left;"> <html:text name="minuteId" id="minuteId"  onchange="changeValue();" styleClass="input-text" style="width:30px;"/>分</html:div>
							 <html:div id="secondTxt"  style="float:left;"> <html:text name="secondId" id="secondId"  onchange="changeValue();" styleClass="input-text" style="width:30px;"/>秒</html:div>
					</html:td>
				</html:tr>
							
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.class#}"/></html:td>
					<html:td >
							<html:text name="taskClass" id="taskClass" styleClass="input-text" size="80"/>													
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.isuse#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isUse"  varValue="0" idValue="isUse" offValue="0" varName="isUse" onValue="1"  idName="isUse" offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"  isSave="false" />																		
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.start#}"/></html:td>
					<html:td >
							<com:simplendar id="startDatetime" name="startDatetime" defaultToday="true"/>												
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.end#}"/></html:td>
					<html:td >
							<com:simplendar id="ednDateTime" name="ednDateTime" />												
					</html:td>
				</html:tr>	
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="1" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" />									
					</html:td>	
				</html:tr>
							
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.desc#}"/></html:td>
					<html:td >
							<html:textarea name="taskDesc" id="taskDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>														
					</html:td>
				</html:tr>		
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:if(validateTime()){__vsubmit('taskForm')}"/>
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
	<script type="text/javascript">
	     var type=document.getElementById("taskType").value;
        
         if(type=='1'){ 
             showOrHideForm1('interavlInputForm','cycleInputForm');
         }else if(type=='2'){ 
             showOrHideForm1('cycleInputForm','interavlInputForm');       
         }else{
             showOrHideForm1('interavlInputForm','cycleInputForm');
         }
	</script>
	

	</body>
</html>


