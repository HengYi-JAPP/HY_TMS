function MyWin() {
	var myWin = this;
	myWin.vWinZIndex = 1;
	/**
	 * 通过元素ID获取元素对象
	 */
	myWin.getElementById = function(obj) {
		return (document.getElementById) ? document.getElementById(obj)
				: (document.all) ? document.all[obj] : obj
	};// getElementById

	/**
	 * 判断当前浏览器是否是IE
	 */
	myWin.isIE = function() {
		var version = myWin.getBrowserVersion();

		if (version.indexOf("IE:9") != -1)
			return false;
		else
			return version.indexOf("IE:") >= 0;
	};// isIE
	/**
	 * 获取浏览器版本
	 */
	myWin.getBrowserVersion = function() {
		var ua = navigator.userAgent.toLowerCase();
		var version = null;
		if (window.ActiveXObject != undefined && window.ActiveXObject != null) {
			version = ua.match(/msie ([\d.]+)/)[1];
			if (version != undefined && version != null)
				return 'IE:' + version;
		} else if (window.MessageEvent && !document.getBoxObjectFor) {
			try {
				version = ua.match(/chrome\/([\d.]+)/)[1];
				if (version != undefined && version != null)
					return 'CH:' + version;
			} catch (exp) {
				version = ua.match(/firefox\/([\d.]+)/)[1];
				if (version != undefined && version != null)
					return 'FF:' + version;
			}
		} else if (!document.getBoxObjectFor) {
			version = ua.match(/firefox\/([\d.]+)/)[1];
			if (version != undefined || version != null)
				return 'FF:' + version;
		} else if (window.opera != undefined && window.opera != null) {
			version = ua.match(/opera.([\d.]+)/)[1];
			if (version != undefined || version != null)
				return 'OP:' + version;
		} else if (window.openDatabase != undefined
				&& window.openDatabase != null) {
			version = ua.match(/version\/([\d.]+)/)[1];
			if (version != undefined || version != null)
				return 'SA:' + version;
		} else
			return '0';
	};// getBrowserVersion
	/**
	 * 重新获取事件
	 */
	myWin.reEvent = function() {
		// 获取Event
		return window.event ? window.event : (function(o) {
			do {
				o = o.caller;
			} while (o && !/^\[object[ A-Za-z]*Event\]$/.test(o.arguments[0]));
			return o.arguments[0];
		})(this.reEvent);
	};
	/**
	 * 获取鼠标的坐标位置
	 */
	myWin.getMouseCoords = function(ev) {
		ev = ev || window.event;
		ev = ev || myWin.reEvent();
		return {
			x : myWin.isIE() ? ev.clientX
					+ Math.max(document.body.scrollLeft,
							document.documentElement.scrollLeft) : ev.pageX,
			y : myWin.isIE() ? ev.clientY
					+ Math.max(document.body.scrollTop,
							document.documentElement.scrollTop) : ev.pageY
		};
	};// getMouseCoords
	/**
	 * 拖动窗口
	 */
	myWin.vDrag = function(winObj, winHeaderObj, initArr) {
		winHeaderObj = winHeaderObj || winObj;
		winObj.style.position = "absolute";
		if (!myWin.isIE()) {
			winHeaderObj.firstChild.onmousedown = function() {
				return false;
			}
		}
		winHeaderObj.onmousedown = function(event) {
			winObj.style.zIndex = myWin.vWinZIndex;
			myWin.vWinZIndex++;
			var winDoc = document;
			if (!event) {
				event = window.event;
			}
			var x = event.layerX ? event.layerX : event.offsetX;
			var y = event.layerY ? event.layerY : event.offsetY;
			if (winHeaderObj.setCapture) {
				winHeaderObj.setCapture();
			} else if (window.captureEvents) {
				window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
			}
			winDoc.onmousemove = function(event) {
				if (!event)
					event = window.event;
				var mus = myWin.getMouseCoords(event)
				if (!event.pageX) {
					event.pageX = mus.x;
				}
				if (!event.pageY) {
					event.pageY = mus.y;
				}
				var tx = event.pageX - x, ty = event.pageY - y;

				if (initArr) {
					winObj.style.left = (tx < initArr[0] ? initArr[0]
							: tx > initArr[2] ? initArr[2] : tx)
							+ "px";
					winObj.style.top = (ty < initArr[1] ? initArr[1]
							: ty > initArr[3] ? initArr[3] : ty)
							+ "px";
				} else {
					winObj.style.left = tx + "px";
					winObj.style.top = ty + "px";
				}
			};
			winDoc.onmouseup = function() {
				if (winHeaderObj.releaseCapture) {
					winHeaderObj.releaseCapture();
				} else if (window.captureEvents) {
					window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
				}
				winDoc.onmousemove = null;
				winDoc.onmouseup = null;
			};
		};
	};// vDrag
	/**
	 * 关闭窗口
	 */
	myWin.closeWebWindow = function(winId) {
		var winObj = myWin.getElementById(winId);
		if (winObj) {
			winObj.parentNode.removeChild(winObj);
		}
	};
	/**
	 * 判断是还是URL
	 */
	myWin.IsURL = function(url) {
		url = url.toLowerCase();
		var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
				+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" // ftp的user@
				+ "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
				+ "|" // 允许IP和DOMAIN（域名）
				+ "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
				+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
				+ "[a-z]{2,6})" // first level domain- .com or .museum
				+ "(:[0-9]{1,4})?" // 端口- :80
				+ "((/?)|" // a slash isn't required if there is no file name
				+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
		var re = new RegExp(strRegex);
		// re.test()
		if (re.test(url)) {
			return (true);
		} else {
			return (false);
		}
	}
	myWin.loadContent = function(content) {
		if (myWin.IsURL(content)) {
			var contentFrame = document.createElement("iframe");
			contentFrame.style.cssText = "width:100%;height:100%;";
			contentFrame.src = content;
			return contentFrame;
		}
		return content;
	}
	/**
	 * 创建窗口
	 * winParams = {winId:"winId", title:"title", content:"content", intLeft:0, intTop:0,
			intWidth:100, intHeight:100}
	 */
	myWin.createWebWindow = function(winParams) {
		var winObj = document.createElement("div");
		winObj.id = winParams.winId;
		winObj.className = "webWinFrame";
		document.body.appendChild(winObj);
		var left = winParams.intLeft ? winParams.intLeft : 0;
		var top = winParams.intTop ? winParams.intTop : 0;
		winObj.style.left = left + "px";
		winObj.style.top = top + "px";

		var winSelf = document.createElement("div");
		winSelf.className = "webWin";
		winObj.appendChild(winSelf);

		var winTitle = document.createElement("div");
		winTitle.className = "wTitle";
		winTitle.innerHTML = "<div style=\"float:left;\">"
				+ winParams.title
				+ "</div><div  style=\"float:right;cursor:pointer;\" onclick=\"myWin.closeWebWindow('"
				+ winParams.winId + "')\">关闭</div>";
		winSelf.appendChild(winTitle);

		var winContent = document.createElement("div");
		winContent.className = "wContent";
		var contentFrame = null;
		if (myWin.IsURL(winParams.content)) {
			contentFrame = document.createElement("iframe");
			contentFrame.style.cssText = "width:100%;height:100%;";
			contentFrame.src = winParams.content;
			winContent.appendChild(contentFrame);
		} else {
			winContent.innerHTML = winParams.content;
		}
		winSelf.appendChild(winContent);

		var winDbox = document.createElement("div");
		winDbox.className = "wResizeBox";
		winSelf.appendChild(winDbox);

		winObj.style.zIndex = myWin.vWinZIndex;
		myWin.vWinZIndex++;

		var minW = 50, minH = 40;
		var _self = this;
		var wX = winSelf.offsetWidth - winContent.offsetWidth;
		var wH = winSelf.offsetHeight - winContent.offsetHeight;
		var winDoc = document;
		winDbox.onmousedown = function(e) {

			winObj.style.zIndex = myWin.vWinZIndex;
			myWin.vWinZIndex++;

			if (!e)
				e = window.event;
			var x = e.layerX ? e.layerX : e.offsetX, y = e.layerY ? e.layerY
					: e.offsetY;
			var MCD = myWin.getMouseCoords(e)
			winSelf.startX = MCD.x;
			winSelf.startY = MCD.y;
			winSelf.startW = winSelf.offsetWidth;
			winSelf.startH = winSelf.offsetHeight;
			if (winDbox.setCapture) {
				winDbox.setCapture();
			} else if (window.captureEvents) {
				window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
			}
			winDoc.onmousemove = function(ev) {

				ev = ev || window.event;
				ev = ev || myWin.reEvent();

				myWin.getElementById('INFOPANEL').innerHTML = window.event.button;
				if (ev.button != 1 && myWin.isIE()) {
					if (winDbox.releaseCapture) {
						winDbox.releaseCapture();
					} else if (window.captureEvents) {
						window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
					}
					winDoc.onmousemove = function(ev) {
					};
					return;
				}

				var mus = myWin.getMouseCoords(ev)
				var newW = (winSelf.startW + (mus.x - winSelf.startX));
				var newH = (winSelf.startH + (mus.y - winSelf.startY));

				resizeWin(newW, newH);
			};

		};
		var onmouseup = function(ev) {
			if (winDbox.releaseCapture) {
				winDbox.releaseCapture();
			} else if (window.captureEvents) {
				window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
			}
			winDoc.onmousemove = function(ev) {
			};

		}
		window.onmouseup = onmouseup;
		winDoc.onmouseup = onmouseup;
		winDbox.onmouseup = onmouseup;
		winSelf.onmouseup = onmouseup;
		winObj.onmouseup = onmouseup;
		winContent.onmouseup = onmouseup;
		if(contentFrame){
			contentFrame.onmouseup = onmouseup;
		}
		function resizeWin(newW, newH) {
			newW = newW < minW ? minW : newW;
			newH = newH < minH ? minH : newH;
			winSelf.style.width = newW + "px";
			winSelf.style.height = newH + "px";
			winTitle.style.width = myWin.isIE() ? newW + "px" : (newW - 4)
					+ "px";
			winContent.style.width = (newW - wX) + "px";
			winContent.style.height = (newH - wH) + "px";
		}
		{
			resizeWin(winParams.intWidth, winParams.intHeight);
			myWin.vDrag(winObj, winTitle);
		}
	};//

}//myWin

var __myWin = new MyWin();