	function validateFetchPrivilege(isSubmit){ 
		var checkedBox = document.getElementsByName("factoryIdSH");		
		var allowSubmit=true,isCorrect=true;
		var checkBoxTip = document.getElementById("checkBoxTip");
		for(var i=0;i<checkedBox.length;i++){
			if(checkedBox[i].checked){	
				isCorrect=true;
				break;
			}else{
				isCorrect=false;
			}
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		checkBoxTip.setAttribute("color",isCorrect==true?"green":"red");
		if(allowSubmit==true&&isSubmit){
			document.getElementById("fetchPrivilegeForm").submit();
		}
	}


	function validateBatchFetchPrivilege(isSubmit,switchOperation){ 
		var checkedBox = document.getElementsByName("factoryIdSH");		
		var allowSubmit=true,isCorrect=true;
		var checkBoxTip = document.getElementById("checkBoxTip");
		for(var i=0;i<checkedBox.length;i++){
			if(checkedBox[i].checked){	
				isCorrect=true;
				break;
			}else{
				isCorrect=false;
			}
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		checkBoxTip.setAttribute("color",isCorrect==true?"green":"red");
		isCorrect=true;
		if(checkUser("userId",allowSubmit)==false){
			isCorrect=false;
			alertTip("请在用户列表中选择用户。");
		}
		allowSubmit=allowSubmit==true&&isCorrect==true?true:false;
		if(allowSubmit==true&&isSubmit){
			document.getElementById("operation").value=switchOperation;
			document.getElementById("fetchPrivilegeForm").submit();
		}
	}
	
	function checkUser(userId,allowSubmit){
		var user=document.getElementsByName(userId);
		
		if(!user||user.length==0){
			return false;
		}
		var notNull=false;
		for(var i=0;i<user.length;i++){
				if((user[i].checked)){
					notNull= true;
					break;
				}
		}
		return notNull;
	}