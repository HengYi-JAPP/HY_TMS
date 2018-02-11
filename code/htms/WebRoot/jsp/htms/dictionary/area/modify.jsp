<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

String currentAreaId=request.getParameter("areaId");
AreaRepository rep = new AreaRepository();
String areaName = (String)rep.getFullAreaName(currentAreaId,">>",true);
%>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";

window.onload=function(){
 	var isLeaf = document.getElementById("isLeaf").value
 	var check = document.getElementById("checkName");
		if(isLeaf=="1"){
 			check.checked = true;
 		}

}
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js" validator="true" simpleUpload="true" myWin="true"/>
<com:loader css="css/common/sub-table-list.css"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>
<html:form id="areaForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyArea"/>
	<html:hidden id="isValidate" name="isValidate" value="areaViewBean.isValidate"/>
	<html:hidden id="areaID" name="areaId" value="areaViewBean.areaId"/>	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true" tree="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1640" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="IGINCFFCCCKKLIINJGBKIBKJKGEMPGBNCKAGGPOIFKKELCEIPILGJOANFCOOHMGP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.areacode#}" ></html:label>
			</td>
			<td  id="BEEBKAFHACFFJBMPMFONGGFGCKJMIPOMJAPKGPCNLHIFOEFPKJHKINJOINMMCEKO" colSpan="1" rowSpan="1">
				<html:text  id="areaCode"  name="areaCode"  value="areaViewBean.areaCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KJMLHFIBIBAONEKGKABBPAAKHHMKCAKNCKLOMJCPIBBOKMPLIKHJIKAFJPNKPHGN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.areaname#}" ></html:label>
			</td>
			<td  id="LECCCEPBHOFHPHMKKOCFLAMFKBIMCGLOFLKJFBBAJKMKAMBEFMLPAAALPFIPPGLL" colSpan="1" rowSpan="1">
				<html:text  id="areaName"  name="areaName"  value="areaViewBean.areaName" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.selectareaparent#}" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<%
				if(areaName!=null){
			 %>
			 	<html:value value="<%=areaName %>"></html:value>
			  <%} %>	
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FBHEPGMJACMEENOFIFPPFFKHJHCENLFOPECCFKEIAALBFGAEAKJIPMCHCFJKANMB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.parentareaid#}" ></html:label>
			</td>
			<td  id="MICMKHJAEJCHLAMMAKLOFCMHOHMOOFHPAONINFEKKIBIKKHPGFKOJJBIGKKFBKHP" colSpan="1" rowSpan="1">
				<html:hidden name="area" id="area"  value=""/>
				<html:hidden id="areaId" name="parentAreaId" value="areaViewBean.parentAreaId"/>
				
			 <html:text name="orderArea" id="orderArea" value="" onblur="document.getElementById('area').value=this.value"/>
			
				<btn:button name="Select" href="javascript:void(0);" onclick="selectArea()" typeId="selectArea" value="选择地址" styleClass="button-self-style"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="PKJNJEIHGHCIPIOEPPGOCJOGECMGKEPIHNHKLKOFHJNIHJGOLIMGCELIIBJMIOGF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.arearoute#}" ></html:label>
			</td>
			<td  id="LALNKEFMKNAALBNEBEGAMHANOBHGBOHOPNJLOKCGJJELPLJKPEGECKMPMOCOJAOJ" colSpan="1" rowSpan="1">
				<html:text  id="areaRoute"  name="areaRoute"  value="areaViewBean.areaRoute" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.isleaf#}" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<label>
					<input type="checkbox" id="checkName" name="checkName" onchange="this.nextElementSibling.value = (this.nextElementSibling.value==1)?0:1 " />
					<html:hidden id="isLeaf" name="isLeaf" value="areaViewBean.isLeaf" />
				</label>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('areaForm')"/>
				<btn:return href="contoller.do?operation=listArea"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="areaForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="areaCode"  types="number-letter" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="areaName"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
