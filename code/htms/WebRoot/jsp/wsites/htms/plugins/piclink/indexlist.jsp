<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>

<html:set name="picLinkName" randomLen="16" value=""/>
<html:style>
	<!--
	.otherFunPicLinkBox{width:100%;height:255px;margin:0 auto;align:center;text-align:center;font:12px/1.5 Arial,Simsun,\588b\4f53;}
	.otherFunPicLinkGroupBox{float:top;width:259;height:auto;margin:10px 10px 10px 10px;padding-left:5px;text-align:center;vertical-align:middle;font:12px/1.5 Arial,Simsun,\588b\4f53;}
	.otherFunPicLinkGroupName{width:100px;height:18px;text-align:left;vertical-align:middle;color: #666666;font-weight: bold;display: block; margin-bottom: 5px;}
	.otherFunLinkCell{float:left;border:0;text-align:left;vertical-align:middle;}
	.otherFunLinkCell a{text-decoration: none;align:left;vertical-align:middle;font:12px/1.5 Arial,Simsun,\588b\4f53;color: #666666;}
	-->
</html:style>


<info:piclink operation="listWebSitePicLinkIndex" type="index" columnId="columnId" linkCacheName="__picLinkList" linkGroupCacheName="__picLinkGroupList" linkTypeCacheName="__picLinkTypeList"/>



<html:div styleClass="otherFunPicLinkBox">
	<!-- 分组区域：显示各分组 -->
	<logic:for beanCollectionsName="__picLinkGroupList" currBeanName="linkGroupBean">		
		<html:table name="$[linkGroupBean.linkTypeId]" styleClass="otherFunPicLinkGroupBox">
			<html:tr>
			<html:td  styleClass="otherFunPicLinkGroupName">
				<html:value value="linkGroupBean.linkGroupName"/>
			</html:td>
			</html:tr>
			<logic:for beanCollectionsName="__picLinkList" currBeanName="linkBean">	
				<logic:if equal="linkBean.linkGroupId,linkGroupBean.linkGroupId">
					<html:tr>
					<!-- 分组中的各个链接元素 -->
						<html:td styleClass="otherFunLinkCell">
							<html:a href="linkBean.linkIconAddr" target="_blank" >
								<html:value value="linkBean.linkTitle"/>
							</html:a>
						</html:td>
					</html:tr>
				</logic:if>
			</logic:for>
			<html:tr>
			<html:td style="height:auto;border-bottom:1px solid #e0e0e0;height:5px;">
			</html:td>
			</html:tr>
		</html:table>
		
	</logic:for>
	
</html:div>
