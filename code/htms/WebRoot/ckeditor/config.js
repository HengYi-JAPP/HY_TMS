/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	config.extraPlugins += (config.extraPlugins ?',lineheight' :'lineheight');//扩展行距插件
	config.language = 'en';
	// config.toolbar = 'Full'; //有Full和Basic基本属性。也可以详细配置	
    config.toolbar_Full = [
                           ['Source','-','Preview','-','Cut','Copy','Paste','PasteText','PasteFromWord','-', 'Scayt','RemoveFormat'],
                           ['Image','Table','HorizontalRule','SpecialChar','PageBreak','Link','Unlink'],
                           ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
                           ['TextColor','BGColor'],
                           ['Bold','Italic','Underline','Strike','-'],
                           '/',
                           ['Subscript','Superscript','NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
                           ['Styles','Format','FontSize','lineheight']//,'Font'
                            
                        ]; 

    config.skin = 'office2003';  // 编辑器样式，有三种：'kama'（默认）、'office2003'、'v2'  
    // config.entities = true; //是否使用HTML实体进行输出 plugins/entities/plugin.js
    // 取消 “拖拽以改变尺寸”功能 
    config.resize_enabled = true;
    config.height = 640;
    config.linkShowAdvancedTab = false; // 隐藏超链接的高级标签页
    config.linkShowTargetTab = false; // 隐藏超链接的目标标签页
    // 新增属性，定义超链接默认target属性
    config.linkTargetDefault = '_blank';
    
    // 上传图片的功能只保留从本地上传并且不对图片做任何的修改，类似于直接插入图片
    config.uploadLocalImageOnly = false;
    
    config.fullPage = true;
    config.baseHref="http://localhost:8080/mysite/";
    config.filebrowserBrowseUrl = 'ckfinder/ckfinder.html';  
    config.filebrowserImageBrowseUrl = 'ckfinder/ckfinder.html?type=Images';  
    config.filebrowserFlashBrowseUrl = 'ckfinder/ckfinder.html?type=Flash';  
    config.filebrowserUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';  
    config.filebrowserImageUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';  
    config.filebrowserFlashUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';  
    // config.filebrowserWindowWidth = '1000';
   // config.filebrowserWindowHeight = '700';
   config.image_previewText = "示例文字示例文字示例文字示例文字示例文字示例文字示例文字示例文字示例文字";
   //config.font_names = '宋体;仿宋;楷体;微软雅黑';
   // 字体
   config.font_defaultLabel = '宋体';
   // 字体大小
   config.fontSize_defaultLabel = '14';
   
   config.lineheight_defaultLabel = '30px';
    //是否强制复制来的内容去除格式
	//config.forcePasteAsPlainText =true;//去除
	//是否使用等标签修饰或者代替从word文档中粘贴过来的内容
	// config.pasteFromWordKeepsStructure = true;
	//从word中粘贴内容时是否移除格式
	//config.pasteFromWordRemoveStyles = true;
	
	//config.pasteFromWordRemoveFontStyles = true;
	// 去掉粗体
	config.pasteFromWordRemoveBold = true;
	// 去掉空段
	config.pasteFromWordRemoveEmptyParagraph = true;
	// 段落缩进
	config.pasteFromWordIndentation = true;
	// 缩进量
	config.pasteFromWordIndent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	
	// 提示是否清除格式
	//config.pasteFromWordPromptCleanup = true;
	
	//config.pasteFromWordNumberedHeadingToList = true;
	//config.pasteFromWordIgnoreFontFace = false;
};
