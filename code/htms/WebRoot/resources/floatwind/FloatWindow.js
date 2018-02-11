function FloatWind(floatObjId){
	var wind = this;
	wind.floatObj = null//document.getElementById("floatDiv");
	wind.xPos = 300;
	wind.yPos = 200; 
	wind.step = 1;
	wind.delay = 20; 
	wind.width = document.body.scrollWidth>document.body.clientWidth?document.body.scrollWidth:document.body.clientWidth;
	wind.height = document.body.scrollHeight>document.body.clientHeight?document.body.scrollHeight:document.body.clientHeight;
	wind.width = wind.width>window.screenWidth?wind.width:window.screenWidth;
	wind.height = wind.height>window.screenHeight?wind.height:window.screenHeight;
	wind.Hoffset = 0;
	wind.Woffset = 0;
	wind.yon = 0;
	wind.xon = 0;
	wind.pause = true;
	wind.interval=null;
	wind.init= function(){
		wind.floatObj = document.getElementById(floatObjId);
		if(!wind.floatObj){
			return;
		}
		wind.floatObj.style.top = wind.yPos;
	};
	//wind.init();
	wind.changePos=function () {
		
		
		//wind.width = document.body.scrollWidth;
		//wind.height = document.body.scrollHeight;
		wind.Hoffset = wind.floatObj.offsetHeight;
		wind.Woffset = wind.floatObj.offsetWidth;
		
		if (wind.yon==1){
			wind.yPos = wind.yPos + wind.step;
		}else {
			wind.yPos = wind.yPos - wind.step;
		}
		
		if (wind.yPos < 0){
			wind.yon = 1;
			wind.yPos = 0;
		}
		if (wind.yPos >= (wind.height - wind.Hoffset)){
			wind.yon = 0;
			wind.yPos = (wind.height - wind.Hoffset);
		}
		if (wind.xon==1){
			wind.xPos = wind.xPos + wind.step;
		}else {
			wind.xPos = wind.xPos - wind.step;
		}
		if (wind.xPos < 0) {
			wind.xon = 1;
			wind.xPos = 0;
		}
		if (wind.xPos >= (wind.width - wind.Woffset)){
			wind.xon = 0;
			wind.xPos = (wind.width - wind.Woffset);   
		}
		var tempLeft = 	wind.xPos ;//+ document.body.scrollLeft;
		var tempTop = 	wind.yPos ;//+ document.body.scrollTop;
		wind.floatObj.style.left = tempLeft + 'px';
		wind.floatObj.style.top = tempTop + 'px';
		//document.getElementById("xyPos").innerHTML="xPos:"+xPos+"<br/>yPos:"+yPos+"<br/>left="+floatObj.style.left+"<br/>top="+floatObj.style.top;
	};
	
	wind.start=function ()
	{	
		wind.init();
		if(!wind.floatObj){
			return;
		}
	 	wind.floatObj.visibility = "visible";
		wind.interval = setInterval(changePos, delay);
		wind.floatObj.onmouseover=function(){clearInterval(wind.interval)}
		wind.floatObj.onmouseout=function(){wind.interval=setInterval(wind.changePos, wind.delay)}
	};
	wind.pause_resume=function () 
	{
		if(wind.pause){
			clearInterval(wind.interval);
			wind.pause = false;
		}else {
			wind.interval = setInterval(wind.changePos,wind.delay);
			wind.pause = true; 
		}
	}
}

var floatWind = new FloatWind("floatDiv");
floatWind.start();