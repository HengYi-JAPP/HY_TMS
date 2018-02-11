package com.zzy.htms.login;

import javax.servlet.http.HttpServletRequest;

import com.abcer.log.Logger;
import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.common.log.LogBusiness;
import com.mobilecn.common.login.sso.SSOLogin;
import com.mobilecn.common.login.upriv.UniversalPrivilege;
import com.mobilecn.privilege.user.UserBean;
import com.zzy.htms.user.HtmsUserBean;

import consts.ComConsts;
import consts.PropKey;
import consts.SysConsts;
import consts.SysLogInfo;


/**
 * 登录业务实现类
 * @author zzy
 *
 */
public class HtmsLoginBusiness  extends AbstractBusinessExecutor {
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
			if(!SSOLogin.isUseSSOLogin()){
				//密码校验不通过，返回登录页面 
				if(!this.isPass()){
					log.info(SysLogInfo.LOGIN_PASSWORD_NOT_PASS);				
					return SysConsts.LOGIN;
				}
			}
			
			
			/* 如果启用统一权限，则有可能在登录之后获取用户所具有的角色，以便后面权限加载使用 */
			//if(UniversalPrivilege.isUseUniversalPrivilege()){
				/*
				 * 此处逻辑暂未填充，后期需要时再实现
				 * 返回的有可能是权限数组，也可能是权限字符串
				 */
			//}
			
			if(this.getResultBean()==null){
				log.info(SysLogInfo.LOGIN_USER_INFO_NOT_EXIST);
				return SysConsts.LOGIN;
			}
			HtmsUserBean userBean = (HtmsUserBean)this.getResultBean().getListFirstResult(PropKey.USER_BEAN_LIST_NAME);
			if(userBean==null){
				log.info(SysLogInfo.LOGIN_USER_INFO_NOT_EXIST);	
				return SysConsts.LOGIN;
			}
			this.getRequest().getSession().setAttribute(SysConsts.USER_BEAN, userBean);
			this.getRequest().getSession().setAttribute(SysConsts.USER_NAME, userBean.getUserName());
			this.getRequest().getSession().setAttribute(SysConsts.USER_ID, userBean.getUserId());
			this.getRequest().getSession().setAttribute(SysConsts.ACCOUNT, userBean.getAccount());
			
			//HtmsUserBean userBean = (HtmsUserBean)request.getSession().getAttribute(SysConsts.USER_BEAN);
		/*	if(userBean==null){
				System.out.println("\n\n\n ================================================userBean");
				return forward;
			}*/
			/*System.out.println("\n\n\n ================================================");
			System.out.println("HtmsLoginBusiness userBean:"+userBean);
			System.out.println("================================================ \n\n\n");*/
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
				this.getRequest().getSession().setAttribute("sql_user_sales_no",salesNo);
			}else{
				this.getRequest().getSession().setAttribute("user_sales_no","-1");
				this.getRequest().getSession().setAttribute("sql_user_sales_no","-1");
			}

			/*设置用户承运商ID*/
			String carrierId=userBean.getCarrierId();
			carrierId=this.isNull(carrierId)?"":carrierId;
			/*System.out.println("\n\n\n ================================================");
			System.out.println("carrierId:"+carrierId);
			System.out.println("================================================ \n\n\n");*/
			this.getRequest().getSession().setAttribute("login_user_carrier_id",carrierId);
			
			
			/* 判断是否需要记录登录日志信息 */
			if(LogBusiness.isRecordLogInfo()){
				LogBusiness.setLogInfo(this.getRequest());
				return SysConsts.LOG_ACTION;
			}else{
				log.info("SysConsts.LIST_PAGE="+SysConsts.LIST_PAGE);
				return SysConsts.LIST_PAGE;
			}

		}
		
		/**
		 * 判断登录的用户是否正确
		 * @param request
		 * @return
		 */
		public static boolean isUserLogin(HttpServletRequest request){
			UserBean userBean = (UserBean)request.getSession().getAttribute(SysConsts.USER_BEAN);
			String userName=(String)request.getSession().getAttribute(SysConsts.USER_NAME);
			String userId=(String)request.getSession().getAttribute(SysConsts.USER_ID);
			if(userBean==null||userName==null||userId==null){
				return false;
			}
			if(!userId.equals(userBean.getUserId())||!userName.equals(userBean.getUserName())){
				return false;
			}
			return true;
		}
		/**
		 * 在没有启用单点登录的情况，校验用户输入的密码与数据库中的密码是否一致
		 * 如一致返回true，不一致返回false
		 * @return
		 */
		private boolean isPass(){
			String pwd = this.getRequest().getParameter(SysConsts.PWD);
			log.info("pwd="+pwd);
			if(pwd==null||"".equals(pwd.trim())){
				log.info(SysLogInfo.LOGIN_USER_PASSWORD_IS_NULL);	
				return false;
			}
			
			if(this.getResultBean()==null){
				log.info(SysLogInfo.LOGIN_USER_PASSWORD_IS_NULL);
				return false;
			}
			UserBean userBean = (UserBean)this.getResultBean().getListFirstResult(PropKey.USER_BEAN_LIST_NAME);
			if(userBean==null){
				log.info(SysLogInfo.LOGIN_GET_USER_INFO_EXCEPTION);
				return false;
			}
			
			
			if(!pwd.equals(userBean.getPassword())){
				
				log.info(SysLogInfo.LOGIN_WRONG_PASSWORD+" pwd:"+userBean.getPassword());
				return false;
			}
			
			return true;
		}
		
		
	/*	public void tryLogin(){
			this.beforeLogin();
			log.info(".................tryLogin");
			ResultBean resultBean = this.doDBOperate("LoginAction_of_commonSystem");
			if(resultBean==null){
				log.info("resultBean==null");
				return ;
			}		
			this.setResultBean(resultBean);
			
			this.afterLogin();
			
			 判断是否需要记录登录日志信息 
			if(LogBusiness.isRecordLogInfo()){
				this.doDBOperate("LogAction_of_commonSystem");
			}
			
		}*/
		
		/**
		 * 判断输入的验证码是否正确
		 */
		public   boolean isVcode(){
			String isSSO = PropKey.IS_USE_VCODE;
			if(isSSO==null||ComConsts.FALSE.equalsIgnoreCase(isSSO.trim())){
				return false;
			}
			return ComConsts.TRUE.equalsIgnoreCase(isSSO.trim());
		}
	
	/*public String beforeHtmsLogin(){
		String forward = super.beforeLogin();
		if(SSOLogin.isUseSSOLogin()){
			this.getRequest().getSession().setAttribute("is_use_sso", "true");
			String oauser=SSOLogin.getSSOAttributes(this.getRequest(), "oauser");	
			oauser=oauser==null?"":oauser;
			this.getRequest().getSession().setAttribute("oauser", oauser);
			System.out.println("\n\n\n ================================================ oauser:"+oauser);
		}else{
			this.getRequest().getSession().setAttribute("is_use_sso", "false");
		}
		return forward;
	}
	*/
	/*public String afterHtmsLogin(){
		System.out.println("\n\n\n ================================================ super.afterLogin()");
		String forward = super.afterLogin();
		HttpServletRequest request=this.getRequest();
		if(request==null){
			System.out.println("\n\n\n forward================================================"+forward);
			return forward;
		}
		HtmsUserBean userBean = (HtmsUserBean)request.getSession().getAttribute(SysConsts.USER_BEAN);
		if(userBean==null){
			System.out.println("\n\n\n ================================================userBean");
			return forward;
		}
		System.out.println("\n\n\n ================================================");
		System.out.println("HtmsLoginBusiness userBean:"+userBean);
		System.out.println("================================================ \n\n\n");
		String salesNo=userBean.getSalesNo();
		if(salesNo!=null){设置用户销售组号
			request.getSession().setAttribute("user_sales_no",salesNo);
			salesNo=salesNo.replace(",", "','");
			//salesNo=salesNo;
			request.getSession().setAttribute("sql_user_sales_no",salesNo);
		}else{
			request.getSession().setAttribute("user_sales_no","");
			request.getSession().setAttribute("sql_user_sales_no","");
		}

		设置用户承运商ID
		String carrierId=userBean.getSubDepartment();
		carrierId=this.isNull(carrierId)?"":carrierId;
		System.out.println("\n\n\n ================================================");
		System.out.println("carrierId:"+carrierId);
		System.out.println("================================================ \n\n\n");
		request.getSession().setAttribute("login_user_carrier_id",carrierId);
		return forward;
	}*/

}
