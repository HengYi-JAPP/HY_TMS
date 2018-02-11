<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
			
<html:table name="cssPropertyTable" style="display:none;"  id="table-list-property" styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
	<html:tr>
		<html:td colspan="6" styleClass="edit-talbe-label" style="text-align:left;"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.table.note#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.table.title.position#}"/></html:td>
		<html:td >	
			<html:hidden id="caption-side-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="caption-side-code" name="itemCode" value="caption-side"/>
			<html:hidden id="caption-side-var" name="itemVar" value=""/>
			<html:select id="caption-side-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="top" value="top"></html:option>
				<html:option label="bottom" value="bottom"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>										
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.table.merge.border#}"/></html:td>
		<html:td >	
			<html:hidden id="border-collapse-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-collapse-code" name="itemCode" value="border-collapse"/>
			<html:hidden id="border-collapse-var" name="itemVar" value=""/>		
			<html:select id="border-collapse-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="separate" value="separate"></html:option>
				<html:option label="collapse" value="collapse"></html:option>
				<html:option label="inline" value="inline"></html:option>
			</html:select>	
		</html:td>
		
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.table.border.spacing#}"/></html:td>
		<html:td >	
			<html:hidden id="border-spacing-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-spacing-code" name="itemCode" value="border-spacing"/>
			<html:text id="border-spacing-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="border-spacing-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-spacing');"/>
																
		</html:td>
	</html:tr>
	
	<html:tr>
		<html:td colspan="6" styleClass="edit-talbe-label" style="text-align:left;"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.list.note#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.list.type#}"/></html:td>
		<html:td >	
			<html:hidden id="list-style-type-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="list-style-type-code" name="itemCode" value="list-style-type"/>
			<html:hidden id="list-style-type-var" name="itemVar" value=""/>
			<html:select  name="itemValue" id="list-style-type-value">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="disc" value="disc"></html:option>
				<html:option label="circle" value="circle"></html:option>
				<html:option label="square" value="square"></html:option>
				<html:option label="decimal" value="decimal"></html:option>
				<html:option label="decimal-leading-zero" value="decimal-leading-zero"></html:option>
				<html:option label="lower-roman" value="lower-roman"></html:option>
				<html:option label="upper-roman" value="upper-roman"></html:option>
				<html:option label="lower-alpha" value="lower-alpha"></html:option>
				<html:option label="upper-alpha" value="upper-alpha"></html:option>
				<html:option label="lower-greek" value="lower-greek"></html:option>
				<html:option label="lower-latin" value="lower-latin"></html:option>
				<html:option label="upper-latin" value="upper-latin"></html:option>
				<html:option label="hebrew" value="hebrew"></html:option>
				<html:option label="armenian" value="armenian"></html:option>
				<html:option label="georgian" value="georgian"></html:option>
				<html:option label="cjk-ideographic" value="cjk-ideographic"></html:option>
				<html:option label="hiragana" value="hiragana"></html:option>
				<html:option label="katakana" value="katakana"></html:option>
				<html:option label="hiragana-iroha" value="hiragana-iroha"></html:option>
				<html:option label="katakana-iroha" value="katakana-iroha"></html:option>
			</html:select>																									
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.list.position#}"/></html:td>
		<html:td >	
			<html:hidden id="list-style-position-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="list-style-position-code" name="itemCode" value="list-style-position"/>
			<html:hidden id="list-style-position-var" name="itemVar" value=""/>		
			<html:select  id="list-style-position-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="inside" value="inside"></html:option>
				<html:option label="outside" value="outside"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.table.list.list.image#}"/></html:td>
		<html:td >	
			<html:hidden id="list-style-image-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="list-style-image-code" name="itemCode" value="list-style-image" />	
			<html:hidden id="list-style-image-value"  name="itemValue" value=""/>
			<com:simpleUpload fileId="list-style-image-value" isImage="true"></com:simpleUpload>		
			<html:hidden id="list-style-image-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('list-style-image');"/>														
		</html:td>
	</html:tr>
</html:table>

<com:loader   simpleUpload="true"/>