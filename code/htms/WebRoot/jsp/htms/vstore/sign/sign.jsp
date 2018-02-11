<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.mobilecn.utils.random.IntRandom"%>
<%@page import="tools.tool"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String fileDir = tools.tool.DateUtil.getFormatDate("yyyyMMdd");


String transportId = (String)request.getParameter("transportId"); 
String wxOpenId = (String)request.getParameter("wxOpenId");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<title></title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-fileinput.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=path %>/jsp/htms/mobile/css/zdialog.css" type="text/css">
</head>
<body>
  <form name="signForm" action="" method="POST" enctype="multipart/form-data">
  <input id="signTime" name="signTime" value="<%=tools.tool.getDateTime() %>" type="hidden"/>
  <div class="top">
	  <div class="top-left"><a href="<%=path %>/contoller.do?operation=listWaitForSend&wxOpenId=<%=wxOpenId %>"><img src="<%=path %>/jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
	  <div class="top-center" >上传图片</div>
   	</div>
		 <div class="form-group" id="uploadForm" enctype='multipart/form-data'>
                <%
                	for(int i = 0;i < 4;i++){
                 %>
                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                    <div class="fileinput-new thumbnail" style="width: 50%;height: 100px;max-height:100px;">
                        <img id='picImg' style="width: 100%;height: auto;max-height: 100px;" src="images/noimage.png" alt="" />
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 100%; max-height: 100px;"></div>
                    <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="pic1" id="pic_<%=i %>" accept="image/gif,image/jpeg,image/x-png,image/jpg,image/jpep2000,image/png">
                        </span>
                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                    </div>
                </div>
				 
               <%} %>
            </div>
            <div style="width: 100%;text-align: center;margin-bottom: 10px;">
            	<button type="button" id="uploadSubmit" class="btn btn-info" onclick="uploadPic();" style="width: 100px;"><img src="images/loading.gif" id="img" style="display: none; width: 20px;float:left;"></img>提交</button>
			</div>
	</form>
	
	<script src="js/fileinput.min.js"></script>
	<script src="js/bootstrap-fileinput.js"></script>
	<script type="text/javascript" src="<%=path %>/resources/simpleupload/jquery-min.js"></script>
	<script type="text/javascript" src="<%=path %>/resources/simpleupload/fileupload.js"></script>
	<script src="<%=path %>/jsp/htms/mobile/js/Ajax.js" ></script>
	<script type="text/javascript">
		
		var maxPic = 4;
		var uploadSuccPic = 0;
		var picsMap = {};
		var uploadSuccIndex = [];
		
		function uploadPic() {
			
			
		
			var fileDir = <%= fileDir%>;
			var fileName = "";
			var fileId = "";
			
			var i;
			for (i = 0; i < maxPic; i++) {
				fileId = "pic_" + i;
				fileName = getPicName(i, fileId, fileDir);
				
				if (fileName == null) {
					uploadSuccPic++;
					
					continue;
				}
				
				simplePicUploader(fileId, fileDir, fileName, i);
			}			
			
			//simplePicUploader(fileId, fileDir, fileName);
		}
	
		//上传照片
		function simplePicUploader(fileId, fileDir, fileName, index){			
			var url = "<%=basePath %>";
			url += "/uploader?isSimpleUpload=true";

			/*上传子目录*/
			url=url+"&uploadSubDir=" + fileDir;
			
			url += "&fileReName=" + fileName;
		    
			var _fileElementId = fileId;
			$.ajaxFileUpload({
		        url:url,
		        secureuri:false,//
		        fileElementId:_fileElementId,//文件上传空间的id属性 <input type="file" id="file" name="file" />
		        dataType: 'json',
		        success: function (data, status){	
					//alert("11111111");
					var data =eval(data);
					//alert("11111111 data.successFlag="+data.successFlag);
		        	if(data){
		        		if(data.successFlag){
		        			//alert("111111"+data.message);
		        			uploadPicSucc(index);
		        		}
		        		
		        	}
		        },
		        error: function (data, status, e){
		        	alert("22222"+data.message);
		        	processUpload(index);
		        }
			});
		}
		
		//图片上传完成后的处理
		function uploadPicSucc(index) {
			uploadSuccPic++;
			
			uploadSuccIndex.push(index);
			
			if (uploadSuccPic >= maxPic) {
				processUpload();
			}
			
		}
		function uploadPicFail(index) {
			uploadSuccPic++;
				
			if (uploadSuccPic >= maxPic) {
				processUpload();
			}
		}
		function processUpload() {
			if (uploadSuccIndex.length <= 0) {
				alert("图片上传失败");
				
				return;
			}
			
			var i, j;
			var index;
			var picName;
			var transportId=<%=transportId%>;
			var signTime = document.getElementById("signTime").value;
			var uploaded = false;
			var fullPic = "";
			for (i = 0; i < maxPic; i++) {
				uploaded = false;
				
				for (j = 0; j < uploadSuccIndex.length; j++) {
					index = uploadSuccIndex[j];
					
					if (index == i) {
						picName = picsMap[index];
						uploaded = true;
						break;
					}					
				}
			
				if (uploaded) {
					if (fullPic.length > 0) {
						fullPic += "&" + picName;
					}else {
						fullPic += picName;
					}
				}else {
					if (fullPic.length > 0) {
						fullPic += "&";
					}
				}
			}
			var basePath = "<%=basePath %>" + '/controller.do';
			var params = {operation:'sign', transportId:transportId, picList:fullPic,signTime:signTime};
			Ajax.get(basePath, params, function(msg){	
                  		var msgObj = JSON.parse(msg);
                  		if ( parseInt(msgObj.isSuccess) == 1) {
                  			window.location.href ="<%=basePath %>" + "/jsp/htms/vstore/list.jsp?wxOpenId=<%=wxOpenId %>";
                  		}else {
                  			alert("保存失败，请稍后再试");
                  			//$.DialogByZ.Alert({Title: "提示", Content: "保存失败，请稍后再试",BtnL:"确定",FunL:alerts});
                  		}			
                 });
			
			//alert(fullPic);
		}			
				
		//获取图片名称
		function getPicName(index, fileId, fileDir) {
			var picFullPath = document.getElementById(fileId).value;
			if (picFullPath == null || picFullPath==undefined || picFullPath=='') {
				return null;
			}
			
			picFullPath = picFullPath.replace(/\\/g, "/");
			var pathComp = picFullPath.split("/");
			var picName = pathComp[pathComp.length - 1];
			
			var picExts = picName.split(".");
			var picExt = "";
			var transportId = "<%=transportId%>";
			if (picExts.length > 1) {
				picExt = picExts[picExts.length -1];
			}
			
			var newPicName = transportId + "_" + index + "_" + getNewPicName();
			submit(newPicName);
			picsMap[index] = fileDir + "/" + newPicName + "." + picExt;
			
			return newPicName;
		}
		
		//点击提交按钮显示加载图片
		function submit(picPath){
			if(picPath != null){
				document.getElementById("img").style.display = "block";
			}
		}
		
		function getNewPicName() {
			var curDate = new Date();
	
			var month = (curDate.getMonth()+1)<10?"0"+(curDate.getMonth()+1):(curDate.getMonth()+1);
			var day = curDate.getDate()<10?"0"+curDate.getDate():curDate.getDate();
			var hh = curDate.getHours()<10?"0"+curDate.getHours():curDate.getHours();
		    var mm = curDate.getMinutes()<10?"0"+curDate.getMinutes():curDate.getMinutes();
		    var ss = curDate.getSeconds()<10?"0"+curDate.getSeconds():curDate.getSeconds();
		    
		    var randomData = parseInt(10 + (Math.random() * 89));
	
		    var picName = "" + month + day + hh + mm + ss + randomData;
	
		    return picName;
		}
	
	</script>
	
</body>
</html>
