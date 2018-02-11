package com.zzy.htms.sales.customerprice;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class MapListSizeUtils {

	
	public static int getCustSize(Map<String,Map<String,Map<String, List<CustomerPriceBean>>>> productMap){
		if(productMap==null||productMap.isEmpty()){
			return 0;
		}
		
		List<CustomerPriceBean> custPriceLists=null;
		Set productSet = null,factorySet=null,areaSet=null;
		Iterator productIt=null,factoryIt=null,areaIt=null;
		Map<String,Map<String, List<CustomerPriceBean>>> factoryMap=null;
		Map<String, List<CustomerPriceBean>> areaMap=null;
		String productId= null,factoryId= null,areaId= null;
		
		int currSize = 0;
		
			
		
			productSet=productMap.entrySet();
			productIt=productSet.iterator();
			while(productIt.hasNext()){
				productId=(String)productIt.next();
				factoryMap=productMap.get(productId);
				if(factoryMap==null||factoryMap.isEmpty()){
					continue;
				}
				
				factorySet=factoryMap.entrySet();
				factoryIt=factorySet.iterator();
				while(factoryIt.hasNext()){
					factoryId=(String)factoryIt.next();
					areaMap=factoryMap.get(factoryId);
					if(areaMap==null||areaMap.isEmpty()){
						continue;
					}
					
					areaSet=areaMap.entrySet();
					areaIt=areaSet.iterator();
					while(areaIt.hasNext()){
						areaId=(String)areaIt.next();
						custPriceLists=areaMap.get(areaId);
						if(custPriceLists==null||custPriceLists.isEmpty()){
							continue;
						}
						currSize=currSize+custPriceLists.size();
					}//while areaMap
				}//while factoryMap
			}//while productMap
		
		return currSize;
	}
	
	public static int getProductSize(Map<String,Map<String, List<CustomerPriceBean>>> factoryMap){
		if(factoryMap==null||factoryMap.isEmpty()){
			return 0;
		}
		
		List<CustomerPriceBean> custPriceLists=null;
		Set factorySet=null,areaSet=null;
		Iterator factoryIt=null,areaIt=null;
		Map<String, List<CustomerPriceBean>> areaMap=null;
		String factoryId= null,areaId= null;
		int currSize = 0;
		
		factorySet=factoryMap.entrySet();
		factoryIt=factorySet.iterator();
		while(factoryIt.hasNext()){
			factoryId=(String)factoryIt.next();
			areaMap=factoryMap.get(factoryId);
			if(areaMap==null||areaMap.isEmpty()){
				continue;
			}
			
			areaSet=areaMap.entrySet();
			areaIt=areaSet.iterator();
			while(areaIt.hasNext()){
				areaId=(String)areaIt.next();
				custPriceLists=areaMap.get(areaId);
				if(custPriceLists==null||custPriceLists.isEmpty()){
					continue;
				}
				currSize=currSize+custPriceLists.size();
			}//while areaMap
		}//while factoryMap
		
		return currSize;
	}
	
	public static int getAreaSize(Map<String, List<CustomerPriceBean>> areaMap){
		if(areaMap==null||areaMap.isEmpty()){
			return 0;
		}
		
		List<CustomerPriceBean> custPriceLists=null;
		Set areaSet=null;
		Iterator areaIt=null;
		String areaId= null;
		int currSize = 0;
			
		areaSet=areaMap.entrySet();
		areaIt=areaSet.iterator();
		while(areaIt.hasNext()){
			areaId=(String)areaIt.next();
			custPriceLists=areaMap.get(areaId);
			if(custPriceLists==null||custPriceLists.isEmpty()){
				continue;
			}
			currSize=currSize+custPriceLists.size();
		}//while areaMap
		
		return currSize;
	}
}
