var Class = {
//创建类
	create : function () {
		return function () {
			this.initialize.apply(this, arguments);
		};
	}
};

var $A = function (a) {
//转换数组
	return a ? Array.apply(null, a) : new Array;
};

var $ = function (elementId) {
//获取对象
	return document.getElementById(elementId);
};

var Try = {
//检测异常
	these : function () {
		var returnValue, arg = arguments, lambda, i;
	
		for (i = 0 ; i < arg.length ; i ++) {
			lambda = arg[i];
			try {
				returnValue = lambda();
				break;
			} catch (exp) {}
		}
	
		return returnValue;
	}
	
};

Object.extend = function(destination, source) { 
//追加方法
    for (var property in source) { 
        destination[property] = source[property]; 
    } 
    return destination; 
}

Object.extend(Object, {
	addEvent : function (targetObj, triggleEvent, eventName, isFalse) {
	//添加函数
		if (targetObj.attachEvent) targetObj.attachEvent(triggleEvent[0], eventName);
		else targetObj.addEventListener(triggleEvent[1] || triggleEvent[0].replace(/^on/, ""), eventName, isFalse || false);
		return eventName;
	},
	
	delEvent : function (a, b, c, d) {
		if (a.detachEvent) a.detachEvent(b[0], c);
		else a.removeEventListener(b[1] || b[0].replace(/^on/, ""), c, d || false);
		return c;
	},
	
	reEvent : function () {
	//获取Event
		return window.event ? window.event : (function (o) {
			do {
				o = o.caller;
			} while (o && !/^\[object[ A-Za-z]*Event\]$/.test(o.arguments[0]));
			return o.arguments[0];
		})(this.reEvent);
	}	
});

Function.prototype.bind = function () {
//绑定事件
	var func = this, a = $A(arguments), o = a.shift();
	return function () {
		func.apply(o, a.concat($A(arguments)));
	};
};

function isIE(){
	var version = getBrowserVersion();
	
	if(version.indexOf("IE:9")!=-1)return false;
	else return  version.indexOf("IE:")>=0;
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
		return '0';  
}

function randomChar(len)  {
	var  x="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
	var  tmp="";
	var slen = len?len:64;
	for(var  i=0;i<slen;i++)  {
		tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
	}

	return  tmp
}