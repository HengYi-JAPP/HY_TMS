<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

String userSalesNo =(String)request.getSession().getAttribute("user_sales_no");
userSalesNo= userSalesNo==null?"":userSalesNo.trim();
String salesNos[]=userSalesNo.split(",");
 %>

<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<script type="text/javascript">
       function submitSyncForm(){
             document.getElementById("operation").value="toSyncOrderUseOrderCode";
             __vsubmit('ordersynForm')
       }
</script>
<html:form id="ordersynForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader   simplendar="true" />
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.transport.title.transportsyn") %>' name="title"/>
	</jsp:include>
	<%if("".equals(userSalesNo)||salesNos==null||salesNos.length==0){%>
		<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				您已经登录超时，请重新登录；如登录后，仍不能同步，请和管理员联系，确认是否已经正确设置销售组号。
			</html:td>
		</html:tr>
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listCustOrder"/>
			</html:td>
		</html:tr>
	</html:table>
	<%}else{ %>
	<html:hidden id="operation" name="operation" value="toSyncSalesOrder"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<table id="1679" class="edit-talbe" >
		<tr class="trCell">
			<td class="edit-talbe-label" id="MMIFBPOPNNCMEKCNAPPFLKKJOBMBEEKHIBCMEGOFOMBFNFHCJIHPGMJIANOHBJKM" colSpan="1" rowSpan="1">
				<html:label  label="开始日期" ></html:label>
			</td>
			<td  id="MKMEMBJMIPHIHBHKNBLJIEKNMHLBFAGBPEAALKEENCOBANHIPGBIJJGOAAJAPHHP" colSpan="1" rowSpan="1">
				<com:simplendar id="startDate" name="startDate" defaultToday="true"/>
			</td>
			</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FLBFGPIJKCKEKJGPJKBGHOKGGNKEAIHGEOGKKEEBLHFGIJFKGHILFMJIGBHPKCMJ" colSpan="1" rowSpan="1">
				<html:label  label="结束日期" ></html:label>
			</td>
			<td  id="FIKNPNBMONHEMFEGPNMCKLBHMKGJJOLCLLNHINHBKFIBCAJGKPBNCNEPKLJCEBMI" colSpan="1" rowSpan="1">
					<com:simplendar id="endDate" name="endDate" defaultToday="true" />
			</td>
		</tr>
		<%--
		<tr class="trCell">
			<td class="edit-talbe-label" id="PFAJANLPIOPIIIAKIGCHPOKHKACCKCPBBEANBFJHOHBHCCJBIKIKKBKAGIBKPGFL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.privilege.user.salesNo#}" ></html:label>
			</td>
			<td  id="OKMEAFGFLBEMJOPNCGJFAMNKJLOLCFIEIKBCKLIOKPHAFCGALKLHKPFKCICKPKEE" colSpan="1" rowSpan="1">
				<select  id="salesNo"  name="salesNo"   >
				<%for(int i=0;i<salesNos.length;i++){ %>
					<option  value="<%=salesNos[i] %>" ><%=salesNos[i] %></option>
				<%} %>
				</select>
			</td>
		</tr> --%>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:button href="javascript:__vsubmit('ordersynForm')" value="同步" name="" typeId="synid" 
				style="width: 50px;height:24px;border-style:none;background-repeat:no-repeat;background-color:transparent;color: #2889c4;font-weight:bold;font-size: 14px;cursor:pointer;border: 1px solid #77b8df;border-radius: 4px;padding: 0 10px;"/>
				<btn:return href="contoller.do?operation=listCustOrder"/>
				
				 <cext:priv code="_htms_sync_order_userordercode">
				    <btn:button href="javascript:submitSyncForm();" value="同步-通过销售组比较" name="" typeId="synid" 
				        style="width: 150px;height:24px;border-style:none;background-repeat:no-repeat;background-color:transparent;color: #2889c4;font-weight:bold;font-size: 14px;cursor:pointer;border: 1px solid #77b8df;border-radius: 4px;padding: 0 10px;"
				    />
				 </cext:priv>
			</html:td>
		</html:tr>
	</html:table>
	<%} %>
	<com:validator formId="ordersynForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="startDate"  types="isnull" event="onblur">
				<com:init size="10" maxlength="10" ></com:init>
			</com:vElement>
			<com:vElement id="salesNo"  types="isnull" event="onblur">
				<com:init  maxlength="60" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
