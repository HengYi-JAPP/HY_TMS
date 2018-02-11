function __check_all(checkId,targetName) {	   
    var checkObj = document.getElementById(checkId);
    if(checkObj==undefined||checkObj==null){
    	return;
    }
    
    var elements = document.getElementsByName(targetName);
    if(elements==undefined||elements==null||elements.length==0){
    	return;
    }			   
   
    for (var i = 0; i < elements.length; i++){
    	elements[i].checked = checkObj.checked;
    }
}