package com.zzy.htms.webservice.market.order;

public class WebServiceResultBean {

	private boolean result;
	private String msg;
	
	
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	public String getString(){
		return "{\"result\":\""+this.isResult()+"\",\"message\":\""+this.getMsg()+"\"}";
	}
	
	public String getString(String appendStr){
		return "{\"result\":\""+this.isResult()+"\",\"message\":\""+this.getMsg()+"\""+appendStr+"}";
	}
	
	public static void main(String[] args) {
		WebServiceResultBean bean=new WebServiceResultBean();
		bean.setResult(false);
		bean.setMsg("test");
		System.out.println(bean.getString());
		
	}
	
}
