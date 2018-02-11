<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="shipForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyShip"/>
	<html:hidden id="isValidate" name="isValidate" value="shipViewBean.isValidate"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1668" class="edit-talbe">
	<html:hidden id="shipId" name="shipId" value="$[shipViewBean.shipId]"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NKCAGFKIMEKGHPKIKHOPCPOLGEOHPEOGBFBGKLNKOCIHGPHBBLKAPCGAEPLPCKKK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="MENEFBONJKOIKHLOPBECKMLBGAGKAPAOLJFEFNMHGIPJJJANCHEEJBNHEGEKEKAI" colSpan="1" rowSpan="1">
				<html:select  id="corderId"  name="corderId"  list="custOrderList" ><html:option  selected="$[shipViewBean.corderId]"  value="corderId"  label="corderName" ></html:option></html:select>
			</td>
			<td class="edit-talbe-label" id="FONACLCAEINCKFNIOAPENKBKHHGNNEGMGILPNFPOIBBKKHCFIGOKKIAHGHNMEOHK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</td>
			<td  id="LKCCLEBIHJNFOEKPIPONLMKAKIKKKJKKLMLIFMMMEPOCENGIACKEFMOKMOLBNMKK" colSpan="1" rowSpan="1">
				<html:select  id="customerId"  name="customerId"  list="customerList" ><html:option  selected="$[shipViewBean.customerId]"  value="customerId"  label="customerName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="PNNGIKHBEHLKBFMKBIKNIIPEGPBIMBKONKJHGKJMOBHBAPJCEAGECKBOLNEEAJHN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.shipcode#}" ></html:label>
			</td>
			<td  id="JEEBIJIPFEJCKPGIKFBCGIHHKAKFGBEIOFKEKKOMPFMPMCMEPLNHJNCKHKHBKMPL" colSpan="1" rowSpan="1">
				<html:text  id="shipCode"  name="shipCode"  value="$[shipViewBean.shipCode]" />
			</td>
			<td class="edit-talbe-label" id="ANIIOIIKNIFKOMCKOOLJKCLMPEMHFKBMOFNAANKLOAELPKHHCCAPGBHFBJCEMBOJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.applier#}" ></html:label>
			</td>
			<td  id="HKCOBBLIHOOJJMOHPNOCCAKBHKGPPFKBAGAMCMNKLINKKJNHEHBBBMPKNHMPGIEE" colSpan="1" rowSpan="1">
				<html:text  id="applier"  name="applier"  value="$[shipViewBean.applier]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="JCHNEJKEBPIJCFIAAPMKJOFLAOKPJJLFAILJKNFFMICIPKAPBIMMGHGNKFMMNLPH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.applytonnum#}" ></html:label>
			</td>
			<td  id="AKKBBKGAKPJNGBNGKAEFFPKOCGGNEGOEKGFHCGGINCGGMLHJIBAMGKBCNCANMNAF" colSpan="1" rowSpan="1">
				<html:text  id="applyTonNum"  name="applyTonNum"  value="$[shipViewBean.applyTonNum]" />
			</td>
			<td class="edit-talbe-label" id="MFBJJKAIPHKACGNGBGCCOMBIINFBFCFEFBPPNPLKKKAIBMAGJGGAINILONKOKJKF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.applytime#}" ></html:label>
			</td>
			<td  id="CFHFAGKIAPKOIPCKICLKNMNIKAHJBKFIFGCLCHOJKOIKLGAFCOEOCGMOLJIGMBLK" colSpan="1" rowSpan="1">
				<html:text  id="applyTime"  name="applyTime"  value="$[shipViewBean.applyTime]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BCPEAKKFEJLGBFAIPEEHPGNBBJKMGENCMNLKLAAFFKOKAEEONFHCLOEAGGBNOFKO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.applypacknum#}" ></html:label>
			</td>
			<td  id="JCEBBAHIOKCLNIMKPAGCIBFBCIOILINJBJLLGECLFLGFFBGILKMHGKCJBNIFIJHL" colSpan="1" rowSpan="1">
				<html:text  id="applyPackNum"  name="applyPackNum"  value="$[shipViewBean.applyPackNum]" />
			</td>
			<td class="edit-talbe-label" id="LEKIMENNHPOOGPHINKACKFFANHANNOLMNFEKHFLBNKEGMKFAPAHOBNGANFBNIMJI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.applystatus#}" ></html:label>
			</td>
			<td  id="LBKHKJGAOAAKFLLNHKEOGCBBNNMKGFHPLOBLKELJLKMAFLFJOKOBFGJGAOKLMBEH" colSpan="1" rowSpan="1">
				<html:text  id="applyStatus"  name="applyStatus"  value="$[shipViewBean.applyStatus]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LLHOLMPLGGPOCFKJOBAAHKCIOGLGHIKOKNILFLLLAANKJELNEKBKCIOELAGGLEGM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.actualtonnum#}" ></html:label>
			</td>
			<td  id="FFPKLFFJFCFCKHEKBGHNKALIOBLNNOBBPKPCCOFKEFJAJHNIFMEKMILPPFGKJENJ" colSpan="1" rowSpan="1">
				<html:text  id="actualTonNum"  name="actualTonNum"  value="$[shipViewBean.actualTonNum]" />
			</td>
			<td class="edit-talbe-label" id="IKJMCIFAJLAKEGCOKKFEFMEAOACCOPJMCABPHGKPBKBKNKKGMJIHFKCLKFPLPCGK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.approver#}" ></html:label>
			</td>
			<td  id="EHKAOAIFJKKFFMPOMJAAHLGCEFOBBFFKIJKOLBNAFMALHIBLNOPAPJLKKEEIKKIE" colSpan="1" rowSpan="1">
				<html:text  id="approver"  name="approver"  value="$[shipViewBean.approver]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="AHPEEEJFPBENBAJKGAIKPKKBJMHKBBMIKBFIMBCHEKKKAKFGIKCKFCBKBKCEOKMI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.actualpacknum#}" ></html:label>
			</td>
			<td  id="LAKBMBKCIKHICICAANAGNKEEBEMEEKCKIAMAHPBFEJNLHFKFJALCMJHELKKOHIAM" colSpan="1" rowSpan="1">
				<html:text  id="actualPackNum"  name="actualPackNum"  value="$[shipViewBean.actualPackNum]" />
			</td>
			<td class="edit-talbe-label" id="EKAPEBLKKKKNHHJCACKGPEBFILMCFBBOJILILMMOKGOCFCMFFCBFNKNNCAJCBNAK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.approvetime#}" ></html:label>
			</td>
			<td  id="IFCNEJNKNHHNCCLBBKBAJEFGPOJFKECAKBCINJOGHBJNKPMKHAFABGHKKJAAOFPJ" colSpan="1" rowSpan="1">
				<html:text  id="approveTime"  name="approveTime"  value="$[shipViewBean.approveTime]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="EGPBKPJPOJLGOGKKGJCOEJKHACAHKFGNNKKKAIEPMAELFHKAEPLAACAOCLKGPKFE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.planfreight#}" ></html:label>
			</td>
			<td  id="FKAMNAKKAECAMLCIPKFPAKMNMNGPGMGOFELEHFPGEFKLEICOFPKAFPNPFHMJIFKO" colSpan="1" rowSpan="1">
				<html:text  id="planFreight"  name="planFreight"  value="$[shipViewBean.planFreight]" />
			</td>
			<td class="edit-talbe-label" id="MNBGPCEACIKHABOENBLAILKFKFKPHOGKICFONEJFMANEPAEFHKPHFEIGEKONKEAJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.freightunit#}" ></html:label>
			</td>
			<td  id="JAECFMFBMHKFPFEGOMJAAGGOBANHPFKCGGAEEPMNLAKBBMJJBCNIPKKAMKLKHFPN" colSpan="1" rowSpan="1">
				<html:text  id="freightUnit"  name="freightUnit"  value="$[shipViewBean.freightUnit]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KKJPKGKCHIPANBCMMAEEFEOHMNANLLJFILLIMKCFCNAIHPHCLAGJFNGGJGFLCKEB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.actualfreight#}" ></html:label>
			</td>
			<td  id="LLLEFKLLKKAKKCBOMELIMNALLMLANCMOBPEBCKAKNOKEOIPPFGFCOPAFHHECHMHE" colSpan="1" rowSpan="1">
				<html:text  id="actualFreight"  name="actualFreight"  value="$[shipViewBean.actualFreight]" />
			</td>
			<td class="edit-talbe-label" id="CHHINNNOKGAIJJGICINIAEOIKCCFJACLNENCKFEIJOEHIJMOOHCBKGKKJNHKCOOK" colSpan="1" rowSpan="1">
			</td>
			<td  id="PIECIELEAAOKNNKHCKPCEAOKENLJCIEFAAOOMMGIONFIFKGMPNMMPKAPNAMBHKBB" colSpan="1" rowSpan="1">
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FGPLNOINKJFAOBKONPKFOKNLOKNJAAPJINJEKCIOFJHLHGANGOHMMKFFCHMPCFFM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.shipnotice#}" ></html:label>
			</td>
			<td  id="PBIFFJIJPFECOMFBLLJFJOMKCBKCFHKHCNMOLBAKIPPMGJLENLOMKPKKANAOOJHH" colSpan="1" rowSpan="1">
				<html:textarea id="shipNotice"  name="shipNotice" cols="40" rows="5" value="$[shipViewBean.shipNotice]"></html:textarea>
			</td>
			<td class="edit-talbe-label" id="PJJPOMPLMLEBKKAGPAAOLKFIEAGOHJLAOGMKALBJKBKNFLIBGHEGHJKPEKOCFNOO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.approvenotice#}" ></html:label>
			</td>
			<td  id="PPOENBGGLOOPJINICBCOGPLNMKPAIBGJHBFJLPFAKOPCCAFNKKANFJIEKKCMJFFE" colSpan="1" rowSpan="1">
				<html:textarea id="approveNotice"  name="approveNotice" cols="40" rows="5" value="$[shipViewBean.approveNotice]"></html:textarea>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:submit('shipForm')"/>
				<btn:return href="contoller.do?operation=listShip"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
