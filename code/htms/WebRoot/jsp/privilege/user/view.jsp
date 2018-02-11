<%@ page language="java" import="consts.PropKey" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
	window.onload=function(){
	var select = document.getElementById("userType");
 	var selectIndex = select.selectedIndex;
 	var selectText = select.options[selectIndex].id;
		if(selectText=="carrier"){
	 		document.getElementById("carrierId").style.display="inline";
	 	}else{
	 		document.getElementById("carrierId").style.display="none";
	 	}
	}
</script>
<base href="<%=basePath%>">
</head>
<body>
<cext:dic typeCode="<%=PropKey.USER_TYPE_DIC%>" scope="request"/>
<cext:dic typeCode="<%=PropKey.SEX_TYPE_DIC%>"  scope="request"/>
<com:loader  js="js/common/common.js" css="css/common/sub-table-list.css" />
			<jsp:include page="../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.user.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.account#}"/></html:td>
					<html:td>						
						<html:value value="userViewBean.account"/>					
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.name#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.userName"/>												
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.passwd#}"/></html:td>
					<html:td>
					<html:password value="userViewBean.password" disabled="true"/>											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.confirmpwd#}"/></html:td>
					<html:td>	
					<html:password value="userViewBean.password" disabled="true"/>													
					</html:td>
				</html:tr>			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.type#}"/></html:td>
					<html:td>
						<html:select id="userType" name="userType"  list="user_type_list" bean="userTypeBean" disabled="true">
							<html:option  id="$[userTypeBean.dicCode]" label="dicName" value="dicId"  selected="userViewBean.userType"/>
						</html:select>	
						
						<html:select id="carrierId" name="carrierId"  list="carrierList"  disabled="true" style="display:none;">
							<html:option selected="$[userViewBean.carrierId]" label="carrierName" value="carrierId" />
						</html:select>		
						<html:hidden id="dicCarrier" name="dicCarrier" value="dicBean.dicId"/>								
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.sex#}"/></html:td>
					<html:td>				
						<html:select id="sex" name="sex"  list="<%=PropKey.SEX_TYPE_DIC%>"  disabled="true">
							<html:option label="dicName" value="dicId"   selected="userViewBean.sex"/>
						</html:select>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="是否贸易商"/></html:td>
					<html:td >
							<com:switchbox boxId="customerType" varValue="$[userViewBean.customerType]" talbeName="TB_WSM_USER" idValue="UserId" offValue="0" varName="customerType" onValue="1"  idName="UserId"  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" disabled="true"/>
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.photo#}"/></html:td>
					<html:td >		
						<html:img src="$[userViewBean.photo]"></html:img>								
					</html:td>				
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.department#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.department"/>													
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.subdepartment#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.subDepartment"/>												
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.email#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.email"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.mobile#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.mobile"/>													
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.phone#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.tel"/>													
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.qq#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.qq"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.order#}"/></html:td>
					<html:td>
					<html:value value="userViewBean.orderId"/>												
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.salesNo#}"/></html:td>
					<html:td >
							<html:value value="$[userViewBean.salesNo]"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="订单同步编号"/></html:td>
					<html:td >
							<html:value value="$[userViewBean.syncEmployNo]"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="员工号"/></html:td>
					<html:td >
							<html:value value="$[userViewBean.employNo]"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="OA账号"/></html:td>
					<html:td >
							<html:value value="$[userViewBean.oaUser]"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="客户编号"/></html:td>
					<html:td >
							<html:value value="$[userViewBean.customerCode]"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="userViewBean.isValidate" talbeName="TB_CMS_USER" idValue="userViewBean.userId" offValue="0" varName="isValidate" onValue="1"  idName="userId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"    ajaxUrl="contoller.do"  disabled="true"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr><html:td>
						<btn:return href="contoller.do?operation=listUser"/>							
				</html:td></html:tr>
			</html:table>
		
</body>
</html>

