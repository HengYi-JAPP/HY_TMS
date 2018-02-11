<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%
String currentSysCode=  request.getParameter("currentSysCode");
RequestHelper helper = new RequestHelper(request);
String basePath = helper.getBasePath();
String template = (String)helper.getValue(PropKey.__CURRENT_LAYOUT_TAG+".layoutTempl");

%>
<com:loader  ajax="true"  myWin="true"/>
<script src="<%=basePath %>js/portal/pdrag-common.js" type="text/javascript"></script> 
<script src="<%=basePath %>js/portal/pdrag-layout.js" type="text/javascript"></script> 
<script src="<%=basePath %>js/portal/pdrag-layout-unit.js" type="text/javascript"></script> 
<script src="<%=basePath %>js/portal/pdrag-portlet.js" type="text/javascript"></script>
<script src="<%=basePath %>js/portal/pdrag-mover.js" type="text/javascript"></script>
<script src="<%=basePath %>js/portal/portal-personalizer.js" type="text/javascript"></script> 

<portal:layout loadColumns="true" personalizer="personalizer" scope="session"/>

<script language="javascript" type="text/javascript">
<!--
//获得当前时间,刻度为一千分一秒
var initializationTime=(new Date()).getTime();
function showLeftTime()
{
var now=new Date();
var hours=now.getHours();
var minutes=now.getMinutes();
var seconds=now.getSeconds();
document.getElementById('hmsTime').innerHTML=" "+hours+":"+minutes+":"+seconds+"";
//一秒刷新一次显示时间
var timeID=setTimeout(showLeftTime,1000);
}
//-->
</script>
<!-- 
布局加载
布局有两种类型：
1）单一布局：一个页面一个布局；
2）组合布局：由多个布局页面组合而成的布局，暂未处理；
组合布局涉及多个布局之间栏目对应关系的变化，处理比较复杂。
建议遵从：只能在同一布局拖曳栏目的原则；此时，组合布局的加载可以在上层实现，这样处理相对简单。

 -->
<style>
table{
	margin:0;
	padding:0;
	border:0;
	vertical-align:top;	
	border-collapse:collapse;
	border-spacing:0; 
}
table td{
	vertical-align:top;
	padding:0;
}
</style>
<portal:themes/>
<script src="<%=basePath %>js/portal/portal-loader.js" type="text/javascript"></script>
<body style="margin:0 auto;border:1px solid #dfdfdf;padding:0px;background:#fff;padding-left:10px;padding-right:10px;" onload="showLeftTime()"  onmousemove="personalizer.showPosition();">
<html:table styleClass="layout-box">
	<!-- 可选择布局列表 -->
   	<html:tr styleClass="layout-list-box">
   		<html:td styleClass="layout-list-box-left"></html:td>
   		<html:td styleClass="layout-list-box-middle" >
   			<html:div styleClass="layout-list-box-time-box">
   				<html:span><%=tools.tool.DateUtil.getEnglishDate(null,"dd-MMMM-yyyy",true) %><html:span id="hmsTime">&nbsp;</html:span></html:span>
   			</html:div>
   			<html:div styleClass="layout-list-box-layout-box">
   				<html:div styleClass="layout-list-box-layout-box-title"><html:value value="{$jsp.portal.console.layout.user.selectable#}"/></html:div>
   				<logic:for beanCollectionsName="<%=PropKey.__LAYOUT_LIST_TAG%>" currBeanName="layoutBean">
   						<logic:if condition="$[layoutBean.layoutId]==$[__layoutId]">
   							<html:div name="__selectableLayout" id="$[layoutBean.layoutId]" onclick="selectLayout(this.id,$[currentSysCode]);" styleClass="layout-list-box-layout-box-layout-selected">
   								<html:value value="$[layoutBean.layoutName]"></html:value>
   							</html:div>
   						</logic:if>
   						<logic:if condition="$[layoutBean.layoutId]!=$[__layoutId]">
   							<html:div name="__selectableLayout" id="$[layoutBean.layoutId]" onclick="selectLayout(this.id,'$[currentSysId]','$[currentSysCode]','$[currentChannelId]');" styleClass="layout-list-box-layout-box-layout">
   								<html:value value="$[layoutBean.layoutName]"></html:value>
   							</html:div>
   						</logic:if>
   				</logic:for>
   				<html:div styleClass="layout-list-box-layout-box-layout"  onclick="__myWin.createWebWindow({winId:'userLayoutMangerWind',title:'{$jsp.portal.website.personalize.layout.config#}',content:'$[basePath]contoller.do?operation=loadUserPersonalizeLayoutList&currentSysCode=$[currentSysCode]&sysId=$[currentSysId]&channelId=$[currentChannelId]',intLeft:10 ,intTop:10 ,intWidth:1024 ,intHeight:600,isResize: true,isFullScreen: false});">
   						+&nbsp;
   				</html:div>
   				<html:div styleClass="layout-list-box-layout-box-layout"  onclick="__myWin.createWebWindow({winId:'userLayoutColumnDefineWind',title:'{$jsp.portal.console.layout.designer.design#}',content:'$[basePath]contoller.do?operation=loadColumns4UserLayoutDesign&layoutId=$[__layoutId]&currentSysCode=$[currentSysCode]&sysId=$[currentSysId]&channelId=$[channelId]&isDirect=true',intLeft:10 ,intTop:10 ,intWidth:1024 ,intHeight:600,isResize: true,isFullScreen: false});">
   						<html:value value="{$website.jsp.specify.layoutloader.define#}"/>&nbsp;
   				</html:div>
   				<html:div styleClass="layout-list-box-layout-box-layout">
   					<html:a href="javascript:void(0);" onclick="resetLayoutColumn()" title="Reset"><html:value value="{$website.jsp.specify.layoutloader.reset#}"/></html:a>
   				</html:div>
   			</html:div>
		</html:td>
   		<html:td styleClass="layout-list-box-right"></html:td>
   	</html:tr>  
   	<!-- 布局加载器 -->
   	<html:tr styleClass="layout-loader-box">
   		<html:td styleClass="layout-loader-box-left">
   		</html:td>
   		
   		<html:td styleClass="layout-loader-box-middle" >
				<jsp:include page="<%=template %>">
						<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
				</jsp:include>	
		</html:td>
   		<html:td styleClass="layout-loader-box-right">
		</html:td>
   	</html:tr>  
</html:table>

</body>
<script>
	/*
	 * 由于前面默认加载的未能加载，在这里再加载一次
	 */
	 if(personalizer){personalizer.reSize();}
</script>