<%@page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.zzy.htms.logistic.send.SendBean" %>
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
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
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
   			SendBean sendBean=null;
   			for(int i=0;i<waitForSendList.size();i++){
				sendBean=(SendBean)waitForSendList.get(i);   			
   			
   		 %>
		<div style=" border-bottom: 10px solid #eef0f2;" > 
		<div  class="appliedcon">
			<div style="padding: 0 0 12px 0;">运单号:<%=sendBean.getTransportCode() %>
				<%if(sendBean.getSendStatus()==1 || sendBean.getSendStatus() == 101){ %>
					<span style="float: right;"  onclick="changeSendStatus('<%=sendBean.getTransId() %>')"><div  id="sendStatusDiv<%=sendBean.getTransId() %>" style="width: 64px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;cursor: pointer;">开始配送</div></span>
				<%}else if(sendBean.getSendStatus()==0){ %>
					<span class="order" style="float: right;">未派车</span>
				<%} %>
			</div>
			<span class="order">总数:<%=sendBean.getApplyTonNum() %>
			<%if(sendBean.getSendStatus()==1 || sendBean.getSendStatus() == 101){ %>
				<span style="float: right;" ><a href="jsp/htms/vstore/sign/sign.jsp?transportId=<%=sendBean.getTransportId() %>&wxOpenId=<%=wxOpenId %>"><div style="width: 46px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;">签收</div></a></span>
			<%} %>
			</span>
		 </div>
			<div class="appliedaddr">
				<div class="custaddr">
					<div class="customer">收货人: <%=sendBean.getCaddrContactor() %>
						<span class="appliedphone" >电话:<%=sendBean.getCaddrTelephone() %></span>
					</div>
					<div class="appliedaddress">地址:<%=sendBean.getAreaName() %></div>
				</div>
			</div>
		</div>
		<%} %>
		</div>
   	
	</form>
   	</div>
	
         
  <input type="hidden" id="interval" name="interval"  value="${config.interval}" />
  <input type="hidden" id="debug" name="debug"  value="${config.debug}" />
  
  
 <script type="text/javascript" ><!--
        var wxOpenId = "<%=wxOpenId %>";
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
              }
              transId+=allSelectTransIds.substring(0,allSelectTransIds.length-1);
              submitChangeSendStatus(transferId);
        }
        
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
				  
				},
				error : function(xhr, textStatus, error) {
				
				}
			});
          }
        }
        
	    var  debug= document.getElementById("debug").value;
	    if(debug=="true"){
	       debug=true;
	    }else{
	       debug=false;
	    }
	    
	    var  interval=document.getElementById("interval").value;
    	var  appId      =  null ;	
		var  timestamp	=  null ;
		var  nonceStr	=  null ;		
		var  signature  =  null ;
		
		var  url=location.href.split('#')[0];
		
		function getConfig(){
			$.ajax({
				url : "${basePath}/contoller.do?operation=getLocationConfig",
				type : "get",
				data : {
					url : url
				},
				timeout:10000,    
		        dataType:'json',    
				success : function(text, textStatus) {
					appId     =  text.appId;
					timestamp =  text.timestamp;
					nonceStr  =  text.noncestr;
					signature =  text.signature;
					interval  =  text.interval;
					
					wxInit();
				},
				error : function(xhr, textStatus, error) {
				//	alert("getConfig:"+error);
					//transId="";
				}
			});
		}
	    
	    function wxInit(){
	    	wx.config({
	            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	            appId: appId, // 必填，企业号的唯一标识，此处填写企业号corpid
	            timestamp: timestamp, // 必填，生成签名的时间戳
	            nonceStr: nonceStr, // 必填，生成签名的随机串
	            signature: signature,// 必填，签名，见附录1
	            jsApiList: ['getLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	        });
	    	
	    	wx.ready(function (res) {
	    		wx.checkJsApi({
	    		    jsApiList: ['getLocation'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
	    		    success: function(res) {
	    		    	//alert("wx checkJsApi successful");
	    		    }
	    		});
	    		
    			wx.getLocation({
				    type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
				    success: function (res) {
				        var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
				        var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
				        var speed = res.speed; // 速度，以米/每秒计
				        var accuracy = res.accuracy; // 位置精度
				        			        
				        submitLocation(latitude,longitude);
				    }
				});
	    		
	    	});
	    	
	    	 wx.error(function(res){
	    	      alert("请求地理位置错误!"+res);
	    	      // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
	    	 });
	    }
	    
	    
	    if(!debug){
	       getConfig();
	    }
	    window.setInterval(function(){
	    	    //	  
	    	    if(!debug){
			       getConfig();
			    }else{
				    latitude="39.922904" ;
		    	    longitude="116.410593" ;
		    	    
		    	    //,
			        submitLocation(latitude,longitude);
			    }
	    	    /*
	    	    latitude="65.48" ;
	    	    longitude="87.89" ;
	    	    //alert(transId);
	    	    transId = "111111";
	    	    submitLocation(latitude,longitude,openId,transId);
	    	    */
	    }, 300000);
		    
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
				    /*
					document.getElementById("xId").innerHTML=latitude;
					document.getElementById("yId").innerHTML=longitude;
					document.getElementById("timeId").innerHTML=getNowFormatDate();
					*/
				},
				error : function(xhr, textStatus, error) {
					//alert("submitLocation:"+error);
					//transId="";
				}
			});
          }
        	
      }
      
      
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
    })
    
    
    
    //百度地图获取坐标
    function getAddr() {
        var geolocation = new BMap.Geolocation();
        var pt;
        geolocation.getCurrentPosition(function (r) {
            if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                //setCookie("localX", r.point.lng);
                //setCookie("localY", r.point.lat);
                alert(r.point.lng + " ， " + r.point.lat);
                pt = r;
                showPosition(pt);
                //传参数给地图按钮
                //document.getElementById("alinkMap").href += "&x="+r.point.lng+"&y="+r.point.lat;
                //document.getElementById("alinkMap").style.display="block";
            }
        });
    }
    //百度地图WebAPI 坐标转地址
    function showPosition(r) {
        // ak = appkey 访问次数流量有限制
        var url = 'http://api.map.baidu.com/geocoder/v2/?ak=7b788c5ea45cc4b3ac6331a4b0643d5b&callback=?&location=' + r.point.lat + ',' + r.point.lng + '&output=json&pois=1';
        $.getJSON(url, function (res) {
            $("#msg").html(url);
            alert(res.result.addressComponent.city);
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
         
  --></script>
	
	
  </body>
</html>
