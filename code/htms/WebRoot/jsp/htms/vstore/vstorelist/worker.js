function timeout(time) {
	var clock=setInterval(function() {
	    time=time*1 - 20;
		if (time != 0) {
		   postMessage(time);
		 
		}else{
		   clearInterval(clock);
		}
	}, 20000);
}


this.addEventListener("message", function(e){
     timeout(e.data);
});