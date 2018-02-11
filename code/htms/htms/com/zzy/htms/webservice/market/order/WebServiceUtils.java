package com.zzy.htms.webservice.market.order;

import com.zzy.htms.services.user.ServiceUserBean;
import com.zzy.htms.services.user.ServiceUserRepository;

public class WebServiceUtils {

	/**
	 * 检测传入的web服务帐号信息是否正确
	 * @param code
	 * @param account
	 * @param passwd
	 * @return
	 */
	public static WebServiceResultBean accountCheck(String code,String account,String passwd) throws  Exception {
		WebServiceResultBean resultBean = new WebServiceResultBean();
			
		if(code==null||code==""||account==null||account==""||passwd==null||passwd==""){
			resultBean.setResult(false);
			resultBean.setMsg("请求的帐号信息不完整");
			return resultBean;
		}
		ServiceUserBean clientUserBean =new ServiceUserBean();
		clientUserBean.setSyscode(code);
		clientUserBean.setAccount(account);
		clientUserBean.setPasswd(passwd);
		
		ServiceUserBean serverUserBean =ServiceUserRepository.getServiceUser(clientUserBean.getSyscode(), clientUserBean.getAccount());
		if(serverUserBean==null){
			resultBean.setResult(false);
			resultBean.setMsg("请求的帐号信息不存在");
			return resultBean;
		}
		if(serverUserBean.getPasswd()!=null&&serverUserBean.getPasswd().equals(clientUserBean.getPasswd())){
			resultBean.setResult(true);
			resultBean.setMsg("请求的帐号信息正确");
			return resultBean;
		}
		return resultBean;
	}
	
}
