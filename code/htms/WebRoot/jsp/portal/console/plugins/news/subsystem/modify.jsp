<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 String currentDate = tools.tool.DateUtil.getFormatDate(null);
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true" myWin="true"/>
<html:form id="newsForm" name="newsForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifySubSystemNews"/>
			<html:hidden id="columnId" name="columnId" value="columnId"/>
			<html:hidden name="infoId" id="infoId"  value="newsViewBean.infoId"/>
			<html:hidden name="modifyTime" id="modifyTime"  value="<%=tools.tool.DateUtil.getFormatDate(null)%>"/>	
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.news.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.title#}"/></html:td>
					<html:td >
							<html:text name="title" id="title" styleClass="input-text"   value="newsViewBean.title"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.subtitle#}"/></html:td>
					<html:td >
							<html:text name="subTile" id="subTile" styleClass="input-text"  value="newsViewBean.subTile"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.introduction#}"/></html:td>
					<html:td >
							<html:textarea name="introduction" id="introduction" styleClass="input-text" cols="60" rows="5" value="newsViewBean.introduction"></html:textarea>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.keywords#}"/></html:td>
					<html:td >
							<html:text name="keyword" id="keyword" styleClass="input-text" value="newsViewBean.keyword"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.createtime#}"/></html:td>
					<html:td >
							<html:text name="createTime" id="createTime" styleClass="input-text" value="newsViewBean.createTime"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.content#}"/></html:td>
					<html:td >
					<jsp:include page="../../../../../common/impart/ckeditor.jsp">
						<jsp:param value="contents" name="name"/>
						<jsp:param value="newsViewBean.contents" name="value"/>
					</jsp:include>
					
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.toppicture#}"/></html:td>
					<html:td align="left">
					<html:table  cellSpacing="0"  align="left" isHead="false" >
						<html:tr >
						<html:td >
							<html:hidden id="indexPic" name="indexPic" value="newsViewBean.indexPic"/>
							<html:div id="showIndexPic">
								<logic:if notNull="newsViewBean.indexPic">
									<html:img src="$[basePath]$[newsViewBean.indexPic]" style="width:200px;150px;"></html:img>
								</logic:if>
							</html:div>				
						</html:td>
						<html:td >	
							<html:div   onclick="__myWin.createWebWindow({winId:'indexpics',title:'{$jsp.portal.console.plugin.news.configtoppic#}',content:'$[basePath]jsp/portal/console/plugins/news/indexpics.jsp',intLeft:50 ,intTop:50 ,intWidth:800 ,intHeight:400,isResize: true,isFullScreen: false});"><html:label label="{$jsp.portal.console.plugin.news.configtoppic#}"/></html:div>			
						</html:td>
						</html:tr>
					</html:table>											
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('newsForm')"/>
						<btn:return href="contoller.do?operation=listSubSystemNews&columnId=$[columnId]"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="newsForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="title"  types="isnull" event="onblur">
			<com:init size="40" maxlength="300" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="subTile"  types="none" event="onblur">
			<com:init size="80" maxlength="300" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="introduction"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="keyword"  types="none" event="onblur">
			<com:init size="80" maxlength="80" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="createTime"  types="none" event="onblur">
			<com:init size="20" maxlength="20" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>