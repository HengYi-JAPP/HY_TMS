var i = 1;
	function splitShip(){
		var split_div = document.getElementById("old_div").innerHTML;
		var divInnerHtml =  document.getElementById("split_div").innerHTML;
		  divInnerHtml=divInnerHtml+'<div id="div_'+i+'">'+split_div+'<input type="button" value="删除"  onclick="del('+i+')"/></div>';
		  document.getElementById("split_div").innerHTML=divInnerHtml;
		  i = i + 1;
		var tonNumCount = parseFloat(document.getElementById("tonNumCount").innerText);
		document.getElementById("applyTonNum").value=tonNumCount;
		var packNumCount = parseFloat(document.getElementById("packNumCount").innerText);
		document.getElementById("applyPackNum").value=packNumCount;
	}
	function del(o){
	 document.getElementById("split_div").removeChild(document.getElementById("div_"+o));
		 var split_tonName=document.getElementsByName("splitTonNum");
		var sumTon=0;
		for(var i=0;i<split_tonName.length;i++){
			var tonNumCount = parseFloat(document.getElementById("tonNumCount").innerText);
			var applyTonNum = parseFloat(document.getElementById("applyTonNum").value);
			sumTon+=parseFloat(split_tonName[i].value);
			if(sumTon<=applyTonNum){
				document.getElementById("applyTonNum").value = tonNumCount-sumTon;
			}
			if(split_tonName.length=="1"){
				document.getElementById("applyTonNum").value=tonNumCount;
			}
		}
		var split_packName=document.getElementsByName("splitPackNum");
		var sumPack=0;
		for(var i=0;i<split_packName.length;i++){
			var packNumCount = parseFloat(document.getElementById("packNumCount").innerText);
			var applyPackNum = parseFloat(document.getElementById("applyPackNum").value);
			sumPack+=parseFloat(split_packName[i].value);
			if(sumPack<=applyPackNum){
				document.getElementById("applyPackNum").value = packNumCount-sumPack;
			}
			if(split_packName.length=="1"){
				document.getElementById("applyPackNum").value=tonNumCount;
			}
		}
	}
	
	
	function modifyTonNum(obj){
		var tonNumCount = parseFloat(document.getElementById("tonNumCount").innerText);
		var applyTonNum = parseFloat(document.getElementById("applyTonNum").value);
		var reg = new RegExp("^[0-9]*$"); 
		if(!reg.test(obj.value)||obj.value==""){
			obj.value=0;
			document.getElementById("error_tips").innerHTML="请输入数字";
		}
		if(obj.value>applyTonNum){
			document.getElementById("error_tips").innerHTML="不能大于默认申请吨数";
			obj.value=0;
		}
		var split_Name=document.getElementsByName("splitTonNum");
		var sum=0;
		for(var i=0;i<split_Name.length;i++){
			sum+=parseFloat(split_Name[i].value);
			
			if(sum<=tonNumCount){
				document.getElementById("applyTonNum").value = tonNumCount-sum;
			}
		}
	}
	function modifyPackNum(obj){
		var packNumCount = parseFloat(document.getElementById("packNumCount").innerText);
		var applyPackNum = parseFloat(document.getElementById("applyPackNum").value);
		var reg = new RegExp("^[0-9]*$"); 
		if(!reg.test(obj.value)||obj.value==""){
			obj.value=0;
			document.getElementById("error_tips").innerHTML="请输入数字"
		}
		if(obj.value>applyPackNum){
			document.getElementById("error_tips").innerHTML="不能大于默认申请吨数";
			obj.value=0;
		}
		var split_Name=document.getElementsByName("splitPackNum");
		var sum=0;
		for(var i=0;i<split_Name.length;i++){
			sum+=parseFloat(split_Name[i].value);
			
			if(sum<=packNumCount){
				document.getElementById("applyPackNum").value = packNumCount-sum;
			}
		}
	}
	
	function submitShip(){
		document.getElementById("old_div").innerHTML="";
		document.getElementById("transferForm").submit();
		
	}