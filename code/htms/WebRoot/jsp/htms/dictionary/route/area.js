	function selectArea(){
			
				var areaId = document.getElementById("areaId").value;
			
			if(!areaId){
				areaId="";
			}
			__myWin.createWebWindow({winId:'selectAreaWin',title:'选择地址',content:basePath+'jsp/htms/dictionary/route/area.jsp?areaId='+areaId,intLeft:10 ,intTop:10 ,intWidth:600 ,intHeight:400,isResize: true,isFullScreen: false});
		}
	
	function selectAsyncArea(){
		
		var areaId = document.getElementById("areaId").value;
	
		if(!areaId){
			areaId="";
		}
		__myWin.createWebWindow({winId:'selectAreaWin',title:'选择地址',content:basePath+'jsp/htms/dictionary/route/asyncArea.jsp?areaId='+areaId,intLeft:10 ,intTop:10 ,intWidth:600 ,intHeight:400,isResize: true,isFullScreen: false});
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