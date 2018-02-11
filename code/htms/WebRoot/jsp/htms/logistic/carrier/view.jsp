<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="carrierForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.carrier.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1693" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="CCIBELJFFCKPLBNKOLLJIOJJMBBHBALLPBIPANGKPFEPMNHBGNPCPLNLLFJKFOKA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="LPEOLELOJMFOFMKMPAEAKJOJMNOOOFGFEJNJNHJBGNJKPNHIKFELCFAPKMFGEBHN" colSpan="1" rowSpan="1">
				<html:value  value="carrierViewBean.carrierName" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="POFFPICCGAJKMOAJEKEIPAHAFOKKLKJIKHKEPGAMFKKJKIBCJOGLLAGHMJHKBGNK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriercode#}" ></html:label>
			</td>
			<td  id="BMLIMEMKOCBOALPMBKAICKLMMNJKIHKKGCKKJOPLBLKBJCHHHOPHGBBNMGGEEOFC" colSpan="1" rowSpan="1">
				<html:value  value="carrierViewBean.carrierCode" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NHHIKMPKMMOOOKKCHMGJLIMMHMMHPMEICKBOIJCBGCKKEMLPPCNFBPCGJHOIKPAI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriercontactor#}" ></html:label>
			</td>
			<td  id="LCOJEHMNGPPFALGKLKGPGEEJLCKFEBKNCCMBPEEHCLBCPCEKALLJLCMBKGCPLJBL" colSpan="1" rowSpan="1">
				<html:value  value="carrierViewBean.carrierContactor" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NPPEHPBAKKGNKPEOAKFOFFFMJKLHINOLLPILMNPANHKOMKFKLKFIKPAOLOJNHPGK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriertelephone#}" ></html:label>
			</td>
			<td  id="BIKILJNOGPKJFLHJKMKAKCNKIMLLNENKGIAEFKIFOMINPHFKPHMEOOHGHMCHAFMN" colSpan="1" rowSpan="1">
				<html:value  value="carrierViewBean.carrierTelephone" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="OLKALKKKMNGIMHMKMENMFFIHGKJAOKMBCAEFEFCAFECNEKKEKJNEPICJHNNFMIBK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carrierarea#}" ></html:label>
			</td>
			<td  id="FOEFKAHLLKJOHLFEFIAAKKBKGAPAGHEIKJALOCHMGKALEHPFEEEJFKGJCMAIEMJP" colSpan="1" rowSpan="1">
				<html:value  value="carrierViewBean.carrierArea" ></html:value>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listCarrier"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
