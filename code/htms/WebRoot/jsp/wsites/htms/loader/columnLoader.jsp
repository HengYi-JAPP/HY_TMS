<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="tools.tool"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="com.mobilecn.portal.layout.LayoutBean"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeRepository"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeBean"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>

<%
RequestHelper helper = new RequestHelper(request);
ColumnBean columnBean = (ColumnBean)helper.getValueFromAllScopes("columnBean");
String currentSysCode=  request.getParameter("currentSysCode");
InfoTypeBean typeBean = null;
String startMove = "",columnId="",columnName = "",columnCode="",typeId="",sysId="",listLink="#",columnLogo="&nbsp;",contentLoader="",openContent="";	
String _title_box,_title_logo,_title_name,_title_blank,_title_config,
_content_box;

String indexShowNum="",indexShowLen="";//,listShowNum="";

//System.out.println("\n\n\n\n\n columnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBeancolumnBean:"+columnBean);
if(columnBean!=null){

	columnLogo=columnBean.getLogo();
	columnLogo = columnLogo==null||"".equals(columnLogo.trim())?"":columnLogo;
	columnId =columnBean.getColumnId();
	_title_box=columnId+"_title_box";
	_title_logo=columnId+"_title_logo";
	_title_name=columnId+"_title_name";
	_title_blank=columnId+"_title_blank";
	_title_config=columnId+"_title_config";
	
	_content_box=columnId+"_content_box";
	typeId=columnBean.getInfoTypeId();
	sysId = columnBean.getSysId();
	columnName = columnBean.getColumnName();
	columnCode= columnBean.getColumnCode();	
	columnCode=columnCode==null?"":columnCode.trim();
	columnBean.setColumnCode(columnCode);
	helper.setRequestAttribute("columnBean",columnBean);
	columnCode = columnCode==null||"".equals(columnCode.trim())?"default":columnCode;
	if(columnBean.getDefaultMove()==1){
	startMove = "personalizer.startMove('"+columnId+"');";
	}
	typeBean = InfoTypeRepository.getInfoTypeBean(typeId);
	indexShowNum=columnBean.getIndexShowNum();
	indexShowLen=columnBean.getIndexShowLen();
	listLink=columnBean.getMoreLink();
	openContent=columnBean.getDefaultOpen()==1?"display:block;":"display:none;";	
	/*首页默认条数*/
	String indexDefaultNum="6",listDefaultNum="12";
	indexShowNum = indexShowNum==null||"".equals(indexShowNum.trim())?indexDefaultNum:indexShowNum;
	indexShowLen = indexShowLen==null||"".equals(indexShowLen.trim())?"":indexShowLen;
	//listShowNum=columnBean.getListShowNum();
	//listShowNum = listShowNum==null||"".equals(listShowNum.trim())?listDefaultNum:listShowNum;
	contentLoader=columnBean.getContentLink();
	//request.setAttribute("",indexShowNum);
	//request.setAttribute("",listShowNum);
	
	request.setAttribute("sysId",sysId);
	request.setAttribute("currentSysCode",currentSysCode);
	request.setAttribute("columnId",columnId);
	request.setAttribute("columnCode",columnCode);
	request.setAttribute("typeBean",typeBean);
	request.setAttribute("_content_box",_content_box);
	if(typeBean!=null){
		listLink=listLink==null||"".equals(listLink.trim())?typeBean.getListLink():listLink.trim();
		
		//System.out.println("\n\n\n\n listLink="+listLink+"\n\n\n\n ");
		if(listLink!=null&&!"".equals(listLink.trim())){
			//System.out.println("listLink="+listLink);
			listLink = tools.tool.fillParams(listLink,request);
			listLink=listLink.indexOf("?")==-1?listLink+"?":listLink+"&";
			listLink=listLink+"sysId="+sysId;
			listLink=listLink+"&currentSysCode="+currentSysCode;			
			listLink=listLink+"&columnId="+columnId;
			listLink=listLink+"&typeId="+typeBean.getInfoTypeId();
			//System.out.println("listLink="+listLink);
			listLink = tools.tool.base64Encode(listLink);
			//System.out.println("listLink="+listLink);
			listLink = tools.tool.urlEncode(listLink);
			//listLink=listLink+"&columnName"+columnName;
			//System.out.println("listLink="+listLink);
		}
		//System.out.println("\n\n\n\n\n contentLoader:"+contentLoader);
		if(contentLoader==null||"".equals(contentLoader.trim())){
			contentLoader=typeBean.getIndexContentLink();
		}
		if(columnBean.getUserDefine()==1){
			contentLoader=typeBean.getIndexContentLink();
		}
		//System.out.println("\n\n\n\n\n columnMoreListLink:"+listLink);
		System.out.println("\n\n\n\n\n contentLoader:"+contentLoader+",columnName="+columnName+",typeBean.getIndexContentLink()="+typeBean.getIndexContentLink());
		request.setAttribute("columnMoreListLink",listLink);
	%>

<portal:themes columnId="columnId" columnCode="columnCode" skinType="columnSkin"/>	
		<logic:if condition="$[columnBean.justContent]==1">
			<jsp:include page="<%=contentLoader %>">
				<jsp:param value="<%=columnId %>" name="columnId"/>
				<jsp:param value="<%=columnName %>" name="columnName"/>
				<jsp:param value="<%=typeId %>" name="typeId"/>
				<jsp:param value="<%=sysId %>" name="sysId"/>
				<jsp:param value="<%=indexShowNum %>" name="perPageCount"/>
				<jsp:param value="<%=indexShowLen %>" name="indexShowLen"/>
				<jsp:param value="0" name="curpage"/>
				<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
				
			</jsp:include>
		</logic:if>
		<logic:if condition="$[columnBean.justContent]!=1">
		<html:table id="<%=columnId %>" width="100%" styleClass="$[columnBean.columnCode]_column-loader-box">
			<html:tr>
				<html:td styleClass="$[columnBean.columnCode]_column-loader-box-title">
					<html:table id="<%=_title_box %>" styleClass="$[columnBean.columnCode]_column-loader-box-title-box" >
							<html:tr>
								<html:td id="<%=_title_logo %>" onmousedown="<%=startMove %>"  styleClass="$[columnBean.columnCode]_column-loader-box-title-logo">
								<%if(columnLogo==null||"".equals(columnLogo.trim())||"null".equalsIgnoreCase(columnLogo.trim())){ %>
								<%//=columnLogo %>
								<%}else{ %>
									<html:img src="<%=columnLogo %>"></html:img>
								<%} %>
								</html:td>
								<html:td id="<%=_title_name %>" onmousedown="<%=startMove %>"   styleClass="$[columnBean.columnCode]_column-loader-box-title-name">
									<%=columnName%>
								</html:td>
								<html:td id="<%=_title_blank %>" onmousedown="<%=startMove %>"  styleClass="$[columnBean.columnCode]_column-loader-box-title-blank">&nbsp;</html:td>				
								<html:td id="<%=_title_config %>" width="auto"  styleClass="$[columnBean.columnCode]_column-loader-box-title-config">
									<%// if(listLink!=null&&!"".equals(listLink.trim())){%>
									<html:div style="display:inline;float:right;verticat-align:middle;">
									<!-- 个性化 | --> 
									<logic:if condition="$[columnBean.isMore]==1">
										<html:a styleClass="$[columnBean.columnCode]_columnMoreInfo" href="$[basePath]jsp/wsites/$[currentSysCode]/loader/newPageLoader.jsp?newPageContentUrl=$[columnMoreListLink]&currentSysCode=$[currentSysCode]" target="_blank" style="text-decoration:none;color:#cccc;font-size:12px;">&nbsp;&nbsp;&nbsp;&nbsp;<%//=tools.tool.getLocal("jsp.portal.website.loader.column.more") %></html:a>
									</logic:if>
									
									<html:a id="$[columnBean.columnId]_closeColumnWin" styleClass="$[columnBean.columnCode]_closeColumn"  href="javascript:void(0);" onclick="personalizer.closeColumnWin('$[columnBean.columnId]');" >&nbsp;&nbsp;&nbsp;&nbsp;</html:a>
									
									<logic:if condition="$[columnBean.defaultOpen]==1">
										<html:a id="$[columnBean.columnId]_folderColumnWin" styleClass="$[columnBean.columnCode]_folderColumn" href="javascript:void(0);" onclick="personalizer.folderColumnWin('$[columnBean.columnId]','$[columnBean.columnCode]');">&nbsp;&nbsp;&nbsp;&nbsp;</html:a>
										<html:a id="$[columnBean.columnId]_unfolderColumnWin"  styleClass="$[columnBean.columnCode]_unfolderColumnHidden"  href="javascript:void(0);" onclick="personalizer.unfolderColumnWin('$[columnBean.columnId]','$[columnBean.columnCode]');">&nbsp;&nbsp;&nbsp;&nbsp;</html:a>
									</logic:if>
									<logic:if condition="$[columnBean.defaultOpen]==0">
										<html:a id="$[columnBean.columnId]_folderColumnWin" styleClass="$[columnBean.columnCode]_folderColumnHidden" href="javascript:void(0);" onclick="personalizer.folderColumnWin('$[columnBean.columnId]','$[columnBean.columnCode]');">&nbsp;&nbsp;&nbsp;&nbsp;</html:a>
										<html:a id="$[columnBean.columnId]_unfolderColumnWin"   styleClass="$[columnBean.columnCode]_unfolderColumn"  href="javascript:void(0);" onclick="personalizer.unfolderColumnWin('$[columnBean.columnId]','$[columnBean.columnCode]');">&nbsp;&nbsp;&nbsp;&nbsp;</html:a>
									</logic:if>
									</html:div>
									<!-- html:a标签在此处好像解析有问题，因而使用纯html的a标签 -->	
									<%//} %>
								</html:td>
							</html:tr>
					</html:table>
					</html:td>
			</html:tr>
			<html:tr>
				<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content">
					<html:table id="<%=_content_box %>" styleClass="$[columnBean.columnCode]_column-loader-box-content-box" style="<%=openContent %>">
						<html:tr>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-top-left"></html:td>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-top-middle"></html:td>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-top-right"></html:td>
						</html:tr>
						<html:tr>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-middle-left"></html:td>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-middle-middle">
								<jsp:include page="<%=contentLoader %>">
									<jsp:param value="<%=columnId %>" name="columnId"/>
									<jsp:param value="<%=columnName %>" name="columnName"/>
									<jsp:param value="<%=typeId %>" name="typeId"/>
									<jsp:param value="<%=sysId %>" name="sysId"/>
									<jsp:param value="<%=indexShowNum %>" name="perPageCount"/>
									<jsp:param value="<%=indexShowLen %>" name="indexShowLen"/>
									<jsp:param value="0" name="curpage"/>
									<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
									
								</jsp:include>
							</html:td>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-middle-right"></html:td>
						</html:tr>
						<html:tr>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-bottom-left"></html:td>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-bottom-middle"></html:td>
							<html:td styleClass="$[columnBean.columnCode]_column-loader-box-content-bottom-right"></html:td>
						</html:tr>
					</html:table>
				</html:td>
			</html:tr>
		</html:table>
		</logic:if>
<%	
	
	}//typeBean!=null
}//if(columnBean!=null)
%> 
