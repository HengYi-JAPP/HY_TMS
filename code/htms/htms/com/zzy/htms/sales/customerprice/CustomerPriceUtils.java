package com.zzy.htms.sales.customerprice;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * 特殊客户运价数据处理公共类
 * @author zzy
 *
 */
public class CustomerPriceUtils {
	public static int getSizeSize(Map<Object,Map<Object,Map<Object,Map<Object,Map<Object,Map<Object, List>>>>>> currentMap){
		if(currentMap==null||currentMap.isEmpty()){
			return 0;
		}
	
		Set currentSet=null;
		Iterator currentIt=null;
		Map<Object,Map<Object,Map<Object,Map<Object,Map<Object, List>>>>> nextMap=null;
		Object currentId= null;
		int totalSize=0, currSize = 0;
		
		currentSet=currentMap.keySet();
		currentIt=currentSet.iterator();
		while(currentIt.hasNext()){
			currentId=currentIt.next();
			nextMap=currentMap.get(currentId);
			if(nextMap==null||nextMap.isEmpty()){
				continue;
			}
			currSize=getFiveSize(nextMap);
			totalSize=totalSize+currSize;
		}//while currentMap
		
		return totalSize;
	}
	
	public static int getFiveSize(Map<Object,Map<Object,Map<Object,Map<Object,Map<Object, List>>>>> currentMap){
		if(currentMap==null||currentMap.isEmpty()){
			return 0;
		}
	
		Set currentSet=null;
		Iterator currentIt=null;
		Map<Object,Map<Object,Map<Object,Map<Object, List>>>> nextMap=null;
		Object currentId= null;
		int totalSize=0, currSize = 0;
		
		currentSet=currentMap.keySet();
		currentIt=currentSet.iterator();
		while(currentIt.hasNext()){
			currentId=currentIt.next();
			nextMap=currentMap.get(currentId);
			if(nextMap==null||nextMap.isEmpty()){
				continue;
			}
			currSize=getFourSize(nextMap);
			totalSize=totalSize+currSize;
		}//while currentMap
		
		return totalSize;
	}
	
	public static int getFourSize(Map<Object,Map<Object,Map<Object,Map<Object, List>>>> currentMap){
		if(currentMap==null||currentMap.isEmpty()){
			return 0;
		}
	
		Set currentSet=null;
		Iterator currentIt=null;
		Map<Object,Map<Object,Map<Object, List>>> nextMap=null;
		Object currentId= null;
		int totalSize=0, currSize = 0;
		
		currentSet=currentMap.keySet();
		currentIt=currentSet.iterator();
		while(currentIt.hasNext()){
			currentId=currentIt.next();
			nextMap=currentMap.get(currentId);
			if(nextMap==null||nextMap.isEmpty()){
				continue;
			}
			currSize=getThreeSize(nextMap);
			totalSize=totalSize+currSize;
		}//while currentMap
		
		return totalSize;
	}
	
	
	public static int getThreeSize(Map<Object,Map<Object,Map<Object, List>>> currentMap){
		if(currentMap==null||currentMap.isEmpty()){
			//System.out.println("------------------------getThreeSize currentMap==null||currentMap.isEmpty()");
			return 0;
		}
	
		Set currentSet=currentMap.keySet();
		Iterator currentIt=currentSet.iterator();
		Map<Object,Map<Object, List>> nextMap=null;
		Object currentId= null;
		int totalSize=0, currSize = 0;
		
		currentSet=currentMap.keySet();
		currentIt=currentSet.iterator();
		while(currentIt.hasNext()){
			currentId=currentIt.next();
			nextMap=(Map<Object,Map<Object, List>>)currentMap.get(currentId);
			//System.out.println("------------------------getThreeSize currentId="+currentId);
			if(nextMap==null||nextMap.isEmpty()){
				//System.out.println("------------------------getThreeSize nextMap==null||nextMap.isEmpty()");
				continue;
			}
			
			currSize=getTowSize(nextMap);
			totalSize=totalSize+currSize;
			//System.out.println("------------------------getThreeSize totalSize="+totalSize+", currSize="+currSize);
		}//while currentMap
		
		return totalSize;
	}
	
	public static int getTowSize(Map<Object,Map<Object, List>> currentMap){
		if(currentMap==null||currentMap.isEmpty()){
			return 0;
		}
	
		Set currentSet=null;
		Iterator currentIt=null;
		Map<Object, List> nextMap=null;
		Object currentId= null;
		int totalSize=0, currSize = 0;
		
		currentSet=currentMap.keySet();
		currentIt=currentSet.iterator();
		while(currentIt.hasNext()){
			currentId=currentIt.next();
			//System.out.println("------------------------getTowSize currentId="+currentId);
			nextMap=(Map<Object, List>)currentMap.get(currentId);
			if(nextMap==null||nextMap.isEmpty()){
				continue;
			}
			currSize=getOneSize(nextMap);
			totalSize=totalSize+currSize;
			//System.out.println("------------------------getTowSize totalSize="+totalSize+", currSize="+currSize);
		}//while currentMap
		
		return totalSize;
	}
	
	public static int getOneSize(Map<Object, List> currentMap){
		if(currentMap==null||currentMap.isEmpty()){
			return 0;
		}
		
		List list=null;
		Set threeSet=null;
		Iterator threeIt=null;
		Object currentId= null;
		int currSize = 0,totalSize=0;
			
		threeSet=currentMap.keySet();
		threeIt=threeSet.iterator();
		while(threeIt.hasNext()){
			currentId=threeIt.next();
			list=(List)currentMap.get(currentId);
			//System.out.println("------------------------getOneSize currentId="+currentId);
			if(list==null||list.isEmpty()){
				//System.out.println("------------------------getOneSize list==null||list.isEmpty()="+currentId);
				continue;
			}
			currSize=list.size();
			totalSize=totalSize+currSize;
			//System.out.println("------------------------getOneSize totalSize="+totalSize+", currSize="+currSize);
		}//while currentMap
		
		return totalSize;
	}
}
