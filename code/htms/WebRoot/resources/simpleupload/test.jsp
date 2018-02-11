<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<body>
<FORM NAME="TEST" ACTION=" ">
<div>
<input type="file" id="selectFile" name="selectFile" style="width: 80px;" contentEditable="false"/>
<input type="button" id="uploadZpBtn" value="上传" onclick="fileUpload('selectFile','<%=basePath %>fileupload/?uploadType=');"/>
</div>
<FORM>
</body>
</html>


		<script type="text/javascript">		
				
		
		// JavaScript Document

		function createUploadIframe (id,url) {
		//create frame
				var frameId = 'jUploadFrame' + id;

				var io = document.createElement('iframe');
				//var io = document.createElement('<iframe id="'
				//				+ frameId + '" name="' + frameId + '" />');
					io.id = frameId;
					io.name = frameId;
					//io.src=url;
					
				io.style.position = 'absolute';
				io.style.top = '-1000px';
				io.style.left = '-1000px';

				document.body.appendChild(io);

				return io;
			}
			
		function createUploadForm (id, fileElementId) {
				//create form 
				var formId = 'jUploadForm' + id;
				var fileId = 'jUploadFile' + id;
				var form = document.createElement('form');
				form.action="";
				form.id=formId;
				form.name=formId;
				form.method="POST";
				form.enctype="multipart/form-data";
				
				
				var oldElement = document.getElementById(fileElementId);
				var newElement = oldElement.cloneNode(true);//jQuery(oldElement).clone();
				//alert(newElement.tagName);
				//if(document.getElementById(fileElementId)&&document.getElementById(fileElementId).parentNode){
					oldElement.parentNode.insertBefore(newElement,oldElement);
				//}
				form.appendChild(oldElement);
				form.style.cssText="position:absolute;top:-1200px;left:-1200px;";
				form.style.position = 'absolute';
				form.style.top = '-1200px';
				form.style.left = '-1200px';
				//set attributes				
				document.body.appendChild(form);
				return form;
			}
var frameId =null;
			function fileUpload(fileElementId,url) {
				// TODO introduce global settings, allowing the client to modify them for all requests, not only timeout  
				//s = jQuery.extend( {}, jQuery.ajaxSettings, s);
				var id = fileElementId;
				var form = createUploadForm(id, fileElementId);
				var io = createUploadIframe(id,url);
				 frameId = 'jUploadFrame' + id;
				var formId = 'jUploadForm' + id;


				
				try {
					var form = document.getElementById(formId);
					form.action=url;
					form.target=frameId
					
					if (form.encoding) {
						form.encoding = 'multipart/form-data';
					} else {
						form.enctype = 'multipart/form-data';
					}
					form.submit();

				} catch (e) {
					alert(e);
				}
				if (window.attachEvent) {
					document.getElementById(frameId).attachEvent('onload',
							uploadCallback);
				} else {
					document.getElementById(frameId).addEventListener('load',
							uploadCallback, false);
				}
				

			}

		var uploadCallback = function(isTimeout) {
					// Wait for a response to come back 
					var io = document.getElementById(frameId);
					var responseText = null;
					try {
						if (io.contentWindow) {
							responseText = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML
									: null;
							//responseXML = io.contentWindow.document.XMLDocument ? io.contentWindow.document.XMLDocument
							//		: io.contentWindow.document;

						} else if (io.contentDocument) {
							responseText = io.contentDocument.document.body ? io.contentDocument.document.body.innerHTML
									: null;
							//xml.responseXML = io.contentDocument.document.XMLDocument ? io.contentDocument.document.XMLDocument
							//		: io.contentDocument.document;
						}
					} catch (e) {
						alert(e);
					}
					if (responseText ) { 
					
						//var httpText = xml.responseText;
						alert("responseText="+responseText);
						var datas = eval(responseText);
						
						//unbind
						if (window.attachEvent) {
							document.getElementById(frameId).attachEvent('onload',null);
						} else {
							document.getElementById(frameId).addEventListener('load',null, false);
						}
						io.parentNode.removeChild(io);
						form.parentNode.removeChild(form);
						
						xml = null;

					}
					;
				}

		</script>
