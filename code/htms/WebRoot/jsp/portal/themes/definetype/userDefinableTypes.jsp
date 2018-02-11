<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
		<com:loader css="css/common/table-list.css" js="js/portal/portal-loader.js"/>
		
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="tdtForm" name="tdtForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="defineUserDefineType"/>
		<html:hidden id="themesId" name="themesId" value=""/>
		<html:hidden id="tdtId" name="tdtId" value=""/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.defvar.define.type.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="true" name="hideSearchBanner"/>
		</jsp:include>
	
	
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" >
			<html:tr>
				<html:td>
					<html:div style="display:inline;">
						<logic:for beanCollectionsName="__selectableTypes" currBeanName="tdtBean" currBeanScope="session">
							<logic:if equal="tdtBean.tdtId,__selectedType.tdtId">
							<html:div style="float:left;">
								<html:table style="background:#787878;">
									<html:tr>
										<html:td style="background:#787878;">	
											<html:a href="javascript:void(0);">							
											<html:img src="tdtBean.tdtIcon" style="width:100px;height:100px;"></html:img>
											</html:a>	
										</html:td>
									</html:tr>
									<html:tr>
										<html:td style="background:#787878;">
											<html:a href="javascript:void(0);">
												<html:radio id="$[tdtBean.themesId]" name="themesId"  value="tdtBean.tdtId"  onclick="setDefineValue(this.id,this.value);" checked="true" /><html:value value="tdtBean.tdtName"/>
											</html:a>		
										</html:td>
									</html:tr>
								</html:table>
							</html:div>
							</logic:if>
							<logic:if notEqual="tdtBean.tdtId,__selectedType.tdtId">
							<html:div style="float:left;">
								<html:table>
									<html:tr>
										<html:td>	
											<html:a href="javascript:void(0);">							
											<html:img src="tdtBean.tdtIcon" style="width:100px;height:100px;"></html:img>
											</html:a>	
										</html:td>
									</html:tr>
									<html:tr>
										<html:td>
											<html:a href="javascript:void(0);">
												<html:radio id="$[tdtBean.themesId]" name="themesId" value="tdtBean.tdtId" onclick="setDefineValue(this.id,this.value);" /><html:value value="tdtBean.tdtName"/>
											</html:a>		
										</html:td>
									</html:tr>
								</html:table>
							</html:div>
							</logic:if>
						</logic:for>
					</html:div>
				</html:td>
			</html:tr>
		</html:table>
		<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('tdtForm')" />		
														
				</html:td></html:tr>
			</html:table>	
	</html:form>
	</body>
</html>

<script type="text/javascript">
<!--
function setDefineValue(themesId,tdtId){
document.getElementById('themesId').value=themesId;
document.getElementById('tdtId').value=tdtId;
}
<logic:if equal="__reload_parent_page,true">
 parent.parent.location.reload();
<html:set name="__reload_parent_page" value="false"/>
</logic:if>
//-->
</script>



