package com.zzy.htms.sap.rfc.server;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.server.JCoServerContext;
import com.sap.conn.jco.server.JCoServerFunctionHandler;
import com.zzy.htms.sap.rfc.SapFreightSynker;
import com.zzy.htms.sap.rfc.SyncLogger;
import com.zzy.htms.sap.rfc.TransferSynker;
import com.zzy.htms.services.business.FreightBean;
import com.zzy.htms.services.business.HtmsFreightBusiness;
import com.zzy.htms.services.business.SapTransferBean;
/**
 * This class provides the implementation for the function STFC_CONNECTION. You will
 * find the RFC-enabled function STFC_CONNECTION in almost any ABAP system. The
 * function is pretty simple - it has 1 input parameter and 2 output parameter. The content
 * of the input parameter REQUTEXT is copied to the output parameter ECHOTEXT. The 
 * output parameter RESPTEXT is set to "Hello World". 
 */
public  class SapServerFunctionHandler implements JCoServerFunctionHandler
{
	// static MyTIDHandler myTIDHandler = null;
    public void handleRequest(JCoServerContext serverCtx, JCoFunction function)
    {
        System.out.println("----------------------------------------------------------------");
        System.out.println("call              : " + function.getName());
        System.out.println("ConnectionId      : " + serverCtx.getConnectionID());
        System.out.println("SessionId         : " + serverCtx.getSessionID());
        System.out.println("TID               : " + serverCtx.getTID());
        System.out.println("repository name   : " + serverCtx.getRepository().getName());
        System.out.println("is in transaction : " + serverCtx.isInTransaction());
        System.out.println("is stateful       : " + serverCtx.isStatefulSession());
        System.out.println("----------------------------------------------------------------");
        System.out.println("gwhost: " + serverCtx.getServer().getGatewayHost());
        System.out.println("gwserv: " + serverCtx.getServer().getGatewayService());
        System.out.println("progid: " + serverCtx.getServer().getProgramID());
        System.out.println("----------------------------------------------------------------");
        System.out.println("attributes  : ");
        System.out.println(serverCtx.getConnectionAttributes().toString());
        System.out.println("----------------------------------------------------------------");
        System.out.println("CPIC conversation ID: " + serverCtx.getConnectionAttributes().getCPICConversationID());
        System.out.println("----------------------------------------------------------------");
       // System.out.println("req text: " + function.getImportParameterList().getString("REQUTEXT"));
       // function.getExportParameterList().setValue("ECHOTEXT", function.getImportParameterList().getString("REQUTEXT"));
        //function.getExportParameterList().setValue("RESPTEXT", "Hello World");
        String funcitonName=function.getName();
        if(funcitonName==null){
        	System.out.println("--------------------------->ZRFC_HTMS_009[I_VBELN]:funcitonName==null");
        	function.getExportParameterList().setValue("E_MSG", "E");
        	return ;
        }
        /*ZRFC_HTMS_011	预估调拨单运费计算*/
        if(funcitonName.equalsIgnoreCase("ZRFC_HTMS_011")){
        	//String sapTransCop =function.getImportParameterList().getString("I_VBELN");
        	System.out.println("--------------------------->ZRFC_HTMS_011[I_VBELN]");
        	if(function.getTableParameterList()!=null){
	        	SapFreightSynker synker= new SapFreightSynker();
	        	synker.estimateFreight(function);
	        	return;
        	}else{
        		System.out.println("--------------------------->ZRFC_HTMS_011[I_VBELN]function.getTableParameterList()=====null");
        	}
        }
        
        /*ZRFC_HTMS_009	调拨单运费计算*/
        if(funcitonName.equalsIgnoreCase("ZRFC_HTMS_009")&&function.getImportParameterList()!=null){
        	String sapTransCop =function.getImportParameterList().getString("I_VBELN");
        	System.out.println("--------------------------->ZRFC_HTMS_009[I_VBELN]:"+sapTransCop);
        	if(sapTransCop==null||"".equals(sapTransCop.trim())){
        		System.out.println("--------------------------->ZRFC_HTMS_009:"+sapTransCop);
        		return;
        	}
        	function.getExportParameterList().setValue("E_MSG", "S");
        	SapFreightSynker synker= null;
    		//在此处增加return 返回为空,则过账失败,可以测试手工指定运费
        	
        	List<SapTransferBean> sapTransList =null;
        	//int count=0;
        	//do{//如果取回的数据是空，再尝试去取，如果取6次都没有，则认为没有数据。
        	//	count++;
        		synker= new SapFreightSynker();
        		sapTransList=synker.getTransferInfo(sapTransCop);     
        	//	if(sapTransList!=null&&sapTransList.size()>0){//如果取回的数据不为空，则不尝试再去取
        	//		break;
        	//	}
        	//}while(count<6);
        	
        	HtmsFreightBusiness freightBusiness = new HtmsFreightBusiness();
        	List<FreightBean> freightList =freightBusiness.getFreight(sapTransList);
        	
        	synker= new SapFreightSynker();
        	synker.writeFreight(freightList);
        	return;
        }
        //function.getExportParameterList().setValue("E_MSG", "E");
       // System.out.println("--------------------------->ZRFC_HTMS_009[I_VBELN]:function.getImportParameterList()==null");
        // In sample 3 (tRFC Server) we also set the status to executed:
       /* if(myTIDHandler != null)
            myTIDHandler.execute(serverCtx);*/
    }
	

}
