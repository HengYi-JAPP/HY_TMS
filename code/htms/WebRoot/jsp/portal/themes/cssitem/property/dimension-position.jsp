<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
			
<html:table name="cssPropertyTable" style="display:none;"  id="dimension-position-property" styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.width#}"/></html:td>
		<html:td >	
			<html:hidden id="width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="width-code" name="itemCode" value="width"/>
			<html:text id="width-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			<html:hidden id="width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('width');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.height#}"/></html:td>
		<html:td >	
			<html:hidden id="height-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="height-code" name="itemCode" value="height"/>
			<html:text id="height-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="height-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('height');"/>											
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.maxwidth#}"/></html:td>
		<html:td >	
			<html:hidden id="max-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="max-width-code" name="itemCode" value="max-width"/>
			<html:text id="max-width-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="max-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('max-width');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.maxheight#}"/></html:td>
		<html:td >	
			<html:hidden id="max-height-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="max-height-code" name="itemCode" value="max-height"/>
			<html:text id="max-height-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="max-height-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('max-height');"/>											
		</html:td>
		
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.minwidth#}"/></html:td>
		<html:td >	
			<html:hidden id="min-width-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="min-width-code" name="itemCode" value="min-width"/>
			<html:text id="min-width-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="min-width-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('min-width');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.minheight#}"/></html:td>
		<html:td >	
			<html:hidden id="min-height-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="min-height-code" name="itemCode" value="min-height"/>
			<html:text id="min-height-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="min-height-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('min-height');"/>											
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.lineheight#}"/></html:td>
		<html:td  colspan="4">	
			<html:hidden id="line-height-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="line-height-code" name="itemCode" value="line-height"/>
			<html:text id="line-height-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			<html:hidden id="line-height-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('line-height');"/>												
		</html:td>
	</html:tr>
	
	
	<html:tr>
		<html:td colspan="4" styleClass="edit-talbe-label">&nbsp;</html:td>
	</html:tr>
	
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.display#}"/></html:td>
		<html:td >	
			<html:hidden id="display-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="display-code" name="itemCode" value="display"/>	
			<html:hidden id="display-var" name="itemVar" value=""/>
			<html:select id="display-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="block" value="block"></html:option>
				<html:option label="inline" value="inline"></html:option>
			</html:select>	
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.visibility#}"/></html:td>
		<html:td >	
			<html:hidden id="visibility-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="visibility-code" name="itemCode" value="visibility"/>
			
			<html:hidden id="visibility-var" name="itemVar" value=""/>
			<html:select id="visibility-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="visible" value="visible"></html:option>
				<html:option label="hidden" value="hidden"></html:option>
				<html:option label="collapse" value="collapse"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>													
		</html:td>
	</html:tr>
	<html:tr>
	<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.textalign#}"/></html:td>
		<html:td >	
			<html:hidden id="text-align-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="text-align-code" name="itemCode" value="text-align"/>	
			<html:hidden id="text-align-var" name="itemVar" value=""/>
			<html:select id="text-align-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="left" value="left"></html:option>
				<html:option label="center" value="center"></html:option>
				<html:option label="right" value="right"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.verticalalign#}"/></html:td>
		<html:td >	
			<html:hidden id="vertical-align-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="vertical-align-code" name="itemCode" value="vertical-align"/>	
			<html:hidden id="vertical-align-var" name="itemVar" value=""/>
			<html:select id="vertical-align-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="top" value="top"></html:option>
				<html:option label="middle" value="middle"></html:option>
				<html:option label="bottom" value="bottom"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>												
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.position#}"/></html:td>
		<html:td >	
			<html:hidden id="position-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="position-code" name="itemCode" value="position"/>
			<html:hidden id="position-var" name="itemVar" value=""/>
			<html:select id="position-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="static" value="static"></html:option>
				<html:option label="relative" value="relative"></html:option>
				<html:option label="absolute" value="absolute"></html:option>
				<html:option label="fixed" value="fixed"></html:option>
			</html:select>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.cursor#}"/></html:td>
		<html:td >	
			<html:hidden id="cursor-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="cursor-code" name="itemCode" value="cursor"/>
			<html:hidden id="cursor-var" name="itemVar" value=""/>
			<html:select id="cursor-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="url" value="url"></html:option>
				<html:option label="default" value="default"></html:option>
				<html:option label="auto" value="auto"></html:option>
				<html:option label="crosshair" value="crosshair"></html:option>
				<html:option label="pointer" value="pointer"></html:option>
				<html:option label="move" value="move"></html:option>
				<html:option label="e-resize" value="e-resize"></html:option>
				<html:option label="ne-resize" value="ne-resize"></html:option>
				<html:option label="nw-resize" value="nw-resize"></html:option>
				<html:option label="n-resize" value="n-resize"></html:option>
				<html:option label="se-resize" value="se-resize"></html:option>
				<html:option label="sw-resize" value="sw-resize"></html:option>
				<html:option label="s-resize" value="s-resize"></html:option>
				<html:option label="w-resize" value="w-resize"></html:option>
				<html:option label="text" value="text"></html:option>
				<html:option label="wait" value="wait"></html:option>
				<html:option label="help" value="help"></html:option>
			</html:select>													
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.float#}"/></html:td>
		<html:td >	
			<html:hidden id="float-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="float-code" name="itemCode" value="float"/>
			<html:hidden id="float-var" name="itemVar" value=""/>
			<html:select id="float-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="left" value="left"></html:option>
				<html:option label="center" value="center"></html:option>
				<html:option label="right" value="right"></html:option>
				<html:option label="top" value="top"></html:option>
				<html:option label="middle" value="middle"></html:option>
				<html:option label="bottom" value="bottom"></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.clear#}"/></html:td>
		<html:td >	
			<html:hidden id="clear-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="clear-code" name="itemCode" value="clear"/>
			<html:hidden id="clear-var" name="itemVar" value=""/>
			<html:select id="clear-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="left" value="left"></html:option>
				<html:option label="right" value="right"></html:option>
				<html:option label="both" value="both"></html:option>
				<html:option label="none" value="none"></html:option>
			</html:select>													
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.zindex#}"/></html:td>
		<html:td colspan="3">	
			<html:hidden id="z-index-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="z-index-code" name="itemCode" value="z-index"/>
			<html:text id="z-index-value" name="itemValue" styleClass="input-text" size="8"   value=""/>
			<html:hidden id="z-index-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('z-index');"/>
		</html:td>
		
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.top#}"/></html:td>
		<html:td >	
			<html:hidden id="top-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="top-code" name="itemCode" value="top"/>
			<html:text id="top-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			
			<html:hidden id="top-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('top');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.right#}"/></html:td>
		<html:td >	
			<html:hidden id="right-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="right-code" name="itemCode" value="right"/>
			<html:text id="right-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			<html:hidden id="right-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('right');"/>											
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.bottom#}"/></html:td>
		<html:td >	
			<html:hidden id="bottom-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="bottom-code" name="itemCode" value="bottom"/>
			<html:text id="bottom-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="bottom-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('bottom');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.dimension.positioin.left#}"/></html:td>
		<html:td >	
			<html:hidden id="left-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="left-code" name="itemCode" value="left"/>
			<html:text id="left-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="left-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('left');"/>											
		</html:td>
	</html:tr>
</html:table>