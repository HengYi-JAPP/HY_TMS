<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
 String path = request.getContextPath();
 String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 String currentDate = tools.tool.DateUtil.getFormatDate(null);
 %>
 
<html>
<head>
<base href="<%=basePath%>">
<style type="text/css"></style>
<portal:themes columnId="columnId" columnCode="columnCode" skinType="viewColumnSkin"/>
<style type="text/css">
.keyword{color:red;border-bottom:1px dotted green;}
</style>
</head>
<body style="background:#FAFCEE;">
<com:loader  js="js/common/common.js"/>			
<com:loader css="css/common/table-list.css"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("mydbc.system.portal.website.plugin.news.viewtitle") %>' name="title"/>		
			</jsp:include>
			
			<html:table  styleClass="news-view-box" align="center" cellPadding="0" cellSpacing="0" >		
				<html:tr>
					<html:td styleClass="news-view-box-top-left"></html:td>
					<html:td styleClass="news-view-box-top-center"></html:td>
					<html:td styleClass="news-view-box-top-right"></html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="news-view-box-middle-left"></html:td>
					<html:td styleClass="news-view-box-middle-center">
							<html:table  styleClass="news-view-content-box" align="center" cellPadding="0" cellSpacing="0" >		
								<html:tr>
									<html:td styleClass="news-view-content-box-title-left" style="width:50px;"></html:td>
									<html:td styleClass="news-view-content-box-title-center" style="padding:20px 0px 20px 0px;font-weight: bold;color: #333333;">
										<logic:if isNull="keyword">
											<h1><html:value  value="newsViewBean.title"/></h1>
										</logic:if>
										<logic:if notNull="keyword">
											<h1><html:value  value="newsViewBean.title" keyword="$[keyword]" keyClass="keyword" /></h1>
										</logic:if>
									</html:td>
									<html:td styleClass="news-view-content-box-title-right" style="width:50px;"></html:td>
								</html:tr>
								<html:tr>
									<html:td styleClass="news-view-content-box-property-left"></html:td>
									<html:td styleClass="news-view-content-box-property-center">
									<html:table style="width:100%;text-align:right;">
										<html:tr>					
											<html:td style="width:auto;"></html:td>						
											<html:td style="width:180px;text-align:right;">[<html:value  value="newsViewBean.createTime"/>][<html:value  value="$[newsViewBean.draftor]"/>]</html:td>
										</html:tr>
									</html:table>
									</html:td>
									<html:td styleClass="news-view-content-box-property-right"></html:td>
								</html:tr>
								<html:tr>
									<html:td styleClass="news-view-content-box-subtile-left"></html:td>
									<html:td styleClass="news-view-content-box-subtile-center"  style="height:80px;padding:20px 50px 20px 50px;font-size: 12px;border: 1px dashed #b5b5b5;background:#FAF9DE;">
										<logic:if isNull="keyword">
											<P><html:value value="newsViewBean.introduction"/></P>	
										</logic:if>
										<logic:if notNull="keyword">
											<P><html:value value="newsViewBean.introduction" keyword="$[keyword]" keyClass="keyword" /></P>	
										</logic:if>
										<p><b>keyword:</b>
										<logic:if isNull="keyword">
											<h1><html:value  value="newsViewBean.keyword"/></h1>
										</logic:if>
										<logic:if notNull="keyword">
											<h1><html:value  value="newsViewBean.keyword" keyword="$[keyword]" keyClass="keyword" /></h1>
										</logic:if></p>
									</html:td>
									<html:td styleClass="news-view-content-box-subtile-right"></html:td>
								</html:tr>
								
								<html:tr>
									<html:td styleClass="news-view-content-box-detail-left"></html:td>
									<html:td styleClass="news-view-content-box-detail-center" style="padding:50px 0px 20px 0px;">
									<logic:if isNull="keyword">
											<h1><html:value  value="newsViewBean.contents"/></h1>
										</logic:if>
										<logic:if notNull="keyword">
											<h1><html:value  value="newsViewBean.contents" keyword="$[keyword]" keyClass="keyword" /></h1>
										</logic:if>
									</html:td>
									<html:td styleClass="news-view-content-box-detail-right"></html:td>
								</html:tr>
								<html:tr>
									<html:td styleClass="news-view-content-box-others-left"></html:td>
									<html:td styleClass="news-view-content-box-others-center"></html:td>
									<html:td styleClass="news-view-content-box-others-right"></html:td>
								</html:tr>
							</html:table>
					</html:td>
					<html:td styleClass="news-view-box-middle-right"></html:td>
				</html:tr>
			</html:table>
			<html:table width="100%" style="float:bottom;" align="center" cellPadding="0" cellSpacing="0" >		
			<html:tr>
					<html:td styleClass="news-view-box-bottom-left"></html:td>
					<html:td styleClass="news-view-box-bottom-center" style="height:80px;vertical-align:middle;text-align:center;">			
						<btn:close  href="javascript:winClose();"/>	
					</html:td>
					<html:td styleClass="news-view-box-bottom-right"></html:td>
				</html:tr>
			</html:table>

	</body>
</html>
<script type="text/javascript">reSizePageFrameworkHeight();</script>