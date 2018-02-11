<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="consts.PropKey"%>

<%@page import="com.mobilecn.utils.RequestHelper"%>
<%
RequestHelper requestHelper = new RequestHelper(request);
String basePath = requestHelper.getBasePath();
String currentSysCode=  request.getParameter("currentSysCode");

%>
   <base href="<%=basePath%>">
<com:loader js="js/iframe-resize.js"/>
<script src="<%=basePath %>js/portal/portal-loader.js" type="text/javascript"></script>

<style>
table{border-collapse:collapse; border-spacing:0;}
</style>
<portal:themes/>
<portal:channel channelList="true" currentChannel="true" scope="session"/>
<com:loader ajax="true" js="resources/menus/channelmenu/js/channelmenu.js"/>

	<!-- 频道加载器，展示频道的可选布局，同时加载选中布局 -->
<html:table styleClass="sub-channel">
	  <!-- 频道加载器[头部]-->
	<html:tr>
		<html:td id="sub-channel-header-box" styleClass="sub-channel-header-box" align="left" valign="top">
			<html:table   id="sub-channel-header" styleClass="sub-channel-header" align="left" valign="top">
				 <html:tr >
				 	<!-- 频道加载器[头部][左部] -->
				 	<html:td id="sub-channel-header-left" styleClass="sub-channel-header-left"></html:td>
				 	<!-- 频道加载器[头部][中部] -->
				 	<html:td id="sub-channel-header-middle"  styleClass="sub-channel-header-middle">
				 	</html:td>
						<!-- 频道加载器[头部][右部] -->
				 	<html:td id="sub-channel-header-right" styleClass="sub-channel-header-right"></html:td>
				 </html:tr> 
	 		</html:table>
		 </html:td>
	 </html:tr>
	 
	 <!-- 频道加载器[主体部分]-->
	<html:tr>
		<html:td id="sub-channel-body-box" styleClass="sub-channel-body-box" align="left" valign="top">
			<html:table   id="sub-channel-body" styleClass="sub-channel-body" align="left" valign="top">
				 <html:tr >
				 	<!-- 频道加载器[主体部分][左部] -->
				 	<html:td id="sub-channel-body-left" styleClass="sub-channel-body-left"></html:td>
				 	<!-- 频道加载器[主体部分][中部] -->
				 	<html:td id="sub-channel-body-middle"  styleClass="sub-channel-body-middle" valign="top">
				 			<html:table   id="sub-channel-content" styleClass="sub-channel-content" align="left" valign="top">
				 				<html:tr >
									<!-- 频道加载器[导航部分][左部](菜单) -->
									<html:td id="sub-channel-navigation-left" styleClass="sub-channel-navigation-left" colspan="3">		
													<jsp:include page="../common/navigation.jsp">
														<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
													</jsp:include>		 	
									</html:td>
									<!-- 频道加载器[导航部分][中部]（内容加载） -->
									<!--html:td id="sub-channel-navigation-middle"  styleClass="sub-channel-navigation-middle">
									
									<--/html:td-->
									<!-- 频道加载器[导航部分][右部](预留) -->
									<!--html:td id="sub-channel-navigation-right" styleClass="sub-channel-navigation-right"><--/html:td-->
								</html:tr> 
								 <html:tr style="border:0px;">
								 	<!-- 频道加载器[主体部分][左部](菜单) -->
								 	<html:td id="sub-channel-content-left" styleClass="sub-channel-content-left" valign="top">									 	
									 	<html:table  id="sub-channel-menus" styleClass="sub-channel-menus" align="left" valign="top">
												<html:tr styleClass="sub-channel-menus-top" >
													<!-- 频道加载器[菜单][上部] -->
													<html:td id="sub-channel-menus-top" styleClass="sub-channel-menus-top"></html:td>
												</html:tr> 
												<html:tr >
													<!-- 频道加载器[菜单][中部]-->
													<html:td id="sub-channel-menus-middle"  styleClass="sub-channel-menus-middle" valign="top">
															<com:channelMenu loader="__subChannelLoader" menuName="portalSubChannel"   initLoadCode="<%=PropKey.__CURRENT_CHANNEL_ID_TAG %>" refIdName="channelId" isSubMenus="true"  channelBoxClass="pscmsubmenu-box" channelItemBoxClass="pscmsubmenu-item-box">
																<com:menuItem menuList="<%=PropKey.__CHANNEL_LIST_TAG%>" name="channelName" parentCode="parentId" onclick="selectChannel(this.id); "  code="channelId" beforeIcon="beforeIcon" afterIcon="afterIcon" link="channelUrl"  showHeight="showHeight"
																channelItemBoxClass="pscmenu-item-name-box" 
																channelItemNameBoxClass="pscmenu-item-name-box" 
																channelItemNameIndentBoxClass="pscmenu-item-name-indent-box" 
																channelItemNameBeforeIconBoxClass="pscmenu-item-name-before-icon-box" 
																channelItemNameBeforeIconClass="pscmenu-item-name-before-icon" 
																channelItemNameTextBoxClass="pscmenu-item-name-text-box" 
																channelItemNameTextClass="pscmenu-item-name-text" 
																channelItemNameAfterIconBoxClass="pscmenu-item-name-after-icon-box" 
																channelItemNameAfterIconClass="pscmenu-item-name-after-icon"
																channelItemSelected="pscmenu-selected"
																
																subMenuBoxClass="pscmsubmenu-box"
																subMenuItemBoxClass="pscmsubmenu-item-box"
																subMenuItemNameBoxClass="pscmsubmenu-item-name-box" 
																subMenuItemNameIndentBoxClass="pscmsubmenu-item-name-indent-box" 
																subMenuItemNameBeforeIconBoxClass="pscmsubmenu-item-name-before-icon-box" 
																subMenuItemNameBeforeIconClass="pscmsubmenu-item-name-before-icon" 
																subMenuItemNameTextBoxClass="pscmsubmenu-item-name-text-box" 
																subMenuItemNameTextClass="pscmsubmenu-item-name-text" 
																subMenuItemNameAfterIconBoxClass="pscmsubmenu-item-name-after-icon-box" 
																subMenuItemNameAfterIconClass="pscmsubmenu-item-name-after-icon"
																subMenuItemSelected="pscmsubmenu-selected"
																itemHover="pscmsubmenu-item-hover"
																
																onmouseover="portalSubChannel.moveHover(this.id)"
																/>
															</com:channelMenu>	
															
															<script type="text/javascript" language="javascript"> 
																function reNavigate(){
																	//alert( "navnavnav: " );
																	if(!portalSubChannel){
																		return null;
																	}
																	portalSubChannel.reNavigate();
																	var nav ="";
																	for(var i=portalSubChannel.navigation.length-1;i>=0;i--){
																		if(i<portalSubChannel.navigation.length-1){
																			nav=nav+">";
																		}
																		nav=nav+portalSubChannel.navigation[i];
																	}
																	//alert( "navnavnav: " + nav);
																	document.getElementById("navigateChannel").innerHTML=nav;
																}
															</script>										
													</html:td>
												</html:tr> 
												<html:tr styleClass="sub-channel-menus-bottom">
													<!-- 频道加载器[菜单][下部](预留) -->
													<html:td id="sub-channel-menus-bottom" styleClass="sub-channel-menus-bottom"></html:td>
												</html:tr> 
											</html:table>
								 	</html:td>
								 	
								 	<!-- 频道加载器[主体部分][中部]（内容加载） -->
								 	<html:td id="sub-channel-content-middle"  styleClass="sub-channel-content-middle">	
								 		<html:table   id="sub-channel-content-box" styleClass="sub-channel-content-box" align="left" valign="top">
											 <html:tr >
											 	<!-- 频道加载器[头部][左部] -->
											 	<html:td id="sub-channel-content-box-left" styleClass="sub-channel-content-box-left"></html:td>
											 	<!-- 频道加载器[头部][中部] -->
											 	<html:td id="sub-channel-content-box-middle"  styleClass="sub-channel-content-box-middle">
											 		<html:table styleClass="channel-content-loader-box">
											 			<html:tr width="100%" height="100%">
											 			<html:td width="100%" height="100%">
											 				<html:iframe  id="__subChannelLoader" src="" styleClass="channel-layout-loader" isRandom="true" width="100%" height="100%" scrolling="no" marginWidth="0" marginHeight="0"  frameBorder="0" vSpace="0" hSpace="0" allowTransparency="true"  onload="reNavigate();__Resizer.resizeFrameHeight(this.id,this.height,null,0,280);"/>
											 			</html:td>
											 			</html:tr>
											 		</html:table>
											 		
											 	</html:td>
													<!-- 频道加载器[头部][右部] -->
											 	<html:td id="sub-channel-content-box-right" styleClass="sub-channel-content-box-right"></html:td>
											 </html:tr> 
								 		</html:table>
	 									 	
								 		
								 	</html:td>
										<!-- 频道加载器[主体部分][右部](预留) -->
								 	<html:td id="sub-channel-content-right" styleClass="sub-channel-content-right"></html:td>
								 </html:tr> 
					 		</html:table>
				 	</html:td>
						<!-- 频道加载器[主体部分][右部] -->
				 	<html:td id="sub-channel-body-right" styleClass="sub-channel-body-right"></html:td>
				 </html:tr> 
	 		</html:table>
		 </html:td>
	 </html:tr>
	 
	 <!-- 频道加载器[尾部] -->
	<html:tr>
		<html:td id="sub-channel-footer-box" styleClass="sub-channel-footer-box"  align="center" valign="middle">
			<html:table  id="sub-channel-footer" styleClass="sub-channel-footer" align="center" valign="middle">
				 <html:tr id="sub-channel-footer" styleClass="sub-channel-footer">
				 	<!-- 频道加载器[尾部][左部] -->
				 	<html:td id="sub-channel-footer-left" styleClass="sub-channel-footer-left"></html:td>
				 	<!-- 频道加载器[尾部][中部] -->
				 	<html:td id="sub-channel-footer-middle"  styleClass="sub-channel-footer-middle"></html:td>
					    <!-- 频道加载器[尾部][右部] -->
				 	<html:td id="sub-channel-footer-right" styleClass="sub-channel-footer-right"></html:td>
				 </html:tr> 
			 </html:table>
		 </html:td>
	 </html:tr>
</html:table>

<script type="text/javascript" language="javascript">   
portalSubChannel.reSelect();
reNavigate();
</script>