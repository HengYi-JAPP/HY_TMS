<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
			
<html:table name="cssPropertyTable"  style="display:none;" id="margin-padding-property" styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
	<html:tr>
		<html:td colspan="12" styleClass="edit-talbe-label" style="text-align:left;"><html:label label="{$jsp.portal.console.plugin.news.title#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.padding#}"/></html:td>
		<html:td  colspan="7">	
			<html:hidden id="padding-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="padding-code" name="itemCode" value="padding"/>	
			<html:text id="padding-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="padding-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('padding');"/>
			<html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.paddingnote#}"/>
		</html:td>
	</html:tr>
	
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.padding.top#}"/></html:td>
		<html:td >	
			<html:hidden id="padding-top-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="padding-top-code" name="itemCode" value="padding-top"/>
			<html:text id="padding-top-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="padding-top-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('padding-top');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.padding.right#}"/></html:td>
		<html:td >	
			<html:hidden id="padding-right-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="padding-right-code" name="itemCode" value="padding-right"/>
			<html:text id="padding-right-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="padding-right-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('padding-right');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.padding.bottom#}"/></html:td>
		<html:td >	
			<html:hidden id="padding-bottom-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="padding-bottom-code" name="itemCode" value="padding-bottom"/>
			<html:text id="padding-bottom-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			<html:hidden id="padding-bottom-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('padding-bottom');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.padding.left#}"/></html:td>
		<html:td >	
			<html:hidden id="padding-left-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="padding-left-code" name="itemCode" value="padding-left"/>
			<html:text id="padding-left-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="padding-left-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('padding-left');"/>											
		</html:td>
	</html:tr>
	<html:tr>
		<html:td colspan="8" styleClass="edit-talbe-label" style="text-align:left;"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.margin.note#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.margin#}"/></html:td>
		<html:td colspan="7">	
			<html:hidden id="margin-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="margin-code" name="itemCode" value="margin"/>	
			<html:text id="margin-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			<html:hidden id="margin-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('margin');"/><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.marginnote#}"/>	
		</html:td>
	</html:tr>
	
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.margin.top#}"/></html:td>
		<html:td >	
			<html:hidden id="margin-top-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="margin-top-code" name="itemCode" value="margin-top"/>
			<html:text id="margin-top-value" name="itemValue" styleClass="input-text" size="8"   value=""/>		
			<html:hidden id="margin-top-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('margin-top');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.margin.right#}"/></html:td>
		<html:td >	
			<html:hidden id="margin-right-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="margin-right-code" name="itemCode" value="margin-right"/>
			<html:text id="margin-right-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			<html:hidden id="margin-right-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('margin-right');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.margin.bottom#}"/></html:td>
		<html:td >	
			<html:hidden id="margin-bottom-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="margin-bottom-code" name="itemCode" value="margin-bottom"/>
			<html:text id="margin-bottom-value" name="itemValue" styleClass="input-text" size="8"   value=""/>	
			<html:hidden id="margin-bottom-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('margin-bottom');"/>											
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.margin.padding.margin.left#}"/></html:td>
		<html:td >	
			<html:hidden id="margin-left-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="margin-left-code" name="itemCode" value="margin-left"/>
			<html:text id="margin-left-value" name="itemValue" styleClass="input-text" size="8"   value=""/>
			<html:hidden id="margin-left-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('margin-left');"/>												
		</html:td>
	</html:tr>
</html:table>