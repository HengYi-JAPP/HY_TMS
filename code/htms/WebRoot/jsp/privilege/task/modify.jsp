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
	<com:loader  js="js/common/common.js,resources/simpleupload/jquery-min.js,js/htms/task/task.js"/>
	<com:loader css="css/common/sub-table-list.css"  switchbox="true" validator="true" simplendar="true" />
	<script type="text/javascript">
    function showOrHideForm(showFormId,displayId){
        //alert("ddd");
     
        $("#"+displayId+"1").hide();   
        $("#"+displayId+"2").hide();
        
        $("#"+showFormId+"1").show();
        $("#"+showFormId+"2").show();
        
		//document.getElementById(showFormId+"1").style.display="block";
		//document.getElementById(showFormId+"2").style.display="block";
	    //document.getElementById(displayId+"1").style.display="none";
	    //document.getElementById(displayId+"2").style.display="none";
	    
	    var taskType=$("#taskType").val();
	    var unitTime;
	    if(taskType=="1"){
	        unitTime=$("#taskTimeUnitInteravl").val();
	    }
	    if(taskType=="2"){
	        unitTime=$("#taskTimeUnitCycle").val();
	    }
	     alert("taskType:  "+taskType+"unitTime:   "+unitTime);
	    if(unitTime!=null&&unitTime!=""&&unitTime!="undefined"){
	      
	       document.getElementById("taskTimeUnit").value=unitTime;
	    }
    } 
    
    function hideOrShowTime(selectObj ){        
        var timeType=selectObj.value;
        if(timeType=="5"){
            $("#hourId").show();
            $("#hourTxt").show();
            $("#minuteId").show();
            $("#minuteTxt").show();
        }
        if(timeType=="4"){
            $("#hourId").hide();
            $("#hourTxt").hide();
            $("#minuteId").show();
            $("#minuteTxt").show();
        }
        if(timeType=="3"){
            $("#minuteId").hide();
            $("#minuteTxt").hide();
        }
        unitChange(selectObj);
        changeValue();
    }
    
    function unitChange(unitObj){
        var unitTime=unitObj.value;
        document.getElementById("taskTimeUnit").value=unitTime;
    }
    //'cycleInputForm','interavlInputForm'
    function changeValue(){
          var hour   =  $("#hourId").val();
          var minute =  $("#minuteId").val();
          var second =  $("#secondId").val();
          var value="";
          var timeType = $("#taskTimeUnit").val();
          if(timeType==null&&timeType==""&&timeType=="undefined"){
              document.getElementById("taskTimeUnitCycle").select[0]="selected";
              document.getElementById("taskTimeUnit").value=5;
              timeType=5;
          }
          if(timeType=="5"&&hour!=null&&hour!=""&&hour!="undefined"){
                     value+=hour+":";
	      }
          if((timeType=="5"||timeType=="4")&&minute!=null&&minute!=""&&minute!="undefined"){
                     value+=minute+":";
              }	          
	      } 
	      if(second!=null&&second!=""&&second!="undefined"){
                     value+=second;
	      } 
	      alert("taskvalue =     "+  value);
	      document.getElementById("taskValue").value=value;
    }
    function validateTime(){
          var hour   =  $("#hourId").val();
          var minute =  $("#minuteId").val();
          var second =  $("#secondId").val();
          
          var value="";
          var taskType= $("#taskType").val();
          if(taskType=="1"){
              return true;
          }
          var timeType = document.getElementById("taskTimeUnit").value;
          if(timeType==null&&timeType==""&&timeType=="undefined"){
             alert("请选择时间单位");
             return ;
          }
          if(timeType=="5"&&hour!=null&&hour!=""&&hour!="undefined"){
              if(parseInt(hour)>=0||parseInt(hour)<24){
                     value+=hour+":";
              }else{
                 alert("执行时间 小时输入应该输入为0到23的整数!");
                 return false;
              }
	         
	      }else{
	          alert("请输入执行时间小时数!");
	      }
          if((timeType=="5"||timeType=="4")&&minute!=null&&minute!=""&&minute!="undefined"){
              if(parseInt(minute)>=0||parseInt(minute)<60){
                     value+=minute+":";
              }else{
                  alert("执行时间 分钟输入应该输入为0到59的整数!");
                  return false;
              }
	          
	      } else{
	          alert("请输入执行时间分钟数!");
	      }
	      if(second!=null&&second!=""&&second!="undefined"){
	          if(parseInt(second)>=0||parseInt(second)<60){
                     value+=second+":";
              }else{
                  alert("执行时间 秒钟输入应该输入为0到59的整数!");
                  return false;
              }
	      } else{
	          alert("请输入执行时间秒钟数!");
	      }
	        alert("taskvalue = 2   "+  value);
	      document.getElementById("taskValue").value=value;
	      return true;
    }
</script>
	
	<html:form id="taskForm" name="taskForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyScheduleTask"/>
			<jsp:include page="../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.schedule.task.title.modify") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.name#}"/></html:td>
					<html:td >
							<html:hidden name="taskId" id="taskId"   value="$[scheduleTaskBean.taskId]"/>	
							<html:text name="taskName" id="taskName" styleClass="input-text" value="$[scheduleTaskBean.taskName]"/>													
					</html:td>
				</html:tr>			
			
				
				<html:tr  >
				    <td class="edit-talbe-label"  >
						任务类型
					</td>
					<td>
					    <html:hidden name="taskTimeUnit" id="taskTimeUnit"  value="$[scheduleTaskBean.taskTimeUnit]" />
						<logic:if condition="$[scheduleTaskBean.taskType]==1"> 
						     <html:radio id="taskType" name="taskType" value="1" checked="checked" onchange="showOrHideForm('interavlInputForm','cycleInputForm');"/>间隔
						     <html:radio id="taskType" name="taskType" value="2"  onchange="showOrHideForm('cycleInputForm','interavlInputForm');" />定时
						</logic:if>
						<logic:if condition="$[scheduleTaskBean.taskType]==2"> 
						   	 <html:radio id="taskType" name="taskType" value="1"  onchange="showOrHideForm('interavlInputForm','cycleInputForm');"/>间隔
						     <html:radio id="taskType" name="taskType" value="2"  checked="checked" onchange="showOrHideForm('cycleInputForm','interavlInputForm');" />定时
						</logic:if>
					</td>
					
			    </html:tr>	
			    		
					
			   <html:tr id="interavlInputForm1" >
				    <html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.timeunit#}"/></html:td>
					<html:td >
							<html:select id="taskTimeUnitInteravl" name="taskTimeUnitInteravl" onchange="unitChange(this);">
								<html:option label="毫秒" value="1"  selected="$[scheduleTaskBean.taskTimeUnit]"/>
								<html:option label="秒钟" value="2" selected="$[scheduleTaskBean.taskTimeUnit]"/>
								<html:option label="分钟" value="3" selected="$[scheduleTaskBean.taskTimeUnit]"/>
								<html:option label="小时" value="4" selected="$[scheduleTaskBean.taskTimeUnit]"/>
								<html:option label="天" value="5" selected="$[scheduleTaskBean.taskTimeUnit]"/>
						     </html:select>		
					</html:td>
				</html:tr>
			
				<html:tr id="interavlInputForm2" >
						<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.interval#}"/></html:td>
						<html:td >
								<html:text name="taskInterval" id="taskInterval"  value="$[scheduleTaskBean.taskInterval]"  styleClass="input-text"/>													
						</html:td>
				</html:tr>	
		 
		        <html:tr  id="cycleInputForm1">
				    <html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.timeunit#}"/></html:td>
					<html:td >
							<html:select id="taskTimeUnitCycle" name="taskTimeUnitCycle" onchange="hideOrShowTime(this);">
								<html:option label="天" value="5" selected="$[scheduleTaskBean.taskTimeUnit]"/>
						     </html:select>		
					</html:td>
				</html:tr>
				
				 <html:tr id="cycleInputForm2" >
				    <html:td styleClass="edit-talbe-label">执行时间</html:td>
					<html:td >
					         <html:hidden name="taskValue" id="taskValue"   value="$[scheduleTaskBean.taskValue]" />
							 <html:div id="hourTxt"    style="float:left;"> <html:text name="hourId" id="hourId" onchange="changeValue();" styleClass="input-text" style="width:30px;" />时</html:div>
							 <html:div id="minuteTxt"  style="float:left;"> <html:text name="minuteId" id="minuteId"  onchange="changeValue();" styleClass="input-text" style="width:30px;"/>分</html:div>
							 <html:div id="secondTxt"  style="float:left;"> <html:text name="secondId" id="secondId"  onchange="changeValue();" styleClass="input-text" style="width:30px;"/>秒</html:div>
					</html:td>
				</html:tr>
				
				
				
				
				
				
						
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.class#}"/></html:td>
					<html:td >
							<html:text name="taskClass" id="taskClass" styleClass="input-text" size="80" value="$[scheduleTaskBean.taskClass]"/>													
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.isuse#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isUse"  varValue="$[scheduleTaskBean.isUse]" idValue="isUse" offValue="0" varName="isUse" onValue="1"  idName="isUse" offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"  isSave="false" />																		
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.start#}"/></html:td>
					<html:td >
							<com:simplendar id="startDatetime" name="startDatetime" defaultToday="true" value="$[scheduleTaskBean.startDatetime]"/>												
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.end#}"/></html:td>
					<html:td >
							<com:simplendar id="ednDateTime" name="ednDateTime"  value="$[scheduleTaskBean.ednDateTime]"/>												
					</html:td>
				</html:tr>	
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="$[scheduleTaskBean.isValidate]" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" />									
					</html:td>	
				</html:tr>
							
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.schedule.task.desc#}"/></html:td>
					<html:td >
							<html:textarea name="taskDesc" id="taskDesc" styleClass="input-text" cols="40" rows="8" value="$[scheduleTaskBean.taskDesc]"></html:textarea>														
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
	<script type="text/javascript">
	     var type= "<html:value value='scheduleTaskBean.taskType' />";
         //alert(type);
         if(type=='1'){ 
             showOrHideForm1('interavlInputForm','cycleInputForm');
         }else if(type=='2'){ 
             showOrHideForm1('cycleInputForm','interavlInputForm');       
         }
         var value= "<html:value value='scheduleTaskBean.taskValue' />";
         if(value){
              var hourMS=value.split(":");
              if(hourMS.length==3){
                  document.getElementById("hourId").value=hourMS[0];
                  document.getElementById("minuteId").value=hourMS[1];
                  document.getElementById("secondId").value=hourMS[2];
              }
              if(hourMS.length==2){
                 document.getElementById("minuteId").value=hourMS[0];
                  document.getElementById("secondId").value=hourMS[1];
              }
	          if(hourMS.length==1){
                document.getElementById("secondId").value=hourMS[0];
              }
	          
         }
        
	</script>
	

	</body>
</html>


