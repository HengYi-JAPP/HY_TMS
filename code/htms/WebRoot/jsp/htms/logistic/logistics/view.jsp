<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="logisticsForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.logistics.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1709" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="BEHKLLFPCFKKMIOKAGMNAJPKJKFAOKNJNAPAFLBHCBEHPHGNOBGHGKKENLOLEAKH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticsname#}" ></html:label>
			</td>
			<td  id="CCBANKHEJCPLPLIJPMEAEGCEJCMPKKKIKIFKNEHIBNMNPBOFJNGHILGELKHAFPGI" colSpan="1" rowSpan="1">
				<html:value  value="logisticsViewBean.logisticsName" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MFJFBNGPJOFKPEGBKFHMEKPJNJGCKIJEECPLKCEOHKAPAFPLJJEPJFOLCHOKBHOB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticscode#}" ></html:label>
			</td>
			<td  id="FKNNNPEKKKGALCOPFLNKEBKAJJKIPHFPLIENMMANJGHJJJNAGJIINKPJOBGGNPAF" colSpan="1" rowSpan="1">
				<html:value  value="logisticsViewBean.logisticsCode" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="APJLOPMPGJNPFKEPKNAGFPNHLABEGMJKLCKPNAPKLGFFCGAFFIIIFJFBLHEEJECH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticscontactor#}" ></html:label>
			</td>
			<td  id="LFHEEKHFLOHKEEPJONAFHNBJNJKCHIBHCKJBMAEHIKOCEAMKKJKFEIMABKCOIMPN" colSpan="1" rowSpan="1">
				<html:value  value="logisticsViewBean.logisticsContactor" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NIOCMFGKMPGMPKCEGLFGMHKMGCGOCLNNGAGMCFNAPGBEIJOBJGHCBECKPFHKIJCF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticstelephone#}" ></html:label>
			</td>
			<td  id="OEBPALKAJBGKNCGBEEKGNKHEKKKFEIBFPIHPKPPIOMKKBJFPMPCGGMHLCPPHIHHL" colSpan="1" rowSpan="1">
				<html:value  value="logisticsViewBean.logisticsTelephone" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BEKFOCJLMKNLHJENPIIJHKAHKCGGEBFPKHBAOAFELHKPOFKFKABIMGFKKJAAMJNN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticsaddress#}" ></html:label>
			</td>
			<td  id="BJEPJPGMKAKMHKIKKLHEJOJFKCCGHOJBCAJFGPCABLHIGKJMAFKPKKJBKLOFBJPJ" colSpan="1" rowSpan="1">
				<html:value  value="logisticsViewBean.logisticsAddress" ></html:value>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listLogistics"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
