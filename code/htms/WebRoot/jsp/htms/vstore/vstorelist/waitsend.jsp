<%@page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.zzy.htms.logistic.send.SendBean" %>
<%@page import="com.zzy.htms.logistic.transportdetail.TransportDetailBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<SendBean> waitForSendList = (List<SendBean>)request.getAttribute("sendList");
if(waitForSendList == null){
	waitForSendList = new ArrayList();
}
  response.setHeader("Access-Control-Allow-Origin", "*");
String wxOpenId = (String)request.getAttribute("wxOpenId");
if(wxOpenId == null){
	wxOpenId = (String)request.getParameter("wxOpenId");
}
%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="path" value="<%=path %>" />
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
     <script type="text/javascript" >
	 <!--
	 var transId="";
	 -->
	 </script>
    <title>未配送列表</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="${path}/resources/jquery/jquery.js"></script>	
	<script type="text/javascript" src="${path}/jsp/htms/vstore/vstorelist/jquery-latest.js"></script>	
	
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3Q27dAsDnXeL3qfwFlCRkxHMaZZFCbXb"></script>
	
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
	<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css">
  </head>
  <style type="text/css">
    *{
        margin:0; 
        padding:0;
    }
    a{
        text-decoration: none;
    }
    img{
        max-width: 100%; 
        height: auto;
    }
    .weixin-tip{
        display: none; 
        position: fixed; 
        left:0; 
        top:0; 
        bottom:0; 
        background: rgba(0,0,0,0.8); 
        filter:alpha(opacity=80);  
        height: 100%; 
        width: 100%; 
        z-index: 100;
    }
    .weixin-tip p{
        text-align: center; 
        margin-top: 10%; 
        padding:0 5%;
    }
</style>
  <body>
  	
  	<div class="weixin-tip">
    <p>
        <img src="images/htms/vstore/live_weixin.jpg" alt="微信打开"/>
    </p>
</div>
  	
  <div  style="width: 100%;height: 100%;display: block;background: #f0f1f3;">
   <form  id="waitForSendFrom"   action="contoller.do"  method="GET">
    	<input id="operation"name="operation" value="listWaitForSend" type="hidden"/>
  <div class="top">
	  <div class="top-left"><a href="jsp/htms/vstore/list.jsp?wxOpenId=<%=wxOpenId %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
	  <div class="top-center" >未配送列表</div>
   	</div>
		<div class="content" >
   		<%
   		   Map<String ,List<TransportDetailBean>>   transportDetailMap = (Map<String ,List<TransportDetailBean>>) request.getAttribute("transportDetailMap");
   		   transportDetailMap = transportDetailMap==null?new HashMap<String,List<TransportDetailBean>>():transportDetailMap;
   			SendBean sendBean=null;
   			for(int i=0;i<waitForSendList.size();i++){
				sendBean=(SendBean)waitForSendList.get(i);   			
   			    List<TransportDetailBean>  transportDetailList=transportDetailMap.get(sendBean.getTransportId()+"");
   			    String factoryName="";
   			    if(transportDetailList!=null&&transportDetailList.size()>0){
   			      TransportDetailBean detailBean= transportDetailList.get(0);
   			      if(detailBean!=null&&detailBean.getFactoryName()!=null){
   			          factoryName =  detailBean.getFactoryName();
   			      }
   			    }
   		 %>
		<div style=" border-bottom: 10px solid #eef0f2;" > 
		<div  class="appliedcon">
			<div style="padding: 0 0 12px 0;">调拨单号:<%=sendBean.getSapTransCode() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=factoryName %>
				<%if(sendBean.getSendStatus()==1 || sendBean.getSendStatus() == 101){ %>
					<span style="float: right;"  onclick="changeSendStatus('<%=sendBean.getTransId() %>')"><div  id="sendStatusDiv<%=sendBean.getTransId() %>" style="width: 64px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;cursor: pointer;">开始配送</div></span>
				<%}else if(sendBean.getSendStatus()==0){ %>
					<span class="order" style="float: right;">未派车</span>
				<%} %>
			</div>
			<span class="order">日期:<%=sendBean.getTransferCreateTime() %>
			<%if(sendBean.getSendStatus()==1 || sendBean.getSendStatus() == 101){ %>
				<span style="float: right;" ><a href="jsp/htms/vstore/sign/sign.jsp?transportId=<%=sendBean.getTransportId() %>&wxOpenId=<%=wxOpenId %>"   id="goToSignPageLink" ></a>
				<div  onclick="submitSignLocation('<%=sendBean.getTransId() %>','jsp/htms/vstore/sign/sign.jsp?transportId=<%=sendBean.getTransportId() %>&wxOpenId=<%=wxOpenId %>')" style="width: 46px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;">
				签收</div></span>
			<%} %>
			</span>
		 </div>
		 <div class="appliedaddr">
				<div class="custaddr">
				     <div class="customer">客户: <%=sendBean.getCustomerName() %>
					</div>
					<div class="appliedaddress">收货人: <%=sendBean.getCaddrContactor() %>
						<span class="appliedphone" >电话:<%=sendBean.getCaddrTelephone() %></span>
					</div>
					<div class="appliedaddress">地址:<%=sendBean.getAreaName() %></div>
				</div>
			</div>
		     <% 
		         if(transportDetailList!=null&&transportDetailList.size()>0){
		            for(TransportDetailBean detailBean:transportDetailList){
		                %>
		                 <div class="orderlist">
							<div class="desc">物料:<span style="color: #333333;"><%=detailBean.getCodetailCertificateDesc()%> </span> </div>
							<div>
								<span class="price">数量：<span class="unitprice"><%=detailBean.getApplyTonNum() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;包数：<%=detailBean.getApplyPackNum() %> </span>
							</div>
							</div>
		                <%
		            }
		         }
		     %>
			
		</div>
		<%} %>
		</div>
   	
	</form>
 
   	</div>
	
         
  <input type="hidden" id="interval" name="interval"  value="${config.interval}" />
  <input type="hidden" id="debug" name="debug"  value="${config.debug}" />
  
  
 <script type="text/javascript" ><!--
        var wxOpenId = "<%=wxOpenId %>";
        
        //百度地址初始化
        var geolocation = new BMap.Geolocation();
        
        //记录下已经点击开始配送的调拨单,供定时任务调用
        function changeSendStatus(transferId){
              var transIds=transId.split(",");
              var mark=false;
              transId=transferId;
              var allSelectTransIds=",";
              for(var i=0;i<transIds.length;i++){
                  var s=transIds[i];
                  if(transferId==s){
                     mark=true;
                  }else{
                     mark=false;
                     if(s!=null&&s!=""){
                        allSelectTransIds+=s+",";
                     }
                  }
              }
              if(!mark){
                   document.getElementById("sendStatusDiv"+transferId).innerHTML="正在配送";
                   sendMessageToDriveWeChat(transferId);
              }
              transId+=allSelectTransIds.substring(0,allSelectTransIds.length-1);
              submitChangeSendStatus(transferId);
        }
        
        function sendMessageToDriveWeChat(transferId){
            console.log("sendMessageToDriveWeChat:  "+transferId);
            if(transferId!=null&&transferId!=""){
	            $.ajax({
					url : "${basePath}/contoller.do?operation=sendLocationTextMessage",
					type : "get",
					timeout:10000,    
			        dataType:'json',  
					data : {
						transferId : transferId,
						wxOpenId   : wxOpenId
					},
					success : function(text, textStatus) {
					     getAddr();
					},
					error : function(xhr, textStatus, error) {
					
					}
			    });
          }
        }
        
        //改变此调拨单状态为配送中
        function submitChangeSendStatus(transferId){
             if(transferId!=null&&transferId!=""){
              $.ajax({
				url : "${basePath}/contoller.do?operation=submitChangeSendStatusLocation",
				type : "get",
				timeout:10000,    
		        dataType:'json',  
				data : {
					transferId   : transferId
				},
				success : function(text, textStatus) {
				     getAddr();
				},
				error : function(xhr, textStatus, error) {
				
				}
			});
          }
        }
        
        //是否启用debug模式
	    var  debug= document.getElementById("debug").value;
	    if(debug=="true"){
	       debug=true;
	    }else{
	       debug=false;
	    }
	    
	    //定时提交坐标信息
	    window.setInterval(function(){
			getAddr();
	    }, 300000);
		
		getAddr(); 
	    
	    //获取当前时间
	    function getNowFormatDate() {
	        var date = new Date();
	        var seperator1 = "-";
	        var seperator2 = ":";
	        var month = date.getMonth() + 1;
	        var strDate = date.getDate();
	        if (month >= 1 && month <= 9) {
	            month = "0" + month;
	        }
	        if (strDate >= 0 && strDate <= 9) {
	            strDate = "0" + strDate;
	        }
	        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
	                + " " + date.getHours() + seperator2 + date.getMinutes()
	                + seperator2 + date.getSeconds();
	        return currentdate;
	    } 
	    
	    
	    //提交坐标信息和开始配送的调拨单id到后台
      function submitLocation(latitude,longitude){
          if(transId!=null&&transId!=""){
              $.ajax({
				url : "${basePath}/contoller.do?operation=submitLocation",
				type : "get",
				timeout:10000,    
		        dataType:'json',  
				data : {
					latitude  : latitude,
					longitude : longitude,
					transId   : transId,
					wxOpenId:wxOpenId
				},
				success : function(text, textStatus) {
				
				},
				error : function(xhr, textStatus, error) {
				
				}
			});
          }
      }
      
      //提交签收时的最新坐标
      function submitSignLocation(transferId,farwardUrl){
          console.log(farwardUrl);
          //获取百度地址坐标
          geolocation.getCurrentPosition(function (r) {
            if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                console.log("submitSignLocation     "+r.point.lng + "        " + r.point.lat);
                $.ajax({
					url : "${basePath}/contoller.do?operation=submitLocation",
					type : "get",
					timeout:10000,    
			        dataType:'json',  
					data : {
						latitude  : r.point.lat,
						longitude : r.point.lng,
						transId   : transferId,
						wxOpenId  : wxOpenId,
						isSign:1
					},
					success : function(text, textStatus) {
					     document.getElementById("goToSignPageLink").click();
					},
					error : function(xhr, textStatus, error) {
					
					}
				});
            }
          });
          
          
             
      }
      
     /* 
    $(window).on("load",function(){
        var winHeight = $(window).height();
        function is_weixin() {
            var ua = navigator.userAgent.toLowerCase();
            if (ua.match(/MicroMessenger/i) == "micromessenger") {
                return true;
            } else {
                return false;
            }
        }
        var isWeixin = is_weixin();
        if(isWeixin){
            $(".weixin-tip").css("height",winHeight);
            $(".weixin-tip").show();
        }
    });
    */
    
    //百度地图获取坐标
    function getAddr() {
        //var geolocation = new BMap.Geolocation();
        geolocation.getCurrentPosition(function (r) {
            //alert(1);
            if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                //alert(2);
                console.log(r.point.lng + "        " + r.point.lat);
                submitLocation(r.point.lat,r.point.lng);
            }
        });
    }
    //百度地图WebAPI 坐标转地址
    function showPosition(r) {
        // ak = appkey 访问次数流量有限制
        var url = 'http://api.map.baidu.com/geocoder/v2/?ak=NG3qxebzlbnTyuotUtxxx8zq8H9zDZTH&callback=?&location=' + r.point.lat + ',' + r.point.lng + '&output=json&pois=1';
        $.getJSON(url, function (res) {
            $("#msg").html(url);
            console.log(res.result.addressComponent.city+"   "+res.result.addressComponent.district);
        });
    }
    //百度地图JS API 坐标转地址，没有加载地图时获取不到rs,总是null
    function getLocation1(myGeo,pt,rs) {
        // 根据坐标得到地址描述 
        myGeo.getLocation(pt, function (rs) {
            if (rs) {
                var addComp = rs.addressComponents;
                window.clearInterval(interval);
                alert(addComp);
            }
            return rs;
        });
    }
    console.log(" 4444444444411111111111111111 ");
  --> 
 </script>
 
  </body>
</html>
