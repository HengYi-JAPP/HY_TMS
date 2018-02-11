package com.zzy.htms.sales.ship;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * 我的申请,页面加载数据公用类
 * @author zzy
 *
 */
public class ShipPageUtil {


	public static int getCusSize(Map<String,Map<String,List<ShipBean>>> orderShipMap ){
		int cusSize=0;
		if(orderShipMap==null||orderShipMap.isEmpty()){
			return cusSize;
		}
		Set orderSet=null,detailSet=null;
		Iterator orderIt=null,detailIt=null;
		String orderKey=null,detailKey=null;
		
		 Map<String,List<ShipBean>> detailShipMap=null;
		 List<ShipBean> shipLists = null;
		 
		orderSet=orderShipMap.keySet();
		orderIt=orderSet.iterator();
		while(orderIt.hasNext()){
			orderKey =(String)orderIt.next();
			detailShipMap=orderShipMap.get(orderKey);
			if(detailShipMap==null||detailShipMap.isEmpty()){
				continue;
			}
			detailSet=detailShipMap.keySet();
			detailIt=detailSet.iterator();
			while(detailIt.hasNext()){
				detailKey =(String)detailIt.next();
				shipLists=detailShipMap.get(detailKey);
				if(shipLists==null||shipLists.isEmpty()){
					continue;
				}
				cusSize=cusSize+shipLists.size();					
			}//while detailShipMap
		}//while orderShipMap
		return cusSize;
	}
	
	public static  int getOrderSize(Map<String,List<ShipBean>> detailShipMap ){
		int orderSize=0;
		if(detailShipMap==null||detailShipMap.isEmpty()){
			return orderSize;
		}
		
		Set set = null,orderSet=null,detailSet=null;
		Iterator it = null,orderIt=null,detailIt=null;
		String key = null,orderKey=null,detailKey=null;
		
		
		 List<ShipBean> shipLists = null;
		 int detailSize=0;
		 
		detailSet=detailShipMap.keySet();
		detailIt=detailSet.iterator();
		while(detailIt.hasNext()){
			detailKey =(String)detailIt.next();
			shipLists=detailShipMap.get(detailKey);
			if(shipLists==null||shipLists.isEmpty()){
				continue;
			}
			orderSize=orderSize+shipLists.size();					
		}//while detailShipMap
		return orderSize;
	}
}
