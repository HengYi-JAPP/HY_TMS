<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.plugins.news.NewsUtils"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
String currentSysCode=request.getParameter("currentSysCode");
String forward=request.getRequestURI();

forward=forward==null?"":forward.replace(path,"");


			
	
%>
 <style type="text/css">

.header-box-right-box{float:left;text-align:left;color:white;font: 12px/1.5 Arial,Simsun,\588b\4f53;}
.header-box-right-box-search{}
.header-box-right-box-keyword{}
.searchInput{height: 28px;line-height: 28px;border: 2px solid #0296f0;width: 270px;border-radius: 15px;outline: none;padding: 0 15px;background: #fff;}
.searchButton{background: url(<%=basePath %>jsp/wsites/<%=currentSysCode%>/images/icon.png) -2px -32px no-repeat;width: 16px;height: 16px;display: inline-block;    position: relative;right: 25px;top: 3px;margin-top: -2px;cursor: pointer;}
.searchKeyword{color:white;font: 12px/1.5 Arial,Simsun,\588b\4f53;}
.keyword{color:red;border-bottom:1px dotted green;}
</style>
<body style="background:#FAFCEE;">
<script type="text/javascript">

function doKeywordSearch(keyword){
	if(!document.getElementById(keyword)||!document.getElementById(keyword).value){
		alert("Please Enter Keyword to Search!");
		return;
	}
	
	document.getElementById("newsListForm").submit();
}
</script>
	
<com:loader css="css/common/table-list.css" />
<jsp:include page="../../../../common/impart/table-banner.jsp">
	<jsp:param value='<%tools.tool.getLocal("website.jsp.specify.news.search.title") %>' name="title"/>		
</jsp:include>
		<html:form id="newsListForm" name="newsListForm" method="post" action="contoller.do">
		<html:hidden name="operation" id="operation" value="searchWebSiteNewsList"/>
		<html:hidden name="currentSysCode" id="currentSysCode" value="currentSysCode"/>
		<html:table id="searchConditionBox" style="background: rgb(78, 174, 255);width:100%;height:28px;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td style="text-align:right;vertical-align:middle;width:35%;height:28px;color:#fff;"><html:value value="{$website.jsp.specify.header.keyword#}"/></html:td>
				<html:td style="text-align:left;vertical-align:middle;width:65%;height:28px;">
					<html:table  styleClass="header-box-right-box">
						<html:tr>
							<html:td styleClass="header-box-right-box-search">
								<html:text id="keyword" name="keyword" styleClass="searchInput" value="$[keyword]"/>
								<html:a id="searchButton" href="javascript:void(0);" style="text-decoration:none;" onclick="doKeywordSearch('keyword');" target="_blank"><html:div styleClass="searchButton" /></html:a>
								
						</html:td>
						</html:tr>
					</html:table>				
				</html:td>
			</html:tr>
		</html:table>
		<html:div style="float:left;width:90%;height:auto;vertical-align:top;padding: 20px 50px 20px 50px;">
		<logic:for indexName="currentNewsIndex" beanCollectionsName="newsList" currBeanName="newsBean" >
		<html:div style="float:left;width:100%;height:auto;padding: 20px 0;padding-left: 5px;border-bottom: 1px dashed #b5b5b5;vertical-align:top;">
		<html:table styleClass="$[columnCode]news-index-box"  isHead="false" style="vertical-align:top;">
			<html:tr styleClass="">	
				<html:td styleClass=""  style="height:40px;vertical-align:middle;">
				<html:a styleClass="" style="color: #0072cf;font-size: 16px;font-weight: bold;    text-decoration: none;;" href='<%=NewsUtils.getViewPath(request) %>' target="_blank">
					<h2><html:value value="newsBean.title" keyword="$[keyword]" keyClass="keyword" /></h2>
				</html:a>	
				</html:td>	
			</html:tr>	
			<html:tr styleClass="">	
				<html:td styleClass="" style="width:100%px;height:33px;color: #666666;font-family: Candara;margin-top: 10px;;vertical-align:top;text-align:left;">
				 <%=NewsUtils.getDate(request) %>
				</html:td>	
			</html:tr>	
			<html:tr styleClass="$[columnCode]news-index-box-line">	
				<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="font-size: 14px;font-family: 'Microsoft YaHei';color: #333333;margin-top: 5px;vertical-align:top;">
					<p><html:value value="newsBean.introduction" length="320"  keyword="$[keyword]" keyClass="keyword" /></p>
				</html:td>	
			</html:tr>	
		</html:table>
		</html:div>
		
		</logic:for>
		<html:div style="float:left;width:355px;height:auto;padding: 20px 0;padding-left: 5px;vertical-align:top;text-align:right;font-size: 12px;font-family: 'Microsoft YaHei';color: #0072cf;float: right;padding-bottom: 10px;">



<com:page formId="newsListForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>

</html:div>

</html:div>

		</html:form>

<com:loader  js="js/common/common.js"/>	

</body>
