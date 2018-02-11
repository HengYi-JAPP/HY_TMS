<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/impart/taglib.jsp"%>

<html>
    <link rel="stylesheet" type="text/css" href="css/base.css"/>
	<link rel="stylesheet" type="text/css" href="css/common.css"/>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/Slider_jquery.js"></script>
<style>
	#loginbtn{ width:316px; background:url(images/btn.png)  0 0 no-repeat;height:44px;line-height: 31px;text-align: center; border:none; outline:none; font-size:16px; height:44px;  color:#fff; letter-spacing:5px; cursor:pointer; border-radius:5px;position: absolute;left: 50%;margin-left: -158px;top: 20px;font-weight: bold;}
	#loginbtn:hover{ background:url(images/btn.png) 0 0 no-repeat;}
</style>
  
<body>
<html:div styleClass="wrap">
<html:form id="loginForm" name="loginForm" action="contoller.do" method="post">
	<html:div styleClass="topcon">
		<html:div styleClass="top topbg">
			<html:div styleClass="topbar">
				<a href="javascript:void(0);">Old version review</a><span class="fr">|</span><a href="javascript:void(0);">WeChat Education</a><span class="fr">|</span><a href="javascript:void(0);">Mobile client</a><span class="fr">|</span><a href="javascript:void(0);">English</a>
			</html:div>
			<html:div styleClass="tlogo">
				<a href="javascript:void(0);" class="logo"><b></b><p class="text">EthERNet</p><p class="text2">Education and Research</p></a>
			</html:div>
		</html:div>
	</html:div>
	
	<!-- 背景图片 -->
	<html:div styleClass="main">
		<html:div styleClass="con_banner">
			<html:div id="tips_banner" styleClass="viewport">
				<ul class="sliders cb">
					<li> <a href="#"><img src="images/l_bg.png" /></a></li>
					<li> <a href="#"><img src="images/l_bg.png" /></a></li>
					<li> <a href="#"><img src="images/l_bg.png" /></a></li>
					<li> <a href="#"><img src="images/l_bg.png" /></a></li>
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
					<html:text name="account" id="account" styleClass="log_input" value="admin"/>
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
				</html:div>
				
				<html:div styleClass="logInfo ">
					<html:div styleClass="inputCon" >
						<input type="submit" id="loginbtn" value="Sign in"/>
						<btn:confirm  value="." onclick="submit('loginForm')"/>  
					</html:div>
				</html:div>
				
				<html:span styleClass="linkleft"></html:span> <html:span styleClass="linkright"></html:span>
			</html:div>
			
			<html:div styleClass="remindbox ">
				<h3>reminder</h3>
				<p>Campus information enabled a unified single point login function, the account is your staff / student ID. If you do not remember the teacher / student ID, please click on "<b class="blue">account inquiries</b>". Please teach the staff / students to change the password in time after login. If you have any questions, please <b class="blue">send email to the manager</b>.</p>
			</html:div>
		</html:div>
	<!-- 登录框 -->		
	</html:div>
	
	<html:div styleClass="clear"></html:div>
	<html:div styleClass="footer">
		<html:div styleClass="copyright_box">
			<html:div styleClass="c_con">
				<ul class="clist">
					<li><a href="javascript:void(0);"><b class="cicon icon1"></b><p class="mt25">Web page statement</p></a></li>
					<li><a href="javascript:void(0);"><b class="cicon icon2"></b><p class="mt25">Site map</p></a></li>
					<li><a href="javascript:void(0);"><b class="cicon icon3"></b><p class="mt25">contact us</p></a></li>
				</ul>
				<p>Ministry of education government portal moe.gov.cn Chinese domain name: Ministry of education Ethiopia ICP No. 10028400 Copyright: the Ministry of education in Ethiopia</p>
			</html:div>
		</html:div>
	</html:div>
</html:form>	
</html:div>	

<script>
   // 加载滑动切换幻灯片
	var flexSlider=new Slider('tips_banner');
</script>
</body>
</html>
