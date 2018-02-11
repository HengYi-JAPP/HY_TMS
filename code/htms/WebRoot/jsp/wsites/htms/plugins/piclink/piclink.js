
function PicLink(){
	var picLink = this;
	picLink.linkTypes = [];
	picLink.addType=function(id,name,order){
		picLink.linkTypes[picLink.linkTypes.length]={typeId:id,typeName:name,showOrder:order};
	};
	
	picLink.showPicLinkType = function(typeId){
		if(typeId==null||typeId==''||typeId=='null'){
			//alert("typeId==null");
			return;
		}
		
		var typeElement =null,typeElementList=null;
		//alert("picLink.linkTypes.length=="+picLink.linkTypes.length);
		for(i=0;i<picLink.linkTypes.length;i++){
			typeObject = picLink.linkTypes[i];
			
			typeElementList =document.getElementsByName(typeObject.typeId);
			if(!typeElementList||typeElementList.length==0){
				//alert("!typeElement");
				continue;
			}
			for(var j=0;j<typeElementList.length;j++){
				typeElement=typeElementList[j]
	            if(!typeElement){
					//alert("!typeElement");
					continue;
				}
				if(typeObject.typeId==typeId){
					typeElement.style.display="block";
				}else{
					typeElement.style.display="none";
				}
			}//for
		}
	};
	picLink.init = function(){
		if(picLink.linkTypes.length==0){
			return;
		}
		picLink.showPicLinkType(picLink.linkTypes[0].typeId);
	};
}