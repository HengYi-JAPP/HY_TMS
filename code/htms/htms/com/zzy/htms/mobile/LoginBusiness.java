package com.zzy.htms.mobile;

import com.abcer.log.Logger;
import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.common.log.LogBusiness;
import com.mobilecn.common.login.sso.SSOLogin;
import com.mobilecn.common.login.upriv.UniversalPrivilege;
import com.zzy.htms.user.HtmsUserBean;

import consts.ComConsts;
import consts.PropKey;
import consts.SysConsts;
import consts.SysLogInfo;


/**
 * 发货助手登录业务实现类
 * @author zzy
 *
 */
public class LoginBusiness extends AbstractBusinessExecutor {
	private static Logger log= Logger.getLogger();
	
	/**
	 * 进行登录之前的处理操作
	 * 集成单点登录和统一权限
	 * 优先级是：
	 * 1）如集成单点登录，以单点登录为先，再进行用户信息的加载
	 * 2）没有集成单点登录，则，需要进行密码校验
	 *
	 */
	public String beforeHtmsList(){
		
		/* 如果是启用单点登录，则需要把帐号放置到系统可以获取的环境中 */
		String account = this.getRequest().getHeader("iv-user");/*与单点登录集成并检测*/
		account= account==null?this.getRequest().getParameter(SysConsts.ACCOUNT):account;
		account= account==null?(String)this.getRequest().getAttribute(SysConsts.ACCOUNT):account;
		account= account==null?(String)this.getRequest().getSession().getAttribute(SysConsts.ACCOUNT):account;
		log.info("getHeader  iv-user account:"+account);
		this.getRequest().getSession().setAttribute("is_use_sso", "false");
		if(account == null||ComConsts.NULL.equals(account.trim())){
			
			if(SSOLogin.isUseSSOLogin()){
				account = SSOLogin.getSSOLoginAccount(this.getRequest());	
				//log.info("sso account:"+account);
				//if(SSOLogin.isUseSSOLogin()){
					this.getRequest().getSession().setAttribute("is_use_sso", "true");
					String oauser=SSOLogin.getSSOAttributes(this.getRequest(), "oauser");	
					oauser=oauser==null?"":oauser;
					this.getRequest().getSession().setAttribute("oauser", oauser);
					log.info("\n\n\n ================================================ oauser:"+oauser);
				//}else{
					
				//}
			}else{
				
				if(this.isVcode()){
					String sys_vcode =(String)this.getRequest().getSession().getAttribute(SysConsts.SYS_VCODE);				
					String vcode =this.getRequest().getParameter(SysConsts.VCODE);
					vcode= vcode==null?"":vcode.trim();
					sys_vcode= sys_vcode==null?"":sys_vcode.trim();
					log.info("enter vcode="+vcode+" ,sys_vcode="+sys_vcode);
					if(!vcode.equalsIgnoreCase(sys_vcode.trim())){
						return SysConsts.LOGIN;
					}
				}
				account= account==null?this.getRequest().getParameter(SysConsts.ACCOUNT):account;
				account= account==null?(String)this.getRequest().getAttribute(SysConsts.ACCOUNT):account;
				account= account==null?(String)this.getRequest().getSession().getAttribute(SysConsts.ACCOUNT):account;
				log.info("enter account:"+account);
			}
		}
		
		/*  没有获得登录需要的帐号，不能处理后续登录操作 */
		if(account == null||ComConsts.NULL.equals(account.trim())){
			log.info(SysLogInfo.LOGIN_NOT_FETCH_ACCOUNT);
			return SysConsts.LOGIN;
		}
		
		/* 如果启用统一权限，则有可能在登录之前先获取用户所具有的角色，以便后面权限加载使用 */
		if(UniversalPrivilege.isUseUniversalPrivilege()){
			/*
			 * 此处逻辑暂未填充，后期需要时再实现
			 * 返回的有可能是权限数组，也可能是权限字符串
			 */
		}
				
		/*把帐号放置到程序可以获取的环境中 */		
		this.getRequest().setAttribute(SysConsts.ACCOUNT, account);
		this.getRequest().getSession().setAttribute(SysConsts.ACCOUNT, account);
		
		
		/* 返回空值，让程序处理后续登录操作  */
		return  null;
	}
	
	/**
	 * 登录之后 的处理操作
	 * @return
	 */
	public String afterHtmsList(){
		/* 是否启用单点登录，如果没有启用，则要进行用户名与密码校验*/
		/*if(!SSOLogin.isUseSSOLogin()){
			密码校验不通过，返回登录页面 
			if(!this.isPass()){
				log.info(SysLogInfo.LOGIN_PASSWORD_NOT_PASS);				
				return SysConsts.LOGIN;
			}
		}*/
		
		
		/* 如果启用统一权限，则有可能在登录之后获取用户所具有的角色，以便后面权限加载使用 */
		//if(UniversalPrivilege.isUseUniversalPrivilege()){
			/*
			 * 此处逻辑暂未填充，后期需要时再实现
			 * 返回的有可能是权限数组，也可能是权限字符串
			 */
		//}
		
		String actionLogin = "/jsp/htms/mobile/list.jsp";
		String actionList = "/jsp/htms/mobile/list.jsp";
		
		if(this.getResultBean()==null){
			log.info(SysLogInfo.LOGIN_USER_INFO_NOT_EXIST);
			return actionLogin;
		}
		HtmsUserBean userBean = (HtmsUserBean)this.getResultBean().getListFirstResult(PropKey.USER_BEAN_LIST_NAME);
		if(userBean==null){
			log.info(SysLogInfo.LOGIN_USER_INFO_NOT_EXIST);	
			return actionLogin;
		}
		this.getRequest().getSession().setAttribute(SysConsts.USER_BEAN, userBean);
		this.getRequest().getSession().setAttribute(SysConsts.USER_NAME, userBean.getUserName());
		this.getRequest().getSession().setAttribute(SysConsts.USER_ID, userBean.getUserId());
		this.getRequest().getSession().setAttribute(SysConsts.ACCOUNT, userBean.getAccount());
		
		//HtmsUserBean userBean = (HtmsUserBean)request.getSession().getAttribute(SysConsts.USER_BEAN);
	/*	if(userBean==null){
			log.info("\n\n\n ================================================userBean");
			return forward;
		}*/
		/*log.info("\n\n\n ================================================");
		log.info("HtmsLoginBusiness userBean:"+userBean);
		log.info("================================================ \n\n\n");*/
		String syncEmployNo=userBean.getSyncEmployNo();
		if(syncEmployNo!=null&&syncEmployNo!=""){/*设置用户销售组号*/
			this.getRequest().getSession().setAttribute("user_sync_employ_no",syncEmployNo);
			syncEmployNo=syncEmployNo.replace(",", "','");
			//salesNo=salesNo;
			this.getRequest().getSession().setAttribute("sql_user_sync_employ_no",syncEmployNo);
		}else{
			this.getRequest().getSession().setAttribute("user_sync_employ_no","-1");
			this.getRequest().getSession().setAttribute("sql_user_sync_employ_no","-1");
		}
		
		
		String salesNo=userBean.getSalesNo();
		if(salesNo!=null&&salesNo!=""){/*设置用户销售组号*/
			this.getRequest().getSession().setAttribute("user_sales_no",salesNo);
			salesNo=salesNo.replace(",", "','");
			//salesNo=salesNo;
			this.getRequest().getSession().setAttribute("UserId", userBean.getUserId());
			
			this.getRequest().getSession().setAttribute("sql_user_sales_no",salesNo);
		}else{
			//salesNo=salesNo;
			this.getRequest().getSession().setAttribute("UserId", userBean.getUserId());
			
			this.getRequest().getSession().setAttribute("user_sales_no","-1");
			this.getRequest().getSession().setAttribute("sql_user_sales_no","-1");
		}

		/*设置用户承运商ID*/
		String carrierId=userBean.getCarrierId();
		carrierId=this.isNull(carrierId)?"":carrierId;
		/*log.info("\n\n\n ================================================");
		log.info("carrierId:"+carrierId);
		log.info("================================================ \n\n\n");*/
		this.getRequest().getSession().setAttribute("login_user_carrier_id",carrierId);
		
		
		/* 判断是否需要记录登录日志信息 */
		if(LogBusiness.isRecordLogInfo()){
			LogBusiness.setLogInfo(this.getRequest());
			return actionList;
		}else{
			log.info("SysConsts.LIST_PAGE="+SysConsts.LIST_PAGE);
			return actionList;
		}
	}

	public   boolean isVcode(){
		String isSSO = PropKey.IS_USE_VCODE;
		if(isSSO==null||ComConsts.FALSE.equalsIgnoreCase(isSSO.trim())){
			return false;
		}
		return ComConsts.TRUE.equalsIgnoreCase(isSSO.trim());
	}
}
