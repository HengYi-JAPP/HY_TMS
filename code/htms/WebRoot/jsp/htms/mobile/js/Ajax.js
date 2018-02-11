var Ajax = {
		
	ajax:function(options){
		options = options || {};
		options.type = (options.type || "GET").toUpperCase();
		options.dataType = options.dataType || "json";
		var params = formatParams(options.data);
		
		console.log('in ajax');
		
		//创建 - 非IE6 - 第一步
		if (window.XMLHttpRequest) {
		    var xhr = new XMLHttpRequest();
		} else { //IE6及其以下版本浏览器
		    var xhr = new ActiveXObject('Microsoft.XMLHTTP');
		}
		
		//接收 - 第三步
		xhr.onreadystatechange = function () {
			console.log('in onreadystatechange');
		    if (xhr.readyState == 4) {
		        var status = xhr.status;
		        if (status >= 200 && status < 300) {
		        	console.log(xhr);
		           // options.success && options.success(xhr.responseText, xhr.responseXML);
		        	options.success && options.success(xhr.responseText);
		        } else {
		            options.fail && options.fail(status);
		        }
		    }
		}
		
		//连接 和 发送 - 第二步
		if (options.type == "GET") {
		    xhr.open("GET", options.url + "?" + params, true);
		    xhr.send(null);
		} else if (options.type == "POST") {
		    xhr.open("POST", options.url, true);
		    //设置表单提交时的内容类型
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    xhr.send(params);
		}
     },
     post:function(url,data,success){
         var popt = {
             url:url,
             type:'post',
             data:data,
             dataType:"json",
             async : true,
             success:success,
             fail:function(data){}
         }
         this.ajax(popt);
     },
     postWithError:function(url,data,success,fail){
         var popt = {
             url:url,
             type:'post',
             data:data,
             dataType:"json",
             async : true,
             success:success,
             fail:fail
         }
         this.ajax(popt);
     },
     get:function(url,data,success){
         var gopt = {
             url:url,
             type:'get',
             data:data,
             dataType:"json",
             async : true,
             success:success,
             fail:function(data){}
         }
         this.ajax(gopt);
     },	
     getWithError:function(url,data,success,fail){
         var gopt = {
                 url:url,
                 type:'get',
                 data:data,
                 dataType:"json",
                 async : true,
                 success:success,
                 fail:fail
             }
             this.ajax(gopt);
         },	
};

function formatParams(data) {
    var arr = [];
    for (var name in data) {
        arr.push(encodeURIComponent(name) + "=" + encodeURIComponent(data[name]));
    }
    arr.push(("v=" + Math.random()).replace(".",""));
    return arr.join("&");
}