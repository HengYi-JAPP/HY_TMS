<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<cext:dic typeCode="<%=PropKey.SEX_TYPE_DIC%>" scope="request"/>
<html:form id="driverForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.driver.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1689" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="KFFIKKHHIABLCIBKKPLKFMPEMEEFHPGHNHIAGLEKICCBCPPGNHNCKGLJAAFNLCMF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="HILGGMCNLPCJAKAOJKINOJBOCGLEOCMKJMLNHFOKCLBFNNCFKMMICCPKKKGLAPMA" colSpan="1" rowSpan="1">
				<html:value value="carrierViewBean.carrierName"></html:value>
				<!--<html:select  id="carrierId"  name="carrierId"  list="carrierList"  disabled="true" ><html:option  selected="driverViewBean.carrierId" label="carrierName" value="carrierId"></html:option></html:select>
			-->
			</td>
			<td class="edit-talbe-label" id="KOLHLNPNNGILEIKOOABOMFHEBCHMMKOMBHNFLFBCAELEIIIHIOGKKNKOKJGPPAAI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivercode#}" ></html:label>
			</td>
			<td  id="PPNHPOMEKEKAAOMFMFAGACNKMNNJGJKBCLCHBPLGGNGPGHKJKPKCHGFPKBIMNHNP" colSpan="1" rowSpan="1">
				<html:value  value="driverViewBean.driverCode" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="JKIEKPOLBLLKKHCPBBPFCIEKBIHJAJEHNICMGOHANMNNJOKFOMEABLCBECAOJGPP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="FAKKMGMJFHHEKOMKGLCBKAPGKKPLBHFGGGOMHHHCLILJOKFACCMBMAMKKEMANHPI" colSpan="1" rowSpan="1">
				<html:value  value="driverViewBean.driverName" ></html:value>
			</td>
			<td class="edit-talbe-label" id="KKAFOECEPLNCEIELLLBALGIKBCKICKJLGEBMLGFKNKEELONBEPKECLGKIMKLEAKA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveridnum#}" ></html:label>
			</td>
			<td  id="JKKLNGOMILAGPNFHLCHGFEMNPLKPGOKGCMLNJGMKOEKKBMICCBGPJKBBAEOHKNBJ" colSpan="1" rowSpan="1">
				<html:value  value="driverViewBean.driverIdNum" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FALOBJOPLNIFMNJBNKJBFEJHKNBCLLMLAMLBPHMFKPCMNGBHNIGKIHKECOGMHIOF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivermobile#}" ></html:label>
			</td>
			<td  id="KCGNPNOJCFPINAJGIKOKAHKOAELGGMHGGNALEPLFJNHKCGIAIOCBENBKKIIGGKNK" colSpan="1" rowSpan="1">
				<html:value  value="driverViewBean.driverMobile" ></html:value>
			</td>
			<td class="edit-talbe-label" id="GIEFKJILKBKMKFGBFICEPCPAPMKIJMEBCLNNBAPFLAMHKOJGIBLPHKKGNKKPBIFA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driverweixin#}" ></html:label>
			</td>
			<td  id="HMAMANMHKMPKEMGNGMOGCECKHOPBGINMIPPAHGNNKJACIJPKPAAEGBLJIPLCEHPF" colSpan="1" rowSpan="1">
				<html:value  value="driverViewBean.driverWeiXin" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KNHANEGPBKKHNEKGEGHNBMGCGCIOKCBOBFIPHAOFKMHKPGNMFNPJJAKOECPABHFL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driversex#}" ></html:label>
			</td>
			<td  id="LOILPJKLHKAEBCMKILOBIECMKJEHCBNOMNMMFLPMKKCHEPFGMFPPHMLNBMBABEOE" colSpan="1" rowSpan="1">
				<html:select id="driverSex" name="driverSex"  list="<%=PropKey.SEX_TYPE_DIC%>"  disabled="true">
					<html:option label="dicName" value="dicId"   selected="driverViewBean.driverSex"/>
				</html:select>
			</td>
			<td class="edit-talbe-label" id="EIOJFKKMGEPKJFNKLGMNAHEEFHMMKNGHMJOGIBKIKJKOGNNKMPNFMCILHAFFAPLH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveryear#}" ></html:label>
			</td>
			<td  id="PLGOBNOJCGBOHKBLPCJMKMIBKKNIBJIMPOLOCKLBAGKLCAAIAGKJAOFECPONNAFO" colSpan="1" rowSpan="1">
				<html:value  value="driverViewBean.driverYear" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NOGGBALOHOJBMPMMKBGAAMMNNCEFMHCKLLHMFEOBCHHIGNIPCLBKMKJALGNGOHJH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveraddress#}" ></html:label>
			</td>
			<td  id="AKHKHECHHIBEFPJGKFAPLIAAAHPMNBMAOPMAIALFCJOAAMHLBBCCCHFJOBIFPFIC" colSpan="3" rowSpan="1">
				<html:value  value="driverViewBean.driverAddress" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GEJEIFOONEIPNGNCFKGKBLMMHKGIJAKOOPIKOEKBCOCHJLHKOOCGGHCLLFKBKKJO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivernotice#}" ></html:label>
			</td>
			<td  id="FEOGKAJLKKKACGFKJIFAOHBNHJHKHGAGFIJHJKEKIFFNGHPGNKMCKHOJAKCIJKKI" colSpan="3" rowSpan="1">
				<html:value  value="driverViewBean.driverNotice" ></html:value>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listDriver"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
