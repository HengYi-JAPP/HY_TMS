package com.zzy.htms.sap.rfc.server;

import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.server.JCoServerContext;
import com.sap.conn.jco.server.JCoServerFunctionHandler;
/**
 * This class provides the implementation for the function STFC_CONNECTION. You will
 * find the RFC-enabled function STFC_CONNECTION in almost any ABAP system. The
 * function is pretty simple - it has 1 input parameter and 2 output parameter. The content
 * of the input parameter REQUTEXT is copied to the output parameter ECHOTEXT. The 
 * output parameter RESPTEXT is set to "Hello World". 
 */
public  class StfcConnectionHandler implements JCoServerFunctionHandler
{
	 //static MyTIDHandler myTIDHandler = null;
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
        System.out.println("req text: " + function.getImportParameterList().getString("REQUTEXT"));
        function.getExportParameterList().setValue("ECHOTEXT", function.getImportParameterList().getString("REQUTEXT"));
        function.getExportParameterList().setValue("RESPTEXT", "Hello World");
        
        // In sample 3 (tRFC Server) we also set the status to executed:
       // if(myTIDHandler != null)
       //     myTIDHandler.execute(serverCtx);
    }


}
