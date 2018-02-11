<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<%
String currentAreaId=request.getParameter("areaId");
AreaRepository rep = new AreaRepository();
AreaBean areaBean=rep.getArea(currentAreaId);
List list =null;
if(areaBean!=null){
	list = new ArrayList();
	list.add(areaBean);
	request.setAttribute("checkedTreeList",list);
}
request.setAttribute("areaTreeList",AreaRepository.getRootNodeList());
String areaName = (String)rep.getFullAreaName(currentAreaId,">>",true);
areaName=areaName==null?"":areaName;
 %>
 <style>
<!--
.treeDiv{margin-bottom: 30px}
-->
</style>
<html:page title="选择地址">

	<com:loader  js="js/common/common.js,js/console/list/list.js"/>
	<com:loader css="css/common/sub-table-list.css" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true"   />	

				<!-- banner 页面导航条 -->

		<html:hidden id="operation" name="operation" value="listArea"/>
		<jsp:include page="../../../common/impart/table-banner-new.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.select")%>' name="title"/>
		</jsp:include>
		
	
		<!-- operationbox 功能操作条 -->
		<html:table id="searchConditionBox" style="width: 98%;position: fixed;bottom: 0px;z-index: 100;" align="left" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label" width="300px"  align="left">
				<!--<btn:button name="Confirm Selected" href="javascript:void(0);" onclick="getSelectOrg();" typeId="assignUser" value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.confirm")%>' styleClass="button-self-style"/>-->
				<input type="button"   name="Confirm Selected" value="确认" onclick="getSelectOrg();" style="width: 50px;height:24px;border-style:none;background-repeat:no-repeat;background-color:transparent;color: #2889c4;font-weight:bold;font-size: 14px;cursor:pointer;border: 1px solid #77b8df;border-radius: 4px;padding: 0 10px;">
				</html:td>
				<html:td styleClass="condition_label" width="auto"  align="left">
				</html:td>
			</html:tr>
			
		</html:table>
		
			<html:div>
				<html:table>
				
				<html:tr>
					<html:td><html:label  label="{$jsp.htms.dictionary.area.selectarea#}:" ></html:label></html:td>
					<html:td>
						 <div id="selectAreaName"><%=areaName %></div>
					</html:td>
				</html:tr>
				</html:table>
			</html:div>
	<com:tree  treeList="areaTreeList" treeName="myTree" useCheckBox="true" chooseStyle="single" cacheElementName="checkAreaId" treeNodeId="areaId" appendNodeOperation="false" useNodeImage="false" expandAll="0" useLink="false" isAsync="true"   asyncDataLodaerClass="com.zzy.htms.dictionary.area.AsyncAreaLoader">
		<com:treeNodeMap name="areaName" nodeId="areaId" parentId="parentAreaId" alert="areaName" level="areaLevel"/>
	</com:tree>
	<script>
		function getSelectOrg(){
			var treeNodes=	myTree.treeNodes;
			//alert("treeNodes="+treeNodes.length);
			var checkAreaId=document.getElementsByName("checkAreaId");
			var areaId =null;
			//alert("checkAreaId.length="+checkAreaId.length);
			if(checkAreaId&&checkAreaId.length==1){
				areaId=checkAreaId[0].value;
				//alert("areaId="+areaId);
			}
			if(!areaId){
				//alert("areaId=null");
				return;
			}
			var selectAreaName ="";
			for(var i=0;i<treeNodes.length;i++){
				if(treeNodes[i].nid==areaId){
					//alert("areaName="+treeNodes[i].nn);
					selectAreaName=fecthFullName(treeNodes[i]);
					parent.document.getElementById("areaId").value=areaId;
					parent.document.getElementById("orderArea").value=selectAreaName;
					parent.document.getElementById("orderArea").focus();
					parent.document.getElementById("orderArea").blur();
					document.getElementById("selectAreaName").value=selectAreaName;
					break;
				}
			}
			parent.__myWin.closeWebWindow('selectAreaWin');
		}
		
		function fecthFullName(currNode){
			if(!currNode){
				//alert("areaId=null");
				return "";
			}
			if(!currNode.pid||currNode.pid=='0'){
				return currNode.nn;
			}
			var nodes=[];
			nodes[nodes.length]=currNode;
			var isMatch=false;
			var treeNodes=	myTree.treeNodes;
			for(var n=0;n<nodes.length;n++){
				currNode=nodes[n];
				for(var i=0;i<treeNodes.length;i++){
					if(currNode.pid==treeNodes[i].nid){
						nodes[nodes.length]=treeNodes[i];
						break;
					}
				}//i
			}//n
			var areaName ="";
			for(var n=nodes.length-1;n>=0;n--){
				areaName=areaName+nodes[n].nn;
			}
			return areaName;
		}
		
		</script>
</html:page>









