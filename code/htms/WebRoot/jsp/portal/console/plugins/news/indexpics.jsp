<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" switchButton=""/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	
		
		<!-- list box 内容列表区 -->
		<html:div id="showPicList">
		</html:div>	
	</body>
</html>

 <script>  
 	var imgList = getImgList();
 	 function getImgPath(path){
        	if(!path){
        		return "";
        	}
        	var oldPath = path;
        	var regExp =new RegExp(" ","g");
        	path=path.replace(regExp,'');
        	path=path.replace('SRC="','src="');        	
        	path=path.replace('Src="','src="');
        	var tempPath = path;//.toLowerCase();
        	var begingIndex = tempPath.indexOf('src="');
        	begingIndex =begingIndex==-1?tempPath.indexOf("src='"):begingIndex;
        	//begingIndex =begingIndex==-1?tempPath.indexOf("src="):begingIndex;
        	if(begingIndex==-1){
        		return oldPath;
        	}
        	tempPath=tempPath.substring(begingIndex+5,tempPath.length);
        	
        	begingIndex = tempPath.indexOf('"');
        	begingIndex =begingIndex==-1?tempPath.indexOf("'"):begingIndex;
        	if(begingIndex==-1){
        		return oldPath;
        	}
        	return  tempPath.substring(0,begingIndex);
        }
		function showImgList(){
	        if(!imgList||imgList.length==0){
	        	return;
	        }
	        var showList="";
	        showList=showList+"<table style='dgbackground'  cellSpacing='0'  border='1'  style='width: 100%;; border-collapse: collapse;' align='center'>";
	        	
	        for (var i=0;i<imgList.length ;i++ )
	        {showList=showList+"<tr>";
	        	showList=showList+"<td>";
	        	showList=showList+"<input type='radio' name='indexpic' onclick='selectIndexPic("+i+");'/>";
	        	showList=showList+"</td>";
	        	showList=showList+"<td><img style='width:200px;height:150px;' src='"+getImgPath(imgList[i])+"'/>";
	        	//showList=showList+"<td>"+imgList[i]+"";
	        	showList=showList+"</td>";
	        	showList=showList+"</tr>";
	        }
	        showList=showList+"</table>";
	        document.getElementById("showPicList").innerHTML=showList;
        }
       
		 function selectIndexPic(index){
		 	var imgPath=getImgPath(imgList[index]);
		 	var contextPath="<%=path%>";
		 	//imgPath=imgPath.replace(contextPath,"");
		 	parent.document.getElementById("indexPic").value=imgPath.replace(contextPath,"");
		 	parent.document.getElementById("showIndexPic").innerHTML="<img style='width:200px;height:150px;' src='"+imgPath+"'/>";;
		 }
		 function getImgList(){	
		 	var htmlContent ="";
		 	if(parent.editor){
		 		htmlContent=parent.editor.document.getBody().getHtml();
		 	}	
			
			
			if(!htmlContent){
				return []
			}
			var regExp =new RegExp("<img.*?>","ig");///<img.*?>/ig;
			return htmlContent.match(regExp);
         }
         showImgList();
    </script> 


