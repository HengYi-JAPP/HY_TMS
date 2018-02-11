package com.zzy.htms.logistic.transfer;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zzy.htms.logistic.transferdetail.TransferDetailBean;


/**
 * 调拨单数据处理公用类
 * @author zzy
 *
 */
public class TransferDetailUtils {

	
	public static int getAreaSize(Map<String,Map<String,Map<String,Map<String, List<TransferBean>>>>> factoryMap){
		List<TransferBean> transportLists =null;
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
						transportLists=applyMap.get(applyCode);
						if(transportLists==null||transportLists.isEmpty()){
							continue;
						}
						totalSize=totalSize+transportLists.size();
					}//while applyMap
				}//while orderMap
			}//while materialMap
		}//while factoryMap
		return totalSize;
	}
	
	public static int getFatorySize(Map<String,Map<String,Map<String, List<TransferBean>>>> materialMap){
		List<TransferBean> transportLists =null;
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
					transportLists=applyMap.get(applyCode);
					if(transportLists==null||transportLists.isEmpty()){
						continue;
					}
					totalSize=totalSize+transportLists.size();
				}//while applyMap
			}//while orderMap
		}//while materialMap
		return totalSize;
	}
	

	public static int getMaterialSize(Map<String,Map<String, List<TransferBean>>> orderMap,Map<String,List<TransferDetailBean>> transportDetailMap){
		List<TransferBean> transportLists =null;
		Set orderSet=null,applySet=null;
		Iterator orderIt=null,applyIt=null;
		Map<String, List<TransferBean>> applyMap=null;
		
		String orderId=null,applyCode=null;
		int totalSize=0;
		
		if(orderMap==null||orderMap.isEmpty()){
			return totalSize;
		}
		
		List<TransferDetailBean> tempList = null;
		TransferBean transportBean=null;
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
				transportLists=applyMap.get(applyCode);
				if(transportLists==null||transportLists.isEmpty()){
					continue;
				}
				for(int i=0,size=transportLists.size();i<size;i++){
					transportBean=transportLists.get(i);
					tempList=transportDetailMap.get(transportBean.getTransId()+"");
					if(tempList==null||tempList.isEmpty()){
						continue;
					}
					totalSize=totalSize+tempList.size();
				}
					
				
			}//while applyMap
		}//while orderMap
		return totalSize;
	}
	
	public static int getOrderSize(Map<String, List<TransferBean>> applyMap,Map<String,List<TransferDetailBean>> transportDetailMap){
		List<TransferBean> transportLists =null;
		Set applySet=null;
		Iterator applyIt=null;
		
		
		String applyCode=null;
		int totalSize=0;
		
		if(applyMap==null||applyMap.isEmpty()){
			return totalSize;
		}
		List<TransferDetailBean> tempList = null;
		TransferBean transportBean=null;
		
		applySet=applyMap.keySet();
		applyIt=applySet.iterator();
		while(applyIt.hasNext()){
			applyCode = (String)applyIt.next();
			transportLists=applyMap.get(applyCode);
			if(transportLists==null||transportLists.isEmpty()){
				continue;
			}
			for(int i=0,size=transportLists.size();i<size;i++){
				transportBean=transportLists.get(i);
				tempList=transportDetailMap.get(transportBean.getTransId()+"");
				if(tempList==null||tempList.isEmpty()){
					continue;
				}
				totalSize=totalSize+tempList.size();
			}
			//totalSize=totalSize+transportLists.size();
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
