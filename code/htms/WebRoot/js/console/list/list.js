var __conditionBoxId = null;
function searchBannerSwitch(banner) {
	if(banner==undefined||banner==null){
		return ;
	}
	if(__conditionBoxId==undefined||__conditionBoxId==null){
		return ;
	}
    
    if (document.getElementById(__conditionBoxId).style.display == "none") {
        document.getElementById(__conditionBoxId).style.display = ""
        banner.className = 'caption_hotinput';
    }
    else {
        document.getElementById(__conditionBoxId).style.display = "none"
        banner.className = 'caption_hotinput_over';
    }
}

var __lastClickRow = undefined;
function onMouseMoveOverTableList(obj) {

    if (__lastClickRow == undefined) {
    	setTableRowColor(obj, "#afdfe4", "#000000");
        __lastClickRow = obj;
    }else if (obj != __lastClickRow) {

    	setTableRowColor(__lastClickRow, __lastClickRow.style.backgroundColor, __lastClickRow.style.color);
        setTableRowColor(obj, "#afdfe4", "#000000");
        __lastClickRow = obj;
    }
}

function setTableRowColor(rowObj, bgcolor, color) {
    for (var i = 0; i < rowObj.childNodes.length; i++) {
       // rowObj.childNodes[i].style.backgroundColor = bgcolor;
        if(rowObj.childNodes[i].tagName=='TD')
        {
        	rowObj.childNodes[i].style.backgroundColor=bgcolor;
        }
    }
}

