package com.zzy.htms.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;


/**
 * json数据处理公用方法
 * @author zzy
 *
 */
public class JsonUtils {

	/*
	 * 返回ajax中json数据的公有方法
	 */
	private void out(String message, HttpServletResponse response) {
		if (message==null||"".equals(message.trim())) {
			return;
		}
		PrintWriter out = null;
		try {
			
			response.setContentType("application/x-www-form-urlencoded; charset=utf-8");
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			out.write(message);
			out.flush();
			out.close();
			
			out = null;
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
	}
	
	/**
	 * 过滤json中的特殊字符
	 * 
	 * @param str
	 * @return
	 */
	public static String jsonStrFilter(String str) {
		try {
			if (str == null || str == "") {
				return "";
			}
			str = str.replaceAll("\\\\", "");  
		    str = str.replace('\\', ' '); 
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return str;
	}

	
	
	public static void main(String[] args) {
		System.out.println(JsonUtils.jsonStrFilter("测试  \\-\\-\\-\\-\\-"));
		
		 Pattern pattern=Pattern.compile("\\\\"); 
		 String s = "HD_爸爸，\\玛丽和我";  
		    String s1 = s.replaceAll("\\\\", "");  
		    String s2 = s.replace('\\', ' ');  
		    System.out.println(s1);  
		    System.out.println(s2);  
		      
		    //多次调用时，用以下方式性能更好  
		    Matcher m=pattern.matcher(s);  
		    String s3=m.replaceAll("");  
		    System.out.println(s3);  
	}

}
