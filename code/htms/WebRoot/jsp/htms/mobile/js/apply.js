	var SUCCESS = 0;
	var ERROR_TON_INCORRECT = 1;
	var ERROR_BEYOND_MAX_TON = 2;
	var ERROR_PACKAGE_EMPTY = 3;
	var ERROR_PACKAGE_INCORRECT = 4;
	var ERROR_ADDR_EMPTY = 5;
	var ERROR_TOM_EMPTY = 6;
	var ERROR_BEYOND_MONEY = 7;
	var ERROR_UNSAME_SHIP_CODE = 8;
	var ERROR_EMPTY_SHIP_CODE = 9;
	
	var isSumitForm = false;

	function inputOnBlur(input) {
		console.log("input on blur");
		console.log(input);
		
//		input.style.width='20%';
//		input.style.height='20px';
		input.style.fontSize='14px';
	}
	function inputOnFocus(input) {
		console.log("input on focus");
		console.log(input);
		
//		input.style.width='50%';
//		input.style.height='30px';
		input.style.fontSize='18px';
	}
	
	function validateApplyTonNum(){
		
		var empty = true;
		var regTon = /^\d+(\.\d{0,3})?$/;
		var regPack = /^\d+?$/;
		var retValue = {};
		
		var totalTonNum = 0;
		var totalPackNum = 0;
		
		var totalPrice = 0;
		
		var shipPoints = new Array();
		
		for (var i = 0; i < codetailIdArray.length; i++) {
			var applyTonNumId = "applyTonNum" + i;
			var appliableAmountId = "appliableAmount" + i;
			var applyPackNumId = "applyPackNum" + i;
			var freightId = "freight" + i;
			var unitPriceId = "unitPrice" + i;
			var shipPointId = "shipPoint" + i;
			
			var applyTonNum=document.getElementById(applyTonNumId).value;
			var applyPackNum = document.getElementById(applyPackNumId).value;
			var freight = document.getElementById(freightId).value;
			var unitPrice = document.getElementById(unitPriceId).value;
			
			var shipPoint = document.getElementById(shipPointId).value;
			shipPoints.push(shipPoint);
			
			if (!applyTonNum && !applyPackNum) {
//				document.getElementById(applyTonNumId).value=0;
//				document.getElementById(applyPackNumId).value=0;
				continue;				
			}
			
			if (!applyTonNum) {
				
				retValue.code = ERROR_TOM_EMPTY;
				retValue.title = "请输入数量";
				retValue.msg = codetailIdArray[i];
				//retValue.msg = "物料" + i + "请输入数量";
				
				return retValue;				
			}	
			/*if (!applyPackNum) {
				
				retValue.code = ERROR_PACKAGE_EMPTY;
				retValue.title = "请输入包数";
				retValue.msg = codetailIdArray[i];
				//retValue.msg = "物料" + i + "请输入包数";
				
				return retValue;				
			}*/
//			if (parseFloat(applyTonNum) == 0 && parseInt(applyPackNum) == 0) {
//				continue;
//			}
			if (parseFloat(applyTonNum) == 0) {
				retValue.code = ERROR_TOM_EMPTY;
				retValue.title = "数量不能为0";
				retValue.msg = codetailIdArray[i];
				//retValue.msg = "物料" + i + "请输入数量";
				
				return retValue;
			}
//			if (parseInt(applyPackNum) == 0) {
//				retValue.code = ERROR_TOM_EMPTY;
//				retValue.title = "包数不能为0";
//				retValue.msg = codetailIdArray[i];
//				//retValue.msg = "物料" + i + "请输入数量";
//				
//				return retValue;
//			}
			
			empty = false;
			
			if(!regTon.test(applyTonNum)){
				//document.getElementById("applyTonNumTip").innerHTML="请输入整数或带3位小数的数";
				retValue.code = ERROR_TON_INCORRECT;
				retValue.title = "数量为整数或带3位小数";
				retValue.msg = codetailIdArray[i];
				
				return retValue;
			}
			if(!regPack.test(applyPackNum)){
				retValue.code = ERROR_PACKAGE_INCORRECT;
				retValue.title = "包数为整数";
				retValue.msg = codetailIdArray[i];
				
				return retValue;
			}
			
			var applyNum = parseFloat(applyTonNum);
			var appliableAmount=parseFloat(document.getElementById(appliableAmountId).value);
			if(applyNum > appliableAmount){
				//document.getElementById("applyTonNumTip").innerHTML="申请吨数不能超过可申请数量";
				retValue.code = ERROR_BEYOND_MAX_TON;
				retValue.title = "申请数量超过可申请数量(" + (applyNum - appliableAmount) + ")";
				retValue.msg = codetailIdArray[i];
				
				return retValue;
			}
			
			totalPackNum += parseInt(applyPackNum);
			totalTonNum += applyNum;
			
			if (freight != null && unitPrice != null ) {
				var fFreight = parseFloat(freight);
				var fUnitPrice = parseFloat(unitPrice);
				
				totalPrice += applyNum * (fFreight + fUnitPrice);
			}
			
		}
		if (empty) {
			retValue.code = ERROR_TOM_EMPTY;
			retValue.title = "提示";
			retValue.msg = "请输入至少一项的吨数和包数";
			
			return retValue;
		}
		
		var shipPointLength = shipPoints.length;
		if (shipPointLength > 0) {
			var unsamePoint = false;
			var emptyPoint = false;
			for (var i = 0; i < shipPointLength; i++) {
				if (unsamePoint) {
					break;
				}
				if (emptyPoint) {
					break;
				}
				
				var applyTonNumId = "applyTonNum" + i;
				var applyTonNum=document.getElementById(applyTonNumId).value;
				console.log("applyTonNum=" + applyTonNum);
				if (applyTonNum == null || parseFloat(applyTonNum) == 0 || applyTonNum == '') {
					continue;
				}
				
				var onePoint = shipPoints[i];
				if (onePoint == '' || onePoint == undefined || onePoint == "null" || onePoint == null) {
					emptyPoint = true;
					break;
				}				
				
				console.log("onePoint=" + onePoint);
				
				for (var j = i + 1; j < shipPointLength; j++) {
					var applyTonNumIdJ = "applyTonNum" + j;
					var applyTonNumJ=document.getElementById(applyTonNumIdJ).value;
					console.log("applyTonNumJ=" + applyTonNumJ);
					if (applyTonNumJ == null || parseFloat(applyTonNumJ) == 0 || applyTonNumJ == '') {
						continue;
					}
					
					var point = shipPoints[j];
					if (point == '' || point == undefined || point == "null" || point == null) {
						emptyPoint = true;
						break;
					}										
					
					console.log("point=" + point);
					
					if (point != onePoint) {
						unsamePoint = true;
						break;
					}
				}
			}
			
			if (emptyPoint) {
				retValue.code = ERROR_EMPTY_SHIP_CODE;
				retValue.title = "提示";
				retValue.msg = "装运点为空，请联系内勤！";
				
				return retValue;
			}
			
			if (unsamePoint) {
				retValue.code = ERROR_UNSAME_SHIP_CODE;
				retValue.title = "提示";
				retValue.msg = "装运点不一致，不能申请！";
				
				return retValue;
			}
		}
		
		var customerAmount = document.getElementById("customerAmount").value;
		var fCustomerAmount = parseFloat(customerAmount);
		var subAmout = fCustomerAmount - totalPrice;
		if (subAmout < 0) {
			retValue.code = ERROR_BEYOND_MONEY;
			retValue.title = "提示";
			retValue.msg = "余额不足(" + subAmout + ")，确定要继续申请吗？";
			
			return retValue;
		}
		
		document.getElementById("applyTotalTonNum").value = totalTonNum;
		document.getElementById("applyTotalPackNum").value = totalPackNum;
		
		retValue.code = SUCCESS;
		retValue.msg = "";
		
		return retValue;
	}

	function validateForm(){	
		var isSubmit= true;	
		
		var retValue = validateApplyTonNum();
		
		if(retValue.code != SUCCESS){
			return retValue;	
		}
		
		var notice = document.getElementById("shipNotice").value;
		console.log("notice=" + notice);
		if (notice != null && notice.length > 0) {
			notice = notice.replace(/\./g, "");
			document.getElementById("shipNotice").value = notice;
		}
		
		var caddrId=document.getElementById("caddrId").value;
		if(!caddrId || (parseInt(caddrId) == -1)){
			//document.getElementById("caddrIdTip").innerHTML="请选择或输入发货地址。";
			retValue.code = ERROR_ADDR_EMPTY;
			retValue.title = "提示";
			retValue.msg = "请选择发货地址";
			
			return retValue;
		}
		
		return retValue;
	}
	function submitForm() {
		if (isSumitForm) {
			return;
		}
		
		isSumitForm = true;
		
		for (var i = 0; i < codetailIdArray.length; i++) {
			var applyTonNumId = "applyTonNum" + i;
			var appliedAmountId = "appliedAmount" + i;
			var orderAmountId = "orderAmount" + i;
			var appliableAoumtId = "appliableAmount" + i;
					
			var applyTonNum=document.getElementById(applyTonNumId).value;
			applyTonNum=applyTonNum?applyTonNum:"0.0";
			
			var appliedAmount = document.getElementById(appliedAmountId).value;
			appliedAmount=appliedAmount?appliedAmount:"0.0";
			
			var newAppliedAmount=calculator.add(applyTonNum,appliedAmount);
			document.getElementById(appliedAmountId).value=newAppliedAmount;
			
			var appliableAmount = document.getElementById(appliableAoumtId).value;
			appliableAmount=appliableAmount?appliableAmount:"0.0";
			
			var orderAmount = document.getElementById(orderAmountId).value;
			orderAmount=orderAmount?orderAmount:"0.0";
			
			var newAppliableAmount=calculator.sub(orderAmount,newAppliedAmount);
			document.getElementById(appliableAoumtId).value=newAppliableAmount;
		}
		var switchElement = document.getElementById("isUrgent");
		if (!switchElement.checked) {
			switchElement.checked = true;
			switchElement.value = 0;
		}else {
			switchElement.value = 1;
		}
		
		document.getElementById("custOrderForm").submit();
	}
	function changeNum(){
		var applyTonNum=document.getElementById("applyTonNum").value;
			applyTonNum=applyTonNum?applyTonNum:"0.0";
			
			var appliedAmount = document.getElementById("appliedAmount").value;
			appliedAmount=appliedAmount?appliedAmount:"0.0";
			
			var newAppliedAmount=calculator.add(applyTonNum,appliedAmount);
			document.getElementById("showAppliedAmount").value=newAppliedAmount;
			
			var appliableAmount = document.getElementById("appliableAmount").value;
			appliableAmount=appliableAmount?appliableAmount:"0.0";
			
			var orderAmount = document.getElementById("orderAmount").value;
			orderAmount=orderAmount?orderAmount:"0.0";
			
			var newAppliableAmount=calculator.sub(orderAmount,newAppliedAmount);
			document.getElementById("showAppliableAmount").value=newAppliableAmount;
	}
	
	function getNewShipCode() {
		var curDate = new Date();

		var month = (curDate.getMonth()+1)<10?"0"+(curDate.getMonth()+1):(curDate.getMonth()+1);
		var day = curDate.getDate()<10?"0"+curDate.getDate():curDate.getDate();
		var hh = curDate.getHours()<10?"0"+curDate.getHours():curDate.getHours();
	    var mm = curDate.getMinutes()<10?"0"+curDate.getMinutes():curDate.getMinutes();
	    var ss = curDate.getSeconds()<10?"0"+curDate.getSeconds():curDate.getSeconds();
	    
	    var randomData = parseInt(10 + (Math.random() * 89));

//	    console.log("month=" + month);
//	    console.log("day=" + day);
//	    console.log("hh=" + hh);
//	    console.log("mm=" + mm);
//	    console.log("ss=" + ss);

	    var shipCode = "" + month + day + hh + mm + ss + randomData;

	    return shipCode;
	}