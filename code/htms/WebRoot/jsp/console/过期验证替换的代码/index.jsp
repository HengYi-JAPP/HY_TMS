<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<script type="text/javascript">

window.history.forward(1);//禁用回退（比如：当前在B页面，点击后退会退回到A页面，那么该代码写在A页面，然后在B页面就不会回退到A了）

</script>
<%!
	
 public static int db(String smdate,String bdate) throws ParseException{ 
 	try{ 
 		String g="==gMy0SMx0yNxAjM";
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(sdf.parse(smdate));    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(sdf.parse(bdate));    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days)); 
       }catch(Exception ex){
       		ex.printStackTrace();
       		return 0;
       }    
    }
     public static String rc(String from){
        char[] froms = from.toCharArray();
        int length = froms.length;
        for (int i = 0; i < length/2; i++){
            char temp = froms[i];
            froms[i] = froms[length - 1 -i];
            froms[length - 1 -i] = temp;
        }
        return String.valueOf(froms);
    }
 %>
<script type="text/javascript">
//禁止后退键 作用于Firefox、Opera 
document.onkeypress=banBackSpace;
//禁止后退键 作用于IE、Chrome 
document.onkeydown=banBackSpace;
//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外 
function banBackSpace(e){ 
var ev = e || window.event;//获取event对象 
var obj = ev.target || ev.srcElement;//获取事件源 
var t = obj.type || obj.getAttribute('type');//获取事件源类型 
//获取作为判断条件的事件类型 
var vReadOnly = obj.getAttribute('readonly'); 
var vEnabled = obj.getAttribute('enabled'); 
//处理null值情况 
vReadOnly = (vReadOnly == null) ? false : vReadOnly; 
vEnabled = (vEnabled == null) ? true : vEnabled; 
//当敲Backspace键时，事件源类型为密码或单行、多行文本的， 
//并且readonly属性为true或enabled属性为false的，则退格键失效 
var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea") && (vReadOnly==true || vEnabled!=true))?true:false; 
//当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效 
var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea") ?true:false; 
//判断 
var  g="==gMy0SMx0yNxAjM";
if(flag2){ 
return false; 
} 
if(flag1){ 
return false; 
} 
} 
</script>
<%
String e=rc("==gMy0SMx0yNxAjM");
String b=tools.tool.getDate();
 e=tools.tool.base64Decode(e);
int t = db(b,e); 
%>
<script type="text/javascript">
//屏蔽F5
document.onkeydown = function(e){
e = window.event || e;
var keycode = e.keyCode || e.which;
if(e.ctrlKey || e.altKey || e.shiftKey
|| keycode >= 112 && keycode <= 123){
if(window.event){// ie
try{e.keyCode = 0;}catch(e){}
e.returnValue = false;
}else{// ff
e.preventDefault();
}
}
}
//屏蔽右键
document.oncontextmenu = function(e){
return false;
}
</script>


<%
if(t>0){
%>
<script type="text/javascript"> 
var countdown=90; 
function settime() { 
	var timeTip = document.getElementById("timeTip");
	if (countdown == 0) { 
		//countdown = 60; 
		timeTip.innerHTML='';
		var forwardIndex= document.getElementById("forwardIndex");
		forwardIndex.setAttribute("href", "jsp/console/console.jsp"); 
		forwardIndex.href="jsp/console/console.jsp"; 
		//forwardIndex.click();
	} else { 
		countdown--; 
		timeTip.innerHTML='<font color="red" size="18">'+countdown+'</font>秒后，';
	
	} 
	if(countdown>=0){
		setTimeout(function() {settime()},1000);
	}
} 
</script> 
<table style="width:100%;height:100%;border:0px;text-align:center">
  <tr>
    <th>距离试用期结束还有<font color="red" size="18"><%=t %></font>天。请及时付费，以免影响正常使用。谢谢。</th>
   
  </tr>
  
  <tr>
    <td style="width:100%;height:10%;text-align:center">
    <span id="timeTip"></span>请点击[<a id="forwardIndex"  href="javascript:void(0);" target="_self">首页</a>]继续
    </td>
  </tr>
  <tr>
    <td style="width:100%;height:auto;text-align:center">&nbsp;</td>
  </tr>
</table>
<script type="text/javascript"> 
	settime();
</script> 
<%}else{%>
<table>
  <tr>
    <th>60天试用期已结束。请付费后，继续使用。谢谢。</th>
    <th></th>
  </tr>
 
</table>
<%}%>



