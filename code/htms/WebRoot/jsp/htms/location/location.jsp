<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  response.setHeader("Access-Control-Allow-Origin", "*");
%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="path" value="<%=path %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的订单</title>
    	
	<script type="text/javascript" src="${path}/resources/jquery/jquery.js"></script>	
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		 
  </head>
 
  <body>
  
  <c:if test="${config.debug}"  >  测试1  </c:if>
  <c:if test="${config.debug}=='true'">  测试2  </c:if>
  	<H1>User Information</H1>
    
   <div id="openId"> 
   <c:out value="${user.openId}" />   </div> <br>
    ${user.nickName}<br>
    ${user.sex}<br>
    ${user.province}<br>
    ${user.city}<br>
    ${user.country}<br>
    ${user.headImgurl}<br>
    ${user.privilege}<br>
    ${user.unionId}<br>
  
   <H1>Config Information</H1>
    	 <div id="interval">   ${config.interval} </div><br>
         <div id="debug">      ${config.debug}    </div><br>
 
   <H1>坐标信息</H1>  
   
         x:<div id="xId">   </div><br>
         y:<div id="yId">   </div><br>
         time:<div id="timeId">    </div><br>
    <br>
      <div id="logTitle">  <div>
        
       	  <div id="configDiv" ></div>
       	  
       	  <br>
       	  <br>
       	  
       	 <div id="divId" ></div>
         
  </body>
 <script type="text/javascript" ><!--
	    var  debug= document.getElementById("debug").innerHTML;
	    var  interval=document.getElementById("interval").innerHTML;
    	var  appId      =  null ;	
		var  timestamp	=  null ;
		var  nonceStr	=  null ;		
		var  signature  =  null ;
		
		var  interval    =  null ;
		
		var url=location.href.split('#')[0];
		
		function getConfig(){
			$.ajax({
				url : "${basePath}/contoller.do?operation=getLocationConfig",
				type : "get",
				data : {
					url : url
				},
				success : function(text, textStatus) {
					appId     =  text.appId;
					timestamp =  text.timestamp;
					nonceStr  =  text.noncestr;
					signature =  text.signature;
					interval  =  text.interval;
					//alert("signature: "+signature);
					
					if(debug=="true"){						
						document.getElementById("logTitle").innerHTML="<H1>Log Information</H1>";
						document.getElementById("configDiv").innerHTML=
						    "         appId  "+text.appId+ 
						    " <br> timestamp "+  text.timestamp+ 
							" <br>  noncestr "+text.noncestr+ 
							" <br> signature " + text.signature;
							
					    document.getElementById("divId").innerHTML=text.msg;
					}
					
					wxInit();
				},
				error : function(xhr, textStatus, error) {
					alert(error);
				}
			});
		}
	    
	    function wxInit(){
	    	wx.config({
	            debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
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
				        var openId= document.getElementById("openId").innerHTML;
				        
				       // alert("location result "+latitude+"    "+longitude+"   uid"+openId);
				        
				        submitLocation(latitude,longitude,openId);
				    }
				});
	    		
	    	});
	    	
	    	 wx.error(function(res){
	    	      alert("请求地理位置错误!"+res);
	    	      // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
	    	 });
	    }
	    
	    //getConfig();
	    window.setInterval(function(){
	    	    getConfig();	  
	    	    /*
	    	    latitude="65.48" ;
	    	    longitude="87.89" ;
	    	    //alert(transId);
	    	    transId = "111111";
	    	    submitLocation(latitude,longitude,openId,transId);
	    	    */
	    	   // parseInt(interval);
	    	   /*
	    	   latitude ="65.48";
	    	   longitude="87.89";
	    	   openId="jsdfiewijewif";
	    	
	    	   submitLocation(latitude,longitude,openId);*/
	    }, 30000); 
		    
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
	    
	    
      function submitLocation(latitude,longitude,openId,transId){
    	   //alert("submitLocation");    	   
    	   var urlStr="1=1&latitude"+latitude+"&longitude"+longitude+"&openId="+"12345"+"&transId="+transId;
        	$.ajax({
				url : "${basePath}/contoller.do?operation=submitLocation",
				type : "get",
				data : {
					latitude  : latitude,
					longitude : longitude,
					openId    :  "1234564",
					transId   : transId
				},
				success : function(text, textStatus) {
					document.getElementById("xId").innerHTML=latitude;
					document.getElementById("yId").innerHTML=longitude;
					document.getElementById("timeId").innerHTML=getNowFormatDate();
					//alert("submit location  successful!");
				},
				error : function(xhr, textStatus, error) {
					alert(error);
				}
			});
		
      }
     
  --></script>
  
</html>
