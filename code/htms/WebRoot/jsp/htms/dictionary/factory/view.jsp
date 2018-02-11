<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="factoryForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.factory.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1633" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="POBFPIEKAFONKFAFONPOPEEMCGJBJKNFOINJHCKGKJAOJMKJMGCCHKBKIALAIPBH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factoryname#}" ></html:label>
			</td>
			<td  id="LNLMLIJBGIKKBIEAIHLNKMNJPPHEAOMPBOJGAOCBPEJEKCPKMJFHJAHEKKGEKKIN" colSpan="1" rowSpan="1">
				<html:value  value="$[factoryViewBean.factoryName]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NNMKGGOOBPOPJHAKPNKIKOABAPMJBMNKJMFKGGFLJOCKPFPCLOKNELIHLEOCAKMJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorycode#}" ></html:label>
			</td>
			<td  id="JNFOGPMENHEAKKMLJJCKAKBBMKJMFMHKFKKJKAKOHJLBFPFKEPOBGJMGLBCELPIJ" colSpan="1" rowSpan="1">
				<html:value  value="$[factoryViewBean.factoryCode]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="HGCMCKCECLCLCEKNGONLBBFHKHMLECKPGFHAIKKBGEJPOHKHBOABFELNOIFFGPGJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorycontactor#}" ></html:label>
			</td>
			<td  id="EPHKFCIKEKCPJBPIPEKHPBOGBKPLNAEBKCEAACONHFJPCLMKGBBMFNIPMGCBPIIK" colSpan="1" rowSpan="1">
				<html:value  value="$[factoryViewBean.factoryContactor]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NICNIEHHOPKOJKPJCLFKMKKECKHJKNNELPLIGOCBNFHNAPPMJJLIMHMKNGHBCPNC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorytelphone#}" ></html:label>
			</td>
			<td  id="KKIFMGHHPKPOKKFPJNLPCBFKIJAMNHHKNOLMCOIHEMHFOMFJFCBAGLKFHJNJHLIG" colSpan="1" rowSpan="1">
				<html:value  value="$[factoryViewBean.factoryTelphone]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LOJPEMLKEJNCJPLGHLBKOLEOMFLPCCGCFLMOEJJBJLPNAFBANIEAJBOBFLKBKMIK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factoryaddress#}" ></html:label>
			</td>
			<td  id="LCLAFJCMJOPLCOABOIFCCMIHIOEOKOKEKOPFHJPJOHKNFIAIBGFICEONOCIBCKME" colSpan="1" rowSpan="1">
				<html:value  value="$[factoryViewBean.factoryAddress]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KPPHIKKKBHPLPPJMKAFELJMOCBNAHBEIFHABBKFEMJNBOGCCLACFFJBOCCLNJCKA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorydesc#}" ></html:label>
			</td>
			<td  id="PMIJINGFGKKKPGGHPHHPHMOCNNKFLENCKNCAIAIPJCKAKAPPOINFKKLENKIBPKEM" colSpan="1" rowSpan="1">
				<html:value  value="$[factoryViewBean.factoryDesc]" ></html:value>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listFactory"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
