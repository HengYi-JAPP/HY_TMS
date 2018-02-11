<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 List<AreaBean> provinceList =AreaRepository.getRootNodeList();
 request.setAttribute("provinceList",provinceList);
 %>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css" ajax="true" asyncSelect="true"/>
<table id="1638" class="edit-talbe">
		
		<tr class="trCell">
			<html:td  styleClass="edit-talbe-label">
				省
			</html:td>
			<html:td width="80px">
				<html:select id="provinceId" name="provinceId"  list="provinceList" isCascade="true" isCascadeSource="true" cascadeTarget="cityId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</html:td>
			
			<html:td styleClass="edit-talbe-label">
				市
			</html:td>
			<html:td width="100px">
				<html:select id="cityId" name="cityId"   isCascade="true" isCascadeSource="true" cascadeTarget="countyId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					
				</html:select>
			</html:td>	
			<html:td styleClass="edit-talbe-label">
				区(县)
			</html:td>
			<html:td width="100px">
				<html:select id="countyId" name="countyId"  isCascade="true" isCascadeSource="true" cascadeTarget="countryId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
				
				</html:select>
			</html:td>	
			<html:td  styleClass="edit-talbe-label">
				乡镇、街道
			</html:td>
			<html:td width="100px">
				<html:select id="countryId" name="countryId"   isCascade="true"  cascadeValue="parentAreaId">
				</html:select>
			</html:td>					
			
		</tr>
		
	</table>
