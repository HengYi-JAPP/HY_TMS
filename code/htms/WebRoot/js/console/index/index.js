/*function ShowOrHideMenu(obj) {
    try {
        var menu = document.getElementById("leftTD");
        if (menu.style.display != "none") {
            menu.style.display = "none";
        }
        else {
            menu.style.display = "";
        }
    }
    catch (ee) {
        alert(ee.massage);
    }
}*/

function ShowOrHideMenu(obj) {
    try {
        var menu = document.getElementById("leftTD");
        var showOrHideImage = document.getElementById("showOrHideImage");
        if (menu.style.display != "none") {
            menu.style.display = "none";
            showOrHideImage.src = "images/common/framework/shrink-right.png";
        }
        else {
            menu.style.display = "";
            showOrHideImage.src = "images/common/framework/shrink-left.png";
        }
    }
    catch (ee) {
        alert(ee.massage);
    }
}

function logout(){
	if(confirm('Are you sure you want to sign out')){		
		window.opener = null;  
		window.close();  

	}
}
function getBrowserVersion()
{	
    var ua = navigator.userAgent.toLowerCase();
	var version = null;
	if(window.ActiveXObject!=undefined&&window.ActiveXObject!=null){
		version=ua.match(/msie ([\d.]+)/)[1];
		if(version!=undefined&&version!=null)return 'IE:'+version;
	}else if(window.MessageEvent && !document.getBoxObjectFor){
		try{
			version=ua.match(/chrome\/([\d.]+)/)[1];
			if(version!=undefined&&version!=null)return 'CH:'+version;
		} catch (exp) {
			version=ua.match(/firefox\/([\d.]+)/)[1];
			if(version!=undefined&&version!=null)return 'FF:'+version;	
		}		
	}else if(!document.getBoxObjectFor){
		version=ua.match(/firefox\/([\d.]+)/)[1];
		if(version!=undefined||version!=null)return 'FF:'+version;	
	}else if(window.opera!=undefined&&window.opera!=null){
		version=ua.match(/opera.([\d.]+)/)[1];
		if(version!=undefined||version!=null)return 'OP:'+version;
	}else if(window.openDatabase!=undefined&&window.openDatabase!=null){
		version=ua.match(/version\/([\d.]+)/)[1];
		if(version!=undefined||version!=null)return 'SA:'+version;
	}else
		return 0;  
}

window.onload=window.onresize = function () {//窗口重新加载或重新调整大小时让内容部分自适应高度
	var h=document.body.clientHeight; 

	var bodyHeight = document.getElementById("body");//寻找ID为content的对象（也就是你想要自适应高度的对象）
	var relativeHeight = 100;//100为页头和页尾的高度和
	bodyHeight.style.height = (h-relativeHeight) + "px";// +“px” 是解决 firefox不识别 bodyHeight.style.height =h。289数字可以根据需要更改！
	
	document.all("mainContent").style.height=document.body.clientHeight-relativeHeight; 
	// document.all("mainContent").style.width=document.body.clientWidth-230; //230为左边菜单区域之和
}

