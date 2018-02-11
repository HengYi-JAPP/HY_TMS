<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%
String currentSysCode=  request.getParameter("currentSysCode");
String currentSysId=  request.getParameter("currentSysId");

String basePath = RequestHelper.getBasePath(request);
String channelLoaderPath =basePath+ "jsp/wsites/"+currentSysCode+"/loader/channelLoader.jsp?currentSysCode="+currentSysCode+"&currentSysId="+currentSysId;
channelLoaderPath =tools.tool.fillParams(channelLoaderPath,request);

/*在加载新页的路径为空时，加载第一个频道的页面*/
String newPageContentUrl = request.getParameter("newPageContentUrl");
String initLoadCode = newPageContentUrl==null||"".equals(newPageContentUrl.trim())||"null".equalsIgnoreCase(newPageContentUrl.trim())?PropKey.__CURRENT_CHANNEL_ID_TAG:null;

%>

<com:loader   ajax="true"/>
<com:loader js="resources/menus/channelmenu/js/channelmenu.js"/>
<script src="<%=basePath %>js/portal/portal-loader.js" type="text/javascript"></script>
<portal:channel channelList="true" currentChannel="true" scope="session"/>

<html:table styleClass="global-body-banner" >
   	<html:tr>
   		<!-- 内容体[频道导航部分][左部] -->
   		<html:td id="banner-left" styleClass="global-body-banner-left"></html:td>
   		<!-- 内容体[频道导航部分][中部] -->
   		<html:td id="banner-middle"  styleClass="global-body-banner-middle">
   			<html:div styleClass="channel-box">
   				<html:div styleClass="channel-box-cell">
   					<com:channelMenu loader="__channelLoader" menuName="portalChannel"   initLoadCode="<%=initLoadCode%>" refIdName="channelId" isConfig="true" configEvent="__myWin.createWebWindow({winId:'channlePersonalized',title:'{$jsp.portal.website.personalize.channel.config#}',content:'$[basePath]contoller.do?operation=loadChannelPersonalizeList&currentSysCode=$[currentSysCode]&sysId=$[currentSysId]',intLeft:100 ,intTop:100 ,intWidth:1024,intHeight:400,isResize: true,isFullScreen: false});" configBoxStyle="cmenu-config" channelBoxClass="cmenu-box" channelItemBoxClass="cmenu-item-box">
						<com:menuItem menuList="<%=PropKey.__CHANNEL_LIST_TAG%>" name="channelName" parentCode="parentId" onclick="selectChannel(this.id);" code="channelId" beforeIcon="beforeIcon" afterIcon="afterIcon" link="<%=channelLoaderPath %>"   showHeight="showHeight"
						
						channelItemBoxClass="cmenu-item-name-box" 
						channelItemNameBoxClass="cmenu-item-name-box" 
						channelItemNameIndentBoxClass="cmenu-item-name-indent-box" 
						channelItemNameBeforeIconBoxClass="cmenu-item-name-before-icon-box" 
						channelItemNameBeforeIconClass="cmenu-item-name-before-icon" 
						channelItemNameTextBoxClass="cmenu-item-name-text-box" 
						channelItemNameTextClass="cmenu-item-name-text" 
						channelItemNameAfterIconBoxClass="cmenu-item-name-after-icon-box" 
						channelItemNameAfterIconClass="cmenu-item-name-after-icon"
						channelItemSelected="cmitem-selected"
						
						subMenuBoxClass="cmsubmenu-box"
						subMenuItemBoxClass="cmsubmenu-item-box"
						subMenuItemNameBoxClass="cmsubmenu-item-name-box" 
						subMenuItemNameIndentBoxClass="cmsubmenu-item-name-indent-box" 
						subMenuItemNameBeforeIconBoxClass="cmsubmenu-item-name-before-icon-box" 
						subMenuItemNameBeforeIconClass="cmsubmenu-item-name-before-icon" 
						subMenuItemNameTextBoxClass="cmsubmenu-item-name-text-box" 
						subMenuItemNameTextClass="cmsubmenu-item-name-text" 
						subMenuItemNameAfterIconBoxClass="cmsubmenu-item-name-after-icon-box" 
						subMenuItemNameAfterIconClass="cmsubmenu-item-name-after-icon"
						subMenuItemSelected="cmsubmenu-selected"
						itemHover="cm-item-hover"
						
						onmouseover="portalChannel.moveHover(this.id)"
						/>
					</com:channelMenu>
   				</html:div>
   				<html:div styleClass="channel-box-cell"></html:div>
   			</html:div>
		</html:td>
		
   		<!-- 内容体[频道导航部分][右部] -->
   		<html:td id="banner-right" styleClass="global-body-banner-right"></html:td>
   	</html:tr>  
</html:table>
<%

//request.removeAttribute("account");
//request.removeAttribute("userId");
//request.getSession().removeAttribute("account");
//request.getSession().removeAttribute("userId");
 %>
