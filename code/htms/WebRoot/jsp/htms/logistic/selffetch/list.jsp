<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ page import="com.zzy.htms.logistic.transfer.TransferBean,com.zzy.htms.logistic.transfer.TransferUtils" %>

<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<%@page import="com.zzy.htms.dictionary.product.ProductRepository" %>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 Map<String, List<TransferBean>> transferDetailListMap=(Map<String, List<TransferBean>>)request.getAttribute("transferDetailListMap");
transferDetailListMap=transferDetailListMap==null?new HashMap<String, List<TransferBean>>():transferDetailListMap;

List<String> transferKeyList=(List<String>)request.getAttribute("transferKeyList");
transferKeyList=transferKeyList==null?new  ArrayList<String>():transferKeyList;


List<TransferBean> detailList=null;

	
 List<AreaBean> provinceList =AreaRepository.getRootNodeList();
 request.setAttribute("provinceList",provinceList); 
 
 
request.setAttribute("productList",ProductRepository.getProductList());
request.setAttribute("factoryList",FactoryRepository.getFactoryList());  

%>
<head>
<base href="<%=basePath%>">
 <style type="text/css">
 table{width:2050px;}
 </style>
</head>

<com:loader  js="js/common/common.js,resources/simpleupload/jquery-min.js,js/htms/dialog/dialog.js"/>
<com:loader css="css/common/table-list-new.css,css/htms/dialog/dialog.css"/>
<script type="text/javascript">
	var $jq = jQuery.noConflict(true);
   function getEstimateFreight(areaId,applyTime,factoryId,productId,applyTonNum,transId,corderId,orderCode,shipId,selfFetchType,customerCode){
		var basePath = basePath + '/controller.do';
		var selfFetchStatus="true";
		
		//"itemCode":itemCode,
		var parmas = {operation:'ajaxCalculationFreight',"areaId":areaId,"factoryId":factoryId,"productId":productId,"shipId":shipId,
		"selfFetchStatus":selfFetchStatus,"selfFetchType":selfFetchType,"customerCode":customerCode,"applyTonNum":applyTonNum,"applyTime":applyTime,"estimateStep":"4","transId":transId,"orderId":corderId,"orderCode":orderCode};
		$jq.ajax({
		    url:basePath,
		    type:'POST',     //GET
		    async:false,    //或false,是否异步
		    data:parmas,
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
				result=true;
				var resultStr=data.isSuccess;
				if(resultStr==0){
				   if(selfFetchType=="2"){
				       $jq.DialogByZ.Confirm({Title: "提示", Content: data.msg+"是否继续提交?",FunL:function() {
						    self.location.href="contoller.do?operation=doSelfFetch&transId="+transId+"&currentShipId="+shipId+"&selfFetchType="+selfFetchType;
						    $jq.DialogByZ.Close();
			  				return true;
			  			},FunR:function(){
			  				$jq.DialogByZ.Close();
			  				btnEnabledAgree(transId);
			  				result=false;
							return false;
			  			}});
				   }else{
					    $jq.DialogByZ.Alert({Title: "提示", Content:"未找到合适的线路或贸易商运价不存在,不能继续提交!",BtnL:"确定",FunL:alerts});
						result=false;
	                    btnEnabledAgree(transId);
						return false;
				   }
					
				}
				if(resultStr==1){
					$jq.DialogByZ.Confirm({Title: "提示", Content: data.msg+"是否继续提交?",FunL:function() {
					    self.location.href="contoller.do?operation=doSelfFetch&transId="+transId+"&currentShipId="+shipId+"&selfFetchType="+selfFetchType;
					    $jq.DialogByZ.Close();
		  				return true;
		  			},FunR:function(){
		  				$jq.DialogByZ.Close();
		  				btnEnabledAgree(transId);
		  				result=false;
						return false;
		  			}});
				}
		    },
		    error:function(xhr,textStatus){
		    	result=false;
		    }
		})
		return result;
	}

</script>

<html:form id="selfFetchForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" loadCache="true" >
	<com:loader  simplendar="true"  ajax="true" asyncSelect="true"  />
	<html:hidden id="operation" name="operation" value="listSelfFtech"/>
	<com:loader binder="true" checkall="true" switchbox="true"  />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.selffetch.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1706" class="edit-talbe" style="width:2050px;" >
	     <tr class="trCell" style="width:100%" >
	        <td class="edit-talbe-label" id=""  colSpan="1" rowSpan="1" >
			       客户名称
			</td>
			<td  id="customerNameID" width="100px;" >
				<html:text id="customerNameSH" name="customerNameSH" value="$[customerNameSH]"/>
			</td>
			<td class="edit-talbe-label" id="" >
			       业务员
			</td>
			<td  id="saleManSH" >
				<html:text id="saleManSH" name="saleManSH" value="$[saleManSH]"/>
			</td>
			<td class="edit-talbe-label" id="" >
			       车牌号
			</td>
			<td  id="saleManSH" >
				<html:text id="fetchCarSH" name="fetchCarSH" value="$[fetchCarSH]"/>
			</td>
			<td class="edit-talbe-label" id="AKJKHMEALEFHKMKJHPNONJCILKPKCHPOPOBABNOCKBOKGABMFNCALPICOBEIKOOK" >
				调拨单号
			</td>
			<td  id="KPLOGMBLICMOLOJNNCBFKGEPPEJFNIFGMOLCNBFFKOHEIJMPMNEIFECJCBAKLIAJ" >
				<html:text id="transferCodeSH" name="transferCodeSH" value="$[transferCodeSH]"/>
			</td>
			<td  class="edit-talbe-label"  colSpan="1" rowSpan="1">
				省
			</td>
			<td  style="width:500px!important;">
				<html:select id="provinceId" name="provinceId"  list="provinceList" isCascade="true" isCascadeSource="true" cascadeTarget="cityId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</td>
			
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				市
			</td>
			<td  width="100px">
				<html:select id="cityId" name="cityId"   isCascade="true" isCascadeSource="true" cascadeTarget="countyId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					
				</html:select>
			</td>	
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				区(县)
			</td>
			<td  >
				<html:select id="countyId" name="countyId"  isCascade="true" isCascadeSource="true" cascadeTarget="countryId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
				
				</html:select>
			</td>	
			<td  class="edit-talbe-label" colSpan="1" rowSpan="1">
				乡镇、街道
			</td>
			<td >
				<html:select id="countryId" name="countryId"   isCascade="true"  cascadeValue="parentAreaId">
				</html:select>
			</td>					
			
		</tr>
	    <tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" >
				<html:label  label="{$jsp.htms.dictionary.route.factoryid#}"  ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJPRODUCTCODEOMMHPCJJJKCAOMBFAPKOINKLGNOK" style=" font-size: 14px;" colSpan="3" rowSpan="1">
				<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId"  checkedList="checkFactoryList" checkedValue="factoryId" checked="" />
			</td>	
			
			<td class="edit-talbe-label" id="LKOKHHFIBBFMFACTORYOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" >
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEFACTORYCODEPCJJJKCAOMBFAPKOINKLGNOK" style=" font-size: 14px;" colSpan="3" rowSpan="1">
				  <html:checkbox id="productIdSH"  name="productIdSH"  list="productList"  label="productName"  value="productId" property="productIdSH" accesskey="productIdSH" checkedList="checkProductList" checkedValue="productId" />
		
			</td>	
			
			
			<td class="edit-talbe-label" id="" >
			         下单时间
			</td>
			<td  id="" colSpan="1" rowSpan="1">
				 <com:simplendar id="createOrderTimeSH" name="createOrderTimeSH" value="$[createOrderTimeSH]"/>
			</td>
			
			<td class="edit-talbe-label" id="INACNKJLAKCPMKIEMCELIAMHJOKCKKEAHNNCLFLFINJCACGOBKNMGGFOGKLJJKMI" >
				<html:label  label="加急订单" ></html:label>
			</td>
			<td  id="OEPPIOFKCKEHPGIBNKNLOICMEIJLKKKPMOFLBLKMCBMLKOPJNNLCBBIELCMJKHMN" colSpan="1" rowSpan="1">
				<html:select  id="isUrgentSH" name="isUrgentSH" >
					<html:option label="是" value="1" selected="$[isUrgentSH]"></html:option>
					<html:option label="否" value="0" selected="$[isUrgentSH]"></html:option>
				</html:select>
			</td>
			<td class="edit-talbe-label" id="INACNKJLAKCPMKIEMCELIAMHJOKCKKEAHNNCLFLFINJCACGOBKNMGGFOGKLJJKMI" >
				 状态
			</td>
			<td  id="OEPPIOFKCKEHPGIBNKNLOICMEIJLKKKPMOFLBLKMCBMLKOPJNNLCBBIELCMJKHMN"  colSpan="1" rowSpan="1">
				<html:select  id="transStatusSH" name="transStatusSH" >
					<html:option label="已分配" value="1" selected="$[transStatusSH]"></html:option>
					<html:option label="未分配" value="0" selected="$[transStatusSH]"></html:option>
				</html:select>
			</td>
			<td class="edit-talbe-label" id="INACNKJLAKCPMKIEMCELwerwerwerewrCGOBKNMGGFOGKLJJKMI" >
				 自提分类
			</td>
			<td  id="OEPPIOFKCKEHPGIBNKNLOICMEIJLKKKPMOFLBLKMCBMLKOPJNNLCBBIELCMJKHMN"  colSpan="1" rowSpan="1">
				<html:select  id="orderTypeSH" name="orderTypeSH" >
					<html:option label="客户自提未分配"   value="2" selected="$[orderTypeSH]"></html:option>
					<html:option label="客户自提已分配"   value="10" selected="$[orderTypeSH]"></html:option>
					<html:option label="贸易商自提未分配" value="1" selected="$[orderTypeSH]"></html:option>
					<html:option label="贸易商自提已分配" value="9" selected="$[orderTypeSH]"></html:option>
				</html:select>
			</td>
	    </tr>
		
		<tr class="trCell">
		     <td  class="search-box"   id="searchBox" colSpan="16" rowSpan="1"  style="border-right: none;">
		           <btn:search href="javascript:submit('selfFetchForm')"/>
				<btn:reset href="javascript:cleanForm('selfFetchForm')"/>
		    </td>
		</tr>
	</table>
	
	<table class="background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="border-collapse: collapse;margin-top: 10px;" align="center">
		<tr  class="headerStyle" >
		    <td width="120px">操作</td>
		    <td width="40px">加急</td>
		    <td width="50px">自提分类</td>
			<td width="300px">送货地址</td>	
			<td width="180px">客户名称</td>
			<td width="80px">车牌号</td>
			<td width="80px">联系方式</td>
			<td width="100px">订单号</td>
			<td width="100px">申请号</td>	
			<td width="100px">调拨单号</td>
			<td width="100px">SAP调拨单号</td>
			
			<td width="80px">业务员</td>
			<td width="80px">下单时间</td>
			<td width="120px">申请时间</td>
			<td width="120px">审批时间</td>
		
			
			<td width="50px">数量</td>
			<td width="50px">包数</td>
			<td width="50px">工厂</td>
			<td width="50px">产品</td>
			
			<td width="50px">SAP单价</td>
			<td width="50px">单价</td>
			<td width="50px">运费</td>
			
			
		</tr>
	<%
	    TransferBean transBean=null;

		for(int i=0,size=transferKeyList.size();i<size;i++){
			detailList=transferDetailListMap.get(transferKeyList.get(i));
				for(int d=0,dsize=(detailList==null?0:detailList.size());d<dsize;d++){
					transBean=detailList.get(d);
					request.setAttribute("transferBean",transBean);					
					String corderCode = transBean.getCorderCode().replaceFirst("^0*","");
					String shipCode = transBean.getShipCode().replaceFirst("0*","");
					String transferCode=transBean.getTransferCode().replaceFirst("0*","");
					int transStatus=0,isDefault=0,isUrgent=0,selfFetch=0;
					isUrgent=transBean.getIsUrgent();
					selfFetch=transBean.getSelfFetch();
					transStatus=transBean.getTransStatus();
					
				%>
					<tr class="alternatingItemStyle" >
						<%if(d==0){
						 %>
						            <td style="text-align:center;" rowspan="<%=dsize %>">
										<%if(selfFetch==1||selfFetch==2){ %>
										
										<%-- <btn:audit  id="agreeBtn_$[transferBean.transId]" onclick="btnDisabled('$[transferBean.transId]');" value="同意" name="同意"  href="contoller.do?operation=doSelfFetch&transId=$[transferBean.transId]&currentShipId=$[transferBean.shipId]" /> --%>										 
										<!-- <html:a  href="contoller.do?operation=doSelfFetch&transId=$[transferBean.transId]&currentShipId=$[transferBean.shipId]"  style="border:0;text-decoration:none;">
										-->
											<btn:button   id="agreeBtn_$[transferBean.transId]"  typeId="auditBtn"  styleClass="commonBtn"  name="同意" value="同意"  onclick="btnDisabledAgree('$[transferBean.transId]','agreeBtn_');getEstimateFreight('$[transferBean.areaId]','$[transferBean.shipApplyTime]','$[transferBean.factoryId]','$[transferBean.productId]','$[transferBean.applyTonNum]','$[transferBean.transId]','$[transferBean.corderId]','$[transferBean.corderCode]','$[transferBean.shipId]','$[transferBean.selfFetch]','$[transferBean.customerCode]');"/>
										<!-- 
										</html:a>
										 -->
										
										
										<html:a  id="delBtn_$[transferBean.transId]" href="contoller.do?operation=rejectSelfFetch&transId=$[transferBean.transId]&currentShipId=$[transferBean.shipId]"  style="border:0;text-decoration:none;">
											<btn:button typeId="auditBtn" styleClass="commonBtn"   name="拒绝" value="拒绝"  onclick="btnDisabled('$[transferBean.transId]','delBtn_');"/>
										</html:a>
										<%} %>
										<%if(selfFetch==9||selfFetch==10){//分配承运商未排车的可以取消 %>
										    <btn:cancel  href="contoller.do?operation=cancelSelfFetch&transId=$[transferBean.transId]&currentShipId=$[transferBean.shipId]"  />
										<%} %>
									</td>
									
									<td style="text-align:center;"  rowspan="<%=dsize %>" >
										<%if(isUrgent==0){ %>
										       <img src="images/htms/green.png"  height="20" width="20" />
										<%}	if(isUrgent==1){ %>
										       <img src="images/htms/red.png" height="20" width="20" />
										<%} %>
									</td>
									<td style="text-align:left;"   rowspan="<%=dsize  %>" >
										<%if(selfFetch==2||selfFetch==10){ %>
										         客户
										<%}	if(selfFetch==1||selfFetch==9){ %>
										        贸易商
										<%} %>  
								    </td>
									<td style="text-align:left;"   rowspan="<%=dsize  %>">
										     <html:a style="text-decoration:none;" href="contoller.do?operation=viewSelfFetch&corderId=$[transferBean.corderId]&codetailId=$[transferBean.codetailId]&transId=$[transferBean.transId]&transDetailId=$[transferBean.transDetailId]&caddrId=$[transferBean.caddrId]">
										         <%=transBean.getAreaName()+transBean.getCaddrDetail()%>
										     </html:a>
								    </td>
								    
								    <td style="text-align:left;"   rowspan="<%=dsize %>" ><%=transBean.getCustomerName() %></td>
								    
								    <td style="text-align:center;" rowspan="<%=dsize %>"><%=transBean.getFetchCar()%></td>
								    <td style="text-align:center;" rowspan="<%=dsize %>"><%=transBean.getFetchMobile() %></td>
											
									<td style="text-align:center;" rowspan="<%=dsize %>"><%=corderCode%></td>
									
									<td style="text-align:center;" rowspan="<%=dsize %>"><%=shipCode %></td>
								
									<td style="text-align:center;line-height:28px;"  rowspan="<%=dsize %>"><%=transferCode %></td>
									<td style="text-align:center;line-height:28px;"  rowspan="<%=dsize %>"><%=transBean.getSapTransCode() %></td>
									<td width="80px"  rowspan="<%=dsize %>" ><%=transBean.getSaleMan() %></td>
										
									<td   rowspan="<%=dsize %>" ><%=transBean.getCustOrderCreateTime() %></td>
									<td width="80px"  rowspan="<%=dsize %>" ><%=transBean.getShipApplyTime() %></td>
									<td width="80px"  rowspan="<%=dsize %>" ><%=transBean.getApproveAgreeTime() %></td>
									
						<%} %>
						     <td style="text-align:right;"  >
							      <html:a style="text-decoration:none;" href="contoller.do?operation=viewSelfFetch&corderId=$[transferBean.corderId]&codetailId=$[transferBean.codetailId]&transId=$[transferBean.transId]&transDetailId=$[transferBean.transDetailId]&caddrId=$[transferBean.caddrId]">
							           <%=transBean.getDetailApplyTonNum()%>
							      </html:a>
						     </td>
								
								
							<td style="text-align:right;"  >
							      <html:a style="text-decoration:none;" href="contoller.do?operation=viewSelfFetch&corderId=$[transferBean.corderId]&codetailId=$[transferBean.codetailId]&transId=$[transferBean.transId]&transDetailId=$[transferBean.transDetailId]&caddrId=$[transferBean.caddrId]">
							           <%=transBean.getDetailApplyPackNum() %>
							      </html:a>
							</td>
						   
						    <td > <%=transBean.getFactoryName() %> </td>
			                <td > <%=transBean.getProductName() %> </td>
						      
									     <td style="text-align:right;" ><%=transBean.getFreight() %></td>
										 <td style="text-align:right;"><%=transBean.getUnitPrice() %></td>
										 <td  style="text-align:right;"><%=transBean.getTransportTotalPrice() %></td>
						 <%if(d==0){%>
						               
						 <%} %>
						
					</tr>
				<%}//for 
				} %>
	</table>
	

	
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkTransferId" checkId="checkAll"/>
				<com:page formId="selfFetchForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>

<script type="text/javascript">
	var provinceId="<html:value value='$[cacheProvinceId]'/>";
	var cityId="<html:value value='$[cacheCityId]'/>";
	var countyId="<html:value value='$[cacheCountyId]'/>";
	var countryId="<html:value value='$[cacheCountryId]'/>";
	selectItemByValue("provinceId",provinceId);
	selectItemByValue("cityId",cityId);
	selectItemByValue("countyId",countyId);
	selectItemByValue("countryId",countryId);
</script>
<jsp:include page="../../../common/invokeMessage.jsp" />
<%
String SAP_INVOKE_MESSAGE=(String)request.getAttribute("SAP_INVOKE_MESSAGE"); 
SAP_INVOKE_MESSAGE=SAP_INVOKE_MESSAGE==null||"".equals(SAP_INVOKE_MESSAGE.trim())?"":SAP_INVOKE_MESSAGE;
SAP_INVOKE_MESSAGE=SAP_INVOKE_MESSAGE.replaceAll("'","\"");
//System.out.println("SAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGE===:"+SAP_INVOKE_MESSAGE);
%>
<script type="text/javascript"> 	
var SAP_INVOKE_MESSAGE='<%=SAP_INVOKE_MESSAGE%>';
if(SAP_INVOKE_MESSAGE!=null&&SAP_INVOKE_MESSAGE!='null'&&SAP_INVOKE_MESSAGE!=''){
alertTip(SAP_INVOKE_MESSAGE);
}

function btnEnabledAgree(matchId){
	$("#agreeBtn_"+matchId).removeAttr("disabled"); 
    $("#delBtn_"+matchId).removeAttr("disabled"); 
}

function btnDisabledAgree(matchId,btnType){
    $("#agreeBtn_"+matchId).attr("disabled",true);
    $("#delBtn_"+matchId).attr("disabled",true);
}

function btnDisabled(matchId,btnType){
	var agreeBtn=document.getElementById("agreeBtn_"+matchId);
	var delBtn=document.getElementById("delBtn_"+matchId)
	document.getElementById(btnType+matchId).click();  
    agreeBtn.removeAttribute('href');   
    delBtn.removeAttribute('href');  
}
</script>