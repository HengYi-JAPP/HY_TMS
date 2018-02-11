/**
 * 有需要完善的：
 * 3）验证标签与text、textarea结合，方便使用
 * 
 * 所有验证规则需要包括如下五项：
 * 1）验证类型；
 * 2）验证器，可以是正规表达式，可以是自定义的对象，如是自定义对象需要实现test方法
 * 3）验证正常，即验证之前的提示信息；
 * 4）验证错误的提示信息；
 * 5）验证正确的提示信息；
 */
var __validate_rules=[      
	  {
	 	 type:"isnull",
	 	 tester:new isNull(), 
	 	 normal:"必填",
	 	 error:"该值不能为空",
	 	 correct:"输入正确"
	  },
	  {
		 	 type:"len",
		 	 tester:new vLen(), 
		 	 normal:"长度有限制",
		 	 error:"长度超出允许长度",
		 	 correct:"输入正确"
		  }, 
       {
      	 type:"number",
      	 tester:/^[0-9]*$/, 
      	 normal:"只能输入数字",
      	 error:"只能输入数字",
      	 correct:"输入正确"
       },  
       {
        	 type:"special",
        	 tester:/^[a-zA-z0-9\u4E00-\u9FA5]*$/, 
        	 normal:"不能包括特殊字符",
        	 error:"不能包括特殊字符",
        	 correct:"输入正确"
         },
         {
        	 type:"number-letter-underline",
        	 tester:/^[0-9a-zA-Z_]{1,}$/, 
        	 normal:"由数字、字母或者下划线组成的字符串",
        	 error:"包含数字、字母或者下划线之外的字符",
        	 correct:"输入正确"
         },
         {
        	 type:"non-negative-integer",
        	 tester:/^\d+$/,
        	 normal:"非负整数（正整数 + 0 ）",
        	 error:"请输入0或正整数",
        	 correct:"输入正确"
         },
         {
        	 type:"positive-integer",
        	 tester:/^[0-9]*[1-9][0-9]*$/, 
        	 normal:"请输入正整数",
        	 error:"请输入正整",
        	 correct:"输入正确"
         },
         {
        	 type:"non-positive-integer",
        	 tester:/^((-\d+)|(0+))$/, 
        	 normal:"非正整数（负整数 + 0）",
        	 error:"请输入0或负整数",
        	 correct:"输入正确"
         },
         {
        	 type:"negative-integer",
        	 tester:/^-[0-9]*[1-9][0-9]*$/,
        	 normal:"负整数",
        	 error:"请输入负整数",
        	 correct:"输入正确"
         },
         {
        	 type:"integer",
        	 tester:/^[0-9a-zA-Z_]{1,}$/,
        	 normal:"整数",
        	 error:"请输入整数",
        	 correct:"输入正确"
         },
         {
        	 type:"non-negative-float",
        	 tester:/^\d+(\.\d+)?$/, 
        	 normal:"非负浮点数（正浮点数 + 0）",
        	 error:"请输入正浮点数 或 0",
        	 correct:"输入正确"
         },
         {
        	 type:"positive-float",
        	 tester:/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/, 
        	 normal:"正浮点数",
        	 error:"请输入正浮点数",
        	 correct:"输入正确"
         },
         {
        	 type:"non-positive-float",
        	 tester:/^((-\d+(\.\d+)?)|(0+(\.0+)?))$/, 
        	 normal:"非正浮点数（负浮点数 + 0）",
        	 error:"请输入负浮点数 或 0",
        	 correct:"输入正确"
         },
         {
        	 type:"nagtive-float",
        	 tester:/^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/, 
        	 normal:"负浮点数",
        	 error:"请输入负浮点数",
        	 correct:"输入正确"
         },
         {
        	 type:"float",
        	 tester:/^(-?\d+)(\.\d+)?$/, 
        	 normal:"浮点数",
        	 error:"请输入浮点数",
        	 correct:"输入正确"
         },
         {
        	 type:"letter",
        	 tester:/^[A-Za-z]+$/, 
        	 normal:"由26个英文字母组成的字符串",
        	 error:"只能输入英文字母",
        	 correct:"输入正确"
         },
         {
        	 type:"upper-letter",
        	 tester:/^[A-Z]+$/, 
        	 normal:"由26个英文字母的大写组成的字符串",
        	 error:"只能输入大写字母",
        	 correct:"输入正确"
         },
         {
        	 type:"lower-letter",
        	 tester:/^[a-z]+$/, 
        	 normal:"由26个英文字母的小写组成的字符串",
        	 error:"只能输入小写字母",
        	 correct:"输入正确"
         },
         {
        	 type:"number-letter",
        	 tester:/^[A-Za-z0-9]+$/, 
        	 normal:"由数字和26个英文字母组成的字符串",
        	 error:"只能输入数字和字母",
        	 correct:"输入正确"
         },
        /* {
        	 type:"",
        	 tester:/^\w+$/, 
        	 normal:"由数字、26个英文字母或者下划线组成的字符串",
        	 error:"",
        	 correct:"输入正确"
         },*/
         {
        	 type:"email",
        	 tester:/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/, 
        	 normal:"email地址",
        	 error:"请输入正确的邮箱地址",
        	 correct:"输入正确"
         },
         {
        	 type:"mobile",
        	 tester:/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/, 
        	 normal:"手机号",
        	 error:"请输入正确的手机号",
        	 correct:"输入正确"
         },
         {
        	 type:"url",
        	 tester:/^[a-zA-z]+:\/\/(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$/, 
        	 normal:"url",
        	 error:"请输入正确的URL",
        	 correct:"输入正确"
         },
         {
        	 type:"year-month-day",
        	 tester:/^(?:(?!0000)[0-9]{4}([-/.]?)(?:(?:0?[1-9]|1[0-2])([-/.]?)(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])([-/.]?)(?:29|30)|(?:0?[13578]|1[02])([-/.]?)31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-/.]?)0?2([-/.]?)29)$/ , 
        	 normal:"日期格式：年-月-日、或 年/月/日、或 年.月.日、或 年月日",
        	 error:"请按日期格式：年-月-日、或 年/月/日、或 年.月.日、或 年月日，输入正确的日期",
        	 correct:"输入正确"
         },
         {
        	 type:"day-month-year",
        	 tester:/^(?:(?:(?:0?[1-9]|1[0-9]|2[0-8])([-/.]?)(?:0?[1-9]|1[0-2])|(?:29|30)([-/.]?)(?:0?[13-9]|1[0-2])|31([-/.]?)(?:0?[13578]|1[02]))([-/.]?)(?!0000)[0-9]{4}|29([-/.]?)0?2([-/.]?)(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00))$/ , 
        	 normal:"日期格式：日-月-年、或 日/月/年、或 日.月.年、或日月年",
        	 error:"请按日期格式：日-月-年、或 日/月/年、或 日.月.年、或日月年，输入正确的日期",
        	 correct:"输入正确"
         },
         
         {
        	 type:"date-time",
        	 tester:/^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)\s+([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/, 
        	 normal:"日期格式：年-月-日  时:分:秒",
        	 error:"请按格式：年-月-日  时:分:秒，输入正确的日期和时间",
        	 correct:"输入正确"
         },
         {
        	 type:"time",
        	 tester:/([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]/, 
        	 normal:"日期格式：时:分:秒",
        	 error:"请按日期格式：时:分:秒，输入正确的时间",
        	 correct:"输入正确"
         },
         /*{
        	 type:"",
        	 tester:/^([w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$/, 
        	 normal:"Email",
        	 error:"",
        	 correct:"输入正确"
         },*/
         {
        	 type:"phone",
        	 tester:/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/ , 
        	 normal:"电话号码",
        	 error:"请输入正确的电话号码",
        	 correct:"输入正确"
         },
         {
        	 type:"ip",
        	 tester:/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/, 
        	 normal:"IP地址",
        	 error:"请输入正确的IP地址",
        	 correct:"输入正确"
         },
         {
        	 type:"chinese",
        	 tester:/^[\u4E00-\u9FA5]+$/, 
        	 normal:"中文字符",
        	 error:"只能输入中文",
        	 correct:"输入正确"
         },
         {
        	 type:"double-byte",
        	 tester:/^[^\x00-\xff]+$/, 
        	 normal:"双字节字符",
        	 error:"只能输入双字节字符",
        	 correct:"输入正确"
         },         
         {
        	 type:"single-byte",
        	 tester:/^[\x00-\xff]+$/, 
        	 normal:"单字节字符",
        	 error:"只能输入字节字符",
        	 correct:"输入正确"
         },
         
         {
        	 type:"null-row",
        	 tester:/\n[\s| ]*\r/, 
        	 normal:"空行",
        	 error:"存在空行",
        	 correct:"输入正确"
         }        
         ];
 /**
  * 
  * @return
  */
 function __vruleInit(type,normal,error,correct){
	 if(__validate_rules){
		 var rules = null;
		 for(var i=0;i<__validate_rules.length;i++){
			 rules=__validate_rules[i];
			 if(i<10){
				 alert(type+",rules.type==type:");
			 }
			 if(rules.type==type){
				 __validate_rules[i].normal=normal;
				 __validate_rules[i].error=error;
				 __validate_rules[i].correct=correct;
				 break;
			 }
	 }
 }
/**
 * 添加测试规则到
 * @param vtype
 * @param vtester
 * @param vnormal
 * @param verror
 * @param vcorrect
 * @return
 */         
 function __vaddValidateRule(vtype,vtester,vnormal,verror,vcorrect){
		for(var i =0;i<__validate_rules.length;i++){
			if(__validate_rules[i].type==vtype){
				return false;
			}
		}
		__validate_rules[__validate_rules.length]= {type:vtype,tester:vtester, normal:vnormal,error:verror, correct:vcorrect};     
		return true;
}
         
/**
 * 判断值是否为空
 * 定义一个类型，该类型中实现test方法
 * @return
 */
function isNull(){
	var isnull = this;
	isnull.elementId =null;
	isnull.test = function(value){	
		//alert("isNull value="+value);
		if(value==null||value==""){
			return false;
		}
		if(value.toLowerCase()=="null"){
			return false;
		}
		value = value.replace(/(^\s*)|(\s*$)/g,""); //去除左右空格
		if(value==""){
			return false;
		}
		if(value.toLowerCase()=="null"){
			return false;
		}
		//alert("isNull value="+value+", value.length="+value.length);
		return true;
	}
}

/**
 * 元素的长度较验，元素必须要设置len属性才能效验
 * 只有text,textarea元素适用
 */
function vLen(){
	var len = this;
	
	len.test = function(value,elementId){	
		if(elementId==undefined ){
			return true;
		};
		if(elementId==null){
			return true;
		};
		if(elementId=="" ){
			return true;
		};
		var targetElement = document.getElementById(elementId);
		if(targetElement==undefined || targetElement==null ){
			return true;
		};		
		var len =targetElement.getAttribute("len");
		if(len==undefined ){
			return true;
		};
		if(len==null){
			return true;
		};
		if(len=="" ){
			return true;
		};
		if(value.length>parseInt(len)){  
        	return false;
        }
        return true;		
	};	
}

function Validator(){
	var validator = this;
	
	/*注册、登记所有的验证等级，有正常（刚开始时提示）、正确、错误*/
	validator.level={normal:"normal",correct:"correct",error:"error"};
	
	/*提示方式：1）box在元素后显示；2）dialog弹出对话框；3）print，通过document.write直接打印*/
	validator.tipStyle={box:"box",dialog:"dialog",print:"print"};
	/*
	 *  验证任务 
	 */
	validator.tasks=[];
	/*
	 * 记录已经绑定验证事件的表单
	 */
	validator.attachForms = [];

	/*
	 * 用户自定义消息
	 */
	validator.messages =[];

	/**
	 * 用户可以根据每个元素自定义各个提示信息
	 */
	validator.defineValidateType=function(myType,myTester,myNormal,myError,myCorrect){
		for(var i=0;i<__validate_rules.length;i++){
			if(__validate_rules[i].type==myType){
				return ;
			}
		}
		__validate_rules[__validate_rules.length]={type:myType,tester:myTester,normal:myNormal,error:myError,correct:myCorrect};
	};
	
	/**
	 * 用户可以根据每个元素自定义各个提示信息
	 */
	validator.defineMessage=function(elementId,type,level,content){
		if(elementId==undefined||elementId==null||type==undefined||type==null||level==undefined||level==null){
			return;
		}
		
		var tempMessage = null,isExist= false;
		for(var i =0;i<validator.messages.length;i++){
			tempMessage = validator.messages[i];
			if(tempMessage.elementId==elementId&&tempMessage.type==type&&tempMessage.level==level){
				tempMessage.content=content==undefined||content==null?"":content;
				isExist= true;
				break;
			}
		}
		if(isExist== false){
			validator.messages[validator.messages.length]=new ValidateMessage(type,level,content,elementId);
		}
	};
	/**
	 * 查找用户定义的提示信息
	 */
	validator.findDefineMessage=function(elementId,type,level){
		var message = null,possibleMessage=null;
		for(var i =0;i<validator.messages.length;i++){
			tempMessage = validator.messages[i];
			if(tempMessage.elementId==elementId&&tempMessage.level==level&&(tempMessage.type==null||tempMessage.type==""||tempMessage.type=="null")){
				/*
				 * 用户定义的消息不一定指明了验证类型，因此，将该消息作为备选消息
				 * */
				possibleMessage= tempMessage.content;	
			}
			if(tempMessage.elementId==elementId&&tempMessage.type==type&&tempMessage.level==level){
				message = tempMessage.content;				
				break;
			}
		}
		possibleMessage =possibleMessage ==undefined||possibleMessage==null?"":possibleMessage;
		//confirm("validator.messages.length="+validator.messages.length+", elementId="+elementId+", type="+type+", level="+level+", message="+message);
		return message ==undefined||message==null?possibleMessage:message;
	};
	
	validator.showMessage=function(elementId,type,level,message){
	
		var tempMessage = validator.findDefineMessage(elementId,type,level);
		if(tempMessage!=null&&tempMessage!=""&&tempMessage!="null"){
			message = tempMessage;
		}
		
		var messageBox = new ValidateMessageBox(level,message);
		
		messageBox.show(elementId);
	};
	 /**
	  * 名称：通用验证 
	  * 通过regex正则表达式验证elementId指定元素的值是否合法，
	  * 如果合法则返回信息数组中第一个元素，如果不合法，则返回信息数组中的第二个元素
	  * 因此，要注意正则表达验证的真假与信息数组位置的匹配。
	 **/ 
	validator.commonValidator=function(vRuleElement,elementId){
		if(document.getElementById(elementId)==undefined||document.getElementById(elementId)==null){
			return;
		}
		
	  	var value = document.getElementById(elementId).value;
	  	if(vRuleElement.type!="isnull"&&(value==null||value==""||value.length==0)){/*对于可空且没有修改过值的提示原有信息*/	  		
	  		validator.showMessage(elementId,vRuleElement.type,validator.level.normal,vRuleElement.normal)
	  		return true;
	  	}
	  	
	  	var tester = vRuleElement.tester;
	  	
	  	var result = tester.test(value,elementId);	/*elementId是附带的参数，对于正则式验证不起作用*/
	   
	  	var level = result?validator.level.correct:validator.level.error;
	  	var message = result?vRuleElement.correct:vRuleElement.error;
	  	
	  	
	  	validator.showMessage(elementId,vRuleElement.type,level,message);
	  	
	  	return result;	 	
	 };
	 
	
	/**
	 * 注册验证任务
	 * 所有需要验证元素都要通过该接口进行注册
	 */
	validator.regTask = function(formId,elementId,types,fireEvent,isSubmit,showNormal){
		
		
		validator.tasks[validator.tasks.length]= new ValidateTash(formId,elementId,types,fireEvent,isSubmit,showNormal);
		
		
		var targetElement = document.getElementById(elementId);
		if(targetElement==undefined || targetElement==null ||targetElement=="" || targetElement=="null"){			
		}else{
			var params = new Object(); 
			params.id = elementId;
			validator.attachEvent(targetElement,fireEvent,__vvalidate,params);
		}
		
		if(formId==undefined || formId==null ||formId=="" || formId=="null"){
			return;
		}
		var isExist = false;
		for(var i=0;i<validator.attachForms.length;i++){
			if(validator.attachForms[i]==formId){
				isExist = true;
			}
		}
		if(isExist==false){
			targetElement = document.getElementById(formId);
			if(targetElement==undefined || targetElement==null ||targetElement=="" || targetElement=="null"){
				return;
			}
			validator.attachForms[validator.attachForms.length]=formId;
			var params = new Object(); 
			params.id = formId;
			//alert("formId="+formId+" onsubmit");
			validator.attachEvent(targetElement,"onsubmit",__vvalidate,params);
			
		}
	};	
	
	validator.attachEvent=function(targetObj, eventName, handler, params){
	    var eventHandler = handler;

	    if(params){
	        eventHander = function(params){	        	
	            handler.call(targetObj,params);
	        }
	    }
	 
		if(targetObj.attachEvent){//IE
			targetObj.attachEvent(eventName, eventHander);
		}else{//FF
			targetObj.addEventListener(eventName.replace(/^on/, ""), eventHander,  false);
		}

	};
	validator.validator=function(type,elementId){
		var result=true,vRuleElement;
		for(var i=0;i<__validate_rules.length;i++){
			vRuleElement= __validate_rules[i];
			if(vRuleElement.type==type){
				result=validator.commonValidator(vRuleElement,elementId);
				break;
			}
		}
	   
	   return result;
	};
	validator.validate=function(task){
		var type = task.types;
		if(type==undefined || type==null ||type=="" || type=="null"){
			return true;
		}
		
		var result =false,tempType=null;
		var elementId = task.elementId;
		if(type.indexOf(",")==-1){
			validator.isCombine=false;
	 		result=validator.validator(type,elementId);
	 		return result;
	 	}else{
	 		types=type.split(",");
	 		for(var i = 0;i< types.length;i++){ 
		 		tempType = types[i];
		 		if(!tempType||tempType==""){
		 			continue;
		 		}
		 		result=validator.validator(tempType,elementId);
		 		//alert("validator.validate result="+result+", tempType="+tempType);
		 		if(result==false){
		 			return false;
		 		}
	 		}
	 		return true;
	 	}
	
	};
	validator.findTask = function(elementId){
		var tempTask =null;
		//confirm("validator.tasks.length="+validator.tasks.length);
		for(var i=0;i<validator.tasks.length;i++){
			tempTask =validator.tasks[i];
			//if(tempTask.elementId==elementId && tempTask.isPass==false&&tempTask.isSubmit==false){
			if(tempTask.elementId==elementId &&tempTask.isSubmit==false){
				return tempTask;
			}
		}
		return null;
	};
	/**
	 * 先根据元素id查找验证任务
	 * 然后再根据任务执行验证
	 * 
	 */
	validator.validateElement=function(elementId){
		if(elementId==undefined || elementId==null ||elementId=="" || elementId=="null"){
			return true;
		}
		
		var tempTask = validator.findTask(elementId);
		
		if(tempTask==null){
			return true;
		}
		
		var result = validator.validate(tempTask);
		
		//if(result==true){
		//记录单一校验的结果，后面表单提交时需要进行检测
			tempTask.isPass = result;
		//}
		return result;
	};
	/**
	 * 获得表中所有需要验证的元素
	 */
	validator.findFormTask = function(formId){
		var tempTask =null;
		var formTasks = [];
		for(var i=0;i<validator.tasks.length;i++){
			tempTask =validator.tasks[i];
			if(tempTask.formId==formId){
				formTasks[formTasks.length]= tempTask;
			}
		}
		return formTasks;
	};
	/**
	 * 验证表单中的所有元素，如果均验证通过，则返回true，否则返回false;
	 */
	validator.validateForm=function(formId){
		if(formId==undefined || formId==null ||formId=="" || formId=="null"){
			return true;
		}
		var formTasks = validator.findFormTask(formId);
		//alert("formTasks.length="+formTasks.length);
		var tempTask = null,result=false,validateResult = true;
		for(var i=0;i<formTasks.length;i++){
			tempTask = formTasks[i];
			if(tempTask.isPass==true){
				continue;
			}
			result = validator.validate(tempTask);
			//alert("validate result="+result);
			if(result==true){
				tempTask.isPass = result;
				continue;
			}else{
				/*
				 * 让所有表单元素均验证一遍，所以没有直接返回false;
				 */
				validateResult=false;
			}
		}
		return validateResult;
	};
	validator.showNormal=function(){
		var tempTask =null;
		var types = null,type,normalMessage=[],message;	 	
		for(var i=0;i<validator.tasks.length;i++){
			tempTask =validator.tasks[i];
			if(tempTask.showNormal==undefined||tempTask.showNormal==false){
				continue;
			}
			type = tempTask.types;
			types = new Array();
		 	if(type.indexOf(",")==-1){
		 		types[0]=type;
		 	}else{
		 		types=type.split(",");
		 	}
		 	
		 	normalMessage= [];
		 	for(var k =0;k<types.length;k++){
		 		tempMessage = validator.findDefineMessage(tempTask.elementId,types[k],validator.level.normal);
		 		
		 		if(tempMessage==""||tempMessage=="null"){
			 		for(var j=0;j<__validate_rules.length;j++){				
						if(__validate_rules[j].type==types[k]){	
							normalMessage[normalMessage.length]= __validate_rules[j].normal;
							break;
						}
					}
		 		}else{
		 			normalMessage[normalMessage.length]=tempMessage;
		 		}
			}
			if(normalMessage.length<1){
				continue;
			}
			if(normalMessage.length==1){
				message= normalMessage[0];
			}else{
				message="请按如下要求输入：";
				
				for(var n=0;n<normalMessage.length;n++){
					message=message+(n+1)+")"+normalMessage[n]+"； ";
				}
			}
			//confirm("type="+type);
			//validator.showMessage(types[0],validator.level.normal,tempTask.elementId);
			validator.showMessage(tempTask.elementId,null,validator.level.normal,message);
		}//for
	
		
		
	};

}
/**
 * 定义验证任务
 * @param formId 验证表单ID
 * @param elementId 验证元素ID
 * @param types 验证类型，多个类型可能通过逗号分隔
 * @param fireEvent 触发事件，在isSubmit时无效
 * @param isSubmit 是否在表单提交时进行验证
 * @return
 */
function ValidateTash(formId,elementId,types,fireEvent,isSubmit,showNormal){
	var task = this;
	task.formId =formId==undefined||formId==null?"":formId;
	task.elementId= (elementId==undefined||elementId==null?"":elementId);
	task.types =types==undefined||types==null?"":types;
	task.fireEvent =fireEvent==undefined||fireEvent==null?"":fireEvent;
	task.isSubmit =isSubmit==undefined||isSubmit==null?false:isSubmit;
	task.showNormal =showNormal==undefined||showNormal==null?false:showNormal;
	
	/*
	 * 是否验证通过标识
	 */
	task.isPass=false;
}
/**
 * 自定义消息
 * @param type
 * @param level
 * @param content
 * @param elementId
 * @return
 */
function ValidateMessage(type,level,content,elementId){
	var message = this;
	message.type=type==undefined||type==null?"":type;
	message.level=level==undefined||level==null?"":level;
	message.content=content==undefined||content==null?"":content;
	message.elementId=elementId==undefined||elementId==null?"":elementId;
}

/**
 * 验证消息显示盒定义
 * @param message
 * @return
 */
function ValidateMessageBox(level,message){

	var messageBox = this;
	/*
	 * 要显示的消息
	 */
	messageBox.message = message;
	
	messageBox.level = level;
	
	/*
	 * 消息盒的后后缀
	 */
	messageBox.boxSuffix="_vmsgbox";
	
	/**
	 * 获取左上角坐标的x坐标值
	 */
	messageBox.getXaxis =function (obj){   
		 var ParentObj=obj;   
		 var left=obj.offsetLeft;   
		 while(ParentObj=ParentObj.offsetParent){   
		  left+=ParentObj.offsetLeft;   
		 }   
		 return left;   
	}; 
	/**
	 * 获取左上角坐标的y坐标值
	 */
	messageBox.getYaxis = function (obj){   
		 var ParentObj=obj;   
		 var top=obj.offsetTop;   
		 while(ParentObj=ParentObj.offsetParent){   
		  top+=ParentObj.offsetTop;   
		 }   
		 return top;   	
	};
		
	messageBox.show = function(elementId){
		var msgBoxId = elementId + messageBox.boxSuffix;
		
		var msgBox =document.getElementById(msgBoxId);//this.getMessgeBox(elementId);
		if(msgBox){
			document.body.removeChild(msgBox);			 
		}
		msgBox=document.createElement("div"); 
		msgBox.id=msgBoxId;	

		document.body.appendChild(msgBox);
		
		msgBox.className=messageBox.level+"-messsbox-validator";
				
		var validateElementObj=document.getElementById(elementId); 
		var top=messageBox.getYaxis(validateElementObj);   
		var left=messageBox.getXaxis(validateElementObj); 
		//var bottom=top+28;
		var leftSpan = 20;
		
		left = left+validateElementObj.offsetWidth+leftSpan;
		
		msgBox.style.top = top;
		msgBox.style.left = left;
		//msgBox.style.bottom = bottom;	
		
		msgBox.innerHTML=messageBox.message;//"<font class='font-"+messageBox.message.level+"-messsbox-validator'/>"+messageBox.message.content+"</font>";	
	};	
}

/**
 * ----------------------------------------------------------------------------------------------
 * 交换接口定义
 * ----------------------------------------------------------------------------------------------
 */
/*
 * 验证器全局变量
 */
var __vValidator = new Validator();
/**
 * 验证任务注册入口
 */
function __vtask(formId,elementId,types,fireEvent,isSubmit,showNormal){
	__vValidator.regTask(formId,elementId,types,fireEvent,isSubmit,showNormal);
}
/**
 * 验证消息定义接口
 * elementId,type,level,content
 */
function __vmessage(elementId,type,level,content){
	__vValidator.defineMessage(elementId,type,level,content);
}
function __vrule(type,tester,normal,error,correct){
	__vValidator.defineValidateType(type,tester,normal,error,correct);
}
/**
 * 表单及其元素的验证入口
 * 
 * 所有需要通过该方法验证的元素，首先均需要通过__vtask注册，注册之后系统会自动绑定调用
 */
function __vvalidate(e){
	//confirm(this.id);
	//confirm("__vvalidate:elementId="+elementObj.target);
	var elementId = this.id;
	if(elementId==undefined || elementId==null){
		return true;
	}
	var elementObj=document.getElementById(elementId);
	if(elementObj==undefined || elementObj==null){
		return true;
	}
	
	//confirm("elementObj.tagName="+elementObj.tagName);
	if(elementObj.tagName=="FORM"){
		//var vresult= __vValidator.validateForm(elementObj.id);
		//confirm("vresult="+vresult);
		//return vresult;
	}else{
		return __vValidator.validateElement(elementObj.id);
	}
}

function __vshownormal(){
	__vValidator.showNormal();
}


function __vsubmit(formId){  
	var vresult= __vValidator.validateForm(formId);
	
	if(vresult){
		var elementObj=document.getElementById(formId);
		elementObj.submit();
	}
}