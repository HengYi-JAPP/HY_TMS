<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

List<CustomerAddrBean> addrLists = (List<CustomerAddrBean>)request.getAttribute("addrLists");
String caddrId = request.getParameter("caddrId");
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="auditForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="passShip"/>
	<html:hidden id="applyStatus" name="applyStatus" value="1"/>
	<html:hidden id="transStatus" name="transStatus" value="0"/>
	<html:hidden id="isValidate" name="isValidate" value="1" />
	<html:hidden id="isDefault" name="isDefault" value="1"/>
	<html:hidden id="shipId" name="shipId" value="shipViewBean.shipId"/>
	<html:hidden id="caddrId" name="caddrId" value="<%=caddrId %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.approve") %>' name="title"/>
	</jsp:include>
	<table id="1661" class="edit-talbe">
	<tr class="trCell">
			<td class="edit-talbe-label" id="PABJOKFOKIGCLEHLFLJNCNKOPGANOPEAAGFIFMIKEAGIGFKEHKPOLGPFJKNBEIOK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td  id="OAAMGEGFMMEJLEKNOPMFNMEEAPCKCJBONAIPKKNOMMEJBCEFFOIMGJJBKMEAHKPO" colSpan="1" rowSpan="1" width="431px">
				<html:value  value="$[shipViewBean.customerName]" ></html:value>
			</td>
			<td class="edit-talbe-label" id="MCKAJBJCKLLNAKGEGOLKKOIKAKCBKKCLIMBKGPALKLCEKGKKOKPEIBKKAKLEGBKK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.customercode#}" ></html:label>
			</td>
			<td  id="NCILOFIEEMLKCGNMIKCGEKBKBLHEFFNPCNJCGKOHNNKGFAKMKOMOKCLLHKJOGNGJ" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.customerCode]" ></html:value>
				<html:hidden id="corderId" name="corderId" value="shipViewBean.corderId"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FPHFFHOHIKJKAANOJLEJBFJNPMGECGHIKOMIMAEPOGPBGEMNGIOHNGGHNCMNAOBJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.productgroup#}" ></html:label>
			</td>
			<td  id="GKOANFGFPIFAEGOEFMCGLHEKJCBOKAMHKOKOGBKCOCINAALANKMNNOKNHBFKLCHI" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.productGroup]" ></html:value>
			</td>
			<td class="edit-talbe-label" id="ELGIPNNKIFHJFHNFCKLNFPNGLALMMPHLPFFNBPKKELBKAOEOOCACEHCEGOPFEPEM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.deliverystatus#}" ></html:label>
			</td>
			<td  id="AFKMGAKELGCPPJKPABNKPABNNAGPNAAMHKLHEHKOHPKOOMBFOILMIFLBBBBNBGPO" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.deliveryStatus]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GLKABKOJNFEFLBJNJLMCOBEBGHFFJOAKEJONKPLIPIAEPLBBHPIHGEGCFCCPAOKJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="AGOBHHEHEKKJKHHJMLOGGLFFHLCLHNFLBLOBJEHOKNOFFNHJKKFKKOGMBAOAHPHH" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.corderCode]" ></html:value>
			</td>
			<td class="edit-talbe-label" id="FBIBNEPPCOEMAGHHKAKGOIIPKMNPNCIHJLJCKNCFIGMMKGHKJBKBJFNPABPNJOOE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.salegroup#}" ></html:label>
			</td>
			<td  id="PBJKFHJGLHHENONMEJOAELBCCKPJJFJAEKKAMCKLHOKKLFKLLLJEEAPKEKPKAJKC" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.saleGroup]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NKFKHAKHMPKAHOKKFJLIPJCHPKIMMHMJPLAKFMIHENHFKGJOPBNJLJKGNMGHHHMK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.salenum#}" ></html:label>
			</td>
			<td  id="KAOCLCOKALFJKLEFPJBNIOKFFEIGIIFHJGLNPFOPAGIEHOKNCNGGIJNPBGAFMGEA" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.saleNum]" ></html:value>
			</td>
			<td class="edit-talbe-label" id="AHGOEBCOCIIIMIIEAHAGFBLFOMJKOHKKLPMOCEMNLIAHKFIKOECLOGMHPBEMLJGE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.saledepartment#}" ></html:label>
			</td>
			<td  id="ICGHNFGCKJLMCOPEGPLLHAFLALJCEIHOCPEEPPKMHKOMKKNOOOMGOBGFMMABBBGA" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.saleDepartment]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="PNMCBBKHHNJOFONKPBMKHBKEGJALBBHJFNEPMACNNKCLIJMMOPGKLFHBNIEGFEAI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.salechannel#}" ></html:label>
			</td>
			<td  id="KLIPHEIIFHAJEBBOKANLENGIBAKHKKOOCJCFOGKHNLEFMMOHLPFAJELNNHJJFIGG" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.saleChannel]" ></html:value>
			</td>
			<td class="edit-talbe-label" id="MICBKKJINLFHJOKBELFMNMHBKFAAOLGLBFKLKKKKKFAFBLLMFFEHBGGKCHLIFHPC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.saletype#}" ></html:label>
			</td>
			<td  id="HJNEECCCMHCHOOFKOKPHEAGAIFINHALEIBILEJKEGPKINHGJBKKOBCHGKGKANHEK" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.saleType]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="ELAEENKEHOGNOEGIFELIKIFCGNNMHBNNPPHPPOKCOHCCPJEGFHHGPFLHBKILFKJC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.exchangetitle#}" ></html:label>
			</td>
			<td  id="FJEBAALOOPKBEOEOIGGBNHNGHJKHHHCKFAACKHKAPNKBHLCGKOKBMOJOMKEJHCJN" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.exchangeTitle]" ></html:value>
			</td>
			<td class="edit-talbe-label" id="HNKFPBEBLNOJCFAOIAMFBNIOHBKKJKHBIJAIMCCKPNMACCLCHEOGANHPIHCLMCFO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.fetchfactory#}" ></html:label>
			</td>
			<td  id="BIPIJHCLOKEPEHKMAKHKBKKLJNFAKIMNKBCOKIFLKMFMNOGLEMLJEHJAOCLEPEEE" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.fetchFactory]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LPMJHGAKANKLCFIPPGIBBNJMMBGOANCNKMEOBIJHKKGBIPGPEAEJCOKOAHCJPFEB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.applytonnum#}" ></html:label>
			</td>
			<td  id="GIFBOFACBOJMJABHEIEHLAANCJLKJACPJPMGNJALNOAACOHCPHGOJKJOFGICGBKK" colSpan="1" rowSpan="1">
				<html:value value="$[shipViewBean.applyTonNum]" />
				<html:hidden id="applyTonNum" name="applyTonNum" value="shipViewBean.applyTonNum" />
			</td>
			<td class="edit-talbe-label" id="KMOOAKFNLJPLOKPNKBAJACOBGEIBBJEAJPPPABALMANHKMHNPLHNPCAEEBGMAMFJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.applypacknum#}" ></html:label>
			</td>
			<td  id="LNIKLKLNPMOOJMINALJBIICCGIHCKMNJKPKBKFHAJGAGIEPBANKHAKLNNCLKGGKJ" colSpan="1" rowSpan="1">
				<html:value  value="$[shipViewBean.applyPackNum]" />
				<html:hidden id="applyPackNum" name="applyPackNum" value="$[shipViewBean.applyPackNum]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LPMJHGAKANKLCFIPPGIBBNJMMBGOANCNKMEOBIJHKKGBIPGPEAEJCOKOAHCJPFEB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.customerbalance#}" ></html:label>
			</td>
			<td  id="GIFBOFACBOJMJABHEIEHLAANCJLKJACPJPMGNJALNOAACOHCPHGOJKJOFGICGBKK" colSpan="1" rowSpan="1">
				<html:value value="1000.00" />
			</td>
			<td class="edit-talbe-label" id="KMOOAKFNLJPLOKPNKBAJACOBGEIBBJEAJPPPABALMANHKMHNPLHNPCAEEBGMAMFJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.inventoryamount#}" ></html:label>
			</td>
			<td  id="LNIKLKLNPMOOJMINALJBIICCGIHCKMNJKPKBKFHAJGAGIEPBANKHAKLNNCLKGGKJ" colSpan="1" rowSpan="1">
				<html:value  value="1000" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FGPLNOINKJFAOBKONPKFOKNLOKNJAAPJINJEKCIOFJHLHGANGOHMMKFFCHMPCFFM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.shipnotice#}" ></html:label>
			</td>
			<td  id="PBIFFJIJPFECOMFBLLJFJOMKCBKCFHKHCNMOLBAKIPPMGJLENLOMKPKKANAOOJHH" colSpan="3" rowSpan="1">
				<html:value value="$[shipViewBean.shipNotice]"/>
				<html:hidden id="shipNotice" name="shipNotice" value="$[shipViewBean.shipNotice]"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label label="{$jsp.htms.sales.customeraddr.address#}"></html:label>
			</td>
			<%
			if(addrLists!=null){
				CustomerAddrBean addrBean = null;
					for(int i=0;i<addrLists.size();i++){
						addrBean=addrLists.get(i);
			%>
			<td colSpan="3" rowSpan="1">
				<html:value value="<%=addrBean.getAreaName() %>"></html:value>
			</td>
			<%}} %>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FGPLNOINKJFAOBKONPKFOKNLOKNJAAPJINJEKCIOFJHLHGANGOHMMKFFCHMPCFFM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.approvenotice#}" ></html:label>
			</td>
			<td  id="PBIFFJIJPFECOMFBLLJFJOMKCBKCFHKHCNMOLBAKIPPMGJLENLOMKPKKANAOOJHH" colSpan="3" rowSpan="1">
				<html:textarea id="approveNotice"  name="approveNotice" cols="40" rows="5" ></html:textarea>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:passaudit href="javascript:submit('auditForm')"/>
				<btn:return href="contoller.do?operation=listApproveShip"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
