package com.zzy.htms.sap.rfc;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.privilege.group.GroupBean;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;
import com.zzy.htms.services.business.SapTransferBean;
import com.zzy.htms.webservice.market.order.HtmsApplyOrderBussiness;

import consts.PropKey;
import consts.SysLogInfo;


/**
 * 调拨单创建删除实现类
 * @author zzy
 *
 */
public class TransferSynker extends SapSynker {
	/**
	 * 创建调拨单
	 * 传入参数需要根据地虚拟调拨单进行传递
	 * 
	 * 返回之后，要把SAP的调拨单号与虚拟调拨单号对应起来。
	 */
	public void createTransfer(){
		/*JCoParameterList parameterList=Jco3Utils.callFunctions(this.getFunctionCode(), this.parameters,false);
		if(parameterList==null){
			System.out.println("parameterList==null");
			return ;
		}*/
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_003");
	
		this.setTableValue("IT_DELVERRY", "VBELN", "0010000276");//销售订单号
		this.setTableValue("IT_DELVERRY", "POSNR", "000010");//销售订单行项目
		this.setTableValue("IT_DELVERRY", "VGBEL", "20170824123412997");//虚拟调拨单号
		this.setTableValue("IT_DELVERRY", "KWMENG", "20");//交货数量
		this.setTableValue("IT_DELVERRY", "ANZPK", "200");//交货中总的包数
		this.setTableValue("IT_DELVERRY", "TRANS_TYPE", "PS");//运输方式
		//this.setTableValue("IT_DELVERRY", "VGBEL", "000020");//参考单据 
		this.setTableValue("IT_DELVERRY", "TXT1", "000020");//收货人 
		this.setTableValue("IT_DELVERRY", "TXT2", "000020");//收货人联系方式
		this.setTableValue("IT_DELVERRY", "TXT3", "000020");//收货人地址
		this.setTableValue("IT_DELVERRY", "TXT4", "000020");//行项目文本备注
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("ET_RETURN");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			System.out.println("ZRFC_CL_INTERFACE013 jcoTable==null");
			return;
		}
		String value=null;
		 jcoTable.setRow(0);
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		System.out.println("=============================COMPANY_TAB_TAB===============================");
		
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			// jcoTable.appendRow();
			 buffer = new StringBuffer();
			 
			 buffer.append(jcoTable.getString("TYPE")).append('\t');//消息类型（消息类型: S 成功,E 错误,W 警告,I 信息,A 中断）
			 buffer.append(jcoTable.getString("VBELN")).append('\t');//交货单号，即SAP中的调拨单号
			 buffer.append(jcoTable.getString("VGBEL")).append('\t');//虚拟交货单号
			 buffer.append(jcoTable.getString("MESSAGE")).append('\t');//返回的消息

			 SyncLogger.log("",buffer.toString());
        }
	}
	
	public Map createTransfer(TransferBean transferBean,List<TransferDetailBean> detailList){
		
		if(transferBean==null){
			System.out.println("transferBean==null，不能创建SAP中的调拨单");
			SyncLogger.log("ZRFC_HTMS_003 001","transferBean==null，不能创建SAP中的调拨单");
			return null;
		}
		
		if(detailList==null||detailList.isEmpty()){
			System.out.println("detailList==null||detailList.isEmpty()，不能创建SAP中的调拨单");
			SyncLogger.log("ZRFC_HTMS_003 002","detailList==null||detailList.isEmpty()，不能创建SAP中的调拨单");
			return null;
		}

		
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_003");
	
		TransferDetailBean detailBean = null;
		BigDecimal applyTon = null,zeroTon=new BigDecimal("0.00");
		int validateCount = 0;
		String applyTonNum=null;
		SyncLogger.log("ZRFC_HTMS_003 004","=============================ZRFC_HTMS_003 004 INPUT========================");
		for(int i=0,size=detailList.size();i<size;i++){
			detailBean=detailList.get(i);
			applyTonNum=detailBean.getApplyTonNum();
			if(applyTonNum==null||"".equals(applyTonNum.trim())){
				continue;
			}
			applyTon=new BigDecimal(applyTonNum);
			/*数量为0，sap不能创建调拨单*/
			if(applyTon.compareTo(zeroTon)<=0){
				continue;
			}
			/*如果数据长度为1，SAP会默认转换成0，通过小数点补足*/
			if(applyTonNum.length()<2){
				applyTonNum=applyTonNum.indexOf(".")==-1?applyTonNum+".0":applyTonNum;
			}
			validateCount++;
			StringBuffer buffer= new StringBuffer();
			this.setTableValue("IT_DELVERRY", "VBELN", transferBean.getCorderCode());//销售订单号
			this.setTableValue("IT_DELVERRY", "POSNR", detailBean.getItemCode());//销售订单行项目
			this.setTableValue("IT_DELVERRY", "VGBEL", transferBean.getTransferCode());//虚拟调拨单号
			this.setTableValue("IT_DELVERRY", "KWMENG", applyTonNum);//交货数量
			this.setTableValue("IT_DELVERRY", "ANZPK",detailBean.getApplyPackNum());//交货中总的包数
			String  TRANS_TYPE="";
			
			//IT_DELVERRY为关键参数，ZT的单据所有都不计算运费，所以默认值为ps放在else中，默认计算运费。zt为不计算运费，自备车自提不收管理费的情况下设置为ZT
			if((transferBean.getSelfFetch()==2||transferBean.getSelfFetch()==10)&&!transferBean.isSelfFetchPriceExist()){
				TRANS_TYPE="ZT";
				this.setTableValue("IT_DELVERRY", "TRANS_TYPE", "ZT");//运输方式:自提，自备车无管理费设置为自提
			}else{
				TRANS_TYPE="PS";
				this.setTableValue("IT_DELVERRY", "TRANS_TYPE", "PS");//运输方式:派送,自备车有管理费设置为派送
			}
			System.out.println(" create transfer :IT_DELVERRY "+TRANS_TYPE);
			this.setTableValue("IT_DELVERRY", "TXT1", transferBean.getCaddrContactor());//收货人 
			this.setTableValue("IT_DELVERRY", "TXT2", transferBean.getCaddrTelephone());//收货人联系方式
			this.setTableValue("IT_DELVERRY", "TXT3", transferBean.getAreaName()+transferBean.getCaddrDetail());//收货人地址
			this.setTableValue("IT_DELVERRY", "TXT4", detailBean.getTransDetailNotice());//行项目文本备注
			this.setTableValue("IT_DELVERRY", "BEROT", transferBean.getFetchCar());//车牌号，为贸易商自提写车牌扩展
			
			buffer.append("VBELN").append(transferBean.getCorderCode()).append("\t");
			buffer.append("POSNR").append(detailBean.getItemCode()).append("\t");
			buffer.append("VGBEL").append(transferBean.getTransferCode()).append("\t");
			buffer.append("KWMENG").append(applyTonNum).append("\t");
			buffer.append("ANZPK").append(detailBean.getApplyPackNum()).append("\t");
			buffer.append("TRANS_TYPE").append(TRANS_TYPE    +"  SelfFetchType:"+transferBean.getSelfFetch() ).append("\t");
			buffer.append("TXT1").append(transferBean.getCaddrContactor()).append("\t");
			buffer.append("TXT2").append(transferBean.getCaddrTelephone()).append("\t");
			buffer.append("TXT3").append(transferBean.getAreaName()+transferBean.getCaddrDetail()).append("\t");
			buffer.append("TXT4").append(detailBean.getTransDetailNotice()).append("\t");
			buffer.append("BEROT").append(transferBean.getFetchCar()).append("\t");;
			
			
			SyncLogger.log("ZRFC_HTMS_003 004",buffer.toString());
			
		}
		if(validateCount==0){
			System.out.println("没有有效的行项目，不能创建SAP中的调拨单");
			SyncLogger.log("ZRFC_HTMS_003 005","validateCount==0,没有有效的行项目，不能创建SAP中的调拨单");
			return null;
		}
		/**
		this.setTableValue("IT_DELVERRY", "VBELN", "0010000276");//销售订单号
		this.setTableValue("IT_DELVERRY", "POSNR", "000010");//销售订单行项目
		this.setTableValue("IT_DELVERRY", "VGBEL", "20170824123412997");//虚拟调拨单号
		this.setTableValue("IT_DELVERRY", "KWMENG", "20");//交货数量
		this.setTableValue("IT_DELVERRY", "ANZPK", "200");//交货中总的包数
		this.setTableValue("IT_DELVERRY", "TRANS_TYPE", "PS");//运输方式
		//this.setTableValue("IT_DELVERRY", "VGBEL", "000020");//参考单据 
		this.setTableValue("IT_DELVERRY", "TXT1", "000020");//收货人 
		this.setTableValue("IT_DELVERRY", "TXT2", "000020");//收货人联系方式
		this.setTableValue("IT_DELVERRY", "TXT3", "000020");//收货人地址
		this.setTableValue("IT_DELVERRY", "TXT4", "000020");//行项目文本备注
		**/
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("ET_RETURN");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			System.out.println("ZRFC_CL_INTERFACE013 jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_003 006","jcoTable==null");
			return null;
		}
		String value=null;
		 jcoTable.setRow(0);
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		System.out.println("=============================COMPANY_TAB_TAB===============================");
		SyncLogger.log("ZRFC_HTMS_003 007","=============================COMPANY_TAB_TAB===============================");
		String type=null,vbeln=null,vgbel=null,message=null;
		Map<String,Map<String,String>> resutlMap=new HashMap<String,Map<String,String>>();
		Map<String,String> map=new HashMap<String,String>();
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			// jcoTable.appendRow();
			 
			 type=jcoTable.getString("TYPE");//消息类型（消息类型: S 成功,E 错误,W 警告,I 信息,A 中断）
			 vbeln=jcoTable.getString("VBELN");//交货单号，即SAP中的调拨单号
			 vgbel=jcoTable.getString("VGBEL");//虚拟交货单号
			 message=jcoTable.getString("MESSAGE");//返回的消息
			 
			 buffer = new StringBuffer();
			 
			 map=new HashMap<String,String>();
			 map.put(vgbel, vbeln);
			 map.put("result", type);
			 map.put("message", message);
			 resutlMap.put(transferBean.getTransferCode(), map);
			 
			 buffer.append(type).append('\t');//消息类型（消息类型: S 成功,E 错误,W 警告,I 信息,A 中断）
			 buffer.append(vbeln).append('\t');//交货单号，即SAP中的调拨单号
			 buffer.append(vgbel).append('\t');//虚拟交货单号
			 buffer.append(message).append('\t');//返回的消息

			 /*if("S".equalsIgnoreCase(type.trim())&&vgbel.equals(transferBean.getTransferCode())){
				 map
				 return vbeln;
			 }*/
	        //System.out.println(buffer);

	 		SyncLogger.log("ZRFC_HTMS_003 007",buffer.toString());
        }
		 
		 try{
			    Integer shipId=transferBean.getShipId();
			    HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
			    boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipId),"2");
			    if(!b){
					String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
					log.info(errorMessage);
				}
		 }catch(Exception e){
			 e.printStackTrace();
			 log.log("调用闭环接口失败");
		 }
		 return resutlMap;
	}
	/**
	 * 根据工厂号和物料号，获取该工厂指定物料的可发货数量
	 * @param factoryNo
	 * @param materialNo
	 * @return
	 */
	public String dropTransfer(String transferNo,String shipId){
		if(this.isNull(transferNo)){
			System.out.println("dropTransfer this.isNull(transferNo)");
			SyncLogger.log("ZRFC_HTMS_006 001","this.isNull(transferNo) 调拨单号为空，无法删除调拨单");
			return "调拨单号为空，无法删除调拨单";
		}
		SyncLogger.log("ZRFC_HTMS_006 002","transferNo="+transferNo);
		this.setFunctionCode("ZRFC_HTMS_006");
		this.setParameter("P_VBELN", transferNo);//交货单号,即SAP中的调拨单号
		
		Object obj = this.getValue("RE_TYP");//返回消息
		String returnCode = obj==null?null:obj.toString();
		//returnCode="E";
		Object message = this.getValue("EX_MSG");
		//message="删除调拨单失败测试";
		System.out.println("dropTransfer RE_TYP="+returnCode+",EX_MSG="+message+",transferNo="+transferNo);
		SyncLogger.log("ZRFC_HTMS_006 003","transferNo="+transferNo+",RE_TYP="+returnCode+",EX_MSG="+message);
		if (!this.isNull(returnCode)&&returnCode.equals("E")  )   
        {
			System.out.println("dropTransfer returnCode=="+returnCode+",EX_MSG="+message+",transferNo="+transferNo);

			SyncLogger.log("ZRFC_HTMS_006 003","transferNo="+transferNo+"  删除调拨单失败。返回信息："+message);
			return "删除调拨单失败。返回信息："+message;
        }
		String result= returnCode.equals("S")?"S":"删除调拨单失败。原因为："+message;
		SyncLogger.log("ZRFC_HTMS_006 003","transferNo="+transferNo+","+result);
		 try{
			    HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
			    boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipId),"1");
			    if(!b){
					String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
					log.info(errorMessage);
				}
		 }catch(Exception e){
			 e.printStackTrace();
			 log.log("调用闭环接口失败");
		 }
		return result;
		
	}
	
	
	
	public List<SapTransferBean> getTransferInfo(String sapTranfCode){
		if(sapTranfCode==null){
			System.out.println("sapTranfCode==null不能获取SAP中的调拨单");
			SyncLogger.log("ZRFC_HTMS_008 001","sapTranfCode==null不能获取SAP中的调拨单");
			return null;
		}
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_008");
		//this.setParameter("IT_VBELN", sapTranfCode);//交货单号,即SAP中的调拨单号
		this.setTableValue("IT_VBELN", "VBELN", sapTranfCode);//销售订单号
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("ET_DELIVERY_ITEM");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			System.out.println("ZRFC_HTMS_008 002 jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_008 002","jcoTable==null");
			return null;
		}
		String value=null;
		// jcoTable.setRow(0);
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		System.out.println("=============================ET_DELIVERY_ITEM===============================");
		SyncLogger.log("ZRFC_HTMS_008 003","=============================ET_DELIVERY_ITEM===============================");
		String type=null,vbeln=null,vgbel=null,message=null;
		Map<String,Map<String,String>> resutlMap=new HashMap<String,Map<String,String>>();
		Map<String,String> map=new HashMap<String,String>();
		List<SapTransferBean> sapTransList = new ArrayList<SapTransferBean>();
		SapTransferBean sapTransferBean = null;
		BigDecimal tonNum=new BigDecimal("0.000"),actualNum=null;;
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			 
			 
			 value = jcoTable.getString("LFIMG");//实际已交货量（按销售单位）
			 actualNum=new BigDecimal(value);
			 if(actualNum.compareTo(tonNum)<1){
				 continue;
			 }
			 
			 buffer = new StringBuffer();
			 sapTransferBean = new SapTransferBean();
			 
			 sapTransferBean.setApplyTonNum(value);
			 
			 value = jcoTable.getString("VBELN");//交货
			 sapTransferBean.setTransferCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("POSNR");//交货项目
			 sapTransferBean.setSubItemCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("UECHA");//父级项目
			 sapTransferBean.setItemCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("MATNR");//物料号 
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("MAKTX");//物料描述（短文本）
			 buffer.append(value).append('\t');
			  
			 value = jcoTable.getString("MATKL");//物料组 
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("WERKS");//工厂
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("LGORT");//库存地点
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("CHARG");//批号
			 buffer.append(value).append('\t');
			
			 
			 value = jcoTable.getString("MEINS");//基本计量单位
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("VRKME");//销售单位 
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZBREED");//产品品种
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZSPEC");//产品规格
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZGROUP");//产品批号
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZRANK");//产品等级
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZNIANX");//捻向
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZSHTYP");//纱种
			 buffer.append(value).append('\t');
			
	         //System.out.println("ZRFC_HTMS_008 003["+i+"]:"+buffer);
	 		 SyncLogger.log("ZRFC_HTMS_008 003["+i+"]:",buffer.toString());
	 		
	 		sapTransList.add(sapTransferBean);
        }
		 return sapTransList;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TransferSynker synker= new TransferSynker();
		//synker.createTransfer();
		synker.getTransferInfo("0080001570");
	

	}

}
