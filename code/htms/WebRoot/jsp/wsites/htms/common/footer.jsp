<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="consts.PropKey"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 内容体[页尾部分] -->
<html:table styleClass="global-body-footer" align="center" valign="bottom">
 		<html:tr styleClass="global-body-footer-top">
 		<!-- 内容体[页尾部分][上左部] -->
 		<html:td id="footer-left" styleClass="global-body-footer-top-left"></html:td>
 		<!-- 内容体[页尾部分][上中部] -->
 		<html:td id="footer-middle" styleClass="global-body-footer-top-middle">
 		</html:td>
 		<!-- 内容体[页尾部分][上右部] -->
 		<html:td id="footer-right" styleClass="global-body-footer-top-right"></html:td>
 	</html:tr> 
 	<html:tr styleClass="global-body-footer-middle">
 		<!-- 内容体[页尾部分][中左部] -->
 		<html:td id="footer-left" styleClass="global-body-footer-middle-left">&nbsp;</html:td>
 		<!-- 内容体[页尾部分][中中部] -->
 		<html:td id="footer-middle" styleClass="global-body-footer-middle-middle">
		 		<html:table styleClass="clxx_1simpleupload_themes_tempfiles_system__footer">
		 			<html:tr>
		 				<html:td styleClass="clxx_2simpleupload_themes_tempfiles_system__footer">
		 					<html:table styleClass="clxx_3simpleupload_themes_tempfiles_system__footer">
		 						<html:tr>
		 							<html:td styleClass="clxx_4simpleupload_themes_tempfiles_system__footer"></html:td>
		 							<html:td styleClass="clxx_5simpleupload_themes_tempfiles_system__footer">
										<html:img src="$[basePath]jsp/wsites/$[currentSysCode]/images/ethnet-icon1.jpg" ></html:img>
									</html:td>
		 							<html:td styleClass="clxx_5simpleupload_themes_tempfiles_system__footer">
										<html:img src="$[basePath]jsp/wsites/$[currentSysCode]/images/ethnet-icon2.jpg" ></html:img>
									</html:td>
		 							<html:td styleClass="clxx_5simpleupload_themes_tempfiles_system__footer">
		 								<html:img src="$[basePath]jsp/wsites/$[currentSysCode]/images/ethnet-icon3.jpg" ></html:img>
		 							</html:td>
		 							<html:td styleClass="clxx_4simpleupload_themes_tempfiles_system__footer"></html:td>
		 						</html:tr>
		 						<html:tr>
		 							<html:td styleClass="clxx_4simpleupload_themes_tempfiles_system__footer"></html:td>
		 							<html:td styleClass="clxx_5simpleupload_themes_tempfiles_system__footer"><html:value value="{$website.jsp.specify.footer.info001#}"/></html:td>
		 							<html:td styleClass="clxx_5simpleupload_themes_tempfiles_system__footer"><html:value value="{$website.jsp.specify.footer.info002#}"/></html:td>
		 							<html:td styleClass="clxx_5simpleupload_themes_tempfiles_system__footer"><html:value value="{$website.jsp.specify.footer.info003#}"/></html:td>
		 							<html:td styleClass="clxx_4simpleupload_themes_tempfiles_system__footer"></html:td>
		 						</html:tr>
		 					</html:table>
		 			
		 				</html:td>
		 			</html:tr>
		 			<html:tr>
		 				<html:td styleClass="copyRight">
		 					 <html:value value="{$website.jsp.specify.footer.info004#}"/><br><html:value value="{$website.jsp.specify.footer.info005#}"/>
		 				</html:td>
		 			</html:tr>
		 		</html:table>
			</html:td>
 		<!-- 内容体[页尾部分][中右部] -->
 		<html:td id="footer-right" styleClass="global-body-footer-middle-right">&nbsp;</html:td>
 	</html:tr> 
 	<html:tr styleClass="global-body-footer-bottom">
 		<!-- 内容体[页尾部分][下左部] -->
 		<html:td id="footer-left" styleClass="global-body-footer-bottom-left">&nbsp;</html:td>
 		<!-- 内容体[页尾部分][下中部] -->
 		<html:td id="footer-middle" styleClass="global-body-footer-bottom-middle">&nbsp;</html:td>
 		<!-- 内容体[页尾部分][下右部] -->
 		<html:td id="footer-right" styleClass="global-body-footer-bottom-right">&nbsp;</html:td>
 	</html:tr> 
</html:table>