<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@page import="com.mobilecn.privilege.organization.OrganizationRepository" %>
<%@page import="com.mobilecn.privilege.organization.OrganizationBean" %>
<%
String currentOrgId=request.getParameter("currentOrgId");
OrganizationRepository rep = new OrganizationRepository();
OrganizationBean argBean=rep.getOrganization(currentOrgId);
List list =null;

if(argBean!=null){
	list = new ArrayList();
	list.add(argBean);
	request.setAttribute("checkedTreeList",list);
}
request.setAttribute("orgList",rep.getOrganizationLists());
 %>
<html:page title="Select Organization">

	<com:loader  js="js/common/common.js,js/console/list/list.js"/>
	<com:loader css="css/common/table-list.css" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true"  tree="true"/>	
				<!-- banner 页面导航条 -->

		<html:hidden id="operation" name="operation" value="listArea"/>
		<jsp:include page="../../common/impart/table-banner.jsp">
			<jsp:param value="Select Organization" name="title"/>
		</jsp:include>
		
	
		<!-- operationbox 功能操作条 -->
		<html:table id="searchConditionBox" style="width: 100%;" align="left" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label" width="300px"  align="left">
				<btn:button name="Confirm Selected" href="javascript:void(0);" onclick="getSelectOrg();" typeId="assignUser" value="Confirm Selected" styleClass="button-self-style"/>
				</html:td>
				<html:td styleClass="condition_label" width="auto"  align="left">
				</html:td>
			</html:tr>
		</html:table>

	<com:tree treeList="orgList" treeName="myTree" useCheckBox="true" chooseStyle="single" checkedTreeList="checkedTreeList" cacheElementName="checkOrgId" treeNodeId="orgId" appendNodeOperation="false" useNodeImage="false" expandAll="0" useLink="false" >
		<com:treeNodeMap name="orgName" nodeId="orgId" parentId="orgParentId" alert="orgName"/>
	</com:tree>
				
	<script>
		function getSelectOrg(){
			var treeNodes=	myTree.treeNodes;
			//alert("treeNodes="+treeNodes.length);
			var checkOrgId=document.getElementsByName("checkOrgId");
			var orgId =null;
			if(checkOrgId&&checkOrgId.length==1){
				orgId=checkOrgId[0].value;
				//alert("orgId="+orgId);
			}
			if(!orgId){
				///alert("orgId=null");
				return;
			}
			for(var i=0;i<treeNodes.length;i++){
				if(treeNodes[i].nid==orgId){
					//alert("areaName="+treeNodes[i].nn);
					parent.document.getElementById("selectedOrgId").value=orgId;
					parent.document.getElementById("orderOrg").value=treeNodes[i].nn;
					parent.document.getElementById("orderOrg").focus();
					parent.document.getElementById("orderOrg").blur();
					break;
				}
			}
			parent.__myWin.closeWebWindow('selectOrgWin');
		}
		
		</script>
</html:page>









