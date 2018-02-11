package com.zzy.htms.logistic.send;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.log.HtmsLogger;

/**
 * 派车管理业务实现类
 * @author zzy
 *
 */
public class SendBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * 在派车之前的预处理
	 */
	public void beforeSend(){
		this.setCache("modifyTime", tools.tool.getDateTime(), "request");
	}
	
	/**
	 * 检查派车单状态是否正常
	 * @param status
	 * @param operation
	 * @param sendIdStr
	 * @throws Exception
	 */
	private void sendStatusCheck(int status,String operation,String sendIdStr) throws Exception{
        String INVOKE_MESSAGE = "";
		
		//添加调拨单状态的检测，
		RequestHelper helper = new RequestHelper(this.getRequest());
		String sendId = (String)helper.getValueFromAllScopes(sendIdStr);
		Map parameters = new HashMap();
		parameters.put("sendId", sendId);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getSendBeanById");
		ResultBean checkResultBean = this.dbOperator(operationBean, parameters, false);
		List<SendBean> sendList = new ArrayList<SendBean>();
		sendList = checkResultBean.getListResult("getSendBeanById");
		
		if(sendList==null||sendList.size()==0){
			INVOKE_MESSAGE=operation+"失败:无法获取派车信息!";
			this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
			return ;
		}
		if(sendList!=null||sendList.size()>0){
			SendBean sendBean=sendList.get(0);
			if(sendBean.getSendStatus()!=status){
				String statusStr="";
				if(sendBean.getSendStatus()==1){
					statusStr="已派车";
				}		
				if(sendBean.getSendStatus()==0){
					statusStr="未派车";
				}
				INVOKE_MESSAGE=operation+"失败:派车单编号为:"+sendBean.getSendCode()+"的记录，状态为 "+statusStr+"，不能"+operation+" !";
				this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
			}
		}	
	}
	
	/**
	 * 检查派车状态是否为0
	 */
	public void checkSendStatusSend(){
		try{
			sendStatusCheck(0,"派车","checkSendId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","派车失败:检测数据时,发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 检查派车状态是否为1 
	 */
	public void checkSendStatusCancel(){
		try{
			sendStatusCheck(1,"取消","sendId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","取消失败:检测数据时,发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SEND001", "增加派车单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SEND002", "增加派车单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SEND011", "删除派车成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SEND012", "删除派车失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if(this.isSuccess()){
		//	HtmsLogger.log("SEND021","查看派车单列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SEND022", "查看派车单列表失败", "0", this.getRequest());
		}
		
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SEND031", "查看派车单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SEND032", "查看派车单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SEND041", "修改派车单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SEND042", "修改派车单失败", "0", this.getRequest());
		}
		return forward;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1910, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1911, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1909, MethodName:默认删除, MethodCode:delete
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1907, MethodName:默认新增, MethodCode:add
	//DefautMethod,MethodId:1912, MethodName:默认查询, MethodCode:list
	//Self Define Method End.
}

