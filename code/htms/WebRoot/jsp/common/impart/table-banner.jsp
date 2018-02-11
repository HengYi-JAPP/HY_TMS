<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<%
	String title = request.getParameter("title");
	title=title==null||"".equals(title.trim())?tools.tool.getLocal("jsp.common.status.notitle"):title;
	String conditionBoxId = request.getParameter("conditionBoxId");
	conditionBoxId=conditionBoxId==null||"".equals(conditionBoxId.trim())?tools.tool.getLocal("jsp.common.status.notitle"):conditionBoxId;
	String hideSearchBanner = request.getParameter("hideSearchBanner");
	hideSearchBanner=hideSearchBanner==null||"".equals(hideSearchBanner.trim())?"true":hideSearchBanner;
 %>

<html:table width="100%" cellPadding="0" cellSpacing="0">
	<html:tr>
		<html:td styleClass="table_top_left" align="left">
			&nbsp;
		</html:td>
		<html:td styleClass="table_top_left_backgound">
			<%=title%>
		</html:td>
		<html:td styleClass="table_top_left_backgound_blank">　
			&nbsp;
		</html:td>
		<html:td styleClass="table_top_right">　
		&nbsp;
		</html:td>
	</html:tr>
</html:table>
 <%if("false".equalsIgnoreCase(hideSearchBanner.trim())){%>
 <script type="text/javascript">
<!--
__conditionBoxId="<%=conditionBoxId%>";
//-->
</script>
<html:table id="userFilter_ResearchTitle" style="width: 100%; padding: 0px" cellPadding="0" cellSpacing="0" align="center">
	<html:tr>
		<html:td styleClass="searchbanner_left">
			<html:label label="{$jsp.common.operation.search#}"></html:label>
		</html:td>
		<html:td styleClass="searchbanner_right">
			<btn:searchbanner onclick="searchBannerSwitch(this)"/>						
		</html:td>
	</html:tr>
</html:table>
<%}%>
