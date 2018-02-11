<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>
<%@page import="com.zzy.htms.sales.shipdetail.ShipDetailBean,java.math.BigDecimal" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

%>
<%String transferCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99); %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,resources/simpleupload/jquery-min.js"/>
<com:loader css="css/common/sub-table-list.css" switchbox="true"/>
<script type="text/javascript">
var itemsNos=[];

function showOrHideOrderDetail(boxId,displayId){
		var boxValue =document.getElementById(boxId).value
		if(boxValue=='1'){
		document.getElementById(displayId).style.display="block";
	}
	if(boxValue=='0'){
		document.getElementById(displayId).style.display="none";
	}
}
function getEstimateFreight(){
		var areaId=document.getElementById("areaId").value;
		var areaCode="";
		var result =false;
		var applyTime=document.getElementById("applyTime").value;
		var customerId=document.getElementById("customerId").value;
		var shipId=document.getElementById("shipId").value;
        var corderCode=document.getElementById("corderCode").value;
        var corderId=document.getElementById("corderId").value;
        
		var factoryId="";
		var productId="";
		var itemCode = "";
		var applyTonNum="";
		var shipDetailId="";
		
		for(var i=0;i<itemsNos.length;i++){
			var tonNum=document.getElementById("applyTonNum"+itemsNos[i]).value;
			if(!(tonNum==null||tonNum=="")&&parseFloat(tonNum)>0){
				//alert(tonNum+"  first   " +itemsNos[i]);
				factoryId   +=  document.getElementById("factoryId"+itemsNos[i]).value+",";
				productId   +=  document.getElementById("productId"+itemsNos[i]).value+",";
				itemCode    +=  document.getElementById("itemCode"+itemsNos[i]).value+",";
				applyTonNum +=  document.getElementById("applyTonNum"+itemsNos[i]).value+",";
				shipDetailId+=  document.getElementById("shipDetailId"+itemsNos[i]).value+",";
			}
		}
		
		if(applyTonNum!=""){
			factoryId =	factoryId.substring(0,factoryId.length-1);
			productId = productId.substring(0,productId.length-1);
			itemCode =	itemCode.substring(0,itemCode.length-1);
			applyTonNum =	applyTonNum.substring(0,applyTonNum.length-1);		
			shipDetailId=shipDetailId.substring(0,shipDetailId.length-1);	
		}
		
		var basePath = basePath + '/controller.do';
		var parmas = {operation:'ajaxCalculationFreight',"shipId":shipId,"orderId":corderId,"areaId":areaId,"orderCode":corderCode,"itemId":shipDetailId,"areaCode":areaCode,"customerId":customerId,
				"factoryId":factoryId,"productId":productId,"itemCode":itemCode,"applyTonNum":applyTonNum,"applyTime":applyTime,"estimateStep":2};
		$.ajax({
		    url:basePath,
		    type:'POST', //GET
		    async:false,    //或false,是否异步
		    data:parmas,
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
				result=true;
				var routeResult=confirm(data.msg+"是否继续提交?");
				if(routeResult==false){
					result=false;
					return false;
				}
				if(routeResult==true){
					return true;
				}
		    },
		    error:function(xhr,textStatus){
		    	result=false;
		    }
		})
		
		return result;
	}

function validateNotice(operationName){
	var selNotice=document.getElementsByName("selectNotice");
	var apprNotice=document.getElementById("apprNotice").value;
	for(var i=0; i<selNotice.length; i ++){
        if(selNotice[i].checked){
        	var allow=selNotice[i].value;
			}
        }
    
	if(!apprNotice&&!allow){
		document.getElementById("noticeTip").innerHTML="请选审批意见或输入审批意见。";
		return false;
    }
    
    /*
   	var freight=getEstimateFreight();
	if(!freight){
		return;
	}*/
    
    
	document.getElementById("approveNotice").value=allow+apprNotice;
	document.getElementById("operation").value=operationName;
	document.getElementById("auditForm").submit();
}

function validateShortNotice(){
	var yesShortStock=document.getElementById("yesShortStock");
	if(yesShortStock&&yesShortStock.checked){
		var shortNotice=document.getElementById("shortNotice").value;
		if(!shortNotice){
			document.getElementById("shortNoticeTip").innerHTML="请填写缺包备注信息。";
			return false;
		}
		document.getElementById("shortStock").value='1';
	}
	return true;
}
</script>

<html:form id="auditForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value=""/>
	<html:hidden id="modifyTime" name="modifyTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="transferCode" name="transferCode" value="<%=transferCode %>"/>
	
	<html:hidden id="shipId" name="shipId" value="$[shipViewBean.shipId]"/>
	
	<html:hidden id="corderId" value="$[shipViewBean.corderId]"/>
	<html:hidden id="corderCode" value="$[shipViewBean.corderCode]"/>	
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.approve") %>' name="title"/>
	</jsp:include>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				订单信息：<com:switchbox boxId="displayOrderDetail" varValue="1" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName="customerId"  offLabel="隐藏订单信息" onLabel="显示订单信息"  ajaxUrl="contoller.do" isSave="false" onBoxClick="showOrHideOrderDetail('displayOrderDetail','orderDetailInfo');"/>
				
			</html:td>
		</html:tr>
	</html:table>
	<table id="orderDetailInfo" class="edit-talbe" style="display:block">
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td width="300px">
				<html:value  value="$[shipViewBean.corderCode]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				是否加急
			</td>
			<td>
				<com:switchbox boxId="isUrgent" varValue="$[shipViewBean.isUrgent]" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName=""  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" disabled="true" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[shipViewBean.customerName]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				业务员
			</td>
			<td >
				<html:value value="$[shipViewBean.saleMan]" />
			</td>
		</tr>
		
		<tr class="trCell">
			<td class="edit-talbe-label">
				申请编号
			</td>
			<td >
				<html:text id="shipCode" name="shipCode" value="$[shipViewBean.shipCode]" readonly="true"  style="border:0px;"></html:text>
			</td>
			<td class="edit-talbe-label">
				<html:label label="{$jsp.htms.sales.customeraddr.address#}"></html:label>
			</td>
			<td width="52%">
				<html:value value="$[custAddrBean.areaName]" />
				<html:value value="$[custAddrBean.caddrDetail]" />
				
				
				<html:hidden id="areaId"     value="$[custAddrBean.areaId]" />				
				<html:hidden id="customerId" value="$[custAddrBean.customerId]" />		
				
					
				<html:hidden id="applyTime" value="$[shipViewBean.applyTime]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				申请数
			</td>
			<td >
				<html:value  value="$[shipViewBean.applyTonNum]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				申请包数
			</td>
			<td>
				<html:value  value="$[shipViewBean.applyPackNum]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			
		<td class="edit-talbe-label" >
				客户余额
			</td>
			<td  >
				<html:value  value="$[customerAmount]"></html:value>
			</>
			<td class="edit-talbe-label">
				备注
			</td>
			<td >
				<html:value value="$[shipViewBean.shipNotice]" />
			</td>
		</tr>
		<!--<tr class="trCell">
			<td class="edit-talbe-label" id="FGPLNOINKJFAOBKONPKFOKNLOKNJAAPJINJEKCIOFJHLHGANGOHMMKFFCHMPCFFM" colSpan="1" rowSpan="1">
				是否缺包
			</td>
			<td  id="PBIFFJIJPFECOMFBLLJFJOMKCBKCFHKHCNMOLBAKIPPMGJLENLOMKPKKANAOOJHH" colSpan="1" rowSpan="1">
				<html:radio id="yesShortStock" name="isShortStock" value="1"/>是
				<html:radio id="notShortStock" name="isShortStock" value="0" checked="true" />否
				
			</td>
			<td class="edit-talbe-label" id="FGPLNOINKJFAOBKONPKFOKNLOKNJAAPJINJEKCIOFJHLHGANGOHMMKFFCHMPCFFM" colSpan="1" rowSpan="1">
				缺包备注
			</td>
			<td  id="PBIFFJIJPFECOMFBLLJFJOMKCBKCFHKHCNMOLBAKIPPMGJLENLOMKPKKANAOOJHH" colSpan="3" rowSpan="1">
				<html:textarea id="shortNotice"  name="shortNotice" cols="40" rows="3" ></html:textarea>
				
				<html:hidden id="shortStock" name="shortStock" value="0"/>
				<span id="shortNoticeTip" style="font-size:12px;color:red;">
				</span>
			</td>
		</tr>
	--></table>
	<logic:if condition="$[shipViewBean.selfFetch]==1||$[shipViewBean.selfFetch]==2">
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
			  <logic:if condition="$[shipViewBean.selfFetch]==1">
			              贸易商自提
			   </logic:if>
			   <logic:if condition="$[shipViewBean.selfFetch]==2">
			              自备车自提
			   </logic:if>
			</html:td>
		</html:tr>
	</html:table>
	<html:table id="showFecthInfo" styleClass="edit-talbe"  style="display:block;" >
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				提货司机
			</html:td>
			<html:td  width="300px">
				<html:value  value="$[shipViewBean.fetchDriver]"  />
			</html:td>
			<html:td styleClass="edit-talbe-label">
				联系方式
			</html:td>
			<html:td width="52%">
				<html:value  value="$[shipViewBean.fetchMobile]"  />
			</html:td>
		</html:tr>	
		<html:tr styleClass="trCell">
			
			<html:td styleClass="edit-talbe-label">
				车牌号
			</html:td>
			<html:td colspan="3">
				<html:value  value="$[shipViewBean.fetchCar]"  />
			</html:td>
		</html:tr>	
			
	</html:table>
	</logic:if>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				发货申请信息：
			</html:td>
		</html:tr>
	</html:table>
	<html:table list="detailLit" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="itemCode" style="width:80px;" width="80px">
			    <html:hidden  id="itemCode$[detailBean.itemCode]"   value="$[detailBean.itemCode]" />
			    <html:hidden  id="factoryId$[detailBean.itemCode]"   value="$[detailBean.factoryId]" />
			    <html:hidden  id="applyTonNum$[detailBean.itemCode]"   value="$[detailBean.applyTonNum]" />
			    <html:hidden  id="productId$[detailBean.itemCode]"   value="$[detailBean.productId]" />
			    <html:hidden  id="shipDetailId$[detailBean.itemCode]"   value="$[detailBean.shipDetailId]" />
			    <script>itemsNos[itemsNos.length]='<html:value value="$[detailBean.itemCode]"/>';</script>	
			</html:td>			
			<html:td label="工厂" property="factoryName"   width="80px"/>
			<html:td label="产品" property="productName"   width="80px"/>		
			<html:td label="物料" style="word-break:break-all"  >			
			   <p title='<html:value value="$[detailBean.codetailCertificateDesc]"/>' ><html:value value="$[detailBean.codetailCertificateDesc]"> </html:value></p>
			</html:td>
			<html:td label="订单数"  width="80px">
				<html:text  id="orderAmount"  name="orderAmount" value="$[detailBean.orderAmount]" size="12"  readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>	
			<html:td label="可审批数" width="80px" style="text-align:right;">
				<html:hidden id="shipDetailId" name="shipDetailId" value="$[detailBean.shipDetailId]"/>
				<html:hidden id="itemCode" name="itemCode" value="$[detailBean.codetailCertificate]"/>
				<html:text  id="appliableAmount"  name="appliableAmount" value="$[detailBean.appliableAmount]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>	
			<html:td label="库存" width="80px"  >
			    <html:text  id="stockNum"  name="stockNum" value="$[detailBean.stockNum]" size="12"  readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<%--
			<html:td label="已申请数" width="80px" style="text-align:right;">
				<html:text  id="appliedAmount"  name="appliedAmount" value="$[detailBean.appliedAmount]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				\
			</html:td> --%>
			<html:td label="申请数"  width="80px">
				<html:text  id="applyTonNum"  name="applyTonNum" value="$[detailBean.applyTonNum]" size="12"  readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td label="申请包数" width="80px">
				<html:text  id="applyPackNum"  name="applyPackNum" value="$[detailBean.applyPackNum]" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td label="金额" property="itemFreight" width="80px" />
			<html:td label="备注"  width="200px">
				<p title='<html:value value="$[detailBean.shipDetailNotice]"/>' ><html:text  id="shipNotice"  name="shipNotice"  value="$[detailBean.shipDetailNotice]" readonly="true" style="width:98%;border:0px;text-align:left;"/>
			   </p>
			</html:td>
		</html:tr>
	
	</html:table>
	<%
	List<ShipDetailBean> detailLit=(List<ShipDetailBean>)request.getAttribute("detailLit");
	String customerAmount=(String )request.getAttribute("customerAmount");
	customerAmount=customerAmount==null||"".equals(customerAmount.trim())?"0":customerAmount;
	BigDecimal customerAmountNum = new BigDecimal(customerAmount);
	detailLit=detailLit==null?new ArrayList<ShipDetailBean>():detailLit;
	ShipDetailBean detailBean = null;
	BigDecimal freightNum=null,priceNum =null,moneyNum=null,totalMoney=null,stockNum=null,applyNum=null,appliableAmount=null; 
	boolean enoughStock = true,enoughtMoney=true,enoughApply=true;
	//System.out.println("---------------------------->0001");
	BigDecimal totalTransportMoney=new BigDecimal(0);
	String stock=null,apply=null,appliable=null;
	try{
	for(int i=0,size=detailLit.size();i<size;i++){
		if(detailBean==null){continue;}
		stock=detailBean.getStockNum();
		stock=stock==null||"".equals(stock.trim())?"0":stock;
		apply=detailBean.getApplyTonNum();
		apply=apply==null||"".equals(apply.trim())?"0":apply;
		
		detailBean = (ShipDetailBean)detailLit.get(i);
		stockNum=new BigDecimal(stock);
		applyNum=new BigDecimal(apply);
		//System.out.println("---------------------------->0002-"+i);
		appliable=detailBean.getAppliableAmount();
		appliable=appliable==null||"".equals(appliable.trim())?"0":appliable;
		appliableAmount=new BigDecimal(appliable);
		if(enoughStock==true){
			enoughStock=stockNum.compareTo(applyNum)>=0;
		}
		if(enoughApply==true){
			enoughApply=appliableAmount.compareTo(applyNum)>=0;
		}
		freightNum=new BigDecimal(detailBean.getFreight());
		priceNum=new BigDecimal(detailBean.getUnitPrice());
		/*运费单价加上产品单价*/
		priceNum=priceNum.add(freightNum);
		
		/*产品申请数量乘以单价得出产品和运费的价钱*/
		moneyNum=priceNum.multiply(applyNum);
		
		/*总价钱=各个行项的价钱之和*/
		totalMoney=totalMoney==null?moneyNum:totalMoney.add(moneyNum);
		
		
	}
	//System.out.println("---------------------------->0003");
	/*看客户余额是否足够*/
	totalMoney=totalMoney==null?new BigDecimal(0):totalMoney;
	customerAmountNum=customerAmountNum==null?new BigDecimal(0):customerAmountNum;
	//System.out.println("---------------------------->0004");
	enoughtMoney=customerAmountNum.compareTo(totalMoney)>=0;
	
	totalTransportMoney=customerAmountNum.subtract(totalMoney);
	 }catch(Exception ex){
		 //ex.printStackTrace();
	 }
	
	//System.out.println("---------------------------->0004");
	String moneyTips = "",stockTips="",applyTips="";
	if(enoughStock==false){
		stockTips="当前工厂该物料的库存不足。";
	}
	 if(enoughtMoney==false){
		moneyTips="请注意:当前客户的余额不足,差额为:"+totalTransportMoney;
	}
	if(enoughApply==false){
		applyTips="当前申请数大于可申请数。";	
	}
	 %>
	<table id="1667" class="edit-talbe" >
		
		<tr class="trCell">
			<td class="edit-talbe-label" id="FGPLNOINKJFAOBKONPKFOKNLOKNJAAPJINJEKCIOFJHLHGANGOHMMKFFCHMPCFFM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.approvenotice#}" ></html:label>
			</td>
			<td  id="PBIFFJIJPFECOMFBLLJFJOMKCBKCFHKHCNMOLBAKIPPMGJLENLOMKPKKANAOOJHH" colSpan="3" rowSpan="1">
				
				<html:radio id="allow" name="selectNotice" value="同意"/>同意
				<html:radio id="notAllow" name="selectNotice" value="不同意" />不同意
				<br/>
				<html:textarea id="apprNotice"  name="apprNotice" cols="60" rows="3" ></html:textarea>
				
				<html:hidden id="approveNotice" name="approveNotice" />
				<span id="noticeTip" style="font-size:12px;color:red;">
				<%=stockTips %><%=applyTips %><%=moneyTips %>
				</span>
			</td>
		</tr>
		
	</table>
	<script>
	var isSubmitCheck = true;
	function enoughCheck(){
		var enoughStock = "<%=enoughStock%>";
		var enoughtMoney = "<%=enoughtMoney%>";
		var moneyTips = "<%=moneyTips%>";
		var stockTips="<%=stockTips%>";
		var enoughApply="<%=enoughApply%>"
		var applyTips="<%=applyTips%>"
		var stockResult=true,moneyResult=true,applyResult=true;
		if(enoughtMoney=='false'){
			confirmTip(moneyTips,function(){
				if(enoughStock=='false'){
					confirmTip(stockTips,function(){
						if(enoughApply=='false'){
							confirmTip(applyTips,function(){
								submitCheck();
							},function(){
								return;
							});
						}else{submitCheck();}
					},function(){
						return;
					});
				}else{
					if(enoughApply=='false'){
							confirmTip(applyTips,function(){
								submitCheck();
							},function(){
								return;
							});
						}else{submitCheck();}
				}
			},function(){
				return;
			});
			return;
		}
		if(enoughStock=='false'){
			confirmTip(stockTips,function(){
				if(enoughApply=='false'){
					confirmTip(applyTips,function(){
						submitCheck();
					},function(){
						return;
					});
				}else{submitCheck();}
			},function(){
				return;
			});
			return;
		}
		if(enoughApply=='false'){
			confirmTip(applyTips,function(){
				submitCheck();
			},function(){
				return;
			});
			return;
		}
		submitCheck();
	};
	function submitCheck(){
		
		/*if(enoughtMoney=='false'){
			moneyResult=confirm(moneyTips);
			if(moneyResult==false){
				return;
			}
		}
		if(enoughStock=='false'){
			stockResult=confirm(stockTips);
			if(stockResult==false){
				return;
			}
		}
		if(enoughApply=='false'){
			applyResult=confirm(applyTips);
			if(applyResult==false){
				return;
			}
		}*/
		if(validateShortNotice()==false){
			return;
		}
		if(isSubmitCheck){
		isSubmitCheck = false;
		validateNotice('checkShipApply');
		}
	}
	
	</script>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				
				<btn:passaudit href="javascript:void(0);"  onclick="enoughCheck();"/>
				<btn:delfile value="驳回申请" name="驳回申请"  href="javascript:void(0);"  onclick="validateNotice('notPassShipApply');" />
				<btn:return href="contoller.do?operation=listApproveShip"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
