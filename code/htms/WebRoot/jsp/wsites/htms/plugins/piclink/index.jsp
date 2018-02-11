<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>

<html:set name="picLinkName" randomLen="16" value=""/>
<html:style>
	<!--
	.comFunPicLinkBox{width:100%;height:auto;margin:10px auto;align:center;text-align:center;}
	.linkCell{float:left;border:0;text-align:center;vertical-align:middle;width:85px;height:117px;}
	.cellTable{width:auto;height:auto;font: 12px/1.5 Arial,Simsun,\588b\4f53;align:center;valign:middle;margin:0;border:0;padding:0;cellSpacing:0; cellPadding:0;}
	.cellTable tr td{text-align: center;;valign-align:middle;color:#666666;;}
	 .cellTable tr td a{text-decoration: none;color:#666666;font-size: 12px;margin-bottom: 10px;}
	-->
</html:style>


<info:piclink operation="listWebSitePicLinkIndex" type="index" columnId="columnId" linkCacheName="__picLinkList" linkGroupCacheName="__picLinkGroupList" linkTypeCacheName="__picLinkTypeList"/>


<html:div styleClass="comFunPicLinkBox">
	<!-- 分组中的各个链接元素 -->
	<logic:for beanCollectionsName="__picLinkList" currBeanName="linkBean">				
			<html:div id="$[linkBean.linkId]" styleClass="linkCell" >
				<html:table styleClass="cellTable">
					<html:tr align="center" valign="middle">
						<html:td align="center" valign="middle">
							<html:a href="linkBean.linkIconAddr" target="_blank" >
								<html:img  border="0"  
								src="$[basePath]$[linkBean.linkIconPath]" 
								width="$[linkBean.linkIconWidth]" 
								height="$[linkBean.linkIconHeight]" append="alt='$[linkBean.linkName]'" />
							</html:a>
						</html:td>
					</html:tr>
					<html:tr align="center" valign="middle">
						<html:td align="center" valign="middle">
							<html:a href="linkBean.linkIconAddr" target="_blank" >
								<html:value value="linkBean.linkTitle"/>
							</html:a>
						</html:td>
					</html:tr>
				</html:table>
			</html:div>	
	</logic:for>
</html:div>