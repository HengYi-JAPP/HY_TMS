<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="logForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.log.list.title") %>' name="title"/>
	</jsp:include>
	<table id="1673" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="KAGHBJPIPOKOCCAKKBKJLMOCGNPBJFICNKOFNKKKLFFKMOJONMLFOKJLOKFGGFMK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.privilege.log.logcode#}" ></html:label>
			</td>
			<td  id="NKANKKNAILBMJPJLLNMAKEJHPBIPLHJLICOCOLJLNIEJNOPMHGIJAKPBNPNFOKAL" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.logCode]" ></html:value>
			</td>
			</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GMFEMKOJGMBHKBGBGGMCEKICNGPLKAMKNNGGNFFPCJLNKAIKOIOKGEIKMKEMBGGM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.privilege.log.loguser#}" ></html:label>
			</td>
			<td  id="MFAPHIBPBCANALKAPGBNAEKHECEONPPLEEPMNJCANCAMBNPEBPMIKGHKBKKMFOOK" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.logUser]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="JHKEHHJOLKOAEIAPBLPPFIBJNHNMMOEGPGIHMNGANNJPCHNEOLGBIJGFLPHOIJCC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.privilege.log.logdesc#}" ></html:label>
			</td>
			<td  id="GKCOOKAPNMJKOJEECFGPLJKLKHKLPABIHCAKJKCKOOKKMKNKBBEBLMKKFNOEEEPA" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.logDesc]" ></html:value>
			</td>
			</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="PHJJGBHFNHIKKCAOJCBJEFCGOJNJMOIEKPEKOCKPGBPKINKMKNIMFCMAAIGMPAGG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.privilege.log.logtime#}" ></html:label>
			</td>
			<td  id="IJEBCMKJPCLCFJAOCOKJKLBMPIBMHKHIHMOBBFJLIJKCBAKMAOIKEKAGKJHLBEJC" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.logTime]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GFHOLBMFCAOCFGECNGHACOKIBEMCNNIMJKCHMLABPLHONAKKKAPEFGCECKPJPALL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.privilege.log.logresult#}" ></html:label>
			</td>
			<td  id="KCILBICBCJKBHEPHKLEKPCCPPJEMNOFFKHFIFKKIJNOKFHJKIPFCJIAHNBFJKIHN" colSpan="1" rowSpan="1">
				<html:value  value="$[logViewBean.logResult]" ></html:value>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listLog"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
