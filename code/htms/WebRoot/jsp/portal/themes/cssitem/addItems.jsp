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
<style type="text/css">
.cssTab{
height:38px;
text-align:center;
vertical-align:middle;
background:#787878;
}
</style>
</head>
<body>
<script type="text/javascript">
var lastCardId = null;
function selectCssCard(cardId){
	var cssPropertyTables = document.getElementsByName("cssPropertyTable");
	for(var i=0;i<cssPropertyTables.length;i++){
		cssPropertyTables[i].style.display="none";
	}
	
	document.getElementById(cardId+"-property").style.display="block";
	document.getElementById(cardId).style.backgroundColor="#cccccc";
	if(lastCardId&&lastCardId!=cardId){
		document.getElementById(lastCardId).style.backgroundColor="#787878";
	}
	lastCardId=cardId;
}

 name="cssPropertyTable";
 </script>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css" validator="true"/>
<com:loader myWin="true"/>	
<script type="text/javascript">
function bindItemVars(itemCode){
	var themesId =document.getElementById("themesId").value;
	var itemCodeValue =document.getElementById(itemCode+"-var").value;
	//alert(itemCode+'='+itemCodeValue);
	var winParams ={
		winId:'_pickLinkTypeManageWin',
		title:'<%=tools.tool.getLocal("jsp.portal.themes.cssitem.additems.bind.var") %>',
		content:'<%=basePath%>contoller.do?operation=toLoadThemesParams&itemCode='+itemCode+'&itemCodeValue='+itemCodeValue+'&themesId='+themesId,
		intLeft:50 ,
		intTop:50 ,
		intWidth:800 ,
		intHeight:400,
		isResize: true,
		isFullScreen: false
	};
	__myWin.createWebWindow(winParams);
	
}

</script>
<html:form id="itemForm" name="itemForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addBatchCssItems"/>
			<html:hidden id="themesId" name="themesId" value="themesId"/>
			<html:hidden id="ownerId" name="ownerId" value="ownerId"/>
			<html:hidden id="ownderType" name="ownderType" value="ownderType"/>
			<html:hidden id="cssId" name="cssId" value="cssId"/>
			<html:hidden id="itemId" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.cssitem.add.title") %>' name='title'/>			
			</jsp:include>
			<!-- 
			
			样式：
			1）边距：上、下、左、右；边框：上、下、左、右（线）
			
			 -->
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				<html:tr>
					<html:td onclick="selectCssCard(this.id);"  id="font-text" styleClass="cssTab"><html:label label="{$jsp.portal.themes.cssitem.text.title#}{$jsp.portal.themes.cssitem.font.title#}"/></html:td>
					<html:td onclick="selectCssCard(this.id);"  id="dimension-position" styleClass="cssTab"><html:label label="{$jsp.portal.themes.cssitem.dimension.title#}{$jsp.portal.themes.cssitem.position.title#}"/></html:td>
					<html:td onclick="selectCssCard(this.id);"  id="border-outline" styleClass="cssTab"><html:label label="{$jsp.portal.themes.cssitem.border.title#}{$jsp.portal.themes.cssitem.outline.title#}"/></html:td>					
					<html:td onclick="selectCssCard(this.id);"  id="margin-padding" styleClass="cssTab"><html:label label="{$jsp.portal.themes.cssitem.margin.title#}{$jsp.portal.themes.cssitem.padding.title#}"/></html:td>
					<html:td onclick="selectCssCard(this.id);"  id="table-list" styleClass="cssTab"><html:label label="{$jsp.portal.themes.cssitem.table.title#}{$jsp.portal.themes.cssitem.list.title#}"/></html:td>
					<html:td onclick="selectCssCard(this.id);"  id="background-others" styleClass="cssTab"><html:label label="{$jsp.portal.themes.cssitem.background.title#}{$jsp.portal.themes.cssitem.others.title#}"/></html:td>
				</html:tr>
				<html:tr>
					<html:td colspan="12" style="width:100%;height:100%;">
					<!-- 字体文本-->
					<jsp:include page="property/font-text.jsp"></jsp:include>
					<!-- 尺寸定位-->
					<jsp:include page="property/dimension-position.jsp"></jsp:include>
					<!-- 边框轮廓-->
					<jsp:include page="property/border-outline.jsp"></jsp:include>
					<!-- 内外边距-->
					<jsp:include page="property/margin-padding.jsp"></jsp:include>
					<!-- 表格列表-->
					<jsp:include page="property/table-list.jsp"></jsp:include>
					<!-- 背景其他-->
					<jsp:include page="property/background-others.jsp"></jsp:include>
					
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('itemForm')"/>		
						<btn:return href="contoller.do?operation=listCss&ownerId=$[ownerId]&cssId=$[cssId]&ownderType=$[ownderType]&themesId=$[themesId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>


	</body>
</html>
<script type="text/javascript">
<!--
selectCssCard("font-text");
//-->
</script>
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
    +'<span style="float:left;color:#999999;"><%=tools.tool.getLocal("jsp.portal.themes.cssitem.additems.select.color") %></span>'
    +'<span style="float:right;padding-right:3px;cursor:pointer;" onclick="colorclose()"><%=tools.tool.getLocal("jsp.portal.themes.cssitem.additems.close") %></span>'
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
<script type="text/javascript">
<!--
var itemsArray=[];
<logic:for  beanCollectionsName="__cssItemList" currBeanName="itemBean">
itemsArray[itemsArray.length]={itemId:'<html:value value="itemBean.itemId"/>',itemCode:'<html:value value="itemBean.itemCode"/>',itemValue:'<html:value value="itemBean.itemValue"/>',itemVar:'<html:value value="itemBean.itemVar"/>'};
</logic:for>

function initItems(){
	var itemId,itemCode,itemValue,itemVar,tempElement;
	for(var i=0;i<itemsArray.length;i++){
		itemId = itemsArray[i].itemId;
		itemCode = itemsArray[i].itemCode;
		itemValue = itemsArray[i].itemValue;
		itemVar= itemsArray[i].itemVar
		tempElement=document.getElementById(itemCode+"-id");
		if(tempElement){
			tempElement.value=itemId;
		}
		
		tempElement=document.getElementById(itemCode+"-code");
		if(tempElement){
			tempElement.value=itemCode;
		}
		
		tempElement=document.getElementById(itemCode+"-value");
		if(tempElement){
			tempElement.value=itemValue;
			//alert(tempElement.id+":"+tempElement.value);
		}
		tempElement=document.getElementById(itemCode+"-select");
		if(tempElement){
			tempElement.value=itemValue;
		}
		
		tempElement=document.getElementById(itemCode+"-var");
		if(tempElement){
			tempElement.value=itemVar;
		}
		
		
		
		tempElement=document.getElementById(itemCode+"-value_Display");
		if(tempElement){
			tempElement.src=itemValue;
		}
		tempElement=document.getElementById(itemCode+"-value_Span");
		if(tempElement){
			tempElement.style.display="block";
		}
		
	}
}

initItems();
//-->
</script>
