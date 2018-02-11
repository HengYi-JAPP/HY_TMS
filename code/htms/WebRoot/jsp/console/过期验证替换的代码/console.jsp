<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
  <%@ include file="../../common/impart/meta.jsp"%>
<com:loader  css="css/framework-new.css" js="js/console/index/index.js"/>	
  <html:page title="恒逸物流管理" isBase="true">
  		<!-- 页面窗口/框架 -->
  		<html:div id="container">
			<!-- 页头部分 -->
			<html:div id="header">
				<jsp:include flush="true" page="../../common/framework/header.jsp">
					<jsp:param value="" name="account"/>
				</jsp:include>
			</html:div>
			<!--  div class="clearfloat">预留间隙</div>
			<div id="horizonMenu">水平菜单部分</div>-->
			<!-- div class="clearfloat">预留间隙</div> -->
			<!-- 主体部分 -->
			<html:div id="body" style="height:542px;">
				<jsp:include flush="true" page="../../common/framework/body.jsp"></jsp:include>
			</html:div>
			<!-- div class="clearfloat">预留间隙</div> -->
			<!-- 页尾部分 -->
			<html:div id="footer">
				<jsp:include flush="true" page="../../common/framework/footer.jsp"></jsp:include>
			</html:div>
		</html:div>
</html:page>
