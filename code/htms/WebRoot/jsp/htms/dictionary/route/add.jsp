<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js" validator="true" simpleUpload="true" myWin="true"/>
<com:loader css="css/common/table-list.css"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>
<html:form id="routeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="addRoute"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.route.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1635" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="AKCIIKBILKIBFJBONOJGMKBJFOJNHFEEFMPANKAFBIENJFALBJLIBBHLJFHPLJOP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="AKIBKMFOMNMPNLNNNECINJOHFNMKGGPGBABLKAGNKHKLJNHPCAKLCKAGPBKIMJLE" colSpan="1" rowSpan="1">
				<html:select  id="productId"  name="productId"  list="productList" ><html:option  value="productId"  label="productName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MPIGKAFKGHIOELPKCABNCPAKHOCHOCLOCPJCJJJEONHIJIJGNBPJPBABGKHLHAAG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
			</td>
			<td  id="KKAGMPHFHKMGJBAMFKAMPLFJFENAPOCOCHMGKJLKGKBMHBJCLJPAKBEILGFIMFIB" colSpan="1" rowSpan="1">
				<html:select  id="factoryId"  name="factoryId"  list="factoryList" ><html:option  value="factoryId"  label="factoryName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="ELPMACGOENCNECIOJEPEGPKJMIMGJMANENBOBKBAPFBFJJFLJOCPPILNNMENFPCA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.route.areaid#}" ></html:label>
			</td>
			<td  id="NFIPCNCCNJKCJKMCCCAMKCKAHAGPHCHOPKIKEBENNMOOHBNKFJLPMELACPIKCKIP" colSpan="1" rowSpan="1">
				
				<html:hidden name="area" id="area"  value=""/>
							
				<html:hidden id="areaId" name="areaId" value=""/>	
				<input type="text" name="orderArea" id="orderArea" value="" onblur="document.getElementById('area').value=this.value"/>	
				<btn:button name="Select" href="javascript:void(0);" onclick="selectArea()" typeId="selectArea" value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.select") %>' styleClass="button-self-style"/>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:submit('routeForm')"/>
				<btn:return href="contoller.do?operation=listRoute"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
