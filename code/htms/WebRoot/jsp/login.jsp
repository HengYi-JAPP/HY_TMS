<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/impart/taglib.jsp"%>
<%@ include file="common/impart/meta.jsp"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%
RequestHelper requestHelper = new RequestHelper(request);
 basePath = requestHelper.getBasePath();
 
 
 String errorMsg=(String) request.getAttribute("LOGIN_ERROR_MESSAGE");
 errorMsg=errorMsg==null?"":errorMsg;
%>
<html>
<com:loader binder="true"  ajax="true" />
<base href="<%=basePath%>">
    <com:loader css="jsp/login/css/base.css"/>
	<com:loader css="jsp/login/css/common.css"/>
	<com:loader js="jsp/login/js/jquery.js"/>
	<com:loader js="jsp/login/js/Slider_jquery.js"/>
<style>
	#loginbtn{ width:316px; background:url(<%=basePath%>jsp/login/images/btn.png)  0 0 no-repeat;height:44px;line-height: 31px;text-align: center; border:none; outline:none; font-size:16px; height:44px;  color:#fff; letter-spacing:5px; cursor:pointer; border-radius:5px;position: absolute;font-weight: bold;}
	#loginbtn:hover{ background:url(<%=basePath%>jsp/login/images/btn.png) 0 0 no-repeat;}
	.header-logo-box-name-myportal{border-left: 1px solid #0c75ad;font-size: 24px;
    height: 24px;
    width:170px;
    line-height: 24px;
    text-align:left;
    padding-left:15px;
    font-size: 24px;
    font-family: Arial,Simsun;
    vertical-align:middle;
    color: #01619e; }
</style>
  
<body>
<html:div styleClass="wrap">
<html:form id="loginForm" name="loginForm" action="contoller.do" method="post">
<html:hidden id="operation" name="operation" value="LoginAction_of_myportal" />
	<html:div styleClass="topcon">
		<html:div styleClass="top topbg">
			<html:div styleClass="topbar">
				<a href="javascript:void(0);">旧版本</a><span class="fr">|</span><a href="javascript:void(0);">使用手册</a><span class="fr">|</span><a href="javascript:void(0);">帮助</a>
			</html:div>
			<html:div styleClass="tlogo" style="display:inline;text-align:center;vertical-align:middle;">
			<html:div style="float:left;text-align:center;vertical-align:middle">
				<a href="javascript:void(0);" class="logo"><b></b><p class="text">恒逸物流</p></a>
			</html:div>
			
				
			</html:div>
		</html:div>
		
	</html:div>
	
	<!-- 背景图片 -->
	<html:div styleClass="main">
		<html:div styleClass="con_banner">
			<html:div id="tips_banner" styleClass="viewport">
				<ul class="sliders cb">
					<li> <a href="#"><html:img src="jsp/login/images/l_bg.png" /></a></li>
					<li> <a href="#"><html:img src="jsp/login/images/l_bg.png" /></a></li>
					<li> <a href="#"><html:img src="jsp/login/images/l_bg.png" /></a></li>
					<li> <a href="#"><html:img src="jsp/login/images/l_bg.png" /></a></li>
				</ul>
				<html:div styleClass="point"></html:div>
			</html:div>
		</html:div>
	<!-- 背景图片 -->	
		
	<!-- 登录框 -->	
		<html:div styleClass="l_box">
			<html:div styleClass="inputbox">
				<h2>用户登录</h2>
				<html:div styleClass="logInfo mb20">
					<html:div styleClass="inputCon" ><html:span styleClass="l_icon1"></html:span> </html:div>
					<html:text name="account" id="account" styleClass="log_input"   value="admin"/>
				</html:div>
				
				<html:div styleClass="logInfo mb20">
					<html:div styleClass="inputCon" ><html:span styleClass="l_icon2"></html:span> </html:div>
					<html:password name="pwd" id="pwd" styleClass="log_input" value="111" onkeydown="keydown('13','submit','loginForm');"/>
				</html:div>
				 
				<html:div styleClass="logInfo mb20">
					<html:div styleClass="inputCon" ><html:span styleClass="l_icon2"></html:span> </html:div>
					<html:text name="vcode" id="vcode" styleClass="log_validate" value=""/>
					<com:vcode codeName="sys_vcode" scope="session" servlet="vcode" reflush="true" vcstyle="number" bgcolor="white" borderColor="random" disturbColor="random"  disturbStyle="" disturbCount="3" width="80" height="30" fontSize="24" isBorder="false" fontColor="black" fontStyle="bold" isTip="false" tip="{$jsp.login.vcode.tip#}" tipStyle="font-size:20;curcor:hand"/>
				</html:div>
				
				<html:div styleClass="logInfo ">
					<html:div styleClass="inputCon">
						 <%
                            if(errorMsg!=""){
                            %>
                            <font color="red"><%=errorMsg %></font>
                            <%
                            }
					     %>
					</html:div>
				</html:div>
				
				<html:div styleClass="logInfo ">
					<html:div styleClass="inputCon" >
						<input type="button" id="loginbtn" value="登录" onclick="doSubmit()"/>
					</html:div>
				</html:div>
				
				<html:span styleClass="linkleft"></html:span> <html:span styleClass="linkright"></html:span>
			</html:div>
			
			<html:div styleClass="remindbox ">
				<h3>提示</h3>
				<p>请用单点登录帐号登录系统，如果没有帐号或帐号登录不了，请和系统管理员联系。</p>
			</html:div>
		</html:div>
	<!-- 登录框 -->		
	</html:div>
	
	<html:div styleClass="clear"></html:div>
	<html:div styleClass="footer">
		<html:div styleClass="copyright_box">
			<html:div styleClass="c_con">
				<ul class="clist">
					<li style="display: inline;"><a href="javascript:void(0);"><b class="cicon icon1"></b><p class="mt25">SAP</p></a></li>
					<li style="display: inline;"><a href="javascript:void(0);"><b class="cicon icon2"></b><p class="mt25">单点登录</p></a></li>
					<li style="display: inline;"><a href="javascript:void(0);"><b class="cicon icon3"></b><p class="mt25">联系我们</p></a></li>
				</ul>
				<p>ICP备案： 浙公网安备 33010902001106号    版权所有:恒逸集团 ©2010-2017 Zhejiang Hengyi Group Co., Ltd. All Rights Reserved </p>
			</html:div>
		</html:div>
	</html:div>
</html:form>	
</html:div>	

<script>
   // 加载滑动切换幻灯片
	var flexSlider=new Slider('tips_banner');
	function doSubmit(){
		document.getElementById("loginForm").submit();
	}
	
</script>
</body>
</html>
