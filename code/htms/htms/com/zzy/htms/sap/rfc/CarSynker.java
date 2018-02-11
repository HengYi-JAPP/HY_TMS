package com.zzy.htms.sap.rfc;

/**
 * 车牌号写入到sap调拨单的实现类
 * @author zzy
 *
 */
public class CarSynker extends SapSynker {

	/**
	 * TMS将实际的车牌号码同步到ERP交货单
	 * @param transferCode 调拨单号
	 * @param carCode车牌号
	 */
	public String writeCarNo(String transferCode,String carCode){
		if(this.isNull(transferCode)||this.isNull(carCode)){
			log.info("CarSynker this.isNull(transferCode)||this.isNull(carCode)");
			SyncLogger.log("ZRFC_HTMS_002 001","transferCode="+transferCode+",carCode="+carCode);
			return "车牌号码或调拨单号空，同步车牌号码同步到SAP交货单失败。";
		}
		SyncLogger.log("ZRFC_HTMS_002 002","transferCode="+transferCode+",carCode="+carCode);
		
		this.setFunctionCode("ZRFC_HTMS_002");
		this.setParameter("P_VBELN", transferCode);//交货单号
		this.setParameter("P_BEROT", carCode);//车牌号
		Object obj = this.getValue("EX_MSG");//返回消息
		String returnCode = obj==null?"":obj.toString();
		//returnCode="E";
		Object message = this.getValue("RT_MSG");
		//message="排车失败测试。";
		log.info("CarSynker EX_MSG="+returnCode+",EX_MSG="+message+",transferCode="+transferCode+",carCode="+carCode);
		SyncLogger.log("ZRFC_HTMS_002 003","EX_MSG="+returnCode+",EX_MSG="+message+",transferCode="+transferCode+",carCode="+carCode);
		String result = null;
		if (!this.isNull(returnCode)&&returnCode.equals("E")  )   
        {
			log.info("CarSynker returnCode=="+returnCode+",EX_MSG="+ message+",transferCode="+transferCode+",carCode="+carCode);
			result= "同步车牌号码同步到SAP交货单失败。返回编码为："+returnCode+",返回信息为："+message;
			SyncLogger.log("ZRFC_HTMS_002 004",result);
			return result;
        }
		result= returnCode.equals("S")?"S":"同步车牌号码同步到SAP交货单失败。返回编码为："+returnCode+",返回信息为："+message;
		SyncLogger.log("ZRFC_HTMS_002 005",result);
		return result;
	}
	public String cancelCarNo(String transferCode){
		if(this.isNull(transferCode)){
			log.info("CarSynker this.isNull(transferCode)||this.isNull(carCode)");
			SyncLogger.log("ZRFC_HTMS_002 001","调拨单号空，无法取消排车。transferCode="+transferCode);
			return "调拨单号空，无法取消排车。";
		}
		SyncLogger.log("ZRFC_HTMS_002 002","transferCode="+transferCode);
		this.setFunctionCode("ZRFC_HTMS_002");
		this.setParameter("P_VBELN", transferCode);//交货单号
		this.setParameter("P_BEROT", "");//车牌号
		Object obj = this.getValue("EX_MSG");//返回消息编码
		String returnCode = obj==null?"":obj.toString();
		//returnCode="E";
		Object message = this.getValue("RT_MSG");//返回消息
		//message="取消排车失败测试。";
		log.info("CarSynker EX_MSG="+returnCode+",EX_MSG="+message+",transferCode="+transferCode);
		SyncLogger.log("ZRFC_HTMS_002 003","EX_MSG="+returnCode+",EX_MSG="+message+",transferCode="+transferCode);
		String result=null;
		if (!this.isNull(returnCode)&&returnCode.equals("E")  )   
        {
			log.info("CarSynker returnCode=="+returnCode+",EX_MSG="+ message+",transferCode="+transferCode);
			result= "同步车牌号码同步到SAP交货单失败。返回信息为："+message;
			SyncLogger.log("ZRFC_HTMS_002 004",result);
			return result;
        }
		result= returnCode.equals("S")?"S":"同步车牌号码同步到SAP交货单失败。返回信息为："+message;
		SyncLogger.log("ZRFC_HTMS_002 005",result);
		return result;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CarSynker carSynker= new CarSynker();
		
		carSynker.writeCarNo("0080001086","浙A88888");

	}

}
