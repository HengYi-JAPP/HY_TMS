<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
			
<html:table name="cssPropertyTable" style="display:none;"  id="border-outline-property" styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
	<html:tr>
		<html:td colspan="8"  styleClass="edit-talbe-label" style="text-align:left;"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.note#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border#}"/></html:td>
		<html:td >	
			<html:hidden id="border-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-code" name="itemCode" value="border"/>	
			<html:text id="border-value" name="itemValue" styleClass="input-text" size="12"   value=""/>		
			<html:hidden id="border-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.width#}"/></html:td>
		<html:td >	
			<html:hidden id="border-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-width-code" name="itemCode" value="border-width"/>	
			<html:text id="border-width-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="border-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-width');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.style#}"/></html:td>
		<html:td >	
			<html:hidden id="border-style-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-style-code" name="itemCode" value="border-style"/>	
			<html:select id="border-style-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="dotted" value="dotted"></html:option>
				<html:option label="dashed" value="dashed"></html:option>
				<html:option label="solid" value="solid"></html:option>
				<html:option label="double" value="double"></html:option>
				<html:option label="groove" value="groove"></html:option>
				<html:option label="ridge" value="ridge"></html:option>
				<html:option label="inset" value="inset"></html:option>
				<html:option label="outset" value="outset"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>	
			<html:hidden id="border-style-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-style');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.color#}"/></html:td>
		<html:td >	
			<html:hidden id="border-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-color-code" name="itemCode" value="border-color"/>	
			<html:text id="border-color-value" name="itemValue" styleClass="input-text" size="12"   value=""  onclick="coloropen(this.id,this.id);"/>	
			<html:hidden id="border-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-color');"/>
		</html:td>
	</html:tr>
	
	
	<html:tr>
		<html:td colspan="8" styleClass="edit-talbe-label"  style="text-align:left;">&nbsp;</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.style.top#}"/></html:td>
		<html:td >	
			<html:hidden id="border-top-style-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-top-style-code" name="itemCode" value="border-top-style"/>
			<html:hidden id="border-top-style-var" name="itemVar" value=""/>
			<html:select id="border-top-style-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="dotted" value="dotted"></html:option>
				<html:option label="dashed" value="dashed"></html:option>
				<html:option label="solid" value="solid"></html:option>
				<html:option label="double" value="double"></html:option>
				<html:option label="groove" value="groove"></html:option>
				<html:option label="ridge" value="ridge"></html:option>
				<html:option label="inset" value="inset"></html:option>
				<html:option label="outset" value="outset"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>													
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.style.right#}"/></html:td>
		<html:td >	
			<html:hidden id="border-right-style-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-right-style-code" name="itemCode" value="border-right-style"/>
			<html:hidden id="border-right-style-var" name="itemVar" value=""/>
			<html:select id="border-right-style-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="dotted" value="dotted"></html:option>
				<html:option label="dashed" value="dashed"></html:option>
				<html:option label="solid" value="solid"></html:option>
				<html:option label="double" value="double"></html:option>
				<html:option label="groove" value="groove"></html:option>
				<html:option label="ridge" value="ridge"></html:option>
				<html:option label="inset" value="inset"></html:option>
				<html:option label="outset" value="outset"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>																									
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.style.bottom#}"/></html:td>
		<html:td >	
			<html:hidden id="border-bottom-style-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-bottom-style-code" name="itemCode" value="border-bottom-style"/>
			<html:hidden id="border-bottom-style-var" name="itemVar" value=""/>
			<html:select id="border-bottom-style-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="dotted" value="dotted"></html:option>
				<html:option label="dashed" value="dashed"></html:option>
				<html:option label="solid" value="solid"></html:option>
				<html:option label="double" value="double"></html:option>
				<html:option label="groove" value="groove"></html:option>
				<html:option label="ridge" value="ridge"></html:option>
				<html:option label="inset" value="inset"></html:option>
				<html:option label="outset" value="outset"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.style.left#}"/></html:td>
		<html:td >	
			<html:hidden id="border-left-style-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-left-style-code" name="itemCode" value="border-left-style"/>
			<html:hidden id="border-left-style-var" name="itemVar" value=""/>
			<html:select id="border-left-style-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="dotted" value="dotted"></html:option>
				<html:option label="dashed" value="dashed"></html:option>
				<html:option label="solid" value="solid"></html:option>
				<html:option label="double" value="double"></html:option>
				<html:option label="groove" value="groove"></html:option>
				<html:option label="ridge" value="ridge"></html:option>
				<html:option label="inset" value="inset"></html:option>
				<html:option label="outset" value="outset"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>													
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.width.top#}"/></html:td>
		<html:td >	
			<html:hidden id="border-top-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-top-width-code" name="itemCode" value="border-top-width"/>
			<html:text id="border-top-width-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="border-top-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-top-width');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.width.right#}"/></html:td>
		<html:td >	
			<html:hidden id="border-right-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-right-width-code" name="itemCode" value="border-right-width"/>
			<html:text id="border-right-width-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="border-right-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-right-width');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.width.bottom#}"/></html:td>
		<html:td >	
			<html:hidden id="border-bottom-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-bottom-width-code" name="itemCode" value="border-bottom-width"/>
			<html:text id="border-bottom-width-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="border-bottom-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-bottom-width');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.width.left#}"/></html:td>
		<html:td >	
			<html:hidden id="border-left-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-left-width-code" name="itemCode" value="border-left-width"/>
			<html:text id="border-left-width-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="border-left-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-left-width');"/>											
		</html:td>
	</html:tr>	
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.color.top#}"/></html:td>
		<html:td >	
			<html:hidden id="border-top-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-top-color-code" name="itemCode" value="border-top-color"/>
			<html:text id="border-top-color-value" name="itemValue" styleClass="input-text" size="12"   value="" onclick="coloropen(this.id,this.id);"/>				
			<html:hidden id="border-top-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-top-color');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.color.right#}"/></html:td>
		<html:td >	
			<html:hidden id="border-right-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-right-color-code" name="itemCode" value="border-right-color"/>
			<html:text id="border-right-color-value" name="itemValue" styleClass="input-text" size="12"   value="" onclick="coloropen(this.id,this.id);"/>
			<html:hidden id="border-right-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-right-color');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.color.bottom#}"/></html:td>
		<html:td >	
			<html:hidden id="border-bottom-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-bottom-color-code" name="itemCode" value="border-bottom-color"/>
			<html:text id="border-bottom-color-value" name="itemValue" styleClass="input-text" size="12"   value="" onclick="coloropen(this.id,this.id);"/>	
			<html:hidden id="border-bottom-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-bottom-color');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.color.left#}"/></html:td>
		<html:td >	
			<html:hidden id="border-left-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-left-color-code" name="itemCode" value="border-left-color"/>
			<html:text id="border-left-color-value" name="itemValue" styleClass="input-text" size="12"   value="" onclick="coloropen(this.id,this.id);"/>
			<html:hidden id="border-left-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-left-color');"/>												
		</html:td>
	</html:tr>

	<html:tr>
		<html:td colspan="8" styleClass="edit-talbe-label"  style="text-align:left;"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.style.note#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.top#}"/></html:td>
		<html:td >	
			<html:hidden id="border-top-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-top-code" name="itemCode" value="border-top"/>	
			<html:text id="border-top-value" name="itemValue" styleClass="input-text" size="12"   value=""/>		
			<html:hidden id="border-top-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-top');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.right#}"/></html:td>
		<html:td >	
			<html:hidden id="border-right-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-right-code" name="itemCode" value="border-right"/>	
			<html:text id="border-right-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="border-right-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-right');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.bottom#}"/></html:td>
		<html:td >	
			<html:hidden id="border-bottom-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-bottom-code" name="itemCode" value="border-bottom"/>	
			<html:text id="border-bottom-value" name="itemValue" styleClass="input-text" size="12"   value=""/>		
			<html:hidden id="border-bottom-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-bottom');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.border.left#}"/></html:td>
		<html:td >	
			<html:hidden id="border-left-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="border-left-code" name="itemCode" value="border-left"/>	
			<html:text id="border-left-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="border-left-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('border-left');"/>
		</html:td>
	</html:tr>
	
	<html:tr>
		<html:td colspan="8" styleClass="edit-talbe-label"  style="text-align:left;"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.outline.note#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.outline.width#}"/></html:td>
		<html:td >	
			<html:hidden id="outline-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="outline-width-code" name="itemCode" value="outline-width"/>	
			<html:text id="outline-width-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="outline-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('outline-width');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.outline.style#}"/></html:td>
		<html:td >	
			<html:hidden id="outline-style-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="outline-style-code" name="itemCode" value="outline-style"/>
			<html:hidden id="outline-style-var" name="itemVar" value=""/>
			<html:select id="outline-style-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="dotted" value="dotted"></html:option>
				<html:option label="dashed" value="dashed"></html:option>
				<html:option label="solid" value="solid"></html:option>
				<html:option label="double" value="double"></html:option>
				<html:option label="groove" value="groove"></html:option>
				<html:option label="ridge" value="ridge"></html:option>
				<html:option label="inset" value="inset"></html:option>
				<html:option label="outset" value="outset"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>													
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.border.outline.outline.color#}"/></html:td>
		<html:td colspan="3">	
			<html:hidden id="outline-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="outline-color-code" name="itemCode" value="outline-color" />	
			<html:text id="outline-color-value" name="itemValue" styleClass="input-text" size="12"   value=""  onclick="coloropen(this.id,this.id);"/>	
			<html:hidden id="outline-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('outline-color');"/>															
		</html:td>
		
	</html:tr>
</html:table>