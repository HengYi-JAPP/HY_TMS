package com.zzy.htms.cache.sync;

import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.dictionary.route.RouteRepository;
import com.zzy.htms.dictionary.traderprice.TraderPriceRepository;
import com.zzy.htms.dictionary.transprice.TranspriceRepository;
import com.zzy.htms.sales.customerprice.CustomerPriceRepository;

/**
 * 集群间缓存更新使用到的方法
 * @author zzy
 *
 */
public class CacheSynker {
	private static String CACHE_SYNC_HOSTS=tools.tool.getProperty("CACHE_SYNC_HOSTS");
	private static String[] CACHE_SYNC_HOSTS_ARRAY = null;
	static{
		CACHE_SYNC_HOSTS=CACHE_SYNC_HOSTS==null?"":CACHE_SYNC_HOSTS.trim();
		if("".equals(CACHE_SYNC_HOSTS)==false){
			if(CACHE_SYNC_HOSTS.indexOf(";")==-1){
				CACHE_SYNC_HOSTS_ARRAY=new String[]{CACHE_SYNC_HOSTS};
			}else{
				CACHE_SYNC_HOSTS_ARRAY=CACHE_SYNC_HOSTS.split(";");
			}
		}else{
			CACHE_SYNC_HOSTS_ARRAY=new String[0];
		}
		
	}
	public static String AREA="AREA";
	public static String FACTORY="FACTORY";
	public static String PRODUCT="PRODUCT";
	public static String ROUTE="ROUTE";
	public static String TRADE_PRICE="TRADE_PRICE";
	public static String CUSTOMER_PRICE="CUSTOMER_PRICE";
	public static String TRANS_PRICE="TRANS_PRICE";

	/**
	 * 集群  更新本地缓存
	 * @param type  缓存类型
	 */
	public static  void syncLocalHost(String type){
		System.out.println("[syncLocalHost]type="+type);
		if(type==null){
			return;
		}
		
		if(type.equalsIgnoreCase(AREA)){
			//AreaRepository.setSyncRemove(false);
			AreaRepository.reload();
			//AreaRepository.setSyncRemove(true);
		}
		
		if(type.equalsIgnoreCase(FACTORY)){
			//FactoryRepository.setSyncRemove(false);
			FactoryRepository.reload();
			//FactoryRepository.setSyncRemove(true);
		}
		
		if(type.equalsIgnoreCase(PRODUCT)){
			//ProductRepository.setSyncRemove(false);
			ProductRepository.reload();
			//ProductRepository.setSyncRemove(true);
		}
		
		if(type.equalsIgnoreCase(ROUTE)){
			//RouteRepository.setSyncRemove(false);
			RouteRepository.reload();
			//RouteRepository.setSyncRemove(true);
		}
		
		if(type.equalsIgnoreCase(TRADE_PRICE)){
			//TraderPriceRepository.setSyncRemove(false);
			TraderPriceRepository.reload();
			//TraderPriceRepository.setSyncRemove(true);
		}
		
		if(type.equalsIgnoreCase(CUSTOMER_PRICE)){
			//CustomerPriceRepository.setSyncRemove(false);
			CustomerPriceRepository.reload();
			//CustomerPriceRepository.setSyncRemove(true);
		}
		
		if(type.equalsIgnoreCase(TRANS_PRICE)){
			//TranspriceRepository.setSyncRemove(false);
			TranspriceRepository.reload();
			//TranspriceRepository.setSyncRemove(true);
		}

	}
	
	/**
	 * 更新远程缓存的方法
	 * @param type  缓存类型
	 */
	public static  void syncRemoveHost(String type){
		if(type==null||"".equals(type)){
			System.out.println("同步类型为空,type==null");
			return;
		}
		if(CACHE_SYNC_HOSTS_ARRAY==null||CACHE_SYNC_HOSTS_ARRAY.length==0){
			System.out.println("请配置需要同步的远程主机IP和端口,CACHE_SYNC_HOSTS_ARRAY==null||CACHE_SYNC_HOSTS_ARRAY.length==0");
			return;
		}
		String params="/contoller.sync?operation=reloadLocalHostCahce&syncType="+type;
		String url = null;
		System.out.println("==========>同步类型为type="+type+",CACHE_SYNC_HOSTS_ARRAY.length="+CACHE_SYNC_HOSTS_ARRAY.length);
		for(int i=0;i<CACHE_SYNC_HOSTS_ARRAY.length;i++){
			url="http://"+CACHE_SYNC_HOSTS_ARRAY[i]+params;
			System.out.println("==========>同步url="+url+",i="+i);
			tools.tool.httpGetRequest(url);  
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
