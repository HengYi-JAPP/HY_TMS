<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.sales.customer.CustomerBean"%>
<%@ include file="../../common/impart/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>AutoCompleter</title>
  </head>
  	<script src="jsp/htms/mobile/js/Ajax.js"></script>
      <link rel="stylesheet" href="jsp/htms/autocompleter/main.css">
        <script src="jsp/htms/autocompleter/jquery.autocompleter.js"></script>
      <script type="text/javascript">
       var basePath = "<%=basePath %>" + '/controller.do';
      function selectCustomer(){
	      	var params = {operation:'SELECUSTOMER'};
	      	Ajax.get(basePath, params, function(msg){
	           	 var jsonMsg = JSON.parse(msg);
	           	console.log('jsonMsg=' + jsonMsg);
	           	$('#customerName').autocompleter({
			        highlightMatches: true,
			        source: jsonMsg,
			        template: '{{ label }} <span>({{ hex }})</span>',
			        hint: true,
			        empty: false,
			        limit: 5,
			        callback: function (value,index,customer) {
			            //获取选中的客户的值
			            alertTip( "Value "+customer.label+"     "+customer.hex );
			        }
			    });
          	});
          }
			
      </script>
      
  <body>
 		  <main>
            <div class="field">
                <input type="text" name="customerName" id="customerName" placeholder="Crayola colors" maxlength="40" onclick="selectCustomer();" />
            </div>
        </main>
       
  </body>
</html>
