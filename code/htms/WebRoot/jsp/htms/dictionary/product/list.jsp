<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="productForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listProduct"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.product.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1630" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="INKLLNLFKCOAKHEAKBGHGLILNJGIPFECMGBHLEAJAPMIPCNALHOFIOOKKHJKHOCE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="AFFCLBKJOKAFHBHBCLJMKPCNMKLMKFKBCLPMOFKPAHLIEMOOBGLHAIFKGNLKLMOM" colSpan="1" rowSpan="1">
				<html:text  id="productNameSH"  name="productNameSH" value="$[productNameSH]" />
			</td>
			<td class="edit-talbe-label" id="INKLLNLFKCOAKHEAKBGHGLIPRODUCTNAMEBHLEAJAPMIPCNALHOFIOOKKHJKHOCE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productcode#}" ></html:label>
			</td>
			<td  id="AFFCLBKJOKAFHBHBCLJMKPCNMKLMKFKBCLPMOFKPAHLIEMOOBGLHAIFKGNLKLMOM" colSpan="1" rowSpan="1">
				<html:text  id="sapNoSH"  name="sapNoSH" value="$[sapNoSH]" />
				<span style="float:right;">
					<btn:search href="javascript:submit('productForm')"/>
					<btn:reset href="javascript:cleanForm('productForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddProduct"/>
				<btn:delete href="javascript:batch_deletes('productForm','checkProductId','','deleteProduct');" />
				<btn:rollback href="contoller.do?operation=syncLocalHostCahce&syncType=PRODUCT" value="加载"/>
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="productList" bean="productBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkProductId" id="checkProductId" value="ProductBean.productId" /></html:td>
			<html:td  label="{$jsp.htms.dictionary.product.productname#}" >
				<html:a href="contoller.do?operation=viewProduct&isModify=0&productId=$[productBean.productId]">
					<html:value value="$[productBean.productName]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.dictionary.product.productcode#}"  >
				<html:a href="contoller.do?operation=viewProduct&isModify=0&productId=$[productBean.productId]">
					<html:value value="$[productBean.productCode]"/>
				</html:a>
			</html:td>
			
			<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewProduct&isModify=1&productId=$[productBean.productId]"/>
				<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteProduct&productId=$[productBean.productId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkProductId" checkId="checkAll"/>
				<com:page formId="productForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
