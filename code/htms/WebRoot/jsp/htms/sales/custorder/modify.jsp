<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="custOrderForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="modifyCustOrder"/>
	<html:hidden id="isValidate" name="isValidate" value="custOrderViewBean.isValidate"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.custorder.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1660" class="edit-talbe">
	<html:hidden id="corderId" name="corderId" value="custOrderViewBean.corderId"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="JBBOALFBLLLBNGKBKALLJCCIFIHHMFMKLJKOANFACFCJMNLFGCFNJOKLOHKBKALK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td  id="IHOIOGPOCGLLALEPABIKPOKFLNJGLIAAEFNKALNLJHFAICJAJHOOLEMLLHCLENKM" colSpan="1" rowSpan="1">
				<html:select  id="customerId"  name="customerId"  list="customerList" ><html:option  selected="$[custOrderViewBean.customerId]"  value="customerId"  label="customerName" ></html:option></html:select>
			</td>
			<td class="edit-talbe-label" id="IIHCIPKPFFGOAKMAHNGKIEMNCIOGPLLGKONBKNNKPGABFHGCMEOAKKHKEJOFNNHK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.customercode#}" ></html:label>
			</td>
			<td  id="FFNFFAKKIMBKFCCHIALOONPPAGFBIEKGJFGJNMJABNEJBELKIFNAPNEBNHBOFOJI" colSpan="1" rowSpan="1">
				<html:text  id="customerCode"  name="customerCode"  value="$[custOrderViewBean.customerCode]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KMKKNNHHANHEFKOJLAOBBKAHKBKFLAKCPIIBMPKJNGKLBHHHGJOIKNPOEEANALCJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordername#}" ></html:label>
			</td>
			<td  id="GLOEINOKKEAKLOOOCPINAOPBGJKPHJMHJBPHKGFBJHCPNOEFNFKBAKFKKJFGLPEJ" colSpan="1" rowSpan="1">
				<html:text  id="corderName"  name="corderName"  value="$[custOrderViewBean.corderName]" />
			</td>
			<td class="edit-talbe-label" id="GOIJEJFKKMKOBMHJOLCLHPCGIOMKHLLKOJJGKGAEIJHPACPKBCOBONHJPJJLBEAL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.productgroup#}" ></html:label>
			</td>
			<td  id="HFFBABKJAGKHKOKENIFEPEPMHLKPJAMOKHOGLFLOLPBNMPMPKKKOHMBFJMEHEMEH" colSpan="1" rowSpan="1">
				<html:text  id="productGroup"  name="productGroup"  value="$[custOrderViewBean.productGroup]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FFKIGOHAJENKNHCPLBLKGIEJPMLHNFPFCKOBEGMJOGPHMKOBIIIIOHOIGIEOAFBL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="JPPOFNGABCKOGBPPBKPGGIBKHCBPKAJCOIEACHAMJAJFIOJLMOPPABJOLHACIHCC" colSpan="1" rowSpan="1">
				<html:text  id="corderCode"  name="corderCode"  value="$[custOrderViewBean.corderCode]" />
			</td>
			<td class="edit-talbe-label" id="IPALKMJOCIEKIGKGFAKOPPIOECCOOFJCKMPCKCLLJAKKFKGHEEBNLKPKKCLEGFKL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.salegroup#}" ></html:label>
			</td>
			<td  id="GFILGEACHKPKNCGMNGNOBFKINPMOEFIGBGNAJEEPBOKEMNCIKECJFKAGLNIKGONJ" colSpan="1" rowSpan="1">
				<html:text  id="saleGroup"  name="saleGroup"  value="$[custOrderViewBean.saleGroup]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="OJMNKPMPNAPHCEHNKAIMKBPOJOEFCPGNLFHGGECKJMFCMNPMKFEPBABFHBKEEBNK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.salenum#}" ></html:label>
			</td>
			<td  id="BBHPLEBKFAPAMMBHNFHKKGOEBKENHOKECNMEFAAMEMACBLIFENBKMBLNKGJKKAAO" colSpan="1" rowSpan="1">
				<html:text  id="saleNum"  name="saleNum"  value="$[custOrderViewBean.saleNum]" />
			</td>
			<td class="edit-talbe-label" id="BGGGEGOOKGEIKKEHNGJECLHKCEKGEPEGCIMEKLHOKICCHCOMFAGKBGAPAGMBILGA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.saledepartment#}" ></html:label>
			</td>
			<td  id="ECKGKAKMLFGPAHFEGABHCACKPOCCINEOKAPKJBLJKBJEGKKKKKPGHCHLHLILKAGO" colSpan="1" rowSpan="1">
				<html:text  id="saleDepartment"  name="saleDepartment"  value="$[custOrderViewBean.saleDepartment]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="COCOCLKBFHHOANKIFFOMFFGAKBHIEENFOPKKCBEFBOLIKKHMOKBAKAGIKFNMKIHF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.salechannel#}" ></html:label>
			</td>
			<td  id="KKBCFHKHAALAMMOJBNCJMKIGBJJJPKHBKHKCFEJPAMKHBIFMOEAAKMPCMKNLNAHE" colSpan="1" rowSpan="1">
				<html:text  id="saleChannel"  name="saleChannel"  value="$[custOrderViewBean.saleChannel]" />
			</td>
				<td class="edit-talbe-label" id="BJGBPKIBMOKAKCEPBIENLMCNKOIKAJBMIOKMNNKLGKLJBMAKEKCKIKAJKKNEKNOA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.saletype#}" ></html:label>
			</td>
			<td  id="IGNHFEAGBLGBPFJMIMHINKLCIOMPMGPEPKHMGFOAKNIFKBCFCIFIIKKKBINFCGPG" colSpan="1" rowSpan="1">
				<html:text  id="saleType"  name="saleType"  value="$[custOrderViewBean.saleType]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="ENKCJMNAPJFAIKKFOAPLGLKLKNOCLMHMOEHEHKCPEGMIFKJONIGINKOAPGPIFEMK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.exchangetitle#}" ></html:label>
			</td>
			<td  id="CHMMAFFKGNMPCILJBKHOAEKHJCMCIGJAIFNEBFNNAHGNKGEHJHBPLIPOLBBEKJLF" colSpan="1" rowSpan="1">
				<html:text  id="exchangeTitle"  name="exchangeTitle"  value="$[custOrderViewBean.exchangeTitle]" />
			</td>
			<td class="edit-talbe-label" id="NFOBFEBJPMNGLKFOLFJGPONACHKFNNNINCAFEHGENACCMIBNMMOINBLFHEILMHBP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.fetchfactory#}" ></html:label>
			</td>
			<td  id="KCIEOFPOOAMJKHIGBBCOOKIEGOKMKKEBHLCKBMJHLCPJNGPJKCIKEGBIBMCLHHNA" colSpan="1" rowSpan="1">
				<html:text  id="fetchFactory"  name="fetchFactory"  value="$[custOrderViewBean.fetchFactory]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KMAEEIJPPJGHFEGIBFFJOBGMFJMCFIBHOKNIONPFMBJHKCFKBKPMEHLANOAKNNGF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.deliverystatus#}" ></html:label>
			</td>
			<td  id="HBLBFIIGNABKKFIKEPMAJMMOAIBMPFEJKABAKOKKPMIKAOEPAPGOPNACNNGCKMAP" colSpan="1" rowSpan="1">
				<html:text  id="deliveryStatus"  name="deliveryStatus"  value="$[custOrderViewBean.deliveryStatus]" />
			</td>
			<td class="edit-talbe-label" id="OAAJEFLNHCFHEMEFOJPKGOINKPMBEJIKIMGHFMEHNOMKPPGCGHHNPIJKPHAJFBBL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.createdate#}" ></html:label>
			</td>
			<td  id="GENOIGBKENBIGJOOMENKLKHICCEJJPBIEPNAMCKFHAFAKGFFJHKCMOGALKLAEMJN" colSpan="1" rowSpan="1">
				<com:simplendar  id="createDate"  name="createDate"  value="$[custOrderViewBean.createDate]" />
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:submit('custOrderForm')"/>
				<btn:return href="contoller.do?operation=listCustOrder"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
