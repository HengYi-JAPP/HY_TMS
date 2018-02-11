-- Create/Recreate primary, unique and foreign key constraints for TB_DIC_TYPE
alter table TB_DIC_TYPE
  add constraint PK_TB_DIC_TYPE primary key (TYPEID);

-- Create/Recreate primary, unique and foreign key constraints for TB_DICTIONARY 
alter table TB_DICTIONARY
  add constraint PK_TB_DICTIONARY primary key (DICID);
alter table TB_DICTIONARY
  add constraint DIC_TYPE_REF_ITEMS foreign key (TYPEID)
  references TB_DIC_TYPE (TYPEID);
  
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_AREA
alter table TB_HTMS_AREA
  add constraint PK_TB_HTMS_AREA primary key (AREAID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_AREA001
alter table TB_HTMS_AREA001
  add constraint PK_TB_HTMS_AREA001 primary key (AREAID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_AREA002
alter table TB_HTMS_AREA002
  add constraint PK_TB_HTMS_AREA002 primary key (AREAID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_AREA003
alter table TB_HTMS_AREA003
  add constraint PK_TB_HTMS_AREA003 primary key (AREAID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_AREA004
alter table TB_HTMS_AREA004
  add constraint PK_TB_HTMS_AREA004 primary key (AREAID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_CARRIER
alter table TB_HTMS_CARRIER
  add constraint PK_TB_HTMS_CARRIER primary key (CARRIERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_CUSTOMER
alter table TB_HTMS_CUSTOMER
  add constraint PK_TB_HTMS_CUSTOMER primary key (CUSTOMERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_DRIVER
alter table TB_HTMS_DRIVER
  add constraint PK_TB_HTMS_DRIVER primary key (DRIVERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_FACTORY
alter table TB_HTMS_FACTORY
  add constraint PK_TB_HTMS_FACTORY primary key (FACTORYID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_LOGISTICS
alter table TB_HTMS_LOGISTICS
  add constraint PK_TB_HTMS_LOGISTICS primary key (LOGISTICSID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_ORDERSYN
alter table TB_HTMS_ORDERSYN
  add constraint PK_HTMS_ORDERSYN primary key (SYNID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_PRODUCTTYPE
alter table TB_HTMS_PRODUCTTYPE
  add constraint PK_TB_HTMS_PRODUCTTYPE primary key (TYPEID);
  
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_SYSTEM_LOG
alter table TB_HTMS_SYSTEM_LOG
  add constraint PK_TB_HTMS_SYSTEM_LOG primary key (LOGID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_TASKSCHEDULE
alter table TB_HTMS_TASKSCHEDULE
  add constraint PK_TB_HTMS_TASKSCHEDULE primary key (TASKID);


-- Create/Recreate primary, unique and foreign key constraints for TB_SYSTEM
alter table TB_SYSTEM
  add constraint PK_TB_SYSTEM primary key (SYSID);


-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_COLUMN_PARAMS
alter table TB_WSM_COLUMN_PARAMS
  add constraint PK_TB_WSM_COLUMN_PARAMS primary key (PARAMSID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_CSS
alter table TB_WSM_CSS
  add constraint PK_TB_WSM_CSS primary key (CSSID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_FILES_STORE
alter table TB_WSM_FILES_STORE
  add constraint PK_TB_WSM_FILES_STORE primary key (FILEID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_GROUP
alter table TB_WSM_GROUP
  add constraint PK_TB_WSM_GROUP primary key (GROUPID);
  
-- Create/Recreate primary, unique and foreign key constraints or TB_WSM_INFOTYPE
alter table TB_WSM_INFOTYPE
  add constraint PK_TB_WSM_INFOTYPE primary key (INFOTYPEID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_LINK_TYPE
alter table TB_WSM_LINK_TYPE
  add constraint PK_TB_WSM_LINK_TYPE primary key (LINKTYPEID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_LOGIN_LOG
alter table TB_WSM_LOGIN_LOG
  add constraint PK_TB_WSM_LOGIN_LOG primary key (LOGID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_ORGANIZATION
alter table TB_WSM_ORGANIZATION
  add constraint PK_TB_WSM_ORGANIZTION primary key (ORGID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_PICS
alter table TB_WSM_PICS
  add constraint PK_TB_WSM_PICS primary key (INFOID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_PRIVILEGE
alter table TB_WSM_PRIVILEGE
  add constraint PK_TB_WSM_PRIVILEGE primary key (PRIVID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_ROLE
alter table TB_WSM_ROLE
  add constraint PK_TB_WSM_ROLE primary key (ROLEID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_NEWS
alter table TB_WSM_INFO_NEWS
  add constraint PK_TB_WSM_INFO_NEWS primary key (INFOID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_REF
alter table TB_WSM_INFO_REF
  add constraint PK_TB_WSM_INFO_REF primary key (INFOID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_SERVICE
alter table TB_WSM_INFO_SERVICE
  add constraint PK_TB_WSM_INFO_SERVICE primary key (SERVICEID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_SYS_CONF
alter table TB_WSM_SYS_CONF
  add constraint PK_TB_WSM_SITE_CONF primary key (CONFIGID);
  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_THEMES
alter table TB_WSM_THEMES
  add constraint PK_TB_WSM_THEMES primary key (THEMESID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_USER
alter table TB_WSM_USER
  add constraint PK_TB_WSM_USER primary key (USERID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_SYS_THEMES
alter table TB_WSM_SYS_THEMES
  add constraint SYS_REF_THEMES foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID);

-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_CUSTOMERADDR
alter table TB_HTMS_CUSTOMERADDR
  add constraint PK_TB_HTMS_CUSTOMERADDR primary key (CADDRID);
alter table TB_HTMS_CUSTOMERADDR
  add constraint FK_CUSTOMERADDR_CUSTOMER foreign key (CUSTOMERID)
  references TB_HTMS_CUSTOMER (CUSTOMERID);

-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_PRODUCT
alter table TB_HTMS_PRODUCT
  add constraint PK_TB_HTMS_PRODUCT primary key (PRODUCTID);
alter table TB_HTMS_PRODUCT
  add constraint FK_PRODUCT_PRODUCTTYPE foreign key (TYPEID)
  references TB_HTMS_PRODUCTTYPE (TYPEID);    

-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_ROUTE
alter table TB_HTMS_ROUTE
  add constraint PK_TB_HTMS_ROUTE primary key (ROUTEID);
alter table TB_HTMS_ROUTE
  add constraint FK_ROUTE_FACTORY foreign key (FACTORYID)
  references TB_HTMS_FACTORY (FACTORYID);
alter table TB_HTMS_ROUTE
  add constraint FK_ROUTE_PRODUCT foreign key (PRODUCTID)
  references TB_HTMS_PRODUCT (PRODUCTID);
alter table TB_HTMS_ROUTE
  add constraint FK_TB_HTMS_ROUTE_TB_HTMS_AREA foreign key (AREAID)
  references TB_HTMS_AREA (AREAID)
  disable;
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_CUSTOMER_PRICE
alter table TB_HTMS_CUSTOMER_PRICE
  add constraint PK_TB_HTMS_CUSTOMER_PRICE primary key (PRICEID);
alter table TB_HTMS_CUSTOMER_PRICE
  add constraint FK_HTMS_CUS_REFERENCE_HTMS_CUS foreign key (CUSTOMERID)
  references TB_HTMS_CUSTOMER (CUSTOMERID);
alter table TB_HTMS_CUSTOMER_PRICE
  add constraint FK_HTMS_CUS_REFERENCE_HTMS_ROU foreign key (ROUTEID)
  references TB_HTMS_ROUTE (ROUTEID);    

-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_CUSTORDER
alter table TB_HTMS_CUSTORDER
  add constraint PK_TB_HTMS_CUSTORDER primary key (CORDERID);
alter table TB_HTMS_CUSTORDER
  add constraint FK_CUSTORDER_CUSTOMER foreign key (CUSTOMERID)
  references TB_HTMS_CUSTOMER (CUSTOMERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_CUSTORDERDETAIL
alter table TB_HTMS_CUSTORDERDETAIL
  add constraint PK_TB_HTMS_CUSTORDERDETAIL primary key (CODETAILID);
alter table TB_HTMS_CUSTORDERDETAIL
  add constraint FK_CUSTORDERDETAIL_CUSTORDER foreign key (CORDERID)
  references TB_HTMS_CUSTORDER (CORDERID);
  

  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_VEHICLE
alter table TB_HTMS_VEHICLE
  add constraint PK_TB_HTMS_VEHICLE primary key (VEHICLEID);
alter table TB_HTMS_VEHICLE
  add constraint FK_VEHICLE_CARRIER foreign key (CARRIERID)
  references TB_HTMS_CARRIER (CARRIERID);

-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_SHIP
alter table TB_HTMS_SHIP
  add constraint PK_TB_HTMS_SHIP primary key (SHIPID); 
alter table TB_HTMS_SHIP
  add constraint FK_SHIP_CUSTADDRID foreign key (CADDRID)
  references TB_HTMS_CUSTOMERADDR (CADDRID);
alter table TB_HTMS_SHIP
  add constraint FK_SHIP_CUSTOMER foreign key (CUSTOMERID)
  references TB_HTMS_CUSTOMER (CUSTOMERID);
alter table TB_HTMS_SHIP
  add constraint FK_SHIP_CUSTORDER foreign key (CORDERID)
  references TB_HTMS_CUSTORDER (CORDERID);

-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_SHIPDETAIL
alter table TB_HTMS_SHIPDETAIL
  add constraint PK_TB_HTMS_SHIPDETAIL primary key (SHIPDETAILID);
alter table TB_HTMS_SHIPDETAIL
  add constraint FK_SHIPDETAIL_CUSTOMERADDR foreign key (CADDRID)
  references TB_HTMS_CUSTOMERADDR (CADDRID);
alter table TB_HTMS_SHIPDETAIL
  add constraint FK_SHIPDETAIL_CUSTORDERDETAIL foreign key (CODETAILID)
  references TB_HTMS_CUSTORDERDETAIL (CODETAILID);
alter table TB_HTMS_SHIPDETAIL
  add constraint FK_SHIPDETAIL_PRODUCT foreign key (PRODUCTID)
  references TB_HTMS_PRODUCT (PRODUCTID);
alter table TB_HTMS_SHIPDETAIL
  add constraint FK_SHIPDETAIL_SHIP foreign key (SHIPID)
  references TB_HTMS_SHIP (SHIPID);
  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_TRANSFER
alter table TB_HTMS_TRANSFER
  add constraint PK_TB_HTMS_TRANSFER primary key (TRANSID);
alter table TB_HTMS_TRANSFER
  add constraint FK_TRANSFER_CADDRID foreign key (CADDRID)
  references TB_HTMS_CUSTOMERADDR (CADDRID);
alter table TB_HTMS_TRANSFER
  add constraint FK_TRANSFER_CUSTOMER foreign key (CUSTOMERID)
  references TB_HTMS_CUSTOMER (CUSTOMERID);
alter table TB_HTMS_TRANSFER
  add constraint FK_TRANSFER_CUSTORDER foreign key (CORDERID)
  references TB_HTMS_CUSTORDER (CORDERID);
alter table TB_HTMS_TRANSFER
  add constraint FK_TRANSFER_LOGISTICS foreign key (LOGISTICSID)
  references TB_HTMS_LOGISTICS (LOGISTICSID);
alter table TB_HTMS_TRANSFER
  add constraint FK_TRANSFER_SHIP foreign key (SHIPID)
  references TB_HTMS_SHIP (SHIPID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_TRANSFERDETAIL
alter table TB_HTMS_TRANSFERDETAIL
  add constraint PK_TB_HTMS_TRANSFERDETAIL primary key (TRANSDETAILID);
alter table TB_HTMS_TRANSFERDETAIL
  add constraint FK_TRANSFERDETAIL_CUSTOMER foreign key (CADDRID)
  references TB_HTMS_CUSTOMERADDR (CADDRID);
alter table TB_HTMS_TRANSFERDETAIL
  add constraint FK_TRANSFERDETAIL_PRODUCT foreign key (PRODUCTID)
  references TB_HTMS_PRODUCT (PRODUCTID)
  disable;
alter table TB_HTMS_TRANSFERDETAIL
  add constraint FK_TRANSFERDETAIL_SHIP foreign key (SHIPID)
  references TB_HTMS_SHIP (SHIPID);
alter table TB_HTMS_TRANSFERDETAIL
  add constraint FK_TRANSFERDETAIL_SHIPDETAIL foreign key (SHIPDETAILID)
  references TB_HTMS_SHIPDETAIL (SHIPDETAILID);
alter table TB_HTMS_TRANSFERDETAIL
  add constraint FK_TRANSFERDETAIL_TRANSFER foreign key (TRANSID)
  references TB_HTMS_TRANSFER (TRANSID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_TRANSPORT
alter table TB_HTMS_TRANSPORT
  add constraint PK_TB_HTMS_TRANSPORT primary key (TRANSPORTID);
alter table TB_HTMS_TRANSPORT
  add constraint FK_TRANSPORT_CADDRID foreign key (CADDRID)
  references TB_HTMS_CUSTOMERADDR (CADDRID);
alter table TB_HTMS_TRANSPORT
  add constraint FK_TRANSPORT_CARRIER foreign key (CARRIERID)
  references TB_HTMS_CARRIER (CARRIERID);
alter table TB_HTMS_TRANSPORT
  add constraint FK_TRANSPORT_SHIPID foreign key (SHIPID)
  references TB_HTMS_SHIP (SHIPID);
alter table TB_HTMS_TRANSPORT
  add constraint FK_TRANSPORT_TRANSFER foreign key (TRANSID)
  references TB_HTMS_TRANSFER (TRANSID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_TRANSPORTDETAIL
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint PK_TB_HTMS_TRANSPORTDETAIL primary key (SPORTDETAILID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_CUSTOMER foreign key (CADDRID)
  references TB_HTMS_CUSTOMERADDR (CADDRID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_CUSTORDERDE foreign key (CODETAILID)
  references TB_HTMS_CUSTORDERDETAIL (CODETAILID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_PRODUCT foreign key (PRODUCTID)
  references TB_HTMS_PRODUCT (PRODUCTID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_SHIP foreign key (SHIPID)
  references TB_HTMS_SHIP (SHIPID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_SHIPDETAIL foreign key (SHIPDETAILID)
  references TB_HTMS_SHIPDETAIL (SHIPDETAILID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_TRANSFER foreign key (TRANSFERID)
  references TB_HTMS_TRANSFER (TRANSID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_TRANSFERDET foreign key (TRANSDETAILID)
  references TB_HTMS_TRANSFERDETAIL (TRANSDETAILID);
alter table TB_HTMS_TRANSPORTDETAIL
  add constraint FK_TRANSPORTDETAIL_TRANSPORT foreign key (TRANSPORTID)
  references TB_HTMS_TRANSPORT (TRANSPORTID);  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_SEND
alter table TB_HTMS_SEND
  add constraint PK_TB_HTMS_SEND primary key (SENDID);
alter table TB_HTMS_SEND
  add constraint FK_SEND_CARRIER foreign key (CARRIERID)
  references TB_HTMS_CARRIER (CARRIERID);
alter table TB_HTMS_SEND
  add constraint FK_SEND_VEHICLE foreign key (VEHICLEID)
  references TB_HTMS_VEHICLE (VEHICLEID);
alter table TB_HTMS_SEND
  add constraint FK_TB_HTMS_SEND_TB_HTMS_DRIVER foreign key (DRIVERID)
  references TB_HTMS_DRIVER (DRIVERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_SENDDETAIL
alter table TB_HTMS_SENDDETAIL
  add constraint PK_TB_HTMS_SENDDETAIL primary key (SENDDETAILID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_CUSTOMER foreign key (CADDRID)
  references TB_HTMS_CUSTOMER (CUSTOMERID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_CUSTORDERDETAIL foreign key (CODETAILID)
  references TB_HTMS_CUSTORDERDETAIL (CODETAILID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_PRODUCT foreign key (PRODUCTID)
  references TB_HTMS_PRODUCT (PRODUCTID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_SEND foreign key (SENDID)
  references TB_HTMS_SEND (SENDID)
  disable;
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_SHIP foreign key (SHIPID)
  references TB_HTMS_SHIP (SHIPID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_SHIPDETAIL foreign key (SHIPDETAILID)
  references TB_HTMS_SHIPDETAIL (SHIPDETAILID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_TRANSFER foreign key (TRANSFERID)
  references TB_HTMS_TRANSFER (TRANSID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_TRANSFERDETAIL foreign key (TRANSDETAILID)
  references TB_HTMS_TRANSFERDETAIL (TRANSDETAILID);
alter table TB_HTMS_SENDDETAIL
  add constraint FK_SENDDETAIL_TRANSPORT foreign key (TRANSPORTID)
  references TB_HTMS_TRANSPORT (TRANSPORTID);


  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_TRANSPORTSEND
alter table TB_HTMS_TRANSPORTSEND
  add constraint TRANSPORT_REF_VEHCILE foreign key (TRANSPORTID)
  references TB_HTMS_TRANSPORT (TRANSPORTID);
alter table TB_HTMS_TRANSPORTSEND
  add constraint VEHCILE_REF_TRANSPORT foreign key (SENDID)
  references TB_HTMS_SEND (SENDID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_HTMS_TRANSPRICE
alter table TB_HTMS_TRANSPRICE
  add constraint PK_TB_HTMS_TRANSPRICE primary key (PRICEID);
alter table TB_HTMS_TRANSPRICE
  add constraint FK_TRANSPRICE_ROUTE foreign key (ROUTEID)
  references TB_HTMS_ROUTE (ROUTEID);
 




-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_CHANNEL
alter table TB_WSM_CHANNEL
  add constraint PK_TB_WSM_CHANNEL primary key (CHANNELID);
alter table TB_WSM_CHANNEL
  add constraint CHANNEL_REF_INFOTYPE foreign key (INFOTYPEID)
  references TB_WSM_INFOTYPE (INFOTYPEID);
alter table TB_WSM_CHANNEL
  add constraint SITE_REF_CHANNEL foreign key (SYSID)
  references TB_SYSTEM (SYSID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_COLUMN
alter table TB_WSM_COLUMN
  add constraint PK_TB_WSM_COLUMN primary key (COLUMNID);
alter table TB_WSM_COLUMN
  add constraint COLUMN_REF_INFOTYPE foreign key (INFOTYPEID)
  references TB_WSM_INFOTYPE (INFOTYPEID);
alter table TB_WSM_COLUMN
  add constraint COLUMN_REF_SITE foreign key (SYSID)
  references TB_SYSTEM (SYSID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_CHANNEL_COLUMN
alter table TB_WSM_CHANNEL_COLUMN
  add constraint PK_TB_WSM_CHANNEL_COLUMN primary key (CCID);
alter table TB_WSM_CHANNEL_COLUMN
  add constraint CHANNNEL_REF_COMPOSITE foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);
alter table TB_WSM_CHANNEL_COLUMN
  add constraint COLUMN_REF_COMPOSITE foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);
  

  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_CSS_ITEM
alter table TB_WSM_CSS_ITEM
  add constraint PK_TB_WSM_CSS_ITEM primary key (ITEMID);
alter table TB_WSM_CSS_ITEM
  add constraint CSS_REF_ITEM foreign key (CSSID)
  references TB_WSM_CSS (CSSID);
  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFOTYPE_PARAMS
alter table TB_WSM_INFOTYPE_PARAMS
  add constraint PK_TB_WSM_INFOTYPE_PARAMS primary key (PARAMSID);
alter table TB_WSM_INFOTYPE_PARAMS
  add constraint INFOTYPE_REF_PARAMS foreign key (INFOTYPEID)
  references TB_WSM_INFOTYPE (INFOTYPEID);
  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_SERVICE_LIST
alter table TB_WSM_INFO_SERVICE_LIST
  add constraint PK_TB_WSM_INFO_SERVICE_LIST primary key (CONFIGID);
alter table TB_WSM_INFO_SERVICE_LIST
  add constraint SERVICE_REF_LIST foreign key (SERVICEID)
  references TB_WSM_INFO_SERVICE (SERVICEID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_SERVICE_PARAMS
alter table TB_WSM_INFO_SERVICE_PARAMS
  add constraint PK_TB_WSM_INFO_SERVICE_PARAMS primary key (PARAMID);  
alter table TB_WSM_INFO_SERVICE_PARAMS
  add constraint SERVICE_REF_PARAMS foreign key (SERVICEID)
  references TB_WSM_INFO_SERVICE (SERVICEID);
 
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_SQLQUERY
alter table TB_WSM_INFO_SQLQUERY
  add constraint PK_TB_WSM_INFO_SQLQUERY primary key (QUERYID);
 
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_SQLQUERY_LIST
alter table TB_WSM_INFO_SQLQUERY_LIST
  add constraint PK_TB_WSM_INFO_SQLQUERY_LIST primary key (CONFIGID);
alter table TB_WSM_INFO_SQLQUERY_LIST
  add constraint QUERY_REF_LIST foreign key (QUERYID)
  references TB_WSM_INFO_SQLQUERY (QUERYID);
 
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_SQLQUERY_PARAMS
alter table TB_WSM_INFO_SQLQUERY_PARAMS
  add constraint PK_TB_WSM_INFO_SQLQUERY_PARAMS primary key (PARAMID);
alter table TB_WSM_INFO_SQLQUERY_PARAMS
  add constraint QUERY_REF_PARAMS foreign key (QUERYID)
  references TB_WSM_INFO_SQLQUERY (QUERYID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_INFO_WEB
alter table TB_WSM_INFO_WEB
  add constraint PK_TB_WSM_INFO_WEB primary key (INFOID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_LAYOUT
alter table TB_WSM_LAYOUT
  add constraint PK_TB_WSM_LAYOUT primary key (LAYOUTID);
alter table TB_WSM_LAYOUT
  add constraint CHANNEL_REF_SITE foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);

-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_LINK_GROUP
alter table TB_WSM_LINK_GROUP
  add constraint PK_TB_WSM_LINK_GROUP primary key (LINKGROUPID);
alter table TB_WSM_LINK_GROUP
  add constraint LINK_GROUP_REF_TYPE foreign key (LINKTYPEID)
  references TB_WSM_LINK_TYPE (LINKTYPEID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_LINK
alter table TB_WSM_LINK
  add constraint PK_TB_WSM_LINK primary key (LINKID);
alter table TB_WSM_LINK
  add constraint FK_TB_WSM_L_REFERENCE_TB_WSM_L foreign key (LINKTYPEID)
  references TB_WSM_LINK_TYPE (LINKTYPEID);
alter table TB_WSM_LINK
  add constraint GROUP_REF_LINK foreign key (LINKGROUPID)
  references TB_WSM_LINK_GROUP (LINKGROUPID);
  

  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_ROLE_CHANNEL
alter table TB_WSM_ROLE_CHANNEL
  add constraint CHANNEL_REF_ROLE foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);
alter table TB_WSM_ROLE_CHANNEL
  add constraint ROLE_REF_CHANNEL foreign key (ROLEID)
  references TB_WSM_ROLE (ROLEID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_ROLE_COLUMN
alter table TB_WSM_ROLE_COLUMN
  add constraint COLUMN_REF_ROLE foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);
alter table TB_WSM_ROLE_COLUMN
  add constraint ROLE_REF_COLUMN foreign key (ROLEID)
  references TB_WSM_ROLE (ROLEID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_SKIN
alter table TB_WSM_SKIN
  add constraint PK_TB_WSM_SKIN primary key (SKINID);
alter table TB_WSM_SKIN
  add constraint SKIN_REF_THEMES foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID);
  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_THEMES_DEFINE_TYPE
alter table TB_WSM_THEMES_DEFINE_TYPE
  add constraint PK_TB_WSM_THEMES_DEFINE_TYPE primary key (TDTID);
alter table TB_WSM_THEMES_DEFINE_TYPE
  add constraint THEMES_REF_DEFINE_TYPE foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_THEMES_PARAMS
alter table TB_WSM_THEMES_PARAMS
  add constraint PK_TB_WSM_THEMES_PARAMS primary key (PARAMSID);
alter table TB_WSM_THEMES_PARAMS
  add constraint THEMES_REF_PARAS foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_THEMES_SELECTABLE_VALUE
alter table TB_WSM_THEMES_SELECTABLE_VALUE
  add constraint PK_TB_WSM_THEMES_SELECTABLE_VA primary key (VALUEID);
alter table TB_WSM_THEMES_SELECTABLE_VALUE
  add constraint PARAMS_REF_VALUE foreign key (PARAMSID)
  references TB_WSM_THEMES_PARAMS (PARAMSID);
alter table TB_WSM_THEMES_SELECTABLE_VALUE
  add constraint TYPE_REF_SELECTABLE_VALUE foreign key (TDTID)
  references TB_WSM_THEMES_DEFINE_TYPE (TDTID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_UNIT
alter table TB_WSM_UNIT
  add constraint PK_TB_WSM_UNIT primary key (UNITID);
alter table TB_WSM_UNIT
  add constraint LAYOUT_REF_UNIT foreign key (LAYOUTID)
  references TB_WSM_LAYOUT (LAYOUTID);
  
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_UNIT_COLUMN
  add constraint COLUMN_REF_UNIT foreign key (UNITID)
  references TB_WSM_UNIT (UNITID);
alter table TB_WSM_UNIT_COLUMN
  add constraint UNIT_REF_COLUMN foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);
  

  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_USER_CHANNEL
alter table TB_WSM_USER_CHANNEL
  add constraint CHANNEL_REF_USER foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);
alter table TB_WSM_USER_CHANNEL
  add constraint USER_REF_CHANNEL foreign key (USERID)
  references TB_WSM_USER (USERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_USER_COLUMN
alter table TB_WSM_USER_COLUMN
  add constraint COLUMN_REF_USER foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);
alter table TB_WSM_USER_COLUMN
  add constraint USER_REF_COLUMN foreign key (USERID)
  references TB_WSM_USER (USERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_USER_LAYOUT 
alter table TB_WSM_USER_LAYOUT
  add constraint LAYOUT_REF_USER foreign key (LAYOUTID)
  references TB_WSM_LAYOUT (LAYOUTID);
alter table TB_WSM_USER_LAYOUT
  add constraint USER_REF_LAYOUT foreign key (USERID)
  references TB_WSM_USER (USERID);
  
-- Create/Recreate primary, unique and foreign key constraints for TB_WSM_USER_SYSTEM
alter table TB_WSM_USER_SYSTEM
  add constraint SITE_REF_USER foreign key (SYSID)
  references TB_SYSTEM (SYSID);
alter table TB_WSM_USER_SYSTEM
  add constraint USER_REF_SITE foreign key (USERID)
  references TB_WSM_USER (USERID);
  
  
  
  
  
  
  
  
  
  