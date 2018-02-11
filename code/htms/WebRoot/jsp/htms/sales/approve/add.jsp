<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="shipForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addShip"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.add") %>' name="title"/>
	</jsp:include>
	<html:table id="1667" styleClass="edit-talbe" list="custOrderList" bean="custOrderBean">
		<html:tr styleClass="trCell" >
			<html:td styleClass="edit-talbe-label" id="IJPOKCAILHMAGCLLHCABLCOACOPHHGPEOMJLFKOKOLKMBCPNEGABJAJNCOENAIMK" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</html:td>
			<html:td  id="IIHLBOAKJGBEEAOAJLLOFOBKHIBHBJCNAPKLLHIACAOCFKKPGEPGHIFPCPNAMMEB" colspan="1" rowspan="1">
					<html:value  value="custOrderBean.corderCode"></html:value>
			<html:hidden id="corderId" name="corderId" value="custOrderBean.corderId" />
			</html:td>
			<html:td styleClass="edit-talbe-label" id="MBKMJEAINFICCBEOAFKPIPKOCFKKIANCKKPJIMKHHNNJBBPOPMOKJPEEPMBKCHLF" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</html:td>
			<html:td  id="OONEFGIKOGIKAFCNEHJCNJJPIOBFCOMKBBKLOJLLPJOMNPIIGABKPGCPLFPHCBGJ" colspan="1" rowspan="1">
				<html:value  value="custOrderBean.customerName"></html:value>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			
			<html:td styleClass="edit-talbe-label" id="LPMJHGAKANKLCFIPPGIBBNJMMBGOANCNKMEOBIJHKKGBIPGPEAEJCOKOAHCJPFEB" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.ship.applytonnum#}" ></html:label>
			</html:td>
			<html:td  id="GIFBOFACBOJMJABHEIEHLAANCJLKJACPJPMGNJALNOAACOHCPHGOJKJOFGICGBKK" colspan="1" rowspan="1">
				<html:text  id="applyTonNum"  name="applyTonNum" />
			</html:td>
			<html:td styleClass="edit-talbe-label" id="KMOOAKFNLJPLOKPNKBAJACOBGEIBBJEAJPPPABALMANHKMHNPLHNPCAEEBGMAMFJ" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.ship.applypacknum#}" ></html:label>
			</html:td>
			<html:td  id="LNIKLKLNPMOOJMINALJBIICCGIHCKMNJKPKBKFHAJGAGIEPBANKHAKLNNCLKGGKJ" colspan="1" rowspan="1">
				<html:text  id="applyPackNum"  name="applyPackNum" />
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" id="FGPLNOINKJFAOBKONPKFOKNLOKNJAAPJINJEKCIOFJHLHGANGOHMMKFFCHMPCFFM" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.ship.shipnotice#}" ></html:label>
			</html:td>
			<html:td  id="PBIFFJIJPFECOMFBLLJFJOMKCBKCFHKHCNMOLBAKIPPMGJLENLOMKPKKANAOOJHH" colspan="3" rowspan="1">
				<html:textarea id="shipNotice"  name="shipNotice" cols="40" rows="5" ></html:textarea>
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:submit('shipForm')"/>
				<btn:return href="contoller.do?operation=listShip"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
