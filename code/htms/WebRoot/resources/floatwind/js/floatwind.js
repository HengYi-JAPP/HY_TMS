function FloatWind(floatObjId){
	var wind = this;
	wind.floatObj = null//document.getElementById("floatDiv");
	wind.winLeft = 300;
	wind.winTop = 200; 
	wind.step = 1;
	wind.delay = 20; 
	wind.moveRangeWidth = document.body.scrollWidth;
	wind.moveRangeHeight = document.body.scrollHeight;
	wind.offsetHeight = 0;
	wind.offsetWidth = 0;
	wind.verticalMove = 0;
	wind.horizonMove = 0;
	wind.interval=null;
	wind.changePos=function () {
		wind.offsetHeight = wind.floatObj.offsetHeight;
		wind.offsetWidth = wind.floatObj.offsetWidth;
		
		if (wind.verticalMove==1){
			wind.winTop = wind.winTop + wind.step;
		}else {
			wind.winTop = wind.winTop - wind.step;
		}
		
		if (wind.winTop < 0){
			wind.verticalMove = 1;
			wind.winTop = 0;
		}
		if (wind.winTop >= (wind.moveRangeHeight - wind.offsetHeight)){
			wind.verticalMove = 0;
			wind.winTop = (wind.moveRangeHeight - wind.offsetHeight);
		}
		if (wind.horizonMove==1){
			wind.winLeft = wind.winLeft + wind.step;
		}else {
			wind.winLeft = wind.winLeft - wind.step;
		}
		if (wind.winLeft < 0) {
			wind.horizonMove = 1;
			wind.winLeft = 0;
		}
		if (wind.winLeft >= (wind.moveRangeWidth - wind.offsetWidth)){
			wind.horizonMove = 0;
			wind.winLeft = (wind.moveRangeWidth - wind.offsetWidth);   
		}
		var tempLeft = 	wind.winLeft ;
		var tempTop = 	wind.winTop ;
		wind.floatObj.style.left = tempLeft + 'px';
		wind.floatObj.style.top = tempTop + 'px';
		//document.getElementById("xyPos").innerHTML="wind.winLeft:"+wind.winLeft+"<br/>yPos:"+yPos+"<br/>left="+floatObj.style.left+"<br/>top="+floatObj.style.top;
	};
	
	wind.start=function ()
	{	
		wind.floatObj = document.getElementById(floatObjId);
		if(!wind.floatObj){
			return;
		}
		wind.floatObj.style.top = wind.winTop;
	 	wind.floatObj.visibility = "visible";
		wind.interval = setInterval(wind.changePos, wind.delay);
		wind.floatObj.onmouseover=function(){clearInterval(wind.interval)}
		wind.floatObj.onmouseout=function(){wind.interval=setInterval(wind.changePos, wind.delay)}
	};
}