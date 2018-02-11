<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.sales.custorder.CustOrderBean,com.mobilecn.utils.random.IntRandom"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean"%>
<%@page import="com.zzy.htms.logistic.selffetchcar.SelfFetchCarBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<CustOrderBean> applyList=(List<CustOrderBean>)request.getAttribute("detailLit");
//System.out.println("page=====================applyList.size="+(applyList==null?0:applyList.size()));
if (applyList == null) {
	applyList = new ArrayList();
}

String customerAmount = (String)request.getAttribute("customerAmount");
//System.out.println("page=====================customerAmount"+customerAmount);
List<CustomerAddrBean> addrLists=(List<CustomerAddrBean>)request.getAttribute("addrLists");
String shipCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99); 

String customerId=(String)request.getParameter("customerId");
String customerName=(String)request.getParameter("customerName");
String customerCode=(String)request.getParameter("customerCode");
String codetailId=(String)request.getParameter("codetailId");
String corderId=(String)request.getParameter("corderId");


String codetailIdArray = "[";
for (int i = 0; i < applyList.size(); i++) {
	CustOrderBean orderBean = applyList.get(i);
	
	if (codetailIdArray.length() > 1) {
		codetailIdArray += ",";
	}
	
	codetailIdArray += "\"";
	String lCodetailId = (String)orderBean.getCodetailCertificateDesc();
	
	codetailIdArray += lCodetailId;
	codetailIdArray += "\"";
}
codetailIdArray += "]";
//System.out.println("page=====================codetailIdArray:"+codetailIdArray);
//选中的地址
String selAddrId = (String)request.getParameter("addrId");
String selContactName = (String)request.getParameter("contactName");
String selContactPhone = (String)request.getParameter("contactPhone");
String selDetailAddr = (String)request.getParameter("detailAddr");
String selAreaId = (String)request.getParameter("areaId");
if (selAddrId == null && addrLists != null && addrLists.size() > 0) {
	CustomerAddrBean addrBean = addrLists.get(0);
	selAddrId = addrBean.getCaddrId() + "";
	selContactName = addrBean.getCaddrContactor();
	selContactPhone = addrBean.getCaddrTelephone();
	selDetailAddr = addrBean.getAreaName()+addrBean.getCaddrDetail();
	selAreaId = addrBean.getAreaId() + "";
}

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");
//System.out.println("page=====================salesNo:"+salesNo);
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>申请</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
	<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css"></link>
	<link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
	<link rel="stylesheet" href="jsp/htms/mobile/css/switch.css" type="text/css">
  </head>
  <script type="text/javascript" src="jsp/htms/mobile/js/apply.js"></script>  
  <script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  <script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
   <script type="text/javascript" src="<%=path %>/js/MathCalculator.js"></script>
   <script src="jsp/htms/mobile/js/Ajax.js" ></script>
   
  <body>
  <div class="container">
  <form id="custOrderForm"   action="contoller.do"  method="GET">
  <input type="hidden" id="operation" name="operation" value="addapply"/>
  <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
    <input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
    <input type="hidden" id="customerAmount" name="customerAmount" value="<%=customerAmount %>"/>
 	<div class="top">
  		<div class="top-left" ><a href="contoller.do?operation=customerOrderList&userId=<%=userId %>&salesNo=<%=salesNo %>&customerId=<%=customerId %>&customerName=<%=customerName %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div> 
		<div class="top-center" style="width:67%" ><%=customerName %></div> 
		<div class="top-right"  ></div> 
	</div>
 	<div class="content" >
   	<div  > 
   	<%
   	
//System.out.println("page=====================selAddrId:"+selAddrId);
   		if (selAddrId != null){
   			
   	 %><!-- 选择地址 -->
   	 <input type="hidden" id="caddrId" name="caddrId" value="<%=selAddrId %>"/>
			<div class="addrcontent" >
				<a href="contoller.do?operation=listCustMobileAddr&corderId=<%=corderId %>&customerCode=<%=customerCode %>&customerId=<%=customerId %>&codetailId=<%=codetailId %>&userId=<%=userId %>&customerName=<%=customerName %>" style="display: block;">
					<div style="padding: 0 0 11px 0;">
						<span class="customer">客户:<%=selContactName %></span>
						<span class="line">|</span>
						<span class="phone"><%=selContactPhone %></span>
				 	<img src="jsp/htms/mobile/image/button/left.jpg" style="width: 10px;float: right;margin-top: 25px;"></img>
					</div>
				 	<div class="address" style="width:90%;">地址:<%=selDetailAddr %></div>
				</a>
			</div>
			<%}else{ %>
			<!-- 新增地址 -->
			<input type="hidden" id="caddrId" name="caddrId" value="-1"/>
			<div class="ordercontent" >
				<a href="contoller.do?operation=addCustAddress&isModify=0&corderId=<%=corderId %>&customerCode=<%=customerCode %>&customerId=<%=customerId %>&codetailId=<%=codetailId %>&userId=<%=userId %>&customerName=<%=customerName %>" style="display: block;">
					<span>请添加地址</span>
				 	<img src="jsp/htms/mobile/image/button/left.jpg" style="width: 10px;float: right;"></img>
				</a>
			</div>
			<%} %>
			<%! 
			public float parseFloat(String value){
				if(value==null||"".equals(value.trim())||"null".equalsIgnoreCase(value.trim())){
					return 0f;
				}
				try{
					return Float.parseFloat(value);
				}catch(Exception ex){
					ex.printStackTrace();
					return 0f;
				}
				
			}
			%>
			 
			<%
			//System.out.println("page=====================applyList.size():"+(applyList==null?0:applyList.size()));
			CustOrderBean custOrderBean=null;
			if(applyList!=null){
			String tempValue = null;
			float appliableAmount=0f,appliedAmout=0f,percent=0f,applyAmount=0f;
			for(int i=0;i<applyList.size();i++){
				custOrderBean=(CustOrderBean)applyList.get(i);
				//System.out.println("custOrderBean=" + custOrderBean);
				tempValue=custOrderBean.getAppliableAmount();
				tempValue=tempValue==null?"0":tempValue;
				appliableAmount = parseFloat(tempValue);
				//System.out.println("page=====================appliableAmount:"+appliableAmount);
				tempValue=custOrderBean.getAppliedAmount();
				//System.out.println("page=====================tempValue:"+tempValue);
				//tempValue=tempValue==null||"null".equalsIgnoreCase(tempValue.trim())||"".equals(tempValue.trim())?"0":tempValue;
				//System.out.println("page=====================appliedAmout-tempValue:"+tempValue);
				appliedAmout = parseFloat(tempValue);
				applyAmount=(appliableAmount + appliedAmout);
				//System.out.println("page=====================appliedAmout:"+appliedAmout);
				if(applyAmount>0f){
					percent = (appliableAmount /applyAmount) * 100;
				}else{
					percent=0f;
				}
					
   	
   //	System.out.println("page=====================percent:"+percent);

			 %>
			 <input type="hidden" id="corderId" name="corderId" value="<%=custOrderBean.getCorderId() %>"/>
			<div class="orderlist">
			<div class="desc">物料：<span style="color: #888888;"><%=custOrderBean.getCodetailCertificateDesc() %></span> </div>
			<div>
				<span style="font-size: 14px;"  > 可申请数:<%=appliableAmount %></span>
				<span style="margin-left: 24%;font-size:12px;color: #bbbbbb;">单价：<span class="unitprice"><%=custOrderBean.getUnitPrice() %> </span></span>
			</div>
			<div>
				<span style="font-size: 14px;color: #bbbbbb;"  > 建议申请数:<span class="unitprice"><%=custOrderBean.getMarketAvailableNum()==null?"":custOrderBean.getMarketAvailableNum() %></span></span>
			</div>
			</div>
			<input type="hidden" id="areaId" name="areaId" value="<%=selAreaId %>"/>
			<input type="hidden" id="factoryId<%=i %>" name="factoryId" value="<%=custOrderBean.getFactoryId() %>"/>
			<input type="hidden" id="productId<%=i %>" name="productId" value="<%=custOrderBean.getProductId() %>"/>
			<input type="hidden" id="codetailId<%=i %>" name="codetailId" value="<%=custOrderBean.getCodetailId() %>"/>
			<input type="hidden" id="marketAvailableNum<%=i %>" name="marketAvailableNumName" value="<%=custOrderBean.getMarketAvailableNum()==null?"":custOrderBean.getMarketAvailableNum() %>"/>
			<input type="hidden" id="customerId" name="customerId" value="<%=custOrderBean.getCustomerId() %>"/>
			<input type="hidden" id="customerName" name="customerName" value="<%=custOrderBean.getCustomerName() %>"/>
			<input type="hidden" id="customerCode" name="customerCode" value="<%=customerCode  %>"/>
			
			<input id="shipDetailStatus" name="shipDetailStatus" value="0" type="hidden"/>
			<input id="applyStatus" name="applyStatus" value="0" type="hidden"/>
			<input id="shipCode" name="shipCode" value="<%=shipCode %>" type="hidden"/>
			<input id="orderCode<%=i %>" name="orderCode" value="<%=custOrderBean.getCorderCode() %>" type="hidden"/>
			<input id="itemCodeDesc<%=i %>" name="itemCodeDesc" value="<%=custOrderBean.getCodetailCertificateDesc() %>" type="hidden"/>
			<input id="itemCode<%=i %>" name="itemCode" value="<%=custOrderBean.getCodetailCertificate() %>" type="hidden"/>
			<input id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>" type="hidden"/>
			<input id="shipPoint<%=i %>" name="shipPoint" value="<%=custOrderBean.getShipPoint() %>" type="hidden" />
			<input id="orderAmount<%=i %>"name="orderAmount" value="<%=custOrderBean.getOrderAmount() %>"  type="hidden"/>
			<input id="applyTotalTonNum" name="applyTotalTonNum" type="hidden" />
			<input id="applyTotalPackNum" name="applyTotalPackNum" type="hidden" />
			<input id="appliableAmount<%=i %>" name="appliableAmount" value="<%=custOrderBean.getAppliableAmount() %>" type="hidden"/>
			<input id="freight<%=i %>" name="freight" value="<%=custOrderBean.getFreight() %>" type="hidden"/>
			<input id="unitPrice<%=i %>" name="unitPrice" value="<%=custOrderBean.getUnitPrice() %>" type="hidden"/>
			<input id="showAppliedAmount"name="showAppliedAmount" value="<%=custOrderBean.getAppliedAmount() %>"  readonly="true" disabled="disabled" style="border:0px;background-color: #ffffff;color: black;width: 80px;" type="hidden"/>
				<input id="appliedAmount<%=i %>" name="appliedAmount" value="<%=custOrderBean.getAppliedAmount() %>" type="hidden"/>
				<div class="applynum">
					<span class="tonpacknum">数量:<input id="applyTonNum<%=i %>" name="applyTonNum" type="text" class="numinput" placeholder="输入" onfocus="inputOnFocus(applyTonNum<%=i %>)" onblur="inputOnBlur(applyTonNum<%=i %>)" /></span>
					<span class="line">|</span>
					<span class="tonpacknum">包数:<input id="applyPackNum<%=i %>" name="applyPackNum"  type="text" pattern="[0-9]*" class="numinput" placeholder="输入" onfocus="inputOnFocus(applyPackNum<%=i %>)" onblur="inputOnBlur(applyPackNum<%=i %>)" /></span>
					<div style="margin-top: 10px;"><span class="tonpacknum">备注:<input type="text" id="shipDetailNotice" name="shipDetailNotice" placeholder="请输入仓库备注" class="numinput" style="width:80%"/></span></div>
				</div >
			
			<%}} %>
			<div style="border-top: 5px solid #eef0f2;height: 40px;">
			<span style="margin-left: 13px;font-size:14px;color:#333333;line-height: 40px;">加急:</span>
			<input class="mui-switch" type="checkbox" id="isUrgent" name="isUrgent" value="0" style="float: right;margin-right: 10px;margin-top:4px;">
			</div>
			<div style="border-top: 5px solid #eef0f2;height: 40px;">
			   <span style="margin-left: 13px;font-size:14px;color:#333333;line-height: 40px;">自提:</span>
			   <input class="mui-switch" type="checkbox" id="selfFetchCheck" name="selfFetchCheck"  onclick="showSelfFetchInput()" value="0" style="float: right;margin-right: 10px;margin-top:4px;">
			   <input type="hidden"   id="selfFetch" name="selfFetch"  value="0" />
			</div>
			
			<div  id="selfFetchInput1" style="border-top: 5px solid #eef0f2;height: 40px;display:none;">
			       <span class="tonpacknum" style="margin-left: 13px;font-size:14px;color:#333333;line-height: 45px;">车牌号:</span>
			       <select class="reginput" id="fetchCar" name="fetchCar" style="width: 50%;height:25px; border: solid 1px #bbbbbb;margin-left: 26px;">
				     <%
					    List<SelfFetchCarBean> selfFetchCarList=(List<SelfFetchCarBean>)request.getAttribute("selfFetchCarList");
						if (selfFetchCarList != null&&selfFetchCarList.size()==1){
						    for(SelfFetchCarBean  fetchBean:selfFetchCarList){
							%>
							     <option value="ZB-<%=fetchBean.getVehicleNo() %>"  selected="selected" ><%=fetchBean.getVehicleNo() %></option>
							<%
							}
						}else	if (selfFetchCarList != null&&selfFetchCarList.size()>1){
							%>
							     <option value="" >--请选择车牌号--</option>
							<%
							for(SelfFetchCarBean  fetchBean:selfFetchCarList){
							%>
							     <option value="ZB-<%=fetchBean.getVehicleNo() %>" ><%=fetchBean.getVehicleNo() %></option>
							<%
							}
						}
			        %>
				 </select>
				 <input type="button"   onclick="loadDriverAndMobile()"  style="border-top: 15px solid #eef0f2;border-radius: 5px;width: 50px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;margin-top: 10px; padding: 5px 0 5px 0;"  value="加载"  />
			</div>
			<div id="selfFetchInput2" style="border-top: 5px solid #eef0f2;padding-left:5px;margin-top: 5px;display:none;">
			   <span class="tonpacknum" style="margin-left: 9px;font-size:14px;color:#333333;line-height: 40px;">提货司机:
			      <input type="text" id="fetchDriver" name="fetchDriver" placeholder="请输入提货司机" class="numinput" style="width:60%"/>
			   </span>
			</div>
			<div id="selfFetchInput3" style="border-top: 5px solid #eef0f2;padding-left:5px;margin-top: 5px;display:none;">
			  <span class="tonpacknum" style="margin-left: 9px;font-size:14px;color:#333333;line-height: 40px;">联系方式:
			      <input type="text" id="fetchMobile" name="fetchMobile" placeholder="请输入联系方式" class="numinput" style="width:60%"/>
			  </span>
			</div>
			
			<div style="padding:10px 16px 6px 10px;"><input type="text" id="shipNotice" name="shipNotice" placeholder="请输入物流备注"  style="border-radius:5px;font-size: 17px;width:96%;color:#bbbbbb; border: 1px solid;height: 30px"/></div>
			<div class="contentbtn" ><div  onclick="checkSelfFetchCar();" id="_save"  style="background-color: #2eaed3;border-radius:14px;font-size: 17px;width:100%;color:white; border: 1px solid;height:30px;padding:10px 0 6px 0;box-shadow: -1px 0px 1px 1px #9be9ff;"/>
			保存</div></div>
		</div>
		</div>
   	</form>
   	</div>
   	
   		<script type="text/javascript">
   		function loadDriverAndMobile(){
		     var customerId=$("#customerId").val();
		     var fetchCar=$("#fetchCar").val();
		     if(customerId==null||customerId==""){
		         $.DialogByZ.Alert({Title: "提示", Content: "获取客户信息为空，调用失败!",BtnL:"确定"});
		     }else
		     if(fetchCar==null||fetchCar==""){
		         $.DialogByZ.Alert({Title: "提示", Content: "请先选择车辆信息!",BtnL:"确定"});
		     }else{
			     var basePath = basePath + '/controller.do';
				 var parmas = {operation:'ajaxGetDefultDriverAndMobile',"customerId":customerId,"fetchCar":fetchCar};
			     $.ajax({
				    url:basePath,
				    type:'POST', //GET
				    async:false,    //或false,是否异步
				    data:parmas,
				    timeout:5000,    //超时时间
				    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
				    success:function(data,textStatus,jqXHR){
						if("1"==data.isSuccess){
						    $("#fetchDriver").attr("value",data.driver);
						    $("#fetchMobile").attr("value",data.mobile);
						}else{
						    //alertTip(data.msg);
						    $.DialogByZ.Alert({Title: "提示",Content: data.msg,BtnL:"确定"});
						}
				    },
				    error:function(xhr,textStatus){
				    	result=false;
				    }
				});
			}
		}
   		
   		var codetailIdArray = <%=codetailIdArray %> 
   		
   		function alerts(){
	  		$.DialogByZ.Close();
   		}
   		
   		function showSelfFetchInput(){
   		     var selfFetchElement=document.getElementById("selfFetchCheck");
   		    if (!selfFetchElement.checked) {
				document.getElementById("selfFetch").value="0";
				document.getElementById("selfFetchInput1").style.display="none";
				document.getElementById("selfFetchInput2").style.display="none";
				document.getElementById("selfFetchInput3").style.display="none";
			} else {
			    document.getElementById("selfFetch").value="2";
				document.getElementById("selfFetchInput1").style.display="block";
				document.getElementById("selfFetchInput2").style.display="block";
				document.getElementById("selfFetchInput3").style.display="block";
			}
   		}
   		
   		var isSubmit = false;
   		
   function validateMarketAvailableNum(){
	   var applyTonNum=null;
	   var marketAvailableNum=null;
	   var result=false;
	   for(var i=0;i<codetailIdArray.length;i++){
			applyTonNum=document.getElementById("applyTonNum"+i).value;
			marketAvailableNum=document.getElementById("marketAvailableNum"+i).value;
			if(applyTonNum!=''&&applyTonNum!=null&&marketAvailableNum!=''&&marketAvailableNum!=null&&parseInt(marketAvailableNum)<parseInt(applyTonNum)){
				console.log(marketAvailableNum+"    "+applyTonNum);
				result= true;
				break;
			}else{
				result= false;
			}
		}
	   
	   checkFreight();
	   /*
	   if(result){
	       $.DialogByZ.Confirm({Title: "提示", Content: "申请数量超过建议申请数量，是否继续提交?",FunL:function() {
	            $.DialogByZ.Close();
				checkFreight();	
		   },FunR:function(){
		        $.DialogByZ.Close();
				return ;
		   }});
	   }else{
		   checkFreight();
	   }*/
   }
   		
   		
   		function  checkSelfFetchCar(){
   		    var selfFetchElement=document.getElementById("selfFetchCheck");
   		    
   		    var caddrId = document.getElementById("caddrId").value;
   		    if(caddrId!=null&&caddrId!=""&&caddrId>0){
	   		     if (!selfFetchElement.checked) {
	   		        document.getElementById("selfFetch").value="0";
					applyConfirm();
				}else {
				    document.getElementById("selfFetch").value="2";
					var retValue=checkSelfFetchForm();
					if(!retValue){
					   return ;
					}else{
					   applyConfirm();
					}
				}
   		    }else{
   		    	$.DialogByZ.Alert({Title: "提示", Content: "请先输入地址信息",BtnL:"确定"});
   		    }
   		   
   		}
   		
   		function checkSelfFetchForm(){
			var car     =  document.getElementById("fetchCar").value;
			var driver  =  document.getElementById("fetchDriver").value;
			var mobile  =  document.getElementById("fetchMobile").value;
			var retValue={};
			if(car==null||car==""||car==undefined){
				retValue.title = "提示";
				retValue.msg = "请选择车牌号，如果车牌号没有可以选择的项，需要先维护客户的车牌号信息";
				$.DialogByZ.Alert({Title: retValue.title, Content: retValue.msg,BtnL:"确定"});
				return false;
			}
			if(driver==null||driver==""||driver==undefined){
				retValue.title = "提示";
				retValue.msg = "请输入提货司机";
				$.DialogByZ.Alert({Title: retValue.title, Content: retValue.msg,BtnL:"确定"});
				return false;
			}
			if(mobile==null||mobile==""||mobile==undefined){
				retValue.title = "提示";
				retValue.msg = "请输入联系方式";
				$.DialogByZ.Alert({Title: retValue.title, Content: retValue.msg,BtnL:"确定"});
				return false;
			}
			return true;
		}
   		
   		function applyConfirm() {
   			console.log("isSubmit=" + isSubmit);
   			if (isSubmit) {
   				return;
   			}
   			
   			<% if (salesNo == null || userId == null) { %>
   				$.DialogByZ.Alert({Title: "提示", Content: "登录超时，请重新登录",BtnL:"确定",FunL:alerts});
   				
   				return;
   			<% } %>
   			
   			var retValue = validateForm();
   			var that = this;
   			
   			console.log("retValue.code=" + retValue.code);
   			
   			if (retValue.code != SUCCESS) {
   				var msg = retValue.msg;
   				var title = retValue.title;
   				
   				if (retValue.code == ERROR_BEYOND_MONEY) {
   					$.DialogByZ.Confirm({Title: title, Content: msg,FunL:function() {
  						$.DialogByZ.Close();
  						checkAppliableNum();				
  					},FunR:function(){
  						$.DialogByZ.Close();
  					}}); 
  					
  					return;
   				}
   				$.DialogByZ.Alert({Title: title, Content: msg,BtnL:"确定",FunL:alerts});
   				return;
   			}
   			  			
   			//isSubmit = true; 
   		/*
   			var factoryId = document.getElementById("factoryId").value;
   			var productId = document.getElementById("productId").value;
   			 
   			if (factoryId == null || factoryId.length == 0) {
   				factoryId = "0";
   			}	
   			if (productId == null || productId.length == 0) {
   				productId = "0";
   			}
   			 */		
   			//var basePath = basePath + '/controller.do';
   			//var areaId = <%=selAddrId %>;
   				
		//	var parmas = {operation:'getRoute',"areaId":areaId,"factoryId":factoryId,"productId":productId};
		/*	Ajax.getWithError(basePath,parmas,function(msg){
			
				var jsonMsg = JSON.parse(msg);
				if(parseInt(jsonMsg.isSuccess) == 1){
					submitForm();
				}else{
					$.DialogByZ.Confirm({Title: "提示", Content: "没有找到匹配的线路,确定要继续申请吗？",FunL:function() {
  						$.DialogByZ.Close();
  				
  						submitForm();				
		  			},FunR:function(){
		  				$.DialogByZ.Close();
		  				isSubmit = false; 
		  			}}); 
				}
			},function(data){	
				$.DialogByZ.Confirm({Title: "提示", Content: "获取线路信息失败,确定要继续申请吗？",FunL:function() {
  						$.DialogByZ.Close();
  				
  						submitForm();				
		  			},FunR:function(){
		  				$.DialogByZ.Close();
		  				isSubmit = false; 
		  		}});  
			}); 		
   			 	*/	
   						
   			//submitForm();
   			checkAppliableNum();
   		}
   		
   		//超发检查
   		function checkAppliableNum() {
   			isSubmit = true;
   			
   			var regTon = /^\d+(\.\d{0,3})?$/;
   		
   			var itemCodes = "";
   			var orderCodes = "";
   			var itemCodeDescs = "";
   			var applyTonNums = "";
   			
   			var ordreId = <%=corderId %>;
   			
   			for (var i = 0; i < codetailIdArray.length; i++) {
				var applyTonNumId = "applyTonNum" + i;
				
				var itemCodeId = "itemCode" + i;
				var orderCodeId = "orderCode" + i;
				var itemCodeDescId = "itemCodeDesc" + i;
				
				var applyTonNum = document.getElementById(applyTonNumId).value;
				
				var itemCode = document.getElementById(itemCodeId).value;
				var orderCode = document.getElementById(orderCodeId).value;
				var itemCodeDesc = document.getElementById(itemCodeDescId).value;
				
				if (!applyTonNum) {
					continue;				
				}
				if(!regTon.test(applyTonNum)){
					continue;
				}
				if (parseFloat(applyTonNum) == 0) {
					continue;
				}
				
				if (itemCodes.length > 0) {
					itemCodes += ",";
				}
				itemCodes += itemCode;
				
				if (orderCodes.length > 0) {
					orderCodes += ",";
				}
				orderCodes += orderCode;
				
				if (itemCodeDescs.length > 0) {
					itemCodeDescs += ",";
				}
				itemCodeDescs += itemCodeDesc;
				
				if (applyTonNums.length > 0) {
					applyTonNums += ",";
				}
				applyTonNums += applyTonNum;
			}
			
			console.log("checkApplyNum->orderId=" + ordreId);
			
			var basePath = basePath + '/controller.do';
			var parmas = {operation:'checkApplyNum',"itemCodes":itemCodes, "orderCodes":orderCodes, 
							"itemCodeDescs":itemCodeDescs, "applyTonNums":applyTonNums, "corderId":ordreId};
					
			Ajax.postWithError(basePath,parmas,function(msg){
					var jsonMsg = JSON.parse(msg);
					
					var code = jsonMsg.code;
					var msg = jsonMsg.msg;
					
					if (code != 0) {
						$.DialogByZ.Alert({Title: "提示", Content: msg,BtnL:"确定",FunL:alerts});
						isSubmit = false;
					}else {
						isSubmit =  validateMarketAvailableNum();
					} 	
						
				},function(data){
					$.DialogByZ.Alert({Title: "提示", Content: "从SAP校验可申请数量失败，请稍后再试！",BtnL:"确定",FunL:alerts});
					isSubmit = false;
				}
			);
   		}
   		
   		function checkFreight() {
   			isSubmit = true; 
   		
   			//重新生成shipCode
   			var newShipCode = getNewShipCode();
   			console.log("newShipCode=" + newShipCode);
   			
   			document.getElementById("shipCode").value=newShipCode;
   		
   			var areaId=document.getElementById("areaId").value;
			var areaCode="";
			var result =false;
			var applyTime=document.getElementById("createTime").value;
			var customerId=document.getElementById("customerId").value;
			
			
			var customerCode=document.getElementById("customerCode").value; 
		
			var factoryId="";
			var productId="";
			var itemCode = "";
			var applyTonNum="";
			
			var orderId = "";
			var orderCode = "";
			var itemId = "";
			
			var selfFetchStatus=false;
			var selfFetchType="1";
			var selfFetchElement=document.getElementById("selfFetchCheck");
   		    if (!selfFetchElement.checked) {
   		        selfFetchStatus=false;
   		        selfFetchType="1"
   		    }else{
   		        selfFetchStatus=true;
   		        selfFetchType="2"
   		    }
			
			for(var i=0;i<codetailIdArray.length;i++){
				var tonNum=document.getElementById("applyTonNum"+i).value;
				if(!(tonNum==null||tonNum=="")&&parseFloat(tonNum)>0){
					//alert(tonNum+"  first   " +itemsNos[i]);
					factoryId   +=  document.getElementById("factoryId"+i).value+",";
					productId   +=  document.getElementById("productId"+i).value+",";
					itemCode    +=  document.getElementById("itemCode"+i).value+",";
					applyTonNum +=  document.getElementById("applyTonNum"+i).value+",";
					
					orderId +=  document.getElementById("corderId").value+",";
					orderCode +=  document.getElementById("orderCode"+i).value+",";
					itemId +=  document.getElementById("codetailId"+i).value+",";
				}
			}
			
			if(applyTonNum!=""){
				factoryId =	factoryId.substring(0,factoryId.length-1);
				productId = productId.substring(0,productId.length-1);
				itemCode =	itemCode.substring(0,itemCode.length-1);
				applyTonNum =	applyTonNum.substring(0,applyTonNum.length-1);		
				
				orderId =	orderId.substring(0,orderId.length-1);	
				orderCode =	orderCode.substring(0,orderCode.length-1);	
				itemId =	itemId.substring(0,itemId.length-1);		
			}
			
			var basePath = basePath + '/controller.do';
			var parmas = {operation:'ajaxCalculationFreight',"areaId":areaId,"areaCode":areaCode,"customerId":customerId,
					"factoryId":factoryId,"productId":productId,"itemCode":itemCode,"applyTonNum":applyTonNum,"applyTime":applyTime,
					"orderId":orderId,"orderCode":orderCode,"itemId":itemId,"selfFetchStatus":selfFetchStatus,
					"selfFetchType":selfFetchType,"customerCode":customerCode};
					
			Ajax.postWithError(basePath,parmas,function(msg){
					var jsonMsg = JSON.parse(msg);
				
					$.DialogByZ.Confirm({Title: "提示", Content: jsonMsg.msg +"确定要继续申请吗？",FunL:function() {
  						$.DialogByZ.Close();
  						submitForm();				
		  			},FunR:function(){
		  				$.DialogByZ.Close();
		  				isSubmit = false; 
		  			}}); 
				},function(data){
					$.DialogByZ.Confirm({Title: "提示", Content: "获取运费失败,确定要继续申请吗？",FunL:function() {
  						$.DialogByZ.Close();
  						submitForm();				
		  			},FunR:function(){
		  				$.DialogByZ.Close();
		  				isSubmit = false; 
		  			}}); 
				}
			);
   		}
   	<%
   	
  // 	System.out.println("page=====================end:");
   	%>	
   	</script>
  </body>
</html>
