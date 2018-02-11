<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="java.util.*"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	//List defineParamsValueList = (List)request.getSession().getAttribute("defineParamsValueList");
	//System.out.println("page.....ParamsBusiness[beforeDefineParamsValue]:defineParamsValueList.size()=="+(defineParamsValueList==null?"null":defineParamsValueList.size()));
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="paramsForm" name="paramsForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="addThemesParamsValueByParamsId"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
		
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.defvar.define.param.title") %>' name='title'/>
			
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="true" name="hideSearchBanner"/>
		</jsp:include>
	
		
	
		
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="defineParamsValueList" bean="paramsBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td  label="{$jsp.portal.themes.defvar.define.param.var#}"  property="tdtName"  width="100px"/>
				<html:td  label="{$jsp.portal.themes.defvar.define.param.code#}"  property="tdtCode"  width="100px"/>
				
				<html:td label="{$jsp.portal.themes.defvar.define.param.value#}" >
					<logic:if equal="paramsType,texttype">
						<html:text name="valueContent" id="valueContent" value="paramsBean.valueContent" maxlength="30" styleClass="input_text" defaultValue=" "/>
					</logic:if>
					
					<logic:if equal="paramsType,imagetype">
						<html:hidden name="valueContent" id="$[paramsBean.valueId]" value="paramsBean.valueContent" />
						<com:simpleUpload fileId="$[paramsBean.valueId]" viewPath="paramsBean.valueContent" isImage="true"></com:simpleUpload>
					</logic:if>
					
					<logic:if equal="paramsType,colortype">
						<html:text name="valueContent" id="$[paramsBean.valueId]" styleClass="input-text" size="12"   value="paramsBean.valueContent"  onclick="coloropen(this.id,this.id);"/>
					</logic:if>
					<logic:if equal="paramsType,fonttype">
						<html:text name="valueContent" id="valueContent" value="paramsBean.valueContent" maxlength="30" styleClass="input_text" defaultValue=" "/>
					</logic:if>
					
					<html:hidden id="paramsId" name="paramsId" value="paramsBean.paramsId"/>
					<html:hidden id="valueId" name="valueId" value="paramsBean.valueId"/>
					<html:hidden id="tdtId" name="tdtId" value="paramsBean.tdtId"/>
				</html:td>
				<html:td label="{$jsp.portal.themes.defvar.define.param.desc#}" >
					<html:text name="valueDesc" id="valueDesc" value="paramsBean.valueDesc" maxlength="30" styleClass="input_text" defaultValue=" "/>
				</html:td>
				
			</html:tr>
		</html:table>	
		<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('paramsForm')"/>		
						<btn:return href="contoller.do?operation=listThemesParams&themesId=$[themesId]"/>								
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
    +'<span style="float:left;color:#999999;"><%=tools.tool.getLocal("jsp.portal.themes.defvar.define.param.select.color") %></span>'
    +'<span style="float:right;padding-right:3px;cursor:pointer;" onclick="colorclose()"><%=tools.tool.getLocal("jsp.portal.themes.defvar.define.param.close") %></span>'
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
itemsArray[itemsArray.length]={itemId:'<html:value value="itemBean.itemId"/>',itemCode:'<html:value value="itemBean.itemCode"/>',itemValue:'<html:value value="itemBean.itemValue"/>'};
</logic:for>

function initItems(){
	var itemId,itemCode,itemValue,tempElement;
	for(var i=0;i<itemsArray.length;i++){
		itemId = itemsArray[i].itemId;
		itemCode = itemsArray[i].itemCode;
		itemValue = itemsArray[i].itemValue;
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
		}
	}
}

//-->
</script>