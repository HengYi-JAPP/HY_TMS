function showOrHideForm(showFormId,displayId,radioObj){
        //alert("ddd");
     
        $("#"+displayId+"1").hide();   
        $("#"+displayId+"2").hide();
        
        $("#"+showFormId+"1").show();
        $("#"+showFormId+"2").show();
        
		//document.getElementById(showFormId+"1").style.display="block";
		//document.getElementById(showFormId+"2").style.display="block";
	    //document.getElementById(displayId+"1").style.display="none";
	    //document.getElementById(displayId+"2").style.display="none";
	    
	    var taskType=radioObj.value;
	    var unitTime=1;
	    //
	    if(taskType=="1"){
	        unitTime=$("#taskTimeUnitInteravl").val();
	    }
	    if(taskType=="2"){
	        //unitTime=$("#taskTimeUnitCycle").val();
	        //unitTime=$('#taskTimeUnitCycle option:selected') .val();
	        var obj = document.getElementById("taskTimeUnitCycle"); //定位id
	        var index = obj.selectedIndex; // 选中索引
	        var text = obj.options[index].text; // 选中文本
	        
	        unitTime = obj.options[index].value; // 选中值
	        
	        //alert("taskType  :  "+taskType+"unitTime:   "+unitTime);
	    }
	    //alert("taskType2211 :  "+taskType+"unitTime:   "+unitTime);
	    if(unitTime!=null&&unitTime!=""&&unitTime!="undefined"){
	       document.getElementById("taskTimeUnit").value=unitTime;
	    }
    } 

function showOrHideForm1(showFormId,displayId){
    //alert("ddd");
 
    $("#"+displayId+"1").hide();   
    $("#"+displayId+"2").hide();
    
    $("#"+showFormId+"1").show();
    $("#"+showFormId+"2").show();
}
    
    function hideOrShowTime(selectObj ){        
        var timeType=selectObj.value;
        if(timeType=="5"){
            $("#hourId").show();
            $("#hourTxt").show();
            $("#minuteId").show();
            $("#minuteTxt").show();
        }
        if(timeType=="4"){
            $("#hourId").hide();
            $("#hourTxt").hide();
            $("#minuteId").show();
            $("#minuteTxt").show();
        }
        if(timeType=="3"){
            $("#minuteId").hide();
            $("#minuteTxt").hide();
        }
        unitChange(selectObj);
        changeValue();
    }
    
    function unitChange(unitObj){
        var unitTime=unitObj.value;
        document.getElementById("taskTimeUnit").value=unitTime;
    }
    //'cycleInputForm','interavlInputForm'
    function changeValue(){
          var hour   =  $("#hourId").val();
          var minute =  $("#minuteId").val();
          var second =  $("#secondId").val();
          var value="";
          var timeType = $("#taskTimeUnit").val();
          //alert(timeType +"  taskvalue =     "+  value);
          if(timeType==null&&timeType==""&&timeType=="undefined"){
              document.getElementById("taskTimeUnitCycle").select[0]="selected";
              document.getElementById("taskTimeUnit").value=5;
              timeType=5;
          }
         
          if(timeType=="5"&&hour!=null&&hour!=""&&hour!="undefined"){
                     value=value+hour+":";
	      }
          if((timeType=="5"||timeType=="4")&&minute!=null&&minute!=""&&minute!="undefined"){
                     value=value+minute+":";
	      } 
	      if(second!=null&&second!=""&&second!="undefined"){
                     value=value+second;
	      } 
	      //alert("taskvalue =     "+  value);
	      document.getElementById("taskValue").value=value;
    }
    
    function validateTime(){
          var hour   =  $("#hourId").val();
          var minute =  $("#minuteId").val();
          var second =  $("#secondId").val();
          
          var value="";
          var taskType= $("#taskType").val();
          if(taskType=="1"){
              return true;
          }
          var timeType = document.getElementById("taskTimeUnit").value;
          if(timeType==null&&timeType==""&&timeType=="undefined"){
             alert("请选择时间单位");
             return ;
          }
          if(timeType=="5"&&hour!=null&&hour!=""&&hour!="undefined"){
              if(parseInt(hour)>=0||parseInt(hour)<24){
                     value+=hour+":";
              }else{
                 alert("执行时间 小时输入应该输入为0到23的整数!");
                 return false;
              }
	         
	      }else{
	          alert("请输入执行时间小时数!");
	      }
          if((timeType=="5"||timeType=="4")&&minute!=null&&minute!=""&&minute!="undefined"){
              if(parseInt(minute)>=0||parseInt(minute)<60){
                     value+=minute+":";
              }else{
                  alert("执行时间 分钟输入应该输入为0到59的整数!");
                  return false;
              }
	          
	      } else{
	          alert("请输入执行时间分钟数!");
	      }
	      if(second!=null&&second!=""&&second!="undefined"){
	          if(parseInt(second)>=0||parseInt(second)<60){
                     value+=second+":";
              }else{
                  alert("执行时间 秒钟输入应该输入为0到59的整数!");
                  return false;
              }
	      } else{
	          alert("请输入执行时间秒钟数!");
	      }
	      //  alert("taskvalue = 2   "+  value);
	      document.getElementById("taskValue").value = value;
	      return true;
    }