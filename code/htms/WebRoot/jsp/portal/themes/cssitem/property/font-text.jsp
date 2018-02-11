<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
			
<html:table name="cssPropertyTable" style="display:none;"  id="font-text-property" styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
	<html:tr>
		<html:td colspan="8" styleClass="edit-talbe-label" style="text-align:left"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.note#}"/></html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.fontserial#}"/></html:td>
		<html:td >	
			<html:hidden id="font-family-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="font-family-code" name="itemCode" value="font-family"/>	
			<html:text name="itemValue" id="font-family-value" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="font-family-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('font-family');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.blod#}"/></html:td>
		<html:td >	
			<html:hidden id="font-weight-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="font-weight-code" name="itemCode" value="font-weight"/>
			<html:hidden id="font-weight-var" name="itemVar" value=""/>
			<html:select  name="itemValue" id="font-weight-value">
				<html:option label=" " value=""></html:option>
				<html:option label="normal" value="normal"></html:option>
				<html:option label="bold" value="bold"></html:option>
				<html:option label="bolder" value="bolder"></html:option>
				<html:option label="lighter" value="lighter"></html:option>
				<html:option label="100" value="100"></html:option>
				<html:option label="200" value="200"></html:option>
				<html:option label="300" value="300"></html:option>
				<html:option label="400" value="400"></html:option>
				<html:option label="500" value="500"></html:option>
				<html:option label="600" value="600"></html:option>
				<html:option label="700" value="700"></html:option>
				<html:option label="800" value="800"></html:option>
				<html:option label="900" value="900"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>																									
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.size#}"/></html:td>
		<html:td >	
			<html:hidden id="font-size-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="font-size-code" name="itemCode" value="font-size"/>			
			<html:text name="itemValue" id="font-size-value" styleClass="input-text" size="12"   value="" />	
			<html:hidden id="font-size-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('font-size');"/>														
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.text.color#}"/></html:td>
		<html:td >	
			<html:hidden id="font-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="font-color-code" name="itemCode" value="font-color" />	
			<html:text name="itemValue" id="font-color-value" styleClass="input-text" size="12"   value=""  onclick="coloropen(this.id,this.id);"/>
				
			<html:hidden id="font-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('font-color');"/>															
		</html:td>
	</html:tr>
	<html:tr>
		
		
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.style#}"/></html:td>
		<html:td >	
			<html:hidden id="font-style-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="font-style-code" name="itemCode" value="font-style"/>
			<html:hidden id="font-style-var" name="itemVar" value=""/>
			<html:select  name="itemValue" id="font-style-value">
				<html:option label=" " value=""></html:option>
				<html:option label="normal" value="normal"></html:option>
				<html:option label="italic" value="italic"></html:option>
				<html:option label="oblique" value="oblique"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>													
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.variant#}"/></html:td>
		<html:td>	
			<html:hidden id="font-variant-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="font-variant-code" name="itemCode" value="font-variant"/>	
			<html:hidden id="font-variant-var" name="itemVar" value=""/>
			<html:select  name="itemValue" id="font-variant-value">
				<html:option label=" " value=""></html:option>
				<html:option label="normal" value="normal"></html:option>
				<html:option label="small-caps" value="small-caps"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>															
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.color#}"/></html:td>
		<html:td>	
			<html:hidden id="color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="color-code" name="itemCode" value="color" />	
			<html:text name="itemValue" id="color-value" styleClass="input-text" size="12"   value=""  onclick="coloropen(this.id,this.id);"/>
				
			<html:hidden id="font-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('color');"/>														
		</html:td>
	</html:tr>
	
	
	
	<html:tr>
		<html:td colspan="8" styleClass="edit-talbe-label" align="left">&nbsp;</html:td>
	</html:tr>
	<html:tr>
		
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.indent#}"/></html:td>
		<html:td >	
			<html:hidden id="text-indent-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="text-indent-code" name="itemCode" value="text-indent"/>			
			<html:text id="text-indent-value" name="itemValue" styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="text-indent-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('text-indent');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.letter.spacing#}"/></html:td>
		<html:td >	
			<html:hidden id="letter-spacing-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="letter-spacing-code" name="itemCode" value="letter-spacing"/>			
			<html:text id="letter-spacing-value" name="itemValue" styleClass="input-text" size="12"   value=""/>		
			<html:hidden id="letter-spacing-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('letter-spacing');"/>												
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.word.spacing#}"/></html:td>
		<html:td >	
			<html:hidden id="word-spacing-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="word-spacing-code" name="itemCode" value="word-spacing"/>			
			<html:text id="word-spacing-value"  name="itemValue"styleClass="input-text" size="12"   value=""/>	
			<html:hidden id="word-spacing-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('word-spacing');"/>														
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.whitespace#}"/></html:td>
		<html:td >	
			<html:hidden id="white-space-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="white-space-code" name="itemCode" value="white-space"/>	
			<html:hidden id="white-space-var" name="itemVar" value=""/>
			<html:select id="white-space-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="normal" value="normal"></html:option>
				<html:option label="pre" value="pre"></html:option>
				<html:option label="nowrap" value="nowrap"></html:option>
				<html:option label="pre-wrap" value="pre-wrap"></html:option>
				<html:option label="pre-line" value="pre-line"></html:option>				
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>															
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.decoration#}"/></html:td>
		<html:td >	
			<html:hidden id="text-decoration-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="text-decoration-code" name="itemCode" value="text-decoration"/>
			<html:hidden id="text-decoration-var" name="itemVar" value=""/>	
			<html:select  id="text-decoration-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="underline" value="underline"></html:option>
				<html:option label="overline" value="overline"></html:option>
				<html:option label="line-through" value="line-through"></html:option>
				<html:option label="blink" value="blink"></html:option>
			</html:select>															
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.transform#}"/></html:td>
		<html:td >	
			<html:hidden id="text-transform-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="text-transform-code" name="itemCode" value="text-transform"/>
			<html:hidden id="text-transform-var" name="itemVar" value=""/>	
			<html:select id="text-transform-value" name="itemValue" >
				<html:option label=" " value=""></html:option>
				<html:option label="none" value="none"></html:option>
				<html:option label="uppercase" value="uppercase"></html:option>
				<html:option label="lowercase" value="lowercase"></html:option>
				<html:option label="capitalize" value="capitalize"></html:option>
			</html:select>															
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.fonttext.font.direction#}"/></html:td>
		<html:td colspan="3">	
			<html:hidden id="direction-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="direction-code" name="itemCode" value="direction"/>	
			<html:hidden id="direction-var" name="itemVar" value=""/>
			<html:select id="direction-value" name="itemValue" >
				<html:option label=" " value=""></html:option>
				<html:option label="ltr" value="ltr"></html:option>
				<html:option label="rtl" value="rtl"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>															
		</html:td>
	</html:tr>
</html:table>