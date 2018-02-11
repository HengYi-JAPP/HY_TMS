<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="factoryForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listFactory"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.factory.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1634" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="OKPMAFCMMEGKBBAKLLOMBINEKKEHLOALLKKJKANIKAAINFFPKHGIMEAKMFANCAHL" colSpan="1" rowSpan="1">
				
				<html:label  label="{$jsp.htms.dictionary.factory.factoryname#}" ></html:label>
			</td>
			<td  id="FHEALJPKMKHHKEPOEEHHFOOMILFLBLLBPECHFGPOALBPOBKNNMLPKFALKMHHCOMM" colSpan="1" rowSpan="1" width="90px">
				<html:text  id="factoryNameSH"  name="factoryNameSH" value="$[factoryNameSH]" />
			</td>
			
			<td class="edit-talbe-label" id="OKPMAFCMMEGKBBAKLLOMBINEKKEHLOALLKKJKANIKAAINFFPKHGIMEAKMFANCAHL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorycode#}" ></html:label>
			</td>
			<td  id="FHEALJPKMKHHKEPOEEHHFOOMILFLBLLBPECHFGPOALBPOBKNNMLPKFALKMHHCOMM" colSpan="1" rowSpan="1" >
				<html:text  id="factoryCodeSH"  name="factoryCodeSH" value="$[factoryCodeSH]" />
				<span style="float:right;">
					<btn:search href="javascript:submit('factoryForm')" />
				 	<btn:reset href="javascript:cleanForm('factoryForm')" />
				</span>
			</td>
			
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddFactory" />
				<btn:delete href="javascript:batch_deletes('factoryForm','checkFactoryId','','deleteFactory');" />
				<btn:rollback href="contoller.do?operation=syncLocalHostCahce&syncType=FACTORY" value="加载"/>
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="factoryList" bean="factoryBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkFactoryId" id="checkFactoryId" value="FactoryBean.factoryId" /></html:td>
			<html:td  label="{$jsp.htms.dictionary.factory.factoryname#}" >
				<html:a href="contoller.do?operation=viewFactory&isModify=0&factoryId=$[factoryBean.factoryId]">
					<html:value value="$[factoryBean.factoryName]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.dictionary.factory.factorycode#}" >
				<html:a href="contoller.do?operation=viewFactory&isModify=0&factoryId=$[factoryBean.factoryId]">
					<html:value value="$[factoryBean.factoryCode]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.dictionary.factory.factoryaddress#}"  property="factoryAddress" />
			<html:td  label="{$jsp.htms.dictionary.factory.factorycontactor#}"  property="factoryContactor" />
			<html:td  label="{$jsp.htms.dictionary.factory.factorytelphone#}"  property="factoryTelphone" />
			<html:td  label="{$jsp.common.status.validate#}"   >
			        <com:switchbox varValue="factoryBean.isVlidate" talbeName="TB_HTMS_FACTORY" idValue="factoryBean.factoryId" 
					    offValue="0" varName="isVlidate" 
					    onValue="1"  idName="factoryId" 
					    offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"    ajaxUrl="contoller.do"/>		
			</html:td>
			<html:td  label="操作">
			<btn:modify href="contoller.do?operation=viewFactory&isModify=1&factoryId=$[factoryBean.factoryId]"/>
			<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteFactory&factoryId=$[factoryBean.factoryId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkFactoryId" checkId="checkAll"/>
				<com:page formId="factoryForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
