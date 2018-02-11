<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,jsp/htms/autocompleter/jquery.min.js,jsp/htms/autocompleter/jquery.autocompleter.js,jsp/htms/mobile/js/Ajax.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<com:loader css="jsp/htms/sales/customerprice/autocompleter.css"/>


<script type="text/javascript">
      var basePath = "<%=basePath %>" + '/controller.do';
      function closeAutoComplater(){
         console.log("close");
         $('#customerName').autocompleter('close');
      }
      
      
      var getDataStatus=false;
      function selectCustomer(){
	      if(!getDataStatus){
	           getAllData();
	           getDataStatus=true;
	      }
       }
       
       function getAllData(){
           var params = {operation:'getSelfFetchCarCustomer'};
           
           Ajax.get(basePath, params, function(msg){
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
			            $('#customerCode').attr("value",customer.hex);
			            //$('#customerNameSH').attr("value",customer.label);
			        }
			    });
          });
          
          $('#autocompleter').autocompleter('close');
       }
       
       
       function validateForm(){
           var customerCode=$('#customerCode').val();
           if(customerCode==null||customerCode==""){
                alertTip("客户名称输入有误");
           }else{
                __vsubmit('selfFetchAddForm');
           }
           
       }
       
</script>

<html:form id="selfFetchAddForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addSelfFetchCar"/>
	<html:hidden id="isValidate" name="isValidate" value="1" />
	<com:loader binder="true" checkall="true" switchbox="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='新增自备车自提车辆' name="title"/>
	</jsp:include>
	<table id="1687" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="COEGCACONNEMECLABPCOKHBKCFKPAAKCKKFBHHGIIPHBPAPLBMOALLNKJJNCIBHK" colSpan="1" rowSpan="1">
				客户
			</td>
			<td  id="FKKIGNLGHKNAKNNBAOLGAPBEMMGPCKLCOECJJAEKJMOCFIIBHHGEIFFCJNIKPKMN" colSpan="1" rowSpan="1">
				<html:hidden  id="customerCode"  name="customerCode"  />
		        <div class="field">
		                <input type="text" name="autocompleter" id="autocompleter"  
		                 style="width: 220px;max_height:300px;"   placeholder="输入后自动匹配客户"  onclick="selectCustomer();" />
		         </div>
			</td>
			
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="EIFOBBFOEIEIKKKLNOCEFMHHAKFAOIGLIGBAAAONBKJPCNKLOJPIKFLGPKCECKPL" colSpan="1" rowSpan="1">
				车牌号
			</td>
			<td  id="MOAHHBJNHABAKKGKPCLOCELHKNBBMALFEFFHIKIMMILBCJNHBKPCCKIFGAEMMABH" colSpan="1" rowSpan="1">
				<html:text  id="vehicleNo"  name="vehicleNo" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="EIFOBBFOEIEIKKKLNOCEFMHHAKFAOIGLIGBAAAONBKJPCNKLOJPIKFLGPKCECKPL" colSpan="1" rowSpan="1">
				备注
			</td>
			<td  id="MOAHHBJNHABAKKGKPCLOCELHKNBBMALFEFFHIKIMMILBCJNHBKPCCKIFGAEMMABH" colSpan="1" rowSpan="1">
				<html:textarea id="remark"  name="remark" cols="40" rows="5"></html:textarea>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:validateForm();"/>
				<btn:return href="contoller.do?operation=listSelfFetchCar"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="selfFetchAddForm" showNormal="true" submitValidate="true" >
		<com:vElement id="autocompleter"  types="isnull" event="onblur">
			<com:init size="15" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="vehicleNo"  types="isnull" event="onblur">
			<com:init size="20" maxlength="30"></com:init>
		</com:vElement>
		<com:vElement id="remark"  types="null" event="onblur">
			<com:init size="20" maxlength="150"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
