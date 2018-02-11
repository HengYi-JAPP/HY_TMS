<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.layout.LayoutBean"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="consts.PropKey,com.mobilecn.utils.PathFetcher"%>
<%@page import="tools.tool"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String currentSysCode=  request.getParameter("currentSysCode");
String checkChannelId =  request.getParameter("checkChannelId");
List<ColumnBean> systemColumn = (List<ColumnBean>)request.getAttribute("systemColumn");
List<ColumnBean> layoutColumn = (List<ColumnBean>)request.getAttribute("layoutColumn");

LayoutBean layoutViewBean = (LayoutBean)request.getAttribute("layoutViewBean");
layoutViewBean= layoutViewBean==null?new LayoutBean():layoutViewBean;
systemColumn = systemColumn==null?new ArrayList<ColumnBean>(0):systemColumn;
layoutColumn = layoutColumn==null?new ArrayList<ColumnBean>(0):layoutColumn;
String layoutTmpl = layoutViewBean.getLayoutTempl();
String orgLayoutTmpl = layoutTmpl;
layoutTmpl = layoutTmpl==null||"".equals(layoutTmpl.trim())?layoutViewBean.getLayoutId()+".jsp":layoutTmpl;


if(orgLayoutTmpl!=null&&!"".equals(orgLayoutTmpl.trim())){
	String projectPath=PathFetcher.getProjectAbsolutePath();
	String tmplPath = projectPath+"/jsp/wsites/"+currentSysCode+"/layout/"+orgLayoutTmpl;
	tmplPath=tools.tool.fillParams(tmplPath,request);
	if(tool.isExist(tmplPath)==false){
		orgLayoutTmpl = null;
		layoutTmpl=layoutViewBean.getLayoutId()+".jsp";
	}
	
//System.out.println("\n\n\n\n --------------------projectPath:"+tmplPath);
}

ColumnBean columnBean = null;
%>
<com:loader   ajax="true"/>
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
    .finelinetable{left:100px;top:100px;border-right:1px solid #000;border-top:1px solid #000;border-collapse:collapse;font-size:13px;height:100%;width:100%;;margin:0 auto;valign:top;vertical-align:top;align:left;text-align:left;}
    .finelinetable td{border-left:1px solid #000;border:1px solid #000;height:25px;valign:top;vertical-align:top;align:left;text-align:left;}
    .ColumnSandBox{};
    .ColumnSandBox td{border:1px solid #000;height:25px;valign:top;vertical-align:top;align:left;text-align:left;}
</style>
	 
	<script src="<%=basePath %>js/portal/layou-designer.js" type="text/javascript"></script> 
	<script type="text/javascript">
var LayoutDesigner = new LayoutDesigner("LayoutDesigner");


LayoutDesigner.LIST_TITLE_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.listtitle") %>';
LayoutDesigner.USAGE_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.usage") %>';
LayoutDesigner.REST_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.setwh") %>';
LayoutDesigner.CANNOT_DELETE_ROW_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.delrow") %>';
LayoutDesigner.CANNOT_DELETE_COL_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.delcol") %>';
LayoutDesigner.SURE_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.sure") %>';
LayoutDesigner.CANNCEL_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.cancel") %>';
LayoutDesigner.WIDTH_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.width") %>';
LayoutDesigner.HEIGHT_LABEL='<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.height") %>';


LayoutDesigner.layoutId = "<%=layoutViewBean.getLayoutId()%>";
</script>

<body  style="margin:0 auto;" onmousemove="if(LayoutDesigner&&LayoutDesigner.mover){LayoutDesigner.mover.showPositionShadow();}"><!--   -->


<form id="layoutDesignerForm" action="contoller.do" method="post">
<input type="hidden" id="operation" name="operation" value="saveLayoutUnitColumn">
<input type="hidden" id="checkLayoutId" name="checkLayoutId" value="<%=layoutViewBean.getLayoutId() %>">
<input type="hidden" id="layoutTempl" name="layoutTempl" value="<%=layoutTmpl %>">
<input type="hidden" id="checkChannelId" name="checkChannelId" value="<%=checkChannelId %>">
<input type="hidden" id="currentSysCode" name="currentSysCode" value="<%=currentSysCode %>">

<table style="width:1200px;height:768px;">
	<tr>
		<td>
			<table id="currentLayoutInfo"  style="width:100%;height:30px;">
				<tr>
					<td  style="width:100px;height:28px;float:left;">
						<div style="width:100px;height:28px;float:left;" ><%=tools.tool.getLocal("jsp.portal.console.layout.name") %></div> 
					</td>
					<td style="width:200px;;height:28px;float:left;">
						<div style="width:200px;;height:28px;float:left;" ><%=layoutViewBean.getLayoutName() %></div>
						<input type="hidden" id="checkLayoutId" name="checkLayoutId" value="<%=layoutViewBean.getLayoutId() %>">
					</td>
					
					<td style="width:80px;;height:28px;float:right;">
						<btn:return href="contoller.do?operation=listLayout&checkChannelId=$[layoutViewBean.channelId]&sysId=$[sysId]"/>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr id="layoutDesignerPannelOperationArea" >
		<td>
			<table  style="width:100%;height:30px;">
				<tr>
					<td width="200px">
						<table  style="border:1px solid #ccc;">
							<tr>
								<td><input type="button" name="Submit242" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.up") %>" onClick="LayoutDesigner.design('insertrow_up',1)"></td>
								<td><input type="button" name="Submit2422" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.down") %>" onClick="LayoutDesigner.design('insertrow_down',1)"></td>
							</tr>
							<tr>
								<td><input type="button" name="Submit2423" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.left") %>" onClick="LayoutDesigner.design('insertcol_left',1)"></td>
								<td><input type="button" name="Submit24223" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.insert.right") %>" onClick="LayoutDesigner.design('insertcol_right',1)"></td>
							</tr>
						</table>
					</td>
					<td  width="100px">
						<table style="border:1px solid #ccc;">
							<tr>
								<td><input type="button" name="Submit2424" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.split.row") %>" onClick="LayoutDesigner.design('rowsplit',1)"></td>							
							</tr>
							<tr>
								<td><input type="button" name="Submit24242" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.split.col") %>" onClick="LayoutDesigner.design('colsplit',2)"></td>
							</tr>
						</table>
					</td>
					<td  width="200px">
						<table style="border:1px solid #ccc;">
							<tr>
								<td><input type="button" name="Submit2" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.up") %>" onClick="LayoutDesigner.design('merge','up')"></td>
								<td><input type="button" name="Submit22" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.down") %>" onClick="LayoutDesigner.design('merge','down')"></td>
							</tr>
							<tr>
								<td><input type="button" name="Submit23" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.left") %>" onClick="LayoutDesigner.design('merge','left')"></td>
								<td><input type="button" name="Submit24" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.merge.right") %>" onClick="LayoutDesigner.design('merge','right')"></td>
							</tr>
						</table>
					</td>
					<td width="100px">
						<table style="border:1px solid #ccc;">
							<tr>
								<td><input type="button" name="Submit24222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.delete.row") %>" onClick="LayoutDesigner.design('deleterow')"></td>
							</tr>
							<tr>
								<td><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.delete.col") %>" onClick="LayoutDesigner.design('deletecol')"></td>
							</tr>
						</table>
					</td>
					<td width="200px">
						<table style="border:1px solid #ccc;">
							<tr>
								<td><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.save.tmpl") %>" onClick="LayoutDesigner.getLayoutTemplate(true)"></td>
								<td><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.publish") %>" onClick="LayoutDesigner.publishLayoutTemplate(true)"></td>
							</tr>
							<tr>
								<td><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.design.tmpl") %>" onClick="LayoutDesigner.defineColumns()"></td>
								<td><input type="button" name="Submit242222" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.operation.design.resize") %>" onClick="LayoutDesigner.resetWidthNHeight()"></td>
							</tr>
						</table>
					</td>
					<td width="auto">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
				<div style="width:100%;height:30px;float:left;"  onclick="LayoutDesigner.ShowOrHideDesignPannel('layoutDesignerPannelOperationArea');">
					<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.closepannel") %>
					</div>
		</td>
	</tr>
	<tr>
		<td style="width:1200px;height:600px;"  valign="top">
			<table>
				<tr>
				   <td   valign="top">
				   		<table>
			   				<tr>
								<td id="layoutDesignerPannel"  style="width:800px;height:600px;" valign="top">
									<%if(orgLayoutTmpl!=null&&!"".equals(orgLayoutTmpl.trim())){ %>
									<jsp:include  page="<%=layoutTmpl %>" flush="true"></jsp:include>
									<%} %>
								</td>
							</tr>
				   		</table>
							
					</td>
					<td style="width:400px;height:600px; ">
							<table id="__columnSandBox" style="display:none;border:1px solid #ccc;width:400px;height:600px;overflow:scroll;">
								<tr>
									<td>
										<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.definecolumn") %>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tr>
												<td><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.columnname") %></td>
												<td><input type="text" id="columnNameKeyWord" value=""></td>
												<td><input type="button" name="Submit23" size="8" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.search") %>" onClick="searchCoumn();"><input type="button" name="Submit23" size="8" value="<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.reset") %>" onClick="resetCoumn();"></td>
											</tr>
												<tr>
												<td colspan="3"><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.definetip") %></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td id="__layoutSandBox_SystemColumn" class="ColumnSandBox"  style="width:400px;height:540px;overflow:scroll;" valign="top"><!-- __allAllowDefinedColumns -->
										<%
											for(int i=0,size=systemColumn.size();i<size;i++){
												columnBean = systemColumn.get(i);
											%>
											<table name="columnBox" id="<%=columnBean.getColumnId() %>"  >		  
											  <tr>
											    <td name="columnTitle" id="<%=columnBean.getColumnId() %>_title"  colspan="3" bgcolor="#cccccc" onmousedown="LayoutDesigner.mover.startMove('<%=columnBean.getColumnId() %>');"><%=columnBean.getColumnName() %></td>
											  </tr>
											    <tr>
											    <td><input  type="checkbox" id="<%=columnBean.getColumnId() %>_isShow" checked="checked" /><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.show") %></td>
											    <td><input  type="checkbox" id="<%=columnBean.getColumnId() %>_isOpen" checked="checked" /><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.open") %></td>
											     <td><input  type="checkbox" id="<%=columnBean.getColumnId() %>_isMove" checked="checked" /><%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.move") %></td>
											  </tr>
											</table>
											<script type="text/javascript">
											  LayoutDesigner.layout.addPortlet("__layoutSandBox_SystemColumn","<%=columnBean.getColumnId() %>","<%=columnBean.getColumnName() %>",1,1, 1);
											</script>
											
											<%} %>
										
										
										<div id="__control_definer" style="width:100%;height:30px;">
											<%=tools.tool.getLocal("jsp.portal.console.layout.designer.label.debuginfo") %>
										</div>
										<textarea id="layoutDesignerTemplateContent" name="layoutDesignerTemplateContent" rows="5" cols="8" style="display:none;"></textarea>
										<textarea id="layoutPublishTemplateContent" name="layoutPublishTemplateContent" rows="5" cols="8" style="display:none;"></textarea>
										<div id="saveValueArea" style="display:none;">
										
										</div>
										
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<script type="text/javascript">
//var LayoutDesigner = new LayoutDesigner("LayoutDesigner");

function searchCoumn(){
	var keyword = document.getElementById("columnNameKeyWord").value;
	
	
	var columnSandBox = document.getElementById("__layoutSandBox_SystemColumn");
	
	var columns = document.getElementsByName("columnTitle"),column;
	//alert("keyword="+keyword+",columns.length="+columns.length);
	var result=false;
	var title ="";
	var tempColumn;
	 for(var i = 0; i <columns.length; i++){
		 column = columns[i];
		 //alert("column.parentNode.parentNode.parentNode.id="+column.parentNode.parentNode.parentNode.id);
		tempColumn = getSandboxColumn(column)
		if(tempColumn){
			title =""+column.innerHTML;
			if(title.indexOf(keyword)!=-1){
				tempColumn.style.display="block";
			}else{
				tempColumn.style.display="none";
			}
		}
	}
}

function getSandboxColumn(column){
	var mit= 6,i=0;
	var curParent = column.parentNode;
	var columnNode;
	while(i<mit&&curParent){
		if(curParent.id&&curParent.id=="__layoutSandBox_SystemColumn"){
			return columnNode;
		}else{
			if(column.id.indexOf(curParent.id)!=-1){
				columnNode= curParent;
			}
			curParent = curParent.parentNode;	
			i++;
		}
	}
	return null;
}

function resetCoumn(){
	document.getElementById("columnNameKeyWord").value="";
	var columnSandBox = document.getElementById("__layoutSandBox_SystemColumn");
	var columns =  document.getElementsByName("columnTitle"),column;
	 for(var i = 0; i <columns.length; i++){
		 column = columns[i];
		 tempColumn = getSandboxColumn(column)
			if(tempColumn){
				tempColumn.style.display="block";
			}
	}
}
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
