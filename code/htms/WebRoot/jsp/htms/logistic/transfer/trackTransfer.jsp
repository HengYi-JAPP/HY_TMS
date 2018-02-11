<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page  import ="com.zzy.htms.parklogistics.ParkLogisticsBean" %>
<%@ page import="com.zzy.htms.logistic.transfer.TransferBean" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%

   String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
   ParkLogisticsBean parkLogisticsBean=(ParkLogisticsBean )request.getAttribute("parkLogisticsBean");
   parkLogisticsBean=parkLogisticsBean==null?new ParkLogisticsBean():parkLogisticsBean;
   
   TransferBean trackTransferBean=(TransferBean )request.getAttribute("trackTransferBean");
   trackTransferBean=trackTransferBean==null?new TransferBean():trackTransferBean;
%>
<head><base href="<%=basePath%>">
<style type="text/css">
	#allmap {width: 100%;height:300px;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3Q27dAsDnXeL3qfwFlCRkxHMaZZFCbXb"></script>
</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css" switchbox="true"/>
	
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='查看物流跟踪详情' name="title"/>
	</jsp:include>
	<html:table cellSpacing="0"  align="left" isHead="false">
		<html:tr >
			<html:td >
				<btn:refresh href="contoller.do?operation=trackTransfer&transId=$[trackTransferBean.transId]&returnOperation=$[returnOperation]"/>
				<btn:return href="contoller.do?operation=$[returnOperation]"/>
			</html:td>
		</html:tr>
	</html:table>
	<table class="edit-talbe">
		<!-- <tr class="trCell">
			<td  colSpan="2" >
				物流跟踪详情
			</td>
		</tr> -->
		<tr class="trCell" >
			 <td class="edit-talbe-label" width="50px">
				订单创建时间
			</td>
			<td width="350px">
				 <html:value  value="$[trackTransferBean.shipApplyTime]" />
			</td>
		</tr>
		<tr class="trCell">	
			
			<td class="edit-talbe-label">
				内勤审批时间
			</td>
			<td >
                 <html:value  value="$[trackTransferBean.approveAgreeTime]" />
			</td>
		</tr>
		<tr class="trCell">
			 <td class="edit-talbe-label">
				物流分配时间
			</td>
			<td >
				 <html:value  value="$[trackTransportBean.assignTime]" />
			</td>
		</tr>
		<tr class="trCell">
			 <td class="edit-talbe-label">
				车牌号
			</td>
			<td >
				 <html:value  value="$[trackTransportBean.vehicleNo]" />
			</td>
		</tr>
		<tr class="trCell">
			 <td class="edit-talbe-label">
				车辆装载状态
			</td>
			<td >
			    <%if("1".equals(parkLogisticsBean.getParkStatus())){
			    %>
			             已到园区,未装运   到园区时间:<html:value  value="$[parkLogisticsBean.bindingTime]" />
			    <%
			    }else if("2".equals(parkLogisticsBean.getParkStatus())){
			    %>
			             装运完成,已驶离园区  离开时间:<html:value  value="$[parkLogisticsBean.exitTime]" />
			    <%
			    }else{
			     %>
			             未到园区
			    <%
			    } 
			    %>
			</td>
		</tr>
		
		<tr class="trCell">
			<td class="edit-talbe-label">
				目前已到达
			</td>
			<td >
                 <html:value  value="$[trackTransferBean.province]" />
                 <html:value  value="$[trackTransferBean.city]" />
                 <html:value  value="$[trackTransferBean.district]" />
                 
                 <%if(trackTransferBean.getModifyTime()!=null&&trackTransferBean.getModifyTime()!=""){
			    %>
			                 更新时间:<html:value  value="$[trackTransferBean.modifyTime]" />
			    <%
			    }else if(trackTransferBean.getCreateTime()!=null&&trackTransferBean.getCreateTime()!=""){
			    %>
			                 更新时间:<html:value  value="$[trackTransferBean.createTime]" />
			    <%
			    }
			    %>
			</td>
		</tr>
		<tr class="trCell"  >
		    <td class="edit-talbe-label">
				签收状态
			</td>
			<td >
				<logic:if condition="$[trackTransportBean.sendStatus]==1&&$[trackTransportBean.transportStatus]!=102">
					未配送
				</logic:if>
				<logic:if condition="$[trackTransportBean.transportStatus]==102">
					已签收
				</logic:if>
			</td>
		</tr>
	</table>
	<table class="edit-talbe" style="height: 300px;">
		<tr>
			<td>
				<div id="allmap"></div>
				<html:hidden id="transId" name="transId" value="$[trackTransferBean.transId]"/>
			</td>
		</tr>
	</table>
	<script src="jsp/htms/mobile/js/Ajax.js" ></script>
	<script type="text/javascript">
	window.onload=function(){ 
		getLocaltion(); 
	} 
	function getLocaltion(){
		setTimeout("getLocaltion()", 1000*60*5);
		var transId = document.getElementById("transId").value;
		var basePath = "<%=basePath%>" + '/controller.do';
		var parmas = {operation:'getLocation','transId':transId};
		Ajax.get(basePath,parmas,function(msg){
		console.log("msg=====" + msg);
			var msgObj = JSON.parse(msg);
			if(msgObj.code != 0){
				//alertTip(msgObj.msg);
				loadLocation(30.168977,120.409748);
			}else{
				var latitude = msgObj.latitude;
				var longitude = msgObj.longitude;
				loadLocation(latitude,longitude);
			}
			
		});
	}
	
	// 百度地图API功能
		var map = new BMap.Map("allmap");    // 创建Map实例
	function loadLocation(latitude,longitude){
		map.centerAndZoom(new BMap.Point(longitude, latitude), 17);  // 初始化地图,设置中心点坐标和地图级别
		var pt = new BMap.Point(longitude, latitude);
		var myIcon = new BMap.Icon("images/htms/car.png", new BMap.Size(60,43));
		var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
		map.addOverlay(marker2);
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	}
</script>
