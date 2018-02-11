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
	<html:hidden id="operation" name="operation" value="modifyDriver"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.driver.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1688" class="edit-talbe">
	<html:hidden id="driverId" name="driverId" value="driverViewBean.driverId"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KKMCNPJLMHPGBIELGOGMHIEHMOIFINGMIAMNNBMHJHMMJHKEMIPHOHCCHJOKKJPF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="LAOEMBCBHMKJNJGEOAHOOBGONMBKLIIHJPMNBALLGKIBJMBOGAEAHOCMMEFMEEAN" colSpan="1" rowSpan="1">
				<html:select  id="carrierId"  name="carrierId"  list="carrierList" ><html:option  selected="driverViewBean.carrierId" label="carrierName" value="carrierId"></html:option></html:select>
			</td>
			<td class="edit-talbe-label" id="MPCPKNJAKCNJOAGKFAGBGKOBFLKNABGEHPIIGEBKCNCEIMCKMFFKMEJPJKGPCJOL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivercode#}" ></html:label>
			</td>
			<td  id="MKECHHCOHKAIPAFPOGFPOEPGNKEIMNFEENGONHHGKPAIPMKLEIMANIIHEBMGKNPE" colSpan="1" rowSpan="1">
				<html:text  id="driverCode"  name="driverCode"  value="driverViewBean.driverCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KGOPNBHEEAHFLJMIKKCGLAPPKIMAPKCOKAFPALKABOMAMKEGFEKLNEHKIAFKKPPH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="NFGCGKFMJFLNMGGJAHPKPFPFAEOOEFLNICMMCPGBELKPKMPLIPBHKFNKGKPLLPIA" colSpan="1" rowSpan="1">
				<html:text  id="driverName"  name="driverName"  value="driverViewBean.driverName" />
			</td>
			<td class="edit-talbe-label" id="OMFJNJAKEEJJNNOHFOOOKLLBGJMAJIMMFOFIIICFHFMBKKPLBPKBMFHNEKPPJGIN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveridnum#}" ></html:label>
			</td>
			<td  id="CFPELMNKCFKOPBEEBLMANOBBALAFJNKPINGKFKIPPHFNOJGHOBHKBMEHOBGMMBFJ" colSpan="1" rowSpan="1">
				<html:text  id="driverIdNum"  name="driverIdNum"  value="driverViewBean.driverIdNum" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="AEHGKJKLGEHFPOKGAAFKOPFMNJNCPNOFBLECEPPFKECNLBMKPJKOAMBBLGNKPMAL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivermobile#}" ></html:label>
			</td>
			<td  id="OIKCCFALMOMJNEKNPFPAKGIPLKKOMIEFEIGBKEMKHKIIECGLGLGEMKFCCIMEOBOG" colSpan="1" rowSpan="1">
				<html:text  id="driverMobile"  name="driverMobile"  value="driverViewBean.driverMobile" />
			</td>
			<td class="edit-talbe-label" id="BBLMIIJJBPALNGCIMHOJEFJKMJGJMGFJFCILOLKPKAAGLKKEOHEEKAFAKFCIGKOH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driverweixin#}" ></html:label>
			</td>
			<td  id="GEALOJIAPKKFGMAMBEKANEMNPPAKEEKLEIOPKOIKLAMBNOHKECNIKFKLCAEEPECL" colSpan="1" rowSpan="1">
				<html:text  id="driverWeiXin"  name="driverWeiXin" size="15"  value="driverViewBean.driverWeiXin" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BMKINHPNJCLPJCACBFJKABCOMGOLJGHHCNMLJMIKAILNJMFIPLCCOKBJJBNKPGPC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driversex#}" ></html:label>
			</td>
			<td  id="ONNKHKAKCIIAIGGBAGJJMEEEAMOFOIJOAKAIONHOEAJHNINELPKGJAJGCJPEEGAA" colSpan="1" rowSpan="1">
				<html:select id="driverSex" name="driverSex"  list="<%=PropKey.SEX_TYPE_DIC%>">
					<html:option label="dicName" value="dicId"   selected="driverViewBean.driverSex"/>
				</html:select>	
			</td>
			<td class="edit-talbe-label" id="FJPLKAMEAHGPNIPBBKPLCKMJLJPCLGPCCCOLPFKGHCNIIMBHGEJEKBKGHIIBLLJM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveryear#}" ></html:label>
			</td>
			<td  id="KEECPKKIKAHIIKAFCBFNMAECCBHEJMPLCCOCJFPHAPACMJKGHJBIPKJFMCAPFFBC" colSpan="1" rowSpan="1">
				<html:text  id="driverYear"  name="driverYear"  value="driverViewBean.driverYear" size="5" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="AKLOLHOFKPJMJPJCKBFINNIIAIGGCJELNFCFKBCKEMBKJOPBHCCKOEAPPPPBOKPP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveraddress#}" ></html:label>
			</td>
			<td  id="EMMGALCKINOPJLLINPKKIKAALMFMOMAKMJBCFLMAPJKFOIKALNNIHKHPLAJIMKMF" colSpan="3" rowSpan="1">
				<html:text  id="driverAddress"  name="driverAddress"  value="driverViewBean.driverAddress" size="45"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BPOOKIPANGGIAFPINPIHGHKGFFJCHOGMBCLFLKEAEALCJJJAGEOFCEKOGAGHIHKC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivernotice#}" ></html:label>
			</td>
			<td  id="NPPIKEFLKIKIKHAONKKKJBNOHKOKAJEOFHPFEBILEKELEGNKKIAPBLNFAGOFKJKH" colSpan="3" rowSpan="1">
				<html:textarea id="driverNotice"  name="driverNotice"  value="driverViewBean.driverNotice" cols="40" rows="5"></html:textarea>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('driverForm')"/>
				<btn:return href="contoller.do?operation=listDriver"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="driverForm" showNormal="true" submitValidate="true" >
		<com:vElement id="driverName"  types="isnull" event="onblur">
			<com:init size="15" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="driverCode"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="driverMobile"  types="mobile" event="onblur">
			<com:init size="15" maxlength="11"></com:init>
		</com:vElement>
		<com:vElement id="driverIdNum"  types="isidcard" event="onblur">
			<com:init size="20" maxlength="18"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
