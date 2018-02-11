package com.zzy.htms.logistic.transfer;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * 调拨单页面数据处理公用类
 * @author zzy
 *
 */
public class TransferUtils {
	
	public static int getAreaSize(Map<String,Map<String,Map<String,Map<String, List<TransferBean>>>>> factoryMap){
		List<TransferBean> transferLists =null;
		Set factorySet=null,materialSet=null,orderSet=null,applySet=null;
		Iterator factoryIt=null,materialIt=null,orderIt=null,applyIt=null;
		Map<String,Map<String,Map<String, List<TransferBean>>>> materialMap=null;
		Map<String,Map<String, List<TransferBean>>> orderMap=null;
		Map<String, List<TransferBean>> applyMap=null;
		String factoryId=null,materialId=null,orderId=null,applyCode=null;
		int totalSize=0;
		if(factoryMap==null||factoryMap.isEmpty()){
			return 0;
		}
		
		factorySet=factoryMap.keySet();
		factoryIt=factorySet.iterator();
		while(factoryIt.hasNext()){
			factoryId = (String)factoryIt.next();
			materialMap=factoryMap.get(factoryId);
			if(materialMap==null||materialMap.isEmpty()){
				continue;
			}
			
			
			
			materialSet=materialMap.keySet();
			materialIt=materialSet.iterator();
			while(materialIt.hasNext()){
				materialId = (String)materialIt.next();
				orderMap=materialMap.get(materialId);
				if(orderMap==null||orderMap.isEmpty()){
					continue;
				}
				
				
				orderSet=orderMap.keySet();
				orderIt=orderSet.iterator();
				while(orderIt.hasNext()){
					orderId = (String)orderIt.next();
					applyMap=orderMap.get(orderId);
					if(applyMap==null||applyMap.isEmpty()){
						continue;
					}
					
					applySet=applyMap.keySet();
					applyIt=applySet.iterator();
					while(applyIt.hasNext()){
						applyCode = (String)applyIt.next();
						transferLists=applyMap.get(applyCode);
						if(transferLists==null||transferLists.isEmpty()){
							continue;
						}
						totalSize=totalSize+transferLists.size();
					}//while applyMap
				}//while orderMap
			}//while materialMap
		}//while factoryMap
		return totalSize;
	}
	
	public static int getFatorySize(Map<String,Map<String,Map<String, List<TransferBean>>>> materialMap){
		List<TransferBean> transferLists =null;
		Set materialSet=null,orderSet=null,applySet=null;
		Iterator materialIt=null,orderIt=null,applyIt=null;
		Map<String,Map<String, List<TransferBean>>> orderMap=null;
		Map<String, List<TransferBean>> applyMap=null;
		
		String materialId=null,orderId=null,applyCode=null;
		int totalSize=0;
		if(materialMap==null||materialMap.isEmpty()){
			return 0;
		}
			
		materialSet=materialMap.keySet();
		materialIt=materialSet.iterator();
		while(materialIt.hasNext()){
			materialId = (String)materialIt.next();
			orderMap=materialMap.get(materialId);
			if(orderMap==null||orderMap.isEmpty()){
				continue;
			}
			
			
			orderSet=orderMap.keySet();
			orderIt=orderSet.iterator();
			while(orderIt.hasNext()){
				orderId = (String)orderIt.next();
				applyMap=orderMap.get(orderId);
				if(applyMap==null||applyMap.isEmpty()){
					continue;
				}
				
				applySet=applyMap.keySet();
				applyIt=applySet.iterator();
				while(applyIt.hasNext()){
					applyCode = (String)applyIt.next();
					transferLists=applyMap.get(applyCode);
					if(transferLists==null||transferLists.isEmpty()){
						continue;
					}
					totalSize=totalSize+transferLists.size();
				}//while applyMap
			}//while orderMap
		}//while materialMap
		return totalSize;
	}
	

	public static int getMaterialSize(Map<String,Map<String, List<TransferBean>>> orderMap){
		List<TransferBean> transferLists =null;
		Set orderSet=null,applySet=null;
		Iterator orderIt=null,applyIt=null;
		Map<String, List<TransferBean>> applyMap=null;
		
		String orderId=null,applyCode=null;
		int totalSize=0;
		
		if(orderMap==null||orderMap.isEmpty()){
			return totalSize;
		}
		
		
		orderSet=orderMap.keySet();
		orderIt=orderSet.iterator();
		while(orderIt.hasNext()){
			orderId = (String)orderIt.next();
			applyMap=orderMap.get(orderId);
			if(applyMap==null||applyMap.isEmpty()){
				continue;
			}
			
			applySet=applyMap.keySet();
			applyIt=applySet.iterator();
			while(applyIt.hasNext()){
				applyCode = (String)applyIt.next();
				transferLists=applyMap.get(applyCode);
				if(transferLists==null||transferLists.isEmpty()){
					continue;
				}
				totalSize=totalSize+transferLists.size();
			}//while applyMap
		}//while orderMap
		return totalSize;
	}
	
	public static int getOrderSize(Map<String, List<TransferBean>> applyMap){
		List<TransferBean> transferLists =null;
		Set applySet=null;
		Iterator applyIt=null;
		
		
		String applyCode=null;
		int totalSize=0;
		
		if(applyMap==null||applyMap.isEmpty()){
			return totalSize;
		}
		
		applySet=applyMap.keySet();
		applyIt=applySet.iterator();
		while(applyIt.hasNext()){
			applyCode = (String)applyIt.next();
			transferLists=applyMap.get(applyCode);
			if(transferLists==null||transferLists.isEmpty()){
				continue;
			}
			totalSize=totalSize+transferLists.size();
		}//while applyMap
		return totalSize;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
