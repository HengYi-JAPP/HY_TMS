package com.zzy.htms.location;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 微信登录入口servlet类
 * @author zzy
 *
 */
public class WXIndexServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		
		System.out.println("WeChatLocationBussiness:getUserInforLocation! ---------  code:    "+ code +"    state:  "+state);
    	
  	    Config c=new Config();
  	    c.setInterval(Integer.valueOf(WeChatLocationBussiness.CONFIG_INTERVAL));
  	    c.setDebug(WeChatLocationBussiness.CONFIG_DEBUG);
  	    
  	    User  user =null;
  	    WeChatLocationBussiness  wechatBussiness= new WeChatLocationBussiness();
  	    
  	    if(c.getDebug()){
  	    	if(user==null){
  	    		user = new User();
  	    	}
  	    	user.setOpenId("test11123");
  	    	user.setNickName("我的微信名称");
  	    }else{
  	    	if(user==null){
  	    		user = new User();
  	    	}
  	    	Token token = wechatBussiness.getWebAccessToken(WeChatLocationBussiness.CONFIG_APP_ID, WeChatLocationBussiness.CONFIG_APP_SECRET, code);
  	    	user  = wechatBussiness.getWebUserInfo(token.getAccessToken(), token.getOpenId());
  	   
  	    }
  	    
  	    System.out.println("debug: "+c.getDebug()+"get user from wechat: "+ user.getOpenId() +"    nickname:  "+user.getNickName());
  	    
  	    request.setAttribute(user.getOpenId(), user);
  	    request.getSession().setAttribute(WeChatLocationBussiness.SESSION_WXUSER, user);
  	    String openId=user.getOpenId();
  	    
    	user = wechatBussiness.getUserFromDB(user.getOpenId());
    	
    	 
    	response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//如果本地数据库未发现此用户，则跳转到注册页面
		if(user==null||user.getOpenId()==null){		
			System.out.println(" get user from db         :  no user exist in db  ");
			request.setAttribute("wxOpenId", openId);
			response.addHeader("result", "1");
			response.setHeader("refresh", "1;url="+request.getContextPath()+"/contoller.do?operation=listRegister");
		}else{
			System.out.println(" get user from db    "+ user.getOpenId() +"    nickname:  "+user.getNickName());
			response.addHeader("result", "1");
			request.setAttribute("wxOpenId", user.getOpenId());
			response.setHeader("refresh", "1;url="+request.getContextPath()+"/jsp/htms/vstore/list.jsp?wxOpenId="+user.getOpenId());
		}		
		System.out.println("======================>WXIndexServlet end ");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String relativeUrl) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(relativeUrl);
		try {
			System.out.println("forward to:" + relativeUrl);
			dispatcher.forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
	}

}
