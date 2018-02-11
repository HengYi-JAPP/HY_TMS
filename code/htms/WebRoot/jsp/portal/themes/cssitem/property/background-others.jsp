<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
			
<html:table name="cssPropertyTable" style="display:none;" id="background-others-property" styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.background.color#}"/></html:td>
		<html:td >	
			<html:hidden id="background-color-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="background-color-code" name="itemCode" value="background-color"/>			
			<html:text name="itemValue" id="background-color-value" styleClass="input-text" size="12"   value=""  onclick="coloropen(this.id,this.id);"/>
				
			<html:hidden id="background-color-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('background-color');"/>													
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.background.image#}"/></html:td>
		<html:td >	
			<html:hidden id="background-image-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="background-image-code" name="itemCode" value="background-image"/>			
			<html:hidden name="itemValue" id="background-image-value"  value="" />
			<com:simpleUpload fileId="background-image-value" sortDir="themes/global/background" isImage="true"></com:simpleUpload>		
			<html:hidden id="background-image-var" name="itemVar" value="" />
			<html:img src="themes/website/green/images/console/config.png"  style="cursor:hand;" onclick="bindItemVars('background-image');"/>												
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.background.repeat#}"/></html:td>
		<html:td >	
			<html:hidden id="background-repeat-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="background-repeat-code" name="itemCode" value="background-repeat"/>
			<html:hidden id="background-repeat-var" name="itemVar" value=""/>			
			<html:select  name="itemValue" id="background-repeat-value">
				<html:option label=" " value=""></html:option>
				<html:option label="repeat" value="repeat"></html:option>
				<html:option label="repeat-x" value="repeat-x"></html:option>
				<html:option label="repeat-y" value="repeat-y"></html:option>
				<html:option label="no-repeat" value="no-repeat"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>													
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.background.position#}"/></html:td>
		<html:td >	
			<html:hidden id="background-position-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="background-position-code" name="itemCode" value="background-position"/>
			<html:hidden name="itemValue" id="background-position-value" value=""/>		
			<html:select  name="selectableItem" id="background-position-select" onchange="document.getElementById('background-position-value').value=this.value;">
				<html:option label=" " value=""></html:option>
				<html:option label="top left" value="top left"></html:option>
				<html:option label="top center" value="top center"></html:option>
				<html:option label="top right" value="top right"></html:option>
				<html:option label="center left" value="center left"></html:option>
				<html:option label="center center" value="center center"></html:option>
				<html:option label="center right" value="center right"></html:option>
				<html:option label="bottom left" value="bottom left"></html:option>
				<html:option label="bottom center" value="bottom center"></html:option>
				<html:option label="bottom right" value="bottom right"></html:option>
			</html:select>	
			<html:text name="otherPosistion" id="otherPosistion" styleClass="input-text" size="12"   value=""  onblur="document.getElementById('background-position-value').value=this.value;"/>
			<html:hidden id="background-position-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('background-position');"/>												
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.overflow#}"/></html:td>
		<html:td >	
			<html:hidden id="overflow-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="overflow-code" name="itemCode" value="overflow"/>
			<html:hidden id="overflow-var" name="itemVar" value=""/>		
			<html:select  name="itemValue" id="overflow-value">
				<html:option label=" " value=""></html:option>
				<html:option label="visible" value="visible"></html:option>
				<html:option label="hidden" value="hidden"></html:option>
				<html:option label="scroll" value="scroll"></html:option>
				<html:option label="auto" value="auto"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>															
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.overflow.item#}"/></html:td>
		<html:td >	
			<html:hidden id="overflow-x-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="overflow-x-code" name="itemCode" value="overflow-x"/>
			<html:hidden id="overflow-x-var" name="itemVar" value=""/>	
			X	
			<html:select  name="itemValue" id="overflow-x-value">
				<html:option label=" " value=""></html:option>
				<html:option label="visible" value="visible"></html:option>
				<html:option label="hidden" value="hidden"></html:option>
				<html:option label="scroll" value="scroll"></html:option>
				<html:option label="auto" value="auto"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>	
			Y			
			<html:hidden id="overflow-y-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="overflow-y-code" name="itemCode" value="overflow-y"/>
			<html:hidden id="overflow-y-var" name="itemVar" value=""/>		
			<html:select  name="itemValue" id="overflow-y-value">
				<html:option label=" " value=""></html:option>
				<html:option label="visible" value="visible"></html:option>
				<html:option label="hidden" value="hidden"></html:option>
				<html:option label="scroll" value="scroll"></html:option>
				<html:option label="auto" value="auto"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>													
		</html:td>
	</html:tr>
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.background.attachment#}"/></html:td>
		<html:td >	
			<html:hidden id="background-attachment-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="background-attachment-code" name="itemCode" value="background-attachment"/>
			<html:hidden id="background-attachment-var" name="itemVar" value=""/>		
			<html:select  name="itemValue" id="background-attachment-value">
				<html:option label=" " value=""></html:option>
				<html:option label="scroll" value="scroll"></html:option>
				<html:option label="fixed" value="fixed"></html:option>
				<html:option label="inherit" value="inherit"></html:option>
			</html:select>															
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.media#}"/></html:td>
		<html:td >	
			<html:hidden id="@media-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="@media-code" name="itemCode" value="@media"/>
			<html:hidden id="@media-var" name="itemVar" value=""/>	
			<html:select id="@media-value" name="itemValue">
				<html:option label=" " value=""></html:option>
				<html:option label="all" value="all"></html:option>
				<html:option label="aural" value="aural"></html:option>
				<html:option label="braille" value="braille"></html:option>
				<html:option label="embossed" value="embossed"></html:option>
				<html:option label="handheld" value="handheld"></html:option>
				<html:option label="print" value="print"></html:option>
				<html:option label="projection" value="projection"></html:option>
				<html:option label="screen" value="screen"></html:option>
				<html:option label="tty" value="tty"></html:option>
				<html:option label="tv" value="tv"></html:option>
			</html:select>										
		</html:td>
	</html:tr>
	
	<html:tr>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.opacity#}"/></html:td>
		<html:td >	
			<html:hidden id="opacity-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="opacity-code" name="itemCode" value="opacity"/>
			<html:text id="opacity-value" name="itemValue" styleClass="input-text" size="8"   value=""/>
			<html:hidden id="opacity-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('opacity');"/>
		</html:td>
		<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.filter#}"/></html:td>
		<html:td >	
			<html:hidden id="filter-id" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden id="filter-code" name="itemCode" value="filter"/>
			<html:hidden id="filter-value" name="itemValue"   value=""/>
			<html:text id="filter-value-show"  styleClass="input-text" size="8"   value="" onblur="document.getElementById('filter-value').value='progid:DXImageTransform.Microsoft.alpha(opacity='+this.value+')';"/>
			<html:hidden id="filter-var" name="itemVar" value=""/>
			<html:img src="themes/website/green/images/console/config.png" style="cursor:hand;" onclick="bindItemVars('filter');"/>
		</html:td>
	</html:tr>
	<html:tr>
   <html:td colspan="4">
   <p><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note1#}"/></p>
   <p><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note2#}"/></p>
   <p><html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note3#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note4#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note5#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note6#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note7#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note8#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note9#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note10#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note11#}"/>
	<html:label label="{$jsp.portal.themes.cssitem.additems.background.others.others.note12#}"/></p>
   </html:td>
   </html:tr>
</html:table>
<com:loader   simpleUpload="true"/>