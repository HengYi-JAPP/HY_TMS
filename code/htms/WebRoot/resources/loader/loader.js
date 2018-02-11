function __taglibs_comps_loader(path)
{ 
	if(path == null||path==''){
		return;
	}
	tempPath = path.toLowerCase();
	var loaderObject;
	var loaderString;
	//confirm("tempPath.length="+tempPath.length+",index="+tempPath.indexOf('.js'));
	if(tempPath.indexOf('.js')==tempPath.length-3){
		loaderObject=document.createElement("script"); 
		loaderObject.type="text/javascript";
		loaderObject.src=path;
		
	}
	
	if(tempPath.indexOf('.css')==tempPath.length-4){
		loaderObject=document.createElement("link"); 
		loaderObject.type="text/css";
		loaderObject.rel="stylesheet";
		loaderObject.href=path;
	}
	if(loaderObject==null||loaderObject==''){
		return;
	}
    //var scriptTag = document.getElementById( id ); 
    if(document.getElementsByTagName('HEAD')==undefined||document.getElementsByTagName('HEAD')==null){
    	 var oHead = document.getElementsByTagName('HEAD').item(0); 
    	 oHead.appendChild(loaderObject)
    	 return;
    }
    
    if(document.getElementsByTagName('BODY')==undefined||document.getElementsByTagName('BODY')==null){
	   	 var oBody = document.getElementsByTagName('BODY').item(0); 
	   	 oBody.appendChild(loaderObject)
	   	 return;
   }
    
    if(tempPath.indexOf('.js')==tempPath.length-3){
    	document.write("<script type='text/javascript' src='"+path+"'><\/script>"); 
    }
    if(tempPath.indexOf('.css')==tempPath.length-4){
    	document.write("<link  rel='stylesheet' type='text/css' href='"+path+"'><\/link>"); 
    }
} 

