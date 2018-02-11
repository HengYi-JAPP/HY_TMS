<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
String userId = request.getParameter("userId");
%>
<head>
<script type="text/javascript">
var basePath="<%=basePath %>";

function selectCustomer(){
	document.getElementById("customerTip").innerHTML="";
}
function selectAreaId(obj){
	document.getElementById('area').value=obj.value;
	document.getElementById("areaTip").innerHTML="";
}
function submitCustAddr(){
	var isSubmit = true;
	var customerId = document.getElementById("customerId").value;
	var areaId = document.getElementById("areaId").value;
	if(!customerId){
		document.getElementById("customerTip").innerHTML="请选择客户";
		isSubmit= false;
	}
	if(!areaId){
		document.getElementById("areaTip").innerHTML="请选择地址";
		isSubmit= false;
	}
	if(isSubmit){
		window.location.href="javascript:__vsubmit('customerAddrForm')";
	}
}
</script>

<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js,jsp/htms/autocompleter/jquery.min.js,jsp/htms/autocompleter/jquery.autocompleter.js" myWin="true"/>
<com:loader css="css/common/sub-table-list.css,jsp/htms/sales/customerprice/autocompleter.css"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>

<script type="text/javascript">
      
      function closeAutoComplater(){
         console.log("close");
         $('#customerName').autocompleter('close');
      }
      
      
      var getDataStatus=false;
      function selectCustomerFromDB(){
	      if(!getDataStatus){
	           getAllData();
	           getDataStatus=true;
	      }
       }
       var basePath1 = "<%=basePath %>" + 'contoller.do';
       
       function getAllData(){
           var   params= {operation:"selectGetAllCustomerByUserGroup"};
           /*
           Ajax.get(basePath1, params, function(msg){
	           	var jsonMsg = JSON.parse(msg);
	           	//console.log('jsonMsg=' + jsonMsg);
	           	$('#autocompleter').autocompleter({
			        highlightMatches: true,
			        source: jsonMsg,
			        template: '{{ label }} <span>({{ hex }})</span>',
			        //hint: true,
			        //empty: false,
			        //scroll:true,  
			        　     // max:10,　　　　　　　　　 //下拉项目的个数，default：10
　                                    // scrollHeight: 300,　 // 下拉框的高度， Default: 180
			        limit: 100,
			        callback: function (value, index,customer) {
			            //alert( "Value "+customer.label+"     "+customer.hex );
			            $('#customerId').attr("value",customer.hex);
			            //$('#customerNameSH').attr("value",customer.label);
			        }
			    });
          });*/
          
          var result=false;
          $.ajax({
		    url  : basePath1,
		    type:'POST', //GET
		    async:false,    //或false,是否异步
		    data: params,
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data){
				alertTip(data);
				/*
				$('#autocompleter').autocompleter({
			        highlightMatches: true,
			        source: jsonMsg,
			        template: '{{ label }} <span>({{ hex }})</span>',
			        //hint: true,
			        //empty: false,
			        //scroll:true,  
			        　     // max:10,　　　　　　　　　 //下拉项目的个数，default：10
　                                    // scrollHeight: 300,　 // 下拉框的高度， Default: 180
			        limit: 100,
			        callback: function (value, index,customer) {
			            //alert( "Value "+customer.label+"     "+customer.hex );
			            $('#customerId').attr("value",customer.hex);
			            //$('#customerNameSH').attr("value",customer.label);
			        }
			    });*/
		    },
		    error:function(xhr,textStatus){
		    	result=false;
		    }
		})
          
          $('#autocompleter').autocompleter('close');
       }
</script>

<html:form id="customerAddrForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="POST" >
	
	<html:hidden id="operation" name="operation" value="addCustomerAddr"/>
	<html:hidden id="userId"  name="userId" value="<%=userId %>"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<com:loader binder="true" checkall="true" switchbox="true"  validator="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customeraddr.title.add") %>' name="title"/>
	</jsp:include>
	<html:table id="1643" styleClass="edit-talbe" > 
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</html:td>
			<html:td>
				
				<html:select id="customerId" name="customerId" list="customerList"  style="width:240px!important;" onblur="selectCustomer();">
					<html:option label="customerName" value="customerId"></html:option>
				</html:select>
				 <!-- 
					 <html:hidden  id="customerId"  name="customerId" value="$[cacheCustomerId]" />
					 <html:hidden  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
				     <div class="field">
				           <input type="text" name="autocompleter" id="autocompleter"  value="<html:value value='$[customerNameSH]' />"   style="width: 220px;max_height:300px;"   placeholder="输入后自动匹配客户" maxlength="40" onclick="selectCustomerFromDB();" />
				     </div>	
			     -->			
				<span id="customerTip" style="font-size:12px;color:red;font-weight: bold;letter-spacing: 2px;font-family: 宋体;"></span>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customeraddr#}" ></html:label>
			</html:td>
			<html:td width="450px;">
				<html:text  id="caddrContactor"  name="caddrContactor"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				客户地址
			</html:td>
			<html:td style="width:380">
				<html:hidden name="area" id="area"  value=""/>
				<html:hidden id="areaId" name="areaId" value=""/>	
				<input type="text" name="orderArea" id="orderArea" value="" onblur="selectAreaId(this);" readonly="readonly" style="width:320"/>	
				<btn:button name="Select" href="javascript:void(0);" onclick="selectAsyncArea()" typeId="selectArea" value='选择' styleClass="button-self-style"/>
				<span id="areaTip" style="font-size:12px;color:red;font-weight: bold;letter-spacing: 2px;font-family: 宋体;"></span>
			</html:td>
			
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.caddrtelephone#}" ></html:label>
			</html:td>
			<html:td>
				<html:text  id="caddrTelephone"  name="caddrTelephone"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				详细地址<%--<html:label  label="{$jsp.htms.sales.customeraddr.caddrdetail#}" ></html:label>--%>
			</html:td>
			<html:td colspan="3">
				<html:text  id="caddrDetail"  name="caddrDetail"  style="width:320px;"/>
			</html:td>
			<%--
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.carno#}" ></html:label>
			</html:td>
			<html:td>
				<html:text  id="carNo"  name="carNo"/>
			</html:td> --%>
		</html:tr>
		<%--
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.caddrnotice#}" ></html:label>
			</html:td>
			<html:td colspan="3">
				<html:textarea id="caddrNotice" name="caddrNotice" cols="40" rows="5"></html:textarea>
			</html:td>
		</html:tr>
		 --%>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save onclick="submitCustAddr();"/>
				<btn:return href="contoller.do?operation=listCustomerAddr"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="customerAddrForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="caddrDetail"  types="isnull" event="onblur">
				<com:init size="40" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="caddrContactor"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="caddrTelephone"  types="mobile" event="onblur">
				<com:init size="20" maxlength="11" ></com:init>
			</com:vElement>
		
		</com:validator>
</html:form>
