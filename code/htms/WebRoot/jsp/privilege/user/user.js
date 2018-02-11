	function selectOrg(){
			var orgId=document.getElementById("selectedOrgId").value;
			if(!orgId){
				orgId="";
			}
			__myWin.createWebWindow({winId:'selectOrgWin',title:'Select Organization',content:basePath+'jsp/privilege/user/org.jsp?currentOrgId='+orgId,intLeft:10 ,intTop:10 ,intWidth:600 ,intHeight:400,isResize: true,isFullScreen: false});
		}
function checkPwd(){
		var pwd=document.getElementById("password").value;
		var cpwd=document.getElementById("confirmPassword").value;
		if(!pwd){
			alert("Enter password ,please.");
			document.getElementById("password").focus();
			return false;
		}
		if(!cpwd){
			alert("Enter  Confirm password,please.");
			document.getElementById("confirmPassword").focus();
			return false;
		}
		if(pwd!=cpwd){
			alert("Password and Confirm password is not match.");
			document.getElementById("password").value='';
			document.getElementById("confirmPassword").value='';
			return false;
		}
		return true;
	}