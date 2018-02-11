<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="resources/simpleupload/jquery-min.js" ></script>
<script src="js/htms/dialog/dialog.js" ></script>
<link rel="stylesheet" href="css/htms/dialog/dialog.css" type="text/css"/>
<script>
	var $jq = jQuery.noConflict(true);
	function alerts(){
	  	$jq.DialogByZ.Close();
	}
	function alertTip(content){
		 $jq.DialogByZ.Alert({Title: "提示", Content:content,BtnL:"确定",FunL:alerts});
	}
	function confirmTip(content,sureCallBack,cancleCallBack){
		$jq.DialogByZ.Confirm({Title: "提示", Content: content,FunL:function() {
	  				$jq.DialogByZ.Close();
	  				sureCallBack();
	  			},FunR:function(){
	  				$jq.DialogByZ.Close();
	  				cancleCallBack();
	  			}});
	}
	
</script>