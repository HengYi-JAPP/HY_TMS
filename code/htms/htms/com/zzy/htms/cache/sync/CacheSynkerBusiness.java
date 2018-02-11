package com.zzy.htms.cache.sync;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.utils.RequestHelper;

public class CacheSynkerBusiness  extends AbstractV2BusinessExecutor {
	
	/**
	 * 刷新本地缓存，并发送刷新其他服务器缓存的请求
	 */
	public void syncLocalHost(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		String syncType=(String)helper.getValueFromAllScopes("syncType");
		
		
		
		System.out.println("syncType="+syncType+",syncHost="+tools.tool.getIpAddress(this.getRequest()));
		if(syncType==null||"".equals(syncType)){
			return;
		}
		CacheSynker.syncLocalHost(syncType);
		CacheSynker.syncRemoveHost(syncType);
	}
	
	/**
	 * 刷新本地缓存，并接收其他服务器发送的请求，仅仅刷新本服务器的缓存
	 */
	public void reloadLocalHostCache(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		String syncType=(String)helper.getValueFromAllScopes("syncType");
		System.out.println("syncType="+syncType+",syncHost="+tools.tool.getIpAddress(this.getRequest()));
		if(syncType==null||"".equals(syncType)){
			return;
		}
		CacheSynker.syncLocalHost(syncType);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
