<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="productTypeForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listProductType"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.producttype.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1626" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="KHKKIJPAKPICCOJGMIHHJJPMEPMGKKCPJEBNGOFNOEFKFEPHIKOGABAGAFCPELKP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typename#}" ></html:label>
			</td>
			<td  id="NPJCKAKFHLLIPBIKINHJAPHJIBEGIEJBNGMNAGMIPLBNLBLAPGEBIOJBFIKKIEKM" colSpan="1" rowSpan="1">
				<html:text  id="typeNameSH"  name="typeNameSH"  value="$[typeNameSH]" />
			</td>
			<td class="edit-talbe-label" id="PAHCHJMONNOABLMMEKLGCPPAKOBBCMMPJHGIGHGHCBFMLAIELBJJMINPBLJOLNBL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typecode#}" ></html:label>
			</td>
			<td  id="HKKLMKGBJKIKCEBPJNHKOGOPJJPKBHAFCGJFJNKNOMIABKINOIICANNGOGGOPOKB" colSpan="1" rowSpan="1">
				<html:text  id="typeCodeSH"  name="typeCodeSH" value="$[typeCodeSH]" />
				<span style="float:right;">
					<btn:search href="javascript:submit('productTypeForm')"/>
					<btn:reset href="javascript:cleanForm('productTypeForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddProductType"/>
				<btn:delete href="javascript:batch_deletes('productTypeForm','checkProductTypeId','','deleteProductType');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="productTypeList" bean="productTypeBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkProductTypeId" id="checkProductTypeId" value="ProductTypeBean.typeId" /></html:td>
			<html:td  label="{$jsp.htms.dictionary.producttype.typename#}" >
				<html:a href="contoller.do?operation=viewProductType&isModify=0&typeId=$[productTypeBean.typeId]">
					<html:value value="$[productTypeBean.typeName]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.dictionary.producttype.typecode#}" >
				<html:a href="contoller.do?operation=viewProductType&isModify=0&typeId=$[productTypeBean.typeId]">
					<html:value value="$[productTypeBean.typeCode]"/>
				</html:a>
			</html:td>
			
			<html:td  label="操作">
			<btn:modify href="contoller.do?operation=viewProductType&isModify=1&typeId=$[productTypeBean.typeId]"/> 
			<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteProductType&typeId=$[productTypeBean.typeId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkProductTypeId" checkId="checkAll"/>
				<com:page formId="productTypeForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
