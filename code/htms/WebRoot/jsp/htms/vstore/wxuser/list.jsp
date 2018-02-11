<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="wxUserFrom"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listWXUser"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='微信用户管理' name="title"/>
	</jsp:include>
	<table id="1690" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="NINFKOLNIELHFKLFKPGIECHIEJFAHFCAOKPNHCOEHPIJNIKBEHJKLILAHKGHPKLN" colSpan="1" rowSpan="1">
				<html:label  label="用户昵称" ></html:label>
			</td>
			<td  id="PPKBCCNLEBLNKLIOINFFGEPGLABHKFBLOOIOKPGAKPOKFKEMHNGFMEJAFFBPHBPM" colSpan="1" rowSpan="1">
				<html:text  id="nickNameSH"  name="nickNameSH"  value="$[nickNameSH]"/>
			</td>
			<td class="edit-talbe-label" id="NINFKOLNIELHFKLFKPGIECHIEJFAHFCAOKPNHCOEHPIJNIKBEHJKLILAHKGHPKLN" colSpan="1" rowSpan="1">
				<html:label  label="司机名称" ></html:label>
			</td>
			<td  id="PPKBCCNLEBLNKLIOINFFGEPGLABHKFBLOOIOKPGAKPOKFKEMHNGFMEJAFFBPHBPM" colSpan="1" rowSpan="1">
				<html:text  id="driverNameSH"  name="driverNameSH"  value="$[driverNameSH]"/>
				<span style="float:right;">
					<btn:search href="javascript:submit('wxUserFrom')"/>
					<btn:reset href="javascript:cleanForm('wxUserFrom')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="wxUserList" bean="wxUserBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" >
			<html:td  label="用户昵称">
				<html:a href="contoller.do?operation=viewWXUser&wxOpenId=$[wxUserBean.openId]">
					<html:value value="$[wxUserBean.nickName]"/>
				</html:a>
			</html:td>
			<html:td  label="车队信息">
				<html:a href="contoller.do?operation=viewWXUser&wxOpenId=$[wxUserBean.openId]">
					<html:value value="$[wxUserBean.carrierName]"/>
				</html:a>
			</html:td>
			<html:td  label="司机名称">
				<html:a href="contoller.do?operation=viewWXUser&wxOpenId=$[wxUserBean.openId]">
					<html:value value="$[wxUserBean.associateDriverName]"/>
				</html:a>
			</html:td>
			<html:td  label="司机手机号">
				<html:a href="contoller.do?operation=viewWXUser&wxOpenId=$[wxUserBean.openId]">
					<html:value value="$[wxUserBean.associateDriverMobile]"/>
				</html:a>
			</html:td>
			<html:td  label="司机身份证">
				<html:a href="contoller.do?operation=viewWXUser&wxOpenId=$[wxUserBean.openId]">
					<html:value value="$[wxUserBean.associateDriverIdNum]"/>
				</html:a>
			</html:td>
			<html:td  label="车辆数">
				<html:a href="contoller.do?operation=viewWXUser&isModify=0&wxOpenId=$[wxUserBean.openId]">
					<html:value value="$[wxUserBean.vehicleCount]"/>
				</html:a>
			</html:td>
			<html:td  label="操作" width="280px">
				<html:a href="contoller.do?operation=toAssociateDriver&wxOpenId=$[wxUserBean.openId]&carrierId=$[wxUserBean.logistics]&driverId=$[wxUserBean.driverId]" style="border:0;text-decoration:none;">
					<input type="button"  id="" name="" value="关联司机"  class="commonBtn" style="width: 80px;">
				</html:a>
				<logic:if condition="$[wxUserBean.driverId]!=''">
					<html:a href="contoller.do?operation=toAssociateVehicle&wxOpenId=$[wxUserBean.openId]&carrierId=$[wxUserBean.logistics]&driverId=$[wxUserBean.driverId]" style="width: 80px;border:0;text-decoration:none;">
						<input type="button"  id="" name="" value="关联车辆"  class="commonBtn" style="width: 80px;">
					</html:a>
				</logic:if>
				<html:a href="contoller.do?operation=toModifyWXUser&wxOpenId=$[wxUserBean.openId]&carrierId=$[wxUserBean.logistics]" style="width: 80px;border:0;text-decoration:none;">
					<input type="button"  id="" name="" value="修改"  class="commonBtn">
				</html:a>
				<html:a href="javascript:deleteRow('contoller.do?operation=deleteWXUser&wxOpenId=$[wxUserBean.openId]&driverId=$[wxUserBean.driverId]')" style="width: 80px;border:0;text-decoration:none;">
					<input type="button"  id="" name="" value="删除"  class="commonBtn">
				</html:a>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkDriverId" checkId="checkAll"/>
				<com:page formId="driverForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
