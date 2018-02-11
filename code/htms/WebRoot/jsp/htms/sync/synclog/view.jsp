<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="logForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader    simplendar="true" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sync.synclog.view") %>' name="title"/>
	</jsp:include>
	<table id="1673" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="JHKEHHJOLKOAEIAPBLPPFIBJNHNMMOEGPGIHMNGANNJPCHNEOLGBIJGFLPHOIJCC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.salesNo#}" ></html:label>
			</td>
			<td  id="GKCOOKAPNMJKOJEECFGPLJKLKHKLPABIHCAKJKCKOOKKMKNKBBEBLMKKFNOEEEPA" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.salesNo]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KAGHBJPIPOKOCCAKKBKJLMOCGNPBJFICNKOFNKKKLFFKMOJONMLFOKJLOKFGGFMK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.startTime#}" ></html:label>
			</td>
			<td  id="NKANKKNAILBMJPJLLNMAKEJHPBIPLHJLICOCOLJLNIEJNOPMHGIJAKPBNPNFOKAL" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.startTime]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GMFEMKOJGMBHKBGBGGMCEKICNGPLKAMKNNGGNFFPCJLNKAIKOIOKGEIKMKEMBGGM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.endTime#}" ></html:label>
			</td>
			<td  id="MFAPHIBPBCANALKAPGBNAEKHECEONPPLEEPMNJCANCAMBNPEBPMIKGHKBKKMFOOK" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.endTime]" ></html:value>
			</td>
		</tr>
	
		<tr class="trCell">
			<td class="edit-talbe-label" id="PHJJGBHFNHIKKCAOJCBJEFCGOJNJMOIEKPEKOCKPGBPKINKMKNIMFCMAAIGMPAGG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.useTime#}" ></html:label>
			</td>
			<td  id="IJEBCMKJPCLCFJAOCOKJKLBMPIBMHKHIHMOBBFJLIJKCBAKMAOIKEKAGKJHLBEJC" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.useTime]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GFHOLBMFCAOCFGECNGVALIDATEBEMCNNIMJKCHMLABPLHONAKKKAPEFGCECKPJPALL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.isValidate#}" ></html:label>
			</td>
			<td  id="KCILBICBCJKBHEPHKLEKPCCPPJEMNOFFKHFIFKKIJNOKFHJKIPFCJIAHNBFJKIHN" colSpan="1" rowSpan="1">
				<!-- <html:value  value="$[logViewBean.isValidate]" ></html:value>
				-->
				<com:switchbox boxId="isValidate" varValue="$[logViewBean.isValidate]" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  
				idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" disabled="true" />									
					
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GFHOLBMFCAOCACCREATECNNIMJKCHMLATIMEHONAKKKAPEFGCECKPJPALL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.createTime#}" ></html:label>
			</td>
			<td  id="KCILBICBCEKBHEPHKLEKPRCPMJEMNOFFKHFIFIKIJNOKEHTKIPFCJIAHNBFJKIHN" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.createTime]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GFHOLBMFCAOCFGMODIFYCOKIBEMCNNIMJKTIMEABPLHONAKKKAPEFGCECKPJPALL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.modifyTime#}" ></html:label>
			</td>
			<td  id="KCILBICBCJKBHEPHKLEKPCCPPJEMMODIFYKHFIFKKIJNOTIMEIPFCJIAHNBFJKIHN" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.modifyTime]" ></html:value>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listSyncLog"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
