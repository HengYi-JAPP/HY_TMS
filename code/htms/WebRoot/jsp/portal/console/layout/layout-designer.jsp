<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.layout.LayoutBean"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="consts.PropKey"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<ColumnBean> systemColumn = (List<ColumnBean>)request.getAttribute("systemColumn");
List<ColumnBean> layoutColumn = (List<ColumnBean>)request.getAttribute("layoutColumn");

LayoutBean layoutViewBean = (LayoutBean)request.getAttribute("layoutViewBean");
layoutViewBean= layoutViewBean==null?new LayoutBean():layoutViewBean;
systemColumn = systemColumn==null?new ArrayList<ColumnBean>(0):systemColumn;
layoutColumn = layoutColumn==null?new ArrayList<ColumnBean>(0):layoutColumn;
String layoutTmpl = layoutViewBean.getLayoutTempl();
String orgLayoutTmpl = layoutTmpl;
layoutTmpl = layoutTmpl==null||"".equals(layoutTmpl.trim())?layoutViewBean.getLayoutId()+".jsp":layoutTmpl;
String projectPath=PathFetcher.getProjectAbsolutePath();
System.out.println("\n\n\n\n --------------------projectPath:"+projectPath);
ColumnBean columnBean = null;
%>
<script src="<%=basePath %>js/portal/pdrag-common.js" type="text/javascript"></script> 
<script src="<%=basePath %>js/portal/pdrag-layout.js" type="text/javascript"></script> 
<script src="<%=basePath %>js/portal/pdrag-layout-unit.js" type="text/javascript"></script> 
<script src="<%=basePath %>js/portal/pdrag-portlet.js" type="text/javascript"></script>
<script src="<%=basePath %>js/portal/pdrag-mover.js" type="text/javascript"></script>  

<style>
   /* body{margin:0px;padding:0px;-moz-user-select:none;cursor:default;}*/

    .tabEditDiv{position:absolute;width:15px;height:15px;cursor:pointer;}
    .seltab{position:absolute;width:15px;height:15px;cursor:pointer;background:url(images/seltab.gif) no-repeat;}
    .splitx{overflow:hidden;position:absolute;height:3px;cursor:row-resize;/*background:red !important;filter:Alpha(opacity=10);-moz-opacity:0.1;opacity: 0.1;*/}
    .splity{overflow:hidden;position:absolute;width:3px;cursor:col-resize;/*background:red !important;filter:Alpha(opacity=10);-moz-opacity:0.1;opacity: 0.1;*/}
    #tabletitle{font-weight:bold;font-size:18px;height:30px;width:800px;margin:0 auto;text-align:center;font-family:宋体;line-height:30px;}
    #tabletitle input{width:100%;border:0px;height:28px;line-height:30px;text-align:center;font-weight:bold;font-size:18px;font-family:宋体;}
    .finelinetable{left:100px;top:100px;border-right:1px solid #000;border-top:1px solid #000;border-collapse:collapse;font-size:13px;height:100%;width:100%;;margin:0 auto;}
    .finelinetable td{border-left:1px solid #000;border-bottom:1px solid #000;height:25px;}
</style>
	 
	<script src="<%=basePath %>js/portal/layou-designer.js" type="text/javascript"></script> 
	<script type="text/javascript">
var LayoutDesigner = new LayoutDesigner("LayoutDesigner");
LayoutDesigner.layoutId = "<%=layoutViewBean.getLayoutId()%>";
</script>

<body  style="margin:0 auto;" onmousemove="if(LayoutDesigner&&LayoutDesigner.mover){LayoutDesigner.mover.showPositionShadow();}"><!--   -->


<form id="layoutDesignerForm" action="contoller.do" method="post">
<input type="hidden" id="operation" name="operation" value="saveLayoutUnitColumn">
<div style="width:100%;height:100%;">
<div  id="currentLayoutInfo"  style="width:100%;height:30px;">
<div style="width:auto;height:28px;float:left;" ><%=tools.tool.getLocal("jsp.portal.console.layout.name") %></div> 
<div style="width:auto;height:28px;float:left;" ><%=layoutViewBean.getLayoutName() %></div>
<input type="hidden" id="checkLayoutId" name="checkLayoutId" value="<%=layoutViewBean.getLayoutId() %>">
<input type="hidden" id="layoutTempl" name="layoutTempl" value="<%=layoutTmpl %>">

</div>
	<div  id="layoutDesignerPannelOperationArea"  style="width:100%;height:30px;">
		<div  id="layoutDesignerOperation"  style="width:100%;height:30px;float:left;">
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit242" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.up") %>" onClick="LayoutDesigner.design('insertrow_up',1)"></div> 
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit2422" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.down") %>" onClick="LayoutDesigner.design('insertrow_down',1)"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit2423" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.left") %>" onClick="LayoutDesigner.design('insertcol_left',1)"></div> 
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit24223" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.right") %>" onClick="LayoutDesigner.design('insertcol_right',1)"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit2424" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.split.row") %>" onClick="LayoutDesigner.design('rowsplit',1)"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit24242" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.split.col") %>" onClick="LayoutDesigner.design('colsplit',2)"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit2" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.up") %>" onClick="LayoutDesigner.design('merge','up')"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit22" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.down") %>" onClick="LayoutDesigner.design('merge','down')"></div> 
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit23" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.left") %>" onClick="LayoutDesigner.design('merge','left')"></div> 
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit24" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.right") %>" onClick="LayoutDesigner.design('merge','right')"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit24222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.delete.row") %>" onClick="LayoutDesigner.design('deleterow')"></div> 
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.delete.col") %>" onClick="LayoutDesigner.design('deletecol')"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.show.tmpl") %>" onClick="LayoutDesigner.getLayoutTemplate()"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.save.tmpl") %>" onClick="LayoutDesigner.getLayoutTemplate()"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.design.tmpl") %>" onClick="LayoutDesigner.defineColumns()"></div>
			<div style="width:auto;height:28px;float:left;" ><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.publish") %>" onClick="LayoutDesigner.publishLayoutTemplate()"></div>
		</div>	
	</div>
	<div style="width:100%;height:30px;float:left;"  onclick="LayoutDesigner.ShowOrHideDesignPannel('layoutDesignerPannelOperationArea');">
	收扰
	</div>
	<div  id="layoutDesignerPannel" style="width:600px;height:400px;float:left" >
	<%if(orgLayoutTmpl!=null&&!"".equals(orgLayoutTmpl.trim())){ %>
	<jsp:include  page="<%=layoutTmpl %>" flush="true"></jsp:include>
	
	<%} %>
	</div>
	<div id="__columnSandBox" style="width:18%;height:100%;float:right;display:none;border:1px solid #ccc;">
	<table>
		<tr>
			<td>				
				<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.definecolumn") %>
			</td>
		</tr>
		<tr>
			<td>
				<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.columnname") %><br/><input type="text" id="columnName" value=""><br/><input type="button" name="Submit23" size="8" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.search") %>" onClick="">
			</td>
		</tr>
		<tr>
			<td id="allColumns"><!-- __allAllowDefinedColumns -->
				<%
				for(int i=0,size=systemColumn.size();i<size;i++){
					columnBean = systemColumn.get(i);
				%>
				<div id="<%=columnBean.getColumnId() %>" style="width:100%;height:90px;"  onmousedown="LayoutDesigner.mover.startMove(this.id);"><%=columnBean.getColumnName() %></div>
				<script type="text/javascript">
				LayoutDesigner.layout.addPortlet("allColumns","<%=columnBean.getColumnId() %>","<%=columnBean.getColumnName() %>","1","1", "1");
				</script>
				<%} %>
			
				<div id="__control_definer" style="width:100%;height:30px;">
<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.debuginfo") %>
	</div>
			</td>
		</tr>
	</table>
	</div>
</div>
<textarea id="layoutDesignerTemplateContent" name="layoutDesignerTemplateContent" rows="5" cols="8" style="display:none;"></textarea>
<textarea id="layoutPublishTemplateContent" name="layoutPublishTemplateContent" rows="5" cols="8" style="display:none;"></textarea>
<div id="saveValueArea" style="display:none;">

</div>
<script type="text/javascript">
//var LayoutDesigner = new LayoutDesigner("LayoutDesigner");

function setFocus(obj){
	LayoutDesigner.clickElement(obj);
}

<%if(orgLayoutTmpl!=null&&!"".equals(orgLayoutTmpl.trim())){ %>
LayoutDesigner.initLayoutPannel();
<%}else{ %>
LayoutDesigner.createDefaultPannel();
<%
}
%>
/*把当前布局中各个单元中原有的栏目*/
<%
for(int i=0,size=layoutColumn.size();i<size;i++){
	columnBean = layoutColumn.get(i);
%>
LayoutDesigner.layout.addPortlet("<%=columnBean.getUnitId() %>","<%=columnBean.getColumnId() %>","<%=columnBean.getColumnName() %>","1","1", "1");
<%} %>
</script>
</form>
</body>
