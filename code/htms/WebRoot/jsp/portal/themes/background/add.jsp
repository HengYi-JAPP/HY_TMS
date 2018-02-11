<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<script type="text/javascript">

function changeBgdType(type){
	if(type=='1'){
		document.getElementById("bgdContentColor").style.display='none';
		document.getElementById("bgdIconColor").style.display='none';
		
		document.getElementById("bgdContentImageDiv").style.display='block';
		document.getElementById("bgdIconImageDiv").style.display='block';
	}else{
		document.getElementById("bgdContentImageDiv").style.display='none';
		document.getElementById("bgdIconImageDiv").style.display='none';
		
		document.getElementById("bgdContentColor").style.display='block';
		document.getElementById("bgdIconColor").style.display='block';
	}
}
</script>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="bgdForm" name="bgdForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addBackground"/>
			<html:hidden id="bgdId" name="bgdId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.background.add.title") %>' name='title'/>
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.background.type#}"/></html:td>
					<html:td >
							<html:radio name="bgdType" id="bgdType"  value="1" checked="true" onclick="changeBgdType(this.value);"/><html:label label="{$jsp.portal.themes.background.image#}"/> <html:radio name="bgdType" id="bgdType"    value="2"  onclick="changeBgdType(this.value);"/> <html:label label="{$jsp.portal.themes.background.color#}"/>
					</html:td>
				</html:tr>
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.background.code#}"/></html:td>
					<html:td >
							<html:text name="bgdCode" id="bgdCode" styleClass="input-text" size="36" maxlength="60"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.background.name#}"/></html:td>
					<html:td >
							<html:text name="bgdName" id="bgdName" styleClass="input-text" size="36" maxlength="60"  value=""/>													
					</html:td>							
				</html:tr>
				<html:tr>	
					<html:td align="right" styleClass="edit-content-label"><html:label label="{$jsp.portal.themes.background.icon#}"/></html:td>
					<html:td>					
						<input name="bgdIcon" id="bgdIcon" class="input_text" type="hidden" size="36" />
						<html:div id="bgdIconImageDiv" >
							<com:simpleUpload fileId="bgdIcon"  isImage="true" ></com:simpleUpload>
						</html:div>
						<html:text name="bgdIconColor" id="bgdIconColor"  size="12" value="" style="display:none" onclick="coloropen(this.id,'bgdIcon');" onblur="document.getElementById('bgdIcon').value=this.value;"/>
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td align="right" styleClass="edit-content-label"><html:label label="{$jsp.portal.themes.background.background#}"/></html:td>
					<html:td>					
						<input name="bgdContent" id="bgdContent" class="input_text" type="hidden" size="36" />
						<html:div id="bgdContentImageDiv" >
							<com:simpleUpload fileId="bgdContent"  isImage="true" ></com:simpleUpload>
						</html:div>
						<html:text name="bgdContentColor" id="bgdContentColor"  size="12" value="" style="display:none" onclick="coloropen(this.id,'bgdContent');" onblur="document.getElementById('bgdContent').value=this.value;"/>
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.background.desc#}"/></html:td>
					<html:td >
							<html:textarea name="bgdDesc" id="bgdDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
				
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('bgdForm')"/>		
						<btn:return href="contoller.do?operation=listBackground"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>


	</body>
</html>
<com:loader   simpleUpload="true"/>
<script type="text/javascript" language="javascript">
<!--
var ColorHex=new Array('00','33','66','99','CC','FF')
var SpColorHex=new Array('FF0000','00FF00','0000FF','FFFF00','00FFFF','FF00FF')
var current=null
var inputcolor=null;
var setToValueId=null;
function initcolor(evt){
    var colorTable=''
    for (i=0;i<2;i++){
        for (j=0;j<6;j++){
            colorTable=colorTable+'<tr height=15>'
            colorTable=colorTable+'<td width=15 style="background-color:#000000">'
            if (i==0){
                colorTable=colorTable+'<td width=15 style="cursor:pointer;background-color:#'+ColorHex[j]+ColorHex[j]+ColorHex[j]+'" onclick="doclick(this.style.backgroundColor)">'
            }
            else{
                colorTable=colorTable+'<td width=15 style="cursor:pointer;background-color:#'+SpColorHex[j]+'" onclick="doclick(this.style.backgroundColor)">'
            }
            colorTable=colorTable+'<td width=15 style="background-color:#000000">'
            for (k=0;k<3;k++){
                for (l=0;l<6;l++){
                    colorTable=colorTable+'<td width=15 style="cursor:pointer;background-color:#'+ColorHex[k+i*3]+ColorHex[l]+ColorHex[j]+'" onclick="doclick(this.style.backgroundColor)">'
                }
            }
        }
    }
    colorTable='<table border="0" cellspacing="0" cellpadding="0" style="border:1px #000000 solid;border-bottom:none;border-collapse: collapse;width:337px;" bordercolor="000000">'
    +'<tr height=20><td colspan=21 bgcolor=#ffffff style="font:12px tahoma;padding-left:2px;">'
    +'<span style="float:left;color:#999999;"><%=tools.tool.getLocal("jsp.portal.themes.background.select.color") %></span>'
    +'<span style="float:right;padding-right:3px;cursor:pointer;" onclick="colorclose()"><%=tools.tool.getLocal("jsp.portal.themes.background.color") %></span>'
    +'</td></table>'
    +'<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="000000" style="cursor:pointer;">'
    +colorTable+'</table>';
    document.getElementById("colorpane").innerHTML=colorTable;
   // var current_x = document.getElementById(inputcolor).offsetLeft;
   // var current_y = document.getElementById(inputcolor).offsetTop;
   // document.getElementById("colorpane").style.left = current_x + "px";
   // document.getElementById("colorpane").style.top = current_y + "px";
}
function doclick(obj){
    document.getElementById(inputcolor).value=obj;
    document.getElementById(setToValueId).value=obj;
    document.getElementById("colorpane").style.display = "none";
}
function colorclose(){
    document.getElementById("colorpane").style.display = "none";
}
function coloropen(id,setId){
	inputcolor=id;
	setToValueId=setId;
    document.getElementById("colorpane").style.display = "";
}
window.onload = initcolor;
</script>		
<div id="colorpane" style="position:relative;z-index:999;display:none;margin-top:20px;top:-300px;left:200px"></div>