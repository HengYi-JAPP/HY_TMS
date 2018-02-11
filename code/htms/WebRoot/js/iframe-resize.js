function IframeResizer(){
	var iframeResizer=this;
	
	iframeResizer.resetFrameHeight=function(frameObj,showHeight,minHeight,level,parentAddHeight){
		if(!frameObj||!frameObj.style){
			return ;
		}
		var height=0,bHeight=0,dHeight=0;
		//alert("iframeId:"+frameObj.id+",frameObj.height:"+frameObj.height+",showHeight="+showHeight+",parentAddHeight="+parentAddHeight);
		if(showHeight){
			if(level==0){
				height=parseInt(showHeight);
			}else{
				height=parseInt(showHeight)+parseInt(parentAddHeight);
			}
			frameObj.style.height =height+"px";
			return;
		}
		
		try{
			if (frameObj.contentWindow){
				frameDocument = frameObj.contentWindow.document;
			}else{
				frameDocument = frameObj.contentDocument;
			}
			
			if(!frameDocument){
				frameObj.style.height = minHeight+"px";
			}
			
			if(frameDocument.body&&frameDocument.body.offsetHeight){
				bHeight =frameDocument.body.offsetHeight;
			}
			if(frameDocument.documentElement&&frameDocument.documentElement.offsetHeight){
				dHeight = frameDocument.documentElement.offsetHeight;
			}
			
			height = Math.max(bHeight, dHeight);
			height= Math.max(height, minHeight);
			//if(isIndex){
			//	height=height-(level+1)*100;
			//}
			frameObj.style.height = height+"px";
			//alert("iframeId:"+frameObj.id+",frameObj.style.height:"+frameObj.style.height+",level="+level);
			return ;
		}catch (ex){
			height = Math.max(bHeight, dHeight);
			height= Math.max(height, minHeight);
			//if(isIndex){
			//	height=height-(level+1)*60;
			//}
			frameObj.style.height = height+"px";
			//alert("eeex......iframeId:"+frameObj.id+",frameObj.style.height:"+frameObj.style.height);
			return ;
		}
	};
	
	iframeResizer.getLevelParent=function(level){
		if(!level||level==0){
			return parent;
		}
		var levelParent = parent;
		var count=0;
		while(count<level&&levelParent.parent){
			levelParent=levelParent.parent;
			count++;
		}
		return count==level?levelParent:null;
	};
	
	iframeResizer.getLevelDocument=function(level){
		if(!level||level==0){
			return document;
		}
		var levelParent = parent;
		//if(level==1){
		//	return levelParent.document;
		//}
		var count=1;
		while(count<level&&levelParent.parent){
			levelParent=levelParent.parent;
			count++;
		}
		return count==level?levelParent.document:null;
	};
	
	iframeResizer.resizeFrameHeight=function(iframeId,showHeight,minHeight,level,parentAddHeight){
		if(iframeId==undefined||iframeId==null||iframeId==""){
			return;
		}
		level=level?level:0;
		parentAddHeight=parentAddHeight?parentAddHeight:0;
		minHeight=minHeight||minHeight>0?minHeight:800;
		//showHeight=showHeight||showHeight>0?showHeight:800;
		
		currentDoc=iframeResizer.getLevelDocument(level);
		
		if(!currentDoc){
			//alert("currentDoc==null,iframeId:"+iframeId+",level="+level);
			return;
		}
		var frameObj =currentDoc.getElementById(iframeId);
		
		
		//resizeFrameHeight(frameObj,minHeight);
	
		var relativeTop = 0,relativeLeft = 0;
		var position= null;
		
		if(!frameObj){
			return;
		}
		/*调整当前FRAME高度*/
		iframeResizer.resetFrameHeight(frameObj,showHeight,minHeight,level,parentAddHeight);
		var currParent =iframeResizer.getLevelParent(level);
		if(!currParent){
			//alert("currParent==null,iframeId:"+iframeId);
			return;
		}
		//alert("currParent!=null,iframeId:"+iframeId);
		var parentDoc =currParent?currParent.document:null;
		if(!parentDoc){
			//alert("parentDoc==null,iframeId:"+iframeId);
			return;
		}
		
		/*
		 * 调整上层嵌套的IFRAME
		 */
		var tempFrames = parentDoc.getElementsByTagName("IFRAME");
		if(!tempFrames||tempFrames.length==0){
			//alert("!tempFrames||tempFrames.length==0,iframeId:"+iframeId);
			return;
		}
		//alert("tempFrames.length=="+tempFrames.length+"iframeId:"+iframeId);
		var tempFrame,tempDocument,parentDocument=null;
		var nestDocuments = [];
		
		for(var i=0;tempFrames&&i<tempFrames.length;i++){
			tempFrame = tempFrames[i];
			parentDocument=null;
			//alert(" Parent iframeId:"+tempFrame.id);
			if (tempFrame.contentWindow){
				tempDocument = tempFrame.contentWindow.document;
			}else{
				tempDocument = tempFrame.contentDocument;
			}
			
			if(!tempDocument||!tempDocument.getElementById(iframeId)){
				continue;
			}
			
			parentDocument=tempDocument;
			break;
		}
		if(parentDocument){
			level++;
			iframeResizer.resizeFrameHeight(tempFrame.id,showHeight,minHeight,level,parentAddHeight);
		}
	};
}
var __Resizer =new IframeResizer();

