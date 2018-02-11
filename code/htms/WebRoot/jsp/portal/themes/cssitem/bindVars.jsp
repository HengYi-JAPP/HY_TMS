<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
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
		<script type="text/javascript">
		var varsCodes=[];
		</script>
	</head>
	<body>
	
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr ><html:td >
				<btn:cancel href="javascript:void(0)" onclick="unSelected()"/>									
		</html:td></html:tr>
	</html:table>	
			<!-- banner 页面导航条 -->
	<html:form id="paramsForm" name="paramsForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listThemesParams"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
		<html:hidden id="itemCodeValue" name="itemCodeValue" value="itemCodeValue"/>
		<html:hidden id="itemCode" name="itemCode" value="itemCode"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.cssitem.bindvar.title") %>' name='title'/>	
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="true" name="hideSearchBanner"/>
		</jsp:include>
	
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="paramsList" bean="paramsBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="{$jsp.portal.themes.cssitem.bindvars.select#}" width="60px">
					
					<html:radio id="$[paramsBean.paramsId]" name="paramsId" onclick="setSelected(this.id)"/>
					<script type="text/javascript">
						varsCodes[varsCodes.length]={paramsId:'<html:value value="paramsBean.paramsId" />',paramsCode:'$[<html:value value="paramsBean.paramsCode" />]'};
					</script>
				</html:td>
				<html:td  label="{$jsp.portal.themes.cssitem.bindvars.code#}"  property="paramsCode" />
				<html:td  label="{$jsp.portal.themes.cssitem.bindvars.name#}" property="paramsName" />
				<html:td  label="{$jsp.portal.themes.cssitem.bindvars.type#}" property="paramsType" />
				<html:td  label="{$jsp.portal.themes.cssitem.bindvars.desc#}" property="paramsDesc" />
			</html:tr>
		</html:table>	
	</html:form>
	
	</body>
</html>
<script type="text/javascript">
<!--
function setSelectedVar(){
	var itemCodeValue =document.getElementById("itemCodeValue").value;
	var selectVar = document.getElementById(itemCodeValue);
	if(selectVar){
		selectVar.setAttribute("checked","true");
	}
}
setSelectedVar();
function setSelected(varId){
	var itemCode =document.getElementById("itemCode").value;
	var targetElement = parent.document.getElementById(itemCode+"-var");
	var showElement = parent.document.getElementById(itemCode+"-value-show");
	var valueElement = parent.document.getElementById(itemCode+"-value");
	var paramsCode = "";
	for(var i=0;i<varsCodes.length;i++){
		if(varsCodes[i].paramsId==varId){
			paramsCode = varsCodes[i].paramsCode;
			break;
		}
	}
	//alert("paramsCode="+paramsCode);
	if(targetElement){
		targetElement.value=varId;
		if(showElement){
			showElement.value=paramsCode;
		}
		if(valueElement){
			valueElement.value=paramsCode;
		}
	}
}
function unSelected(){
	var itemCode ,targetElement,showElement ,valueElement;
	var itemCode =document.getElementById("itemCode").value;
	var targetElement = parent.document.getElementById(itemCode+"-var");
	var showElement = parent.document.getElementById(itemCode+"-value-show");
	var valueElement = parent.document.getElementById(itemCode+"-value");
	var paramsCode = "";
	for(var i=0;i<varsCodes.length;i++){
		selectVar=document.getElementById(varsCodes[i].paramsId);
		if(selectVar&&selectVar.checked){
			 selectVar.removeAttribute("checked");
			 
		     if(targetElement){
				targetElement.value="";
				if(showElement){
					showElement.value="";
				}
				if(valueElement){
					valueElement.value="";
				}
			}
			break;
		}
	}
}
//-->
</script>



