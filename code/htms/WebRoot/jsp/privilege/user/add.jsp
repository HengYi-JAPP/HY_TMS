<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";
 function selectType(){
 	var select = document.getElementById("userType");
 	var selectIndex = select.selectedIndex;
 	var selectText = select.options[selectIndex].id;
 	if(selectText=="carrier"){
 		document.getElementById("carrierId").style.display="inline";
 	}else{
 		document.getElementById("carrierId").options[0].selected = true;
 		document.getElementById("carrierId").style.display="none";
 	}
 }

</script>
<base href="<%=basePath%>">
</head>
<body>
<cext:dic typeCode="<%=PropKey.SEX_TYPE_DIC%>" scope="request"/>
<com:loader  js="js/common/common.js" css="css/common/sub-table-list.css" validator="true" simpleUpload="true" myWin="true" />
<com:loader js="jsp/privilege/user/user.js" switchbox="true"/>
<html:form id="userForm" name="userForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addUser"/>
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<html:hidden id="dicCarrier" name="dicCarrier" value="dicBean.dicId"/>
			<jsp:include page="../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.user.add.title") %>' name='title'/>		
			</jsp:include>
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.account#}"/></html:td>
					<html:td >						
						<html:text id="account" name="account" styleClass="input-text"  maxlength="60" size="36" value=""/>
						<html:hidden id="isValidate"  value="1"/> 						
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.name#}"/></html:td>
					<html:td >
							<html:text id="userName" name="userName" styleClass="input-text"  maxlength="60" size="36" value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.passwd#}"/></html:td>
					<html:td >
							<html:password id="password"  name="password" styleClass="input-text"  maxlength="60" size="36" value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.confirmpwd#}"/></html:td>
					<html:td >					
							<html:password id="confirmPassword"  name="confirmPassword"  maxlength="60"  styleClass="input-text" size="36" value=""/>													
					</html:td>
				</html:tr>			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.type#}"/></html:td>
					<html:td >
						<html:select id="userType" name="userType"  list="user_type_list" bean="userTypeBean" onchange="selectType();" >
							<html:option id="userTypeBean.dicCode" label="dicName" value="dicId" />
						</html:select>
								<html:select id="carrierId" name="carrierId"  list="carrierList" style="display:none;" fistOption="请选择承运商">
									<html:option label="carrierName" value="carrierId" />
								</html:select>
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.sex#}"/></html:td>
					<html:td >
						<html:select id="sex" name="sex"  list="<%=PropKey.SEX_TYPE_DIC%>">
							<html:option label="dicName" value="dicId" selected="true"/>
						</html:select>													
					</html:td>
				</html:tr>
				<tr class="trCell">
					<td class="edit-talbe-label" >
						是否贸易商
					</td>
					<td>
						<com:switchbox boxId="customerType" varValue="0" talbeName="TB_WSM_USER" idValue="userId" offValue="0" varName="customerType" onValue="1"  idName="userId"  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false"/>
					</td>
				</tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.mobile#}"/></html:td>
					<html:td >
							<html:text name="mobile" id="mobile" styleClass="input-text"  maxlength="11" size="36" value=""/>													
					</html:td>
				</html:tr>
				<html:tr  style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.photo#}"/></html:td>
					<html:td >		
						<com:simpleUpload fileId="photo" sortDir="userfiles/photos" isImage="true"></com:simpleUpload>								
					</html:td>				
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.department#}"/></html:td>
					<html:td >
							<html:hidden name="department" id="department"  value=""/>
							
							<html:hidden id="selectedOrgId" name="selectedOrgId" value=""/>	
						
							<btn:button name="Select" href="javascript:void(0);" onclick="selectOrg()" typeId="selectOrg" value="Select" styleClass="button-self-style"/>
							<input type="text" name="orderOrg" id="orderOrg" value="" onblur="document.getElementById('department').value=this.value"/>													
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.subdepartment#}"/></html:td>
					<html:td >
							<html:text name="subDepartment" id="subDepartment" styleClass="input-text"  maxlength="60" size="36"/>													
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.email#}"/></html:td>
					<html:td >
							<html:text name="email" id="email" styleClass="input-text"  maxlength="60" size="36"/>													
					</html:td>
				</html:tr>
			
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.phone#}"/></html:td>
					<html:td >
							<html:text name="tel" id="tel" styleClass="input-text"  maxlength="60" size="36"/>													
					</html:td>
				</html:tr>
				<html:tr style="display:none;">
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.qq#}"/></html:td>
					<html:td >
							<html:text name="qq" id="qq" styleClass="input-text"  maxlength="60" size="36"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.order#}"/></html:td>
					<html:td >
							<html:text id="orderId" name="orderId" styleClass="input-text"  maxlength="60" size="36"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.salesNo#}"/></html:td>
					<html:td >
							<html:text name="salesNo" id="salesNo" styleClass="input-text"  maxlength="600" size="36"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="订单同步编号"/></html:td>
					<html:td >
							<html:text name="syncEmployNo" id="syncEmployNo" styleClass="input-text"  maxlength="100" size="36"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="员工号"/></html:td>
					<html:td >
							<html:text name="employNo" id="employNo" styleClass="input-text"  maxlength="100" size="36"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="OA账号"/></html:td>
					<html:td >
							<html:text name="oaUser" id="oaUser" styleClass="input-text"  maxlength="100" size="36"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="客户编号"/></html:td>
					<html:td >
							<html:text name="customerCode" id="customerCode" styleClass="input-text"  maxlength="100" size="36"  value=""/>													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('userForm')"/>
						<btn:return href="contoller.do?operation=listUser"/>							
				</html:td></html:tr>
			</html:table>
			<com:validator formId="userForm" showNormal="true" submitValidate="true">
				<com:vElement id="account"  types="isnull,number-letter-underline" />
				<com:vElement id="userName"  types="isnull" />
				<com:vElement id="password"  types="isnull" />
				<com:vElement id="confirmPassword"  types="isnull" />
				<com:vElement id="salesNo"  types="isnumspot" />
		</com:validator>
	</html:form>	
	
		
</body>
</html>
