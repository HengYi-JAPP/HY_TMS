-- Create table TB_DATASOURCE
create table TB_DATASOURCE
(
  DBSID      VARCHAR2(64) not null,
  DBSNAME    VARCHAR2(100) not null,
  DBTYPE     VARCHAR2(100) not null,
  DBDRIVER   VARCHAR2(100) not null,
  DBNAME     VARCHAR2(100) not null,
  HOSTIP     VARCHAR2(100) not null,
  HOSTPORT   VARCHAR2(10) not null,
  DBACCOUNT  VARCHAR2(60) not null,
  DBPWD      VARCHAR2(60) not null,
  MAXCONN    VARCHAR2(10),
  ISVALIDATE VARCHAR2(2)
);

-- Create table TB_DICTIONARY
create table TB_DICTIONARY
(
  TYPEID     NUMBER(38) not null,
  DICID      NUMBER(38) not null,
  DICNAME    VARCHAR2(300) not null,
  DICCODE    VARCHAR2(64) not null,
  DICDESC    VARCHAR2(300),
  SHOWORDER  VARCHAR2(10) not null,
  ISVALIDATE VARCHAR2(10) not null
);

-- Create table TB_DIC_TYPE
create table TB_DIC_TYPE
(
  TYPEID     NUMBER(38) not null,
  TYPECODE   VARCHAR2(64) not null,
  TYPENAME   VARCHAR2(300) not null,
  TYPEDESC   VARCHAR2(100),
  ISVALIDATE VARCHAR2(10) not null
);

-- Create table TB_HTMS_AREA
create table TB_HTMS_AREA
(
  AREAID         NUMBER(38) not null,
  PARENTAREAID   NUMBER(38) default -1,
  AREACODE       VARCHAR2(10),
  AREANAME       VARCHAR2(100),
  AREALEVEL      NUMBER(38),
  AREAROUTE      VARCHAR2(100),
  ISVALIDATE     NUMBER(38) default '1',
  AREALONGTITUE  VARCHAR2(30),
  AREALATITUE    VARCHAR2(30),
  AREAPARENTCODE VARCHAR2(10),
  ISLEAF         INTEGER
);

-- Create table TB_HTMS_AREA001
create table TB_HTMS_AREA001
(
  AREAID         NUMBER(38) not null,
  PARENTAREAID   NUMBER(38) default -1,
  AREACODE       VARCHAR2(10),
  AREANAME       VARCHAR2(100),
  AREALEVEL      NUMBER(38),
  AREAROUTE      VARCHAR2(100),
  ISVALIDATE     NUMBER(38) default '1',
  AREALONGTITUE  VARCHAR2(30),
  AREALATITUE    VARCHAR2(30),
  AREAPARENTCODE VARCHAR2(10),
  ISLEAF         NUMBER(38)
);

-- Create table TB_HTMS_AREA002
create table TB_HTMS_AREA002
(
  AREAID         NUMBER(38) not null,
  PARENTAREAID   NUMBER(38) default -1,
  AREACODE       VARCHAR2(10),
  AREANAME       VARCHAR2(100),
  AREALEVEL      NUMBER(38),
  AREAROUTE      VARCHAR2(100),
  ISVALIDATE     NUMBER(38) default '1',
  AREALONGTITUE  VARCHAR2(30),
  AREALATITUE    VARCHAR2(30),
  AREAPARENTCODE VARCHAR2(10),
  ISLEAF         NUMBER(38),
  PROVINCECODE   VARCHAR2(10),
  PROVINCENAME   VARCHAR2(100),
  PROVINCEID     NUMBER(38)
);

-- Create table TB_HTMS_AREA003
create table TB_HTMS_AREA003
(
  AREAID         NUMBER(38) not null,
  PARENTAREAID   NUMBER(38) default -1,
  AREACODE       VARCHAR2(10),
  AREANAME       VARCHAR2(100),
  AREALEVEL      NUMBER(38),
  AREAROUTE      VARCHAR2(100),
  ISVALIDATE     NUMBER(38) default '1',
  AREALONGTITUE  VARCHAR2(30),
  AREALATITUE    VARCHAR2(30),
  AREAPARENTCODE VARCHAR2(10),
  ISLEAF         NUMBER(38),
  CITYID         NUMBER(38),
  CITYCODE       VARCHAR2(10),
  CITYNAME       VARCHAR2(100),
  PROVINCEID     NUMBER(38),
  PROVINCECODE   VARCHAR2(10),
  PROVINCENAME   VARCHAR2(100)
);

-- Create table TB_HTMS_AREA004
create table TB_HTMS_AREA004
(
  AREAID         NUMBER(38) not null,
  PARENTAREAID   NUMBER(38) default -1,
  AREACODE       VARCHAR2(10),
  AREANAME       VARCHAR2(100),
  AREALEVEL      NUMBER(38),
  AREAROUTE      VARCHAR2(100),
  ISVALIDATE     NUMBER(38) default '1',
  AREALONGTITUE  VARCHAR2(30),
  AREALATITUE    VARCHAR2(30),
  AREAPARENTCODE VARCHAR2(10),
  ISLEAF         NUMBER(38),
  COUNTYID       NUMBER(38),
  COUNTYCODE     VARCHAR2(10),
  COUNTYNAME     VARCHAR2(100),
  CITYID         NUMBER(38),
  CITYCODE       VARCHAR2(10),
  CITYNAME       VARCHAR2(100),
  PROVINCEID     NUMBER(38),
  PROVINCECODE   VARCHAR2(10),
  PROVINCENAME   VARCHAR2(100)
);

-- Create table TB_HTMS_CARRIER
create table TB_HTMS_CARRIER
(
  CARRIERID        NUMBER(38) not null,
  CARRIERNAME      VARCHAR2(100),
  CARRIERCODE      VARCHAR2(100),
  CARRIERAREA      VARCHAR2(1000),
  CARRIERCONTACTOR VARCHAR2(100),
  CARRIERTELEPHONE VARCHAR2(30),
  ISVALIDATE       NUMBER(38) default '1'
);

-- Create table TB_HTMS_CUSTOMER
create table TB_HTMS_CUSTOMER
(
  CUSTOMERID     NUMBER(38) not null,
  CUSTOMERCODE   VARCHAR2(100),
  CUSTOMERNAME   VARCHAR2(100),
  CUSTOMERNOTICE VARCHAR2(300),
  CUSTOMERAMOUNT VARCHAR2(30),
  CREATOR        VARCHAR2(30),
  CREATETIME     VARCHAR2(30),
  ISVALIDATE     NUMBER(38) default '1',
  CUSTOMERTYPE   INTEGER default 0
);

-- Create table TB_HTMS_CUSTOMERADDR
create table TB_HTMS_CUSTOMERADDR
(
  CADDRID        NUMBER(38) not null,
  CUSTOMERID     NUMBER(38),
  CADDRDETAIL    VARCHAR2(30),
  CREATOR        VARCHAR2(30),
  CREATETIME     VARCHAR2(30),
  ISVALIDATE     NUMBER(38) default '1',
  AREAID         INTEGER,
  CADDRCONTACTOR VARCHAR2(30),
  CADDRTELEPHONE VARCHAR2(30),
  ISDEFAULT      INTEGER,
  CARNO          VARCHAR2(30),
  CADDRNOTICE    VARCHAR2(300),
  AREACODE       VARCHAR2(30)
);

-- Create table TB_HTMS_CUSTOMER_PRICE
create table TB_HTMS_CUSTOMER_PRICE
(
  PRICEID          INTEGER not null,
  CUSTOMERID       INTEGER,
  ROUTEID          INTEGER,
  PRICETYPE        INTEGER,
  FREIGHTMODEL     INTEGER,
  CUSTOMERPRICE    VARCHAR2(30),
  CARRIERPRICE     VARCHAR2(30),
  CUSTOMERONEPRICE VARCHAR2(30),
  CARRIERONEPRICE  VARCHAR2(30),
  PRICESTART       VARCHAR2(30),
  PRICEEND         VARCHAR2(30),
  PRICEUNIT        VARCHAR2(30),
  VALIDATEDATE     VARCHAR2(30),
  PRICENOTICE      VARCHAR2(300),
  CREATOR          INTEGER,
  CREATETIME       VARCHAR2(30),
  MODIFIER         INTEGER,
  MODIFYTIME       VARCHAR2(30),
  ISVALIDATE       INTEGER
);

-- Create table TB_HTMS_CUSTORDER
create table TB_HTMS_CUSTORDER
(
  CORDERID       NUMBER(38) not null,
  CUSTOMERID     NUMBER(38),
  CORDERNAME     VARCHAR2(100),
  CORDERCODE     VARCHAR2(30),
  CUSTOMERCODE   VARCHAR2(30),
  SALENUM        VARCHAR2(30),
  SALECHANNEL    VARCHAR2(30),
  PRODUCTGROUP   VARCHAR2(30),
  SALEGROUP      VARCHAR2(30),
  SALEDEPARTMENT VARCHAR2(30),
  SALETYPE       VARCHAR2(30),
  EXCHANGETITLE  VARCHAR2(30),
  FETCHFACTORY   VARCHAR2(300),
  DELIVERYSTATUS VARCHAR2(10),
  CREATEDATE     VARCHAR2(30),
  CREATETIME     VARCHAR2(30),
  CREATOR        VARCHAR2(30),
  INPUTTIME      VARCHAR2(30),
  ISVALIDATE     NUMBER(38) default '1',
  CUSTOMERNAME   VARCHAR2(100),
  SALEORG        VARCHAR2(30),
  SALEMAN        VARCHAR2(30),
  CUSTOMERAMOUNT VARCHAR2(30)
);

-- Create table TB_HTMS_CUSTORDERDETAIL
create table TB_HTMS_CUSTORDERDETAIL
(
  CODETAILID              NUMBER(38) not null,
  CORDERID                NUMBER(38),
  CODETAILCERTIFICATE     VARCHAR2(100),
  METERIALNO              VARCHAR2(100),
  METERIALID              VARCHAR2(30),
  CODETAILCERTIFICATEDESC VARCHAR2(100),
  ORDERAMOUNT             VARCHAR2(30),
  ORDERUNIT               VARCHAR2(100),
  PROJECTVOLUME           VARCHAR2(30),
  VOLUMEUNIT              VARCHAR2(100),
  CONDITIONSUTOTAL        VARCHAR2(30),
  FREIGHT                 VARCHAR2(30),
  UNITPRICE               VARCHAR2(30),
  DOCCONDCOUNT            VARCHAR2(30),
  ALREADYGETNUM           VARCHAR2(30),
  CREATOR                 VARCHAR2(30),
  CREATETIME              VARCHAR2(30),
  MODIFIER                VARCHAR2(30),
  MODIFYTIIME             VARCHAR2(30),
  ISVALIDATE              NUMBER(38) default '1',
  SALENUM                 VARCHAR2(30),
  METERIALFACTORY         VARCHAR2(30),
  NOTLIMITSTORAGE         NUMBER(38),
  POSTEDSTOCK             INTEGER,
  UNPOSTEDSTOCK           INTEGER,
  DELIVERYSTATUS          VARCHAR2(10),
  PARTIALDELIVERY         NUMBER(38),
  DBPRICE                 NUMBER(38),
  APPLIABLEAMOUNT         VARCHAR2(30),
  APPLIEDAMOUNT           VARCHAR2(30) default 0,
  METERIALGROUP           VARCHAR2(30),
  PRODUCTID               INTEGER,
  FACTORYID               INTEGER,
  PRODUCTNAME             VARCHAR2(60),
  FACTORYNAME             VARCHAR2(60),
  FACTORYGROUP            VARCHAR2(30)
);

-- Create table TB_HTMS_DRIVER
create table TB_HTMS_DRIVER
(
  DRIVERID      NUMBER(38) not null,
  CARRIERID     NUMBER(38),
  DRIVERCODE    VARCHAR2(30),
  DRIVERNAME    VARCHAR2(30),
  DRIVERSEX     NUMBER(38),
  DRIVERYEAR    NUMBER(38),
  DRIVERIDNUM   VARCHAR2(30),
  DRIVERADDRESS VARCHAR2(30),
  DRIVERMOBILE  VARCHAR2(30),
  DRIVERWEIXIN  VARCHAR2(30),
  DRIVERNOTICE  VARCHAR2(300),
  ISVALIDATE    NUMBER(38) default '1'
);

-- Create table TB_HTMS_FACTORY
create table TB_HTMS_FACTORY
(
  FACTORYID        NUMBER(38) not null,
  FACTORYNAME      VARCHAR2(100),
  FACTORYCODE      VARCHAR2(100),
  FACTORYDESC      VARCHAR2(1000),
  FACTORYADDRESS   VARCHAR2(300),
  FACTORYCONTACTOR VARCHAR2(30),
  FACTORYTELPHONE  VARCHAR2(30),
  ISVLIDATE        NUMBER(38) default '1'
);

-- Create table TB_HTMS_LOGISTICS
create table TB_HTMS_LOGISTICS
(
  LOGISTICSID        NUMBER(38) not null,
  LOGISTICSNAME      VARCHAR2(100),
  LOGISTICSCODE      VARCHAR2(100),
  LOGISTICSADDRESS   VARCHAR2(300),
  LOGISTICSCONTACTOR VARCHAR2(100),
  LOGISTICSTELEPHONE VARCHAR2(30),
  ISVALIDATE         NUMBER(38) default '1'
);

-- Create table TB_HTMS_OADDR
create table TB_HTMS_OADDR
(
  CADDRID        NUMBER(38) not null,
  CUSTOMERID     NUMBER(38),
  CADDRDETAIL    VARCHAR2(300),
  CREATOR        VARCHAR2(30),
  CREATETIME     VARCHAR2(30),
  ISVALIDATE     NUMBER(38) default '1',
  AREAID         NUMBER(38),
  CADDRCONTACTOR VARCHAR2(30),
  CADDRTELEPHONE VARCHAR2(30),
  ISDEFAULT      NUMBER(38),
  CUSTOMERNO     VARCHAR2(30),
  CUSTOMERNAME   VARCHAR2(300),
  AREACODE       VARCHAR2(30),
  PROVINCEID     VARCHAR2(30),
  PROVINCECODE   VARCHAR2(30),
  PROVINCENAME   VARCHAR2(300),
  CITYID         VARCHAR2(30),
  CITYCODE       VARCHAR2(30),
  CITYNAME       VARCHAR2(300),
  COUNTYID       VARCHAR2(30),
  COUNTYCODE     VARCHAR2(30),
  COUNTYNAME     VARCHAR2(300),
  COUNTRYID      VARCHAR2(30),
  COUNTRYCODE    VARCHAR2(30),
  COUNTRYNAME    VARCHAR2(300),
  DEFAULTDESC    VARCHAR2(30),
  FULLNAME       VARCHAR2(300),
  ADDRNOTICE     VARCHAR2(300)
);

-- Create table TB_HTMS_ORDERSYN
create table TB_HTMS_ORDERSYN
(
  SYNID      NUMBER(38) not null,
  STARTDATE  VARCHAR2(30),
  ENDDATE    VARCHAR2(30),
  SALESNO    VARCHAR2(30),
  CREATOR    VARCHAR2(30),
  CREATETIME VARCHAR2(30),
  MODIFIER   VARCHAR2(30),
  MODIFYTIME VARCHAR2(30),
  ISVALIDATE NUMBER(38) default '1',
  SYNIP      VARCHAR2(30),
  STARTTIME  VARCHAR2(30),
  ENDTIME    VARCHAR2(30),
  USETIME    NUMBER(38)
);

-- Create table TB_HTMS_PRODUCT
create table TB_HTMS_PRODUCT
(
  PRODUCTID   NUMBER(38) not null,
  TYPEID      NUMBER(38),
  PRODUCTNAME VARCHAR2(100),
  PRODUCTCODE VARCHAR2(100),
  PRODUCTDESC VARCHAR2(300),
  SAPNO       VARCHAR2(100),
  ISVALIDATE  NUMBER(38) default '1'
);

-- Create table TB_HTMS_PRODUCTTYPE
create table TB_HTMS_PRODUCTTYPE
(
  TYPEID     NUMBER(38) not null,
  TYPENAME   VARCHAR2(100) not null,
  TYPECODE   VARCHAR2(100) not null,
  TYPEDESC   VARCHAR2(300),
  ISVALIDATE NUMBER(38) default '1'
);

-- Create table TB_HTMS_ROUTE
create table TB_HTMS_ROUTE
(
  ROUTEID    NUMBER(38) not null,
  FACTORYID  NUMBER(38),
  AREAID     NUMBER(38),
  PRODUCTID  NUMBER(38),
  CREATOR    NUMBER(38),
  CREATETIME VARCHAR2(30),
  MODIFIER   NUMBER(38),
  MODIFYTIME VARCHAR2(30),
  ISVALIDATE NUMBER(38) default '1'
);

-- Create table TB_HTMS_SEND
create table TB_HTMS_SEND
(
  SENDID        NUMBER(38) not null,
  VEHICLEID     NUMBER(38),
  DRIVERID      NUMBER(38),
  CARRIERID     NUMBER(38),
  SENDCODE      VARCHAR2(30),
  PLANTIME      VARCHAR2(30),
  APPLYTONNUM   VARCHAR2(30),
  APPLYPACKNUM  VARCHAR2(30),
  ACTAULTONNUM  VARCHAR2(30),
  ACTAULPACKNUM VARCHAR2(30),
  PLANFREIGHT   VARCHAR2(30),
  ACTAULFREIGHT VARCHAR2(30),
  FREIGHTUNIT   VARCHAR2(30),
  SENDSTATUS    NUMBER(38),
  SIGNPROOF     VARCHAR2(300),
  CREATOR       VARCHAR2(30),
  CREATETIME    VARCHAR2(30),
  MODIFIER      VARCHAR2(30),
  MODIFYTIME    VARCHAR2(30),
  ISVALIDATE    NUMBER(38) default '1',
  SENDNOTICE    VARCHAR2(300),
  DETAILTIME    VARCHAR2(30)
);

-- Create table TB_HTMS_SENDDETAIL
create table TB_HTMS_SENDDETAIL
(
  SENDDETAILID      NUMBER(38) not null,
  SENDID            NUMBER(38),
  TRANSDETAILID     NUMBER(38),
  TRANSPORTID       NUMBER(38),
  TRANSFERID        NUMBER(38),
  SHIPDETAILID      NUMBER(38),
  CODETAILID        NUMBER(38),
  SHIPID            NUMBER(38),
  CADDRID           NUMBER(38),
  PRODUCTID         NUMBER(38),
  APPLYTONNUM       VARCHAR2(30),
  APPLYPACKNUM      VARCHAR2(30),
  FETCHTONNUM       VARCHAR2(30),
  FETCHPACKNUM      VARCHAR2(30),
  PLANFREIGHT       VARCHAR2(30),
  ACTULFREIGHT      VARCHAR2(30),
  FREIGHTUNIT       VARCHAR2(30),
  USEFREIGHT        VARCHAR2(30),
  TRANSDETAILNOTICE VARCHAR2(300),
  TRANSDETAILSTATUS VARCHAR2(30),
  CREATOR           VARCHAR2(30),
  CREATETIME        VARCHAR2(30),
  MODIFIER          VARCHAR2(30),
  MODIFYTIME        VARCHAR2(30),
  ISVALIDATE        NUMBER(38) default '1'
);

-- Create table TB_HTMS_SHIP
create table TB_HTMS_SHIP
(
  SHIPID        NUMBER(38) not null,
  CORDERID      NUMBER(38),
  CUSTOMERID    NUMBER(38),
  SHIPCODE      VARCHAR2(30),
  APPLYTONNUM   VARCHAR2(30),
  APPLYPACKNUM  VARCHAR2(30),
  ACTUALTONNUM  VARCHAR2(30),
  ACTUALPACKNUM VARCHAR2(30),
  PLANFREIGHT   VARCHAR2(30),
  ACTUALFREIGHT VARCHAR2(30),
  FREIGHTUNIT   VARCHAR2(30),
  SHIPNOTICE    VARCHAR2(300),
  APPLIER       NUMBER(38),
  APPLYTIME     VARCHAR2(30),
  APPLYSTATUS   NUMBER(38),
  APPROVER      VARCHAR2(30),
  APPROVETIME   VARCHAR2(30),
  APPROVENOTICE VARCHAR2(300),
  CREATOR       VARCHAR2(30),
  CREATETIME    VARCHAR2(30),
  MODIFIER      VARCHAR2(30),
  MODIFYTIME    VARCHAR2(30),
  ISVALIDATE    NUMBER(38) default '1',
  ISURGENT      INTEGER default 0,
  ORDERCODE     VARCHAR2(30),
  SELFFETCH     NUMBER(38) default 0,
  FETCHDRIVER   VARCHAR2(30),
  FETCHMOBILE   VARCHAR2(30),
  FETCHCAR      VARCHAR2(30),
  CADDRID       NUMBER(38)
);

-- Create table TB_HTMS_SHIPDETAIL
create table TB_HTMS_SHIPDETAIL
(
  SHIPDETAILID     NUMBER(38) not null,
  SHIPID           NUMBER(38),
  CADDRID          NUMBER(38),
  CODETAILID       NUMBER(38),
  PRODUCTID        NUMBER(38),
  APPLYTONNUM      VARCHAR2(30),
  APPLYPACKNUM     VARCHAR2(30),
  FETCHTONNUM      VARCHAR2(30),
  FETCHPACKNUM     VARCHAR2(30),
  PLANFREIGHT      VARCHAR2(30),
  ACTULFREIGHT     VARCHAR2(30),
  FREIGHTUNIT      VARCHAR2(30),
  SHIPDETAILNOTICE VARCHAR2(300),
  SHIPDETAILSTATUS NUMBER(38),
  CREATETIME       VARCHAR2(30),
  CREATOR          VARCHAR2(30),
  MODIFIER         VARCHAR2(30),
  MODIFYTIME       VARCHAR2(30),
  ISVALIDATE       NUMBER(38) default '1',
  ITEMCODE         VARCHAR2(30),
  FACTORYID        NUMBER(38)
);

-- Create table TB_HTMS_SYSTEM_LOG
create table TB_HTMS_SYSTEM_LOG
(
  LOGID      INTEGER not null,
  LOGCODE    VARCHAR2(30),
  LOGADDRESS VARCHAR2(300),
  LOGDESC    VARCHAR2(300),
  LOGUSER    INTEGER,
  LOGTIME    VARCHAR2(30),
  LOGRESULT  INTEGER,
  LOGIP      VARCHAR2(30),
  LOGMAC     VARCHAR2(30),
  ISVALIDATE INTEGER
);

-- Create table TB_HTMS_TASKSCHEDULE
create table TB_HTMS_TASKSCHEDULE
(
  TASKID        INTEGER not null,
  TASKNAME      VARCHAR2(100),
  TASKDESC      VARCHAR2(300),
  TASKINTERVAL  INTEGER,
  TASKTIMEUNIT  INTEGER,
  TASKCLASS     VARCHAR2(300),
  ISUSE         INTEGER,
  STARTDATETIME VARCHAR2(30),
  EDNDATETIME   VARCHAR2(30),
  ISVALIDATE    INTEGER
);

-- Create table TB_HTMS_TRANSFER
create table TB_HTMS_TRANSFER
(
  TRANSID       NUMBER(38) not null,
  SHIPID        NUMBER(38),
  LOGISTICSID   NUMBER(38),
  CORDERID      NUMBER(38),
  CUSTOMERID    NUMBER(38),
  TRANSFERCODE  VARCHAR2(30),
  APPLYTONNUM   VARCHAR2(30),
  APPLYPACKNUM  VARCHAR2(30),
  ACTUALTONNUM  VARCHAR2(30),
  ACTUALPACKNUM VARCHAR2(30),
  PLANFREIGHT   VARCHAR2(30),
  ACTUALFREIGHT VARCHAR2(30),
  FREIGHTUNIT   VARCHAR2(30),
  SHIPNOTICE    VARCHAR2(300),
  TRANSSTATUS   NUMBER(38),
  CREATOR       VARCHAR2(30),
  CREATETIME    VARCHAR2(30),
  MODIFIER      VARCHAR2(30),
  MODIFYTIME    VARCHAR2(30),
  ISVALIDATE    NUMBER(38) default '1',
  ISDEFAULT     INTEGER,
  SELFFETCH     NUMBER(38) default 0,
  FETCHDRIVER   VARCHAR2(30),
  FETCHMOBILE   VARCHAR2(30),
  FETCHCAR      VARCHAR2(30),
  ISURGENT      NUMBER(38),
  ORDERCODE     VARCHAR2(30),
  CADDRID       NUMBER(38),
  SHIPCODE      VARCHAR2(30),
  SAPTRANSCODE  VARCHAR2(30)
);

-- Create table TB_HTMS_TRANSFERDETAIL
create table TB_HTMS_TRANSFERDETAIL
(
  TRANSDETAILID     NUMBER(38) not null,
  SHIPDETAILID      NUMBER(38),
  TRANSID           NUMBER(38),
  SHIPID            NUMBER(38),
  CADDRID           NUMBER(38),
  PRODUCTID         NUMBER(38),
  APPLYTONNUM       VARCHAR2(30),
  APPLYPACKNUM      VARCHAR2(30),
  FETCHTONNUM       VARCHAR2(30),
  FETCHPACKNUM      VARCHAR2(30),
  PLANFREIGHT       VARCHAR2(30),
  ACTULFREIGHT      VARCHAR2(30),
  FREIGHTUNIT       VARCHAR2(30),
  TRANSDETAILNOTICE VARCHAR2(30),
  TRANSDETAILSTATUS NUMBER(38),
  CREATOR           VARCHAR2(30),
  CREATETIME        VARCHAR2(30),
  MODIFIER          VARCHAR2(30),
  MODIFYTIME        VARCHAR2(30),
  ISVALIDATE        NUMBER(38) default '1',
  CODETAILID        NUMBER(38),
  ITEMCODE          VARCHAR2(30),
  FACTORYID         INTEGER
);

-- Create table TB_HTMS_TRANSPORT
create table TB_HTMS_TRANSPORT
(
  TRANSPORTID     NUMBER(38) not null,
  CARRIERID       NUMBER(38),
  TRANSID         NUMBER(38),
  TRANSPORTCODE   VARCHAR2(30),
  PLANTIME        VARCHAR2(30),
  APPLYTONNUM     VARCHAR2(30),
  APPLYPACKNUM    VARCHAR2(30),
  ACTAULTONNUM    VARCHAR2(30),
  ACTAULPACKNUM   VARCHAR2(30),
  PLANFREIGHT     VARCHAR2(30),
  ACTAULFREIGHT   VARCHAR2(30),
  FREIGHTUNIT     VARCHAR2(30),
  TRANSPORTSTATUS VARCHAR2(30),
  CREATOR         VARCHAR2(30),
  CREATETIME      VARCHAR2(30),
  MODIFIER        VARCHAR2(30),
  MODIFYTIME      VARCHAR2(30),
  ISVALIDATE      NUMBER(38) default '1',
  CORDERID        NUMBER(38),
  SHIPID          NUMBER(38),
  CADDRID         NUMBER(38)
);

-- Create table TB_HTMS_TRANSPORTDETAIL
create table TB_HTMS_TRANSPORTDETAIL
(
  SPORTDETAILID     NUMBER(38) not null,
  TRANSDETAILID     NUMBER(38),
  TRANSPORTID       NUMBER(38),
  TRANSFERID        NUMBER(38),
  SHIPDETAILID      NUMBER(38),
  CODETAILID        NUMBER(38),
  SHIPID            NUMBER(38),
  CADDRID           NUMBER(38),
  PRODUCTID         NUMBER(38),
  APPLYTONNUM       VARCHAR2(30),
  APPLYPACKNUM      VARCHAR2(30),
  FETCHTONNUM       VARCHAR2(30),
  FETCHPACKNUM      VARCHAR2(30),
  PLANFREIGHT       VARCHAR2(30),
  ACTULFREIGHT      VARCHAR2(30),
  FREIGHTUNIT       VARCHAR2(30),
  TRANSDETAILNOTICE VARCHAR2(30),
  TRANSDETAILSTATUS NUMBER(38),
  CREATOR           VARCHAR2(30),
  CREATETIME        VARCHAR2(30),
  MODIFIER          VARCHAR2(30),
  MODIFYTIME        VARCHAR2(30),
  ISVALIDATE        NUMBER(38),
  FACTORYID         INTEGER,
  ITEMCODE          VARCHAR2(30)
);

-- Create table TB_HTMS_TRANSPORTSEND
create table TB_HTMS_TRANSPORTSEND
(
  TRANSPORTID INTEGER,
  SENDID      INTEGER
);

-- Create table TB_HTMS_TRANSPRICE
create table TB_HTMS_TRANSPRICE
(
  PRICEID          NUMBER(38) not null,
  ROUTEID          NUMBER(38),
  PRICETYPE        NUMBER(38),
  CUSTOMERPRICE    VARCHAR2(30),
  COMPANYPRICE     VARCHAR2(30),
  CARRIERPRICE     VARCHAR2(30),
  PRICESTART       VARCHAR2(30),
  PRICEEND         VARCHAR2(30),
  PRICEUNIT        VARCHAR2(30),
  CREATOR          VARCHAR2(30),
  CREATETIME       VARCHAR2(30),
  MODIFIER         VARCHAR2(30),
  MODIFYTIME       VARCHAR2(30),
  ISVALIDATE       NUMBER(38) default '1',
  CUSTOMERONEPRICE VARCHAR2(30),
  CARRIERONEPRICE  VARCHAR2(30),
  FREIGHTMODEL     INTEGER,
  VALIDATEDATE     VARCHAR2(30)
);

-- Create table TB_HTMS_VEHICLE
create table TB_HTMS_VEHICLE
(
  VEHICLEID        NUMBER(38) not null,
  CARRIERID        NUMBER(38),
  VEHICLECODE      VARCHAR2(30),
  VEHICLENO        VARCHAR2(12),
  VEHICLEMAXTON    VARCHAR2(30),
  VEHICLELENGTH    VARCHAR2(30),
  VEHICLEWIDTH     VARCHAR2(30),
  VEHICLEHEIGHT    VARCHAR2(30),
  VEHICLEPERSONNUM NUMBER(38),
  VEHICLEDESC      VARCHAR2(300),
  ISVALIDATE       NUMBER(38) default '1'
);

-- Create table TB_SYSTEM
create table TB_SYSTEM
(
  SYSID      NUMBER(38) not null,
  SYSCODE    VARCHAR2(100) not null,
  SYSNAME    VARCHAR2(100) not null,
  SYSPATH    VARCHAR2(500) not null,
  SYSDESC    VARCHAR2(1000),
  SHOWORDER  NUMBER(38),
  DEFROLEID  NUMBER(38),
  ISVALIDATE NUMBER(38) not null,
  ISINSIDE   NUMBER(38) default 0,
  USERDEFINE NUMBER(38) default 0,
  USERID     NUMBER(38)
);

-- Create table TB_WSM_CHANNEL
create table TB_WSM_CHANNEL
(
  CHANNELID     NUMBER(38) not null,
  SYSID         NUMBER(38),
  INFOTYPEID    NUMBER(38),
  CHANNELNAME   VARCHAR2(300),
  CHANNELCODE   VARCHAR2(300),
  CHANNELURL    VARCHAR2(300),
  SELECTEDCLASS VARCHAR2(300),
  DEFAULTCLASS  VARCHAR2(300),
  CHANNELDESC   VARCHAR2(300),
  LOADSTYLE     VARCHAR2(30),
  ISVALIDATE    NUMBER(38) default 1,
  DEFAULTORDER  NUMBER(38) default 0,
  DEFAULTSHOW   NUMBER(38) default 1,
  DEFAULTSELECT NUMBER(38) default 0,
  BEFOREICON    VARCHAR2(300),
  AFTERICON     VARCHAR2(300),
  SHOWHEIGHT    NUMBER(38),
  USERDEFINE    NUMBER(38) default 0,
  USERID        NUMBER(38)
);

-- Create table TB_WSM_CHANNEL_COLUMN
create table TB_WSM_CHANNEL_COLUMN
(
  CCID       NUMBER(38) not null,
  CHANNELID  NUMBER(38),
  COLUMNID   NUMBER(38),
  PARENTID   NUMBER(38),
  SHOWNAME   VARCHAR2(200),
  SYSID      NUMBER(38),
  SHOWORDER  NUMBER(38),
  BEFOREICON VARCHAR2(300),
  AFTERICON  VARCHAR2(300),
  SHOWHEIGHT NUMBER(38),
  USERDEFINE NUMBER(38) default 0,
  USERID     NUMBER(38)
);

-- Create table TB_WSM_COLUMN
create table TB_WSM_COLUMN
(
  COLUMNID        NUMBER(38) not null,
  PARENTCOLUMNID  NUMBER(38) default -1,
  SYSID           NUMBER(38),
  INFOTYPEID      NUMBER(38),
  COLUMNNAME      VARCHAR2(100) not null,
  COLUMNCODE      VARCHAR2(100),
  LOGO            VARCHAR2(300),
  CONTENTLINK     VARCHAR2(300),
  MORELINK        VARCHAR2(300),
  ISASYNCLOAD     VARCHAR2(30),
  COLUMNDESC      VARCHAR2(1000),
  ISVALIDATE      VARCHAR2(30),
  COLUMNLOADER    VARCHAR2(300),
  COLUMNSKIN      VARCHAR2(64),
  INDEXCOLUMNSKIN VARCHAR2(64),
  VIEWCOLUMNSKIN  VARCHAR2(64),
  LISTCOLUMNSKIN  VARCHAR2(64),
  INDEXSHOWNUM    NUMBER(38),
  LISTSHOWNUM     NUMBER(38),
  INDEXSHOWLEN    NUMBER(38),
  ISDEFAULTLOAD   NUMBER(38),
  DEFAULTMOVE     NUMBER(38),
  BEFOREICON      VARCHAR2(300),
  AFTERICON       VARCHAR2(300),
  JUSTCONTENT     NUMBER(38) default 0,
  VIEWLINK        VARCHAR2(300),
  DEFAULTORDER    NUMBER(38),
  DEFAULTSHOW     NUMBER(38),
  DEFAULTOPEN     NUMBER(38),
  ISPERSONALIZE   NUMBER(38),
  CONTENTHEIGHT   NUMBER(38),
  CONTENTWIDTH    NUMBER(38),
  ISMORE          NUMBER(38),
  USERDEFINE      NUMBER(38) default 0,
  USERID          NUMBER(38),
  COLUMNCONTENT   CLOB
);

-- Create table TB_WSM_COLUMN_PARAMS
create table TB_WSM_COLUMN_PARAMS
(
  PARAMSID       NUMBER(38) not null,
  COLUMNID       NUMBER(38),
  PARAMSVAR      VARCHAR2(300) not null,
  PARAMSNAME     VARCHAR2(300) not null,
  PARAMSVALUE    VARCHAR2(300),
  PARAMSDEFVALUE VARCHAR2(300),
  PARAMSDESC     VARCHAR2(300),
  ISVALIDATE     NUMBER(38) not null
);

-- Create table TB_WSM_CSS
create table TB_WSM_CSS
(
  CSSID      NUMBER(38) not null,
  OWNERID    NUMBER(38),
  CSSNAME    VARCHAR2(300),
  CSSCODE    VARCHAR2(300),
  CSSDESC    VARCHAR2(1000),
  CSSCONTENT VARCHAR2(3000),
  SHOWORDER  NUMBER(38),
  ISVALIDATE NUMBER(38),
  OWNERTYPE  NUMBER(38)
);

-- Create table TB_WSM_CSS_ITEM
create table TB_WSM_CSS_ITEM
(
  ITEMID     NUMBER(38) not null,
  CSSID      NUMBER(38),
  ITEMCODE   VARCHAR2(100) not null,
  ITEMVALUE  VARCHAR2(1000),
  ITEMVAR    VARCHAR2(64),
  ISVALIDATE NUMBER(38)
);

-- Create table TB_WSM_FILES_STORE
create table TB_WSM_FILES_STORE
(
  FILEID      VARCHAR2(64) not null,
  FILENAME    VARCHAR2(500),
  FILEFORMAT  VARCHAR2(100),
  FILESIZE    NUMBER(38),
  DISKPATH    VARCHAR2(500),
  ACCESSCOUNT NUMBER(38) default 0,
  FILETYPE    VARCHAR2(300),
  CREATETIME  VARCHAR2(30),
  CREATOR     VARCHAR2(64),
  ISVALIDATE  VARCHAR2(30) default '1'
);

-- Create table  TB_WSM_GROUP
create table TB_WSM_GROUP
(
  GROUPID       NUMBER(38) not null,
  GROUPNAME     VARCHAR2(100) not null,
  GROUPPARENTID NUMBER(38) default -1,
  GROUPDESC     VARCHAR2(300),
  ISVALIDATE    VARCHAR2(2) not null,
  SHOWORDER     VARCHAR2(10),
  SYSID         VARCHAR2(64) not null,
  ISDEFAULT     VARCHAR2(2) default 0,
  DEFAULTID     NUMBER(38)
);

-- Create table TB_WSM_GROUP_ROLE
create table TB_WSM_GROUP_ROLE
(
  GROUPID NUMBER(38) not null,
  ROLEID  NUMBER(38) not null
);

-- Create table TB_WSM_INFOTYPE
create table TB_WSM_INFOTYPE
(
  INFOTYPEID        NUMBER(38) not null,
  INFOTYPENAME      VARCHAR2(300),
  INFOTABLENAME     VARCHAR2(300),
  INFOTYPEDESC      VARCHAR2(1000),
  LISTLINK          VARCHAR2(500),
  INDEXCONTENTLINK  VARCHAR2(500),
  DETAILCONTENTLINK VARCHAR2(500),
  MANAGELINK        VARCHAR2(500),
  ISDATAPRIV        NUMBER(38),
  ISVALIDATE        NUMBER(38),
  ISIMPORT          NUMBER(38),
  ISDEPLOY          NUMBER(38),
  INFOTYPECODE      VARCHAR2(300)
);

-- Create table TB_WSM_INFOTYPE_PARAMS
create table TB_WSM_INFOTYPE_PARAMS
(
  PARAMSID       NUMBER(38) not null,
  INFOTYPEID     NUMBER(38),
  PARAMSVAR      VARCHAR2(300) not null,
  PARAMSNAME     VARCHAR2(300) not null,
  PARAMSVALUE    VARCHAR2(300),
  PARAMSDEFVALUE VARCHAR2(300),
  PARAMSDESC     VARCHAR2(300),
  ISVALIDATE     NUMBER(38) not null
);

-- Create table TB_WSM_INFO_COLUMN
create table TB_WSM_INFO_COLUMN
(
  COLUMNID      NUMBER(38),
  INFOID        NUMBER(38),
  ISVALIDATE    NUMBER(38),
  ISRECOMMEND   NUMBER(38),
  ISTOP         NUMBER(38),
  APPROVESTATUS NUMBER(38)
);

-- Create table TB_WSM_INFO_NEWS
create table TB_WSM_INFO_NEWS
(
  INFOID       NUMBER(38) not null,
  TITLE        VARCHAR2(500) not null,
  SUBTILE      VARCHAR2(500),
  INTRODUCTION VARCHAR2(1000),
  KEYWORD      VARCHAR2(500),
  CONTENTS     CLOB,
  DRAFTOR      VARCHAR2(100),
  CREATETIME   VARCHAR2(30),
  MODIFIER     VARCHAR2(100),
  MODIFYTIME   VARCHAR2(30),
  APPROVER     VARCHAR2(100),
  APPROVETIME  VARCHAR2(30),
  ISVALIDATE   VARCHAR2(10),
  INDEXPIC     VARCHAR2(300)
);

-- Create table TB_WSM_INFO_REF
create table TB_WSM_INFO_REF
(
  INFOID     NUMBER(38) not null,
  REFLINK    VARCHAR2(500) not null,
  REFDESC    VARCHAR2(500),
  CREATOR    VARCHAR2(64),
  CREATETIME VARCHAR2(64),
  MODIFIER   VARCHAR2(64),
  MODIFYTIME VARCHAR2(64),
  ISVALIDATE NUMBER(38),
  REFNAME    VARCHAR2(100)
);

-- Create table TB_WSM_INFO_SERVICE
create table TB_WSM_INFO_SERVICE
(
  SERVICEID      NUMBER(38) not null,
  SERVICENAME    VARCHAR2(300),
  SERVICEADDRESS VARCHAR2(300),
  INVOKESTYLE    VARCHAR2(30),
  SEIVCEPLATFORM VARCHAR2(30),
  SHOWSTYLE      VARCHAR2(30),
  SHOWNUM        NUMBER(38),
  ISVALIDATE     NUMBER(38),
  ISSHOWTITLE    NUMBER(38),
  SHOWLENGTH     NUMBER(38),
  REPLACESTRING  VARCHAR2(30),
  TITLEROWNUM    NUMBER(38),
  TITLECOLNUM    NUMBER(38),
  SERVICEDESC    VARCHAR2(500),
  INVOKEMETHOD   VARCHAR2(300)
);

-- Create table TB_WSM_INFO_SERVICE_LIST
create table TB_WSM_INFO_SERVICE_LIST
(
  CONFIGID   NUMBER(38) not null,
  SERVICEID  NUMBER(38),
  TITLE      VARCHAR2(100) not null,
  VARNAME    VARCHAR2(100) not null,
  WIDTH      VARCHAR2(10),
  ALIGN      VARCHAR2(30),
  VALIGN     VARCHAR2(30),
  TARGET     VARCHAR2(30),
  EXCHANGE   VARCHAR2(500),
  ISVIEW     NUMBER(38),
  ISVALIDATE NUMBER(38) not null,
  SHOWORDER  NUMBER(38)
);

-- Create table TB_WSM_INFO_SERVICE_PARAMS
create table TB_WSM_INFO_SERVICE_PARAMS
(
  PARAMID    NUMBER(38) not null,
  SERVICEID  NUMBER(38),
  PARAMCODE  VARCHAR2(100) not null,
  PARAMNAME  VARCHAR2(100) not null,
  PARAMDESC  VARCHAR2(300),
  PARAMVAR   VARCHAR2(100),
  PARAMVALUE VARCHAR2(100),
  ISVALIDATE NUMBER(38) not null
);

-- Create table TB_WSM_INFO_SQLQUERY
create table TB_WSM_INFO_SQLQUERY
(
  QUERYID         NUMBER(38) not null,
  QUERYNAME       VARCHAR2(300),
  INDEXSQL        VARCHAR2(3000),
  LISTSQL         VARCHAR2(3000),
  VIEWSQL         VARCHAR2(3000),
  SHOWSTYLE       VARCHAR2(30),
  SHOWNUM         NUMBER(38),
  ISVALIDATE      NUMBER(38),
  ISSHOWTITLE     NUMBER(38),
  SHOWLENGTH      NUMBER(38),
  REPLACESTRING   VARCHAR2(30),
  TITLEROWNUM     NUMBER(38),
  TITLECOLNUM     NUMBER(38),
  QUERYDESC       VARCHAR2(500),
  QUERYDETAILPAGE VARCHAR2(500),
  DBSID           NUMBER(38)
);

-- Create table TB_WSM_INFO_SQLQUERY_LIST
create table TB_WSM_INFO_SQLQUERY_LIST
(
  CONFIGID   NUMBER(38) not null,
  QUERYID    NUMBER(38),
  TITLE      VARCHAR2(100) not null,
  VARNAME    VARCHAR2(100) not null,
  WIDTH      VARCHAR2(10),
  ALIGN      VARCHAR2(30),
  VALIGN     VARCHAR2(30),
  TARGET     VARCHAR2(30),
  EXCHANGE   VARCHAR2(500),
  ISVIEW     NUMBER(38),
  ISVALIDATE NUMBER(38) not null,
  SHOWORDER  NUMBER(38)
);

-- Create table TB_WSM_INFO_SQLQUERY_PARAMS
create table TB_WSM_INFO_SQLQUERY_PARAMS
(
  PARAMID    NUMBER(38) not null,
  QUERYID    NUMBER(38),
  PARAMCODE  VARCHAR2(100) not null,
  PARAMNAME  VARCHAR2(100) not null,
  PARAMDESC  VARCHAR2(300),
  PARAMVAR   VARCHAR2(100),
  PARAMVALUE VARCHAR2(100),
  ISVALIDATE NUMBER(38) not null
);

-- Create table TB_WSM_INFO_WEB
create table TB_WSM_INFO_WEB
(
  INFOID     NUMBER(38) not null,
  WEBNAME    VARCHAR2(100),
  WEBCONTENT CLOB,
  WEBDESC    VARCHAR2(500),
  CREATOR    VARCHAR2(64),
  CREATETIME VARCHAR2(64),
  MODIFIER   VARCHAR2(64),
  MODIFYTIME VARCHAR2(64),
  ISVALIDATE NUMBER(38)
);

-- Create table TB_WSM_LAYOUT
create table TB_WSM_LAYOUT
(
  LAYOUTID           NUMBER(38) not null,
  CHANNELID          NUMBER(38),
  LAYOUTNAME         VARCHAR2(100) not null,
  LAYOUTTEMPL        VARCHAR2(300) not null,
  LAYOUTLOGO         VARCHAR2(300),
  LAYOUTSELECTEDLOGO VARCHAR2(300),
  LAYOUTDESC         VARCHAR2(300),
  ISVALIDATE         NUMBER(38) default 1,
  DEFAULTORDER       NUMBER(38) default 0,
  DEFAULTSELECT      NUMBER(38) default 0,
  DEFAULTSHOW        NUMBER(38) default 1,
  USERDEFINE         NUMBER(38) default 0,
  USERID             NUMBER(38)
);

-- Create table TB_WSM_LINK
create table TB_WSM_LINK
(
  LINKID          NUMBER(38) not null,
  LINKGROUPID     NUMBER(38),
  LINKTYPEID      NUMBER(38),
  LINKNAME        VARCHAR2(300) not null,
  LINKTITLE       VARCHAR2(300) not null,
  LINKADDR        VARCHAR2(300) not null,
  LINKDESC        VARCHAR2(300),
  LINKICONPATH    VARCHAR2(300) not null,
  LINKICONWIDTH   NUMBER(38) default 50,
  LINKICONHEIGHT  NUMBER(38) default 50,
  LINKICONADDR    VARCHAR2(300),
  SHOWCONTENTS    NUMBER(38) default 0,
  CONTENTS        CLOB,
  PUBLISHER       VARCHAR2(64),
  PUBLISHDATETIME VARCHAR2(30),
  DRAFTER         VARCHAR2(64),
  DRAFDATETIME    VARCHAR2(30),
  SHOWLINKICON    NUMBER(38) default 1,
  SHOWORDER       NUMBER(38) default 100,
  ISSEE           NUMBER(38) default 1,
  ISCLICK         NUMBER(38) default 1,
  ISVALIDATE      NUMBER(38) default 1
);

-- Create table TB_WSM_LINK_GROUP
create table TB_WSM_LINK_GROUP
(
  LINKGROUPID   NUMBER(38) not null,
  LINKTYPEID    NUMBER(38),
  SYSID         NUMBER(38),
  LINKGROUPNAME VARCHAR2(300) not null,
  LINKGROUPDESC VARCHAR2(300),
  SHOWGROUPNAME NUMBER(38) default 1,
  SHOWORDER     NUMBER(38) default 100,
  ISVALIDATE    NUMBER(38) default 1
);

-- Create table TB_WSM_LINK_TYPE
create table TB_WSM_LINK_TYPE
(
  LINKTYPEID   NUMBER(38) not null,
  SYSID        NUMBER(38),
  LINKTYPENAME VARCHAR2(300),
  LINKTYPEDESC VARCHAR2(300),
  ISVALIDATE   NUMBER(38) default 1
);

-- Create table TB_WSM_LOGIN_LOG
create table TB_WSM_LOGIN_LOG
(
  LOGID      NUMBER(38) not null,
  LOGUSER    NUMBER(38),
  OPERATION  VARCHAR2(100),
  LOGTIME    VARCHAR2(30) not null,
  CREATETIME VARCHAR2(30),
  ISVALIDATE NUMBER(38) not null,
  LOGIP      VARCHAR2(64),
  LOGDESC    VARCHAR2(300)
);

-- Create table TB_WSM_ORGANIZATION
create table TB_WSM_ORGANIZATION
(
  ORGID         NUMBER(38) not null,
  ORGCODE       VARCHAR2(100) not null,
  ORGNAME       VARCHAR2(100) not null,
  ORGDESC       VARCHAR2(300),
  ORGSIMPLENAME VARCHAR2(100),
  ORGALIAS      VARCHAR2(100),
  ORGENGNAME    VARCHAR2(100),
  ORGPARENTID   NUMBER(38) default -1,
  ISVALIDATE    VARCHAR2(2) not null,
  SHOWORDER     VARCHAR2(30)
);

-- Create table TB_WSM_ORGANIZATION_USER
create table TB_WSM_ORGANIZATION_USER
(
  ORGID  NUMBER(38) not null,
  USERID NUMBER(38) not null
);

-- Create table TB_WSM_PICS
create table TB_WSM_PICS
(
  INFOID     NUMBER(38) not null,
  DISKPATH   VARCHAR2(500),
  ACCESSPATH VARCHAR2(500),
  PICFORMAT  VARCHAR2(50),
  PICSIZE    NUMBER(38),
  PICHEIGHT  NUMBER(38),
  PICWIDTH   NUMBER(38),
  CREATETIME VARCHAR2(30),
  CREATOR    VARCHAR2(64)
);

-- Create table TB_WSM_PRIVILEGE
create table TB_WSM_PRIVILEGE
(
  PRIVID       NUMBER(38) not null,
  PRIVNAME     VARCHAR2(100) not null,
  PRIVCODE     VARCHAR2(100) not null,
  PRIVDESC     VARCHAR2(300),
  PRIVADDR     VARCHAR2(300),
  PRIVPARENTID NUMBER(38) default -1,
  PRIVTYPE     VARCHAR2(64) not null,
  ISVALIDATE   VARCHAR2(2) not null,
  PRIVORDER    NUMBER default 1,
  SYSID        NUMBER(38) not null,
  ISDEFAULT    VARCHAR2(2) default 0,
  DEFAUTLID    NUMBER(38),
  COLUMNID     NUMBER(38),
  MODULEID     NUMBER(38),
  OBJID        NUMBER(38)
);

-- Create table TB_WSM_ROLE
create table TB_WSM_ROLE
(
  ROLEID     NUMBER(38) not null,
  ROLENAME   VARCHAR2(100) not null,
  ROLEDESC   VARCHAR2(300),
  ISVALIDATE VARCHAR2(2) not null,
  SYSID      NUMBER(38) not null,
  ISDEFAULT  VARCHAR2(2) default 0,
  ROLETYPE   INTEGER
);

-- Create table TB_WSM_ROLE_CHANNEL
create table TB_WSM_ROLE_CHANNEL
(
  ROLEID    NUMBER(38),
  CHANNELID NUMBER(38)
);

-- Create table TB_WSM_ROLE_COLUMN
create table TB_WSM_ROLE_COLUMN
(
  ROLEID   NUMBER(38),
  COLUMNID NUMBER(38)
);

-- Create table TB_WSM_ROLE_PRIVILEGE
create table TB_WSM_ROLE_PRIVILEGE
(
  ROLEID NUMBER(38) not null,
  PRIVID NUMBER(38) not null
);

-- Create table TB_WSM_SKIN
create table TB_WSM_SKIN
(
  SKINID          NUMBER(38) not null,
  THEMESID        NUMBER(38),
  SKINNAME        VARCHAR2(300),
  SKINCODE        VARCHAR2(300),
  SKINDESC        VARCHAR2(1000),
  SHOWORDER       NUMBER(38),
  ISDEFAULT       NUMBER(38),
  ISCOLUMNSKIN    NUMBER(38),
  INDEXCOLUMNSKIN NUMBER(38),
  VIEWCOLUMNSKIN  NUMBER(38),
  LISTCOLUMNSKIN  NUMBER(38),
  ISVALIDATE      NUMBER(38),
  SKINFILEPATH    VARCHAR2(300)
);

-- Create table TB_WSM_SYS_BACKGROUND
create table TB_WSM_SYS_BACKGROUND
(
  SYSID     NUMBER(38),
  BGDID     NUMBER(38),
  ISDEFAULT NUMBER(38)
);

-- Create table TB_WSM_SYS_CONF
create table TB_WSM_SYS_CONF
(
  CONFIGID      NUMBER(38) not null,
  SYSID         NUMBER(38),
  CONFIGTYPE    VARCHAR2(64),
  CONFIGNAME    VARCHAR2(300) not null,
  CONFIGCODE    VARCHAR2(300) not null,
  CONFIGDESC    VARCHAR2(300),
  CONFIGCONTENT CLOB,
  VERSIONNO     VARCHAR2(30) not null,
  ISREF         NUMBER(38) not null,
  ISVALIDATE    NUMBER(38) not null
);

-- Create table TB_WSM_SYS_THEMES
create table TB_WSM_SYS_THEMES
(
  THEMESID  NUMBER(38),
  SYSID     NUMBER(38),
  ISDEFAULT NUMBER(38)
);

-- Create table TB_WSM_THEMES
create table TB_WSM_THEMES
(
  THEMESID   NUMBER(38) not null,
  THEMESNAME VARCHAR2(300),
  THEMESCODE VARCHAR2(300),
  THEMESDESC VARCHAR2(1000),
  ISVALIDATE NUMBER(38),
  SHOWORDER  NUMBER(38),
  ISDEFAULT  NUMBER(38)
);

-- Create table TB_WSM_THEMES_DEFINE_TYPE
create table TB_WSM_THEMES_DEFINE_TYPE
(
  TDTID      NUMBER(38) not null,
  THEMESID   NUMBER(38),
  TDTCODE    VARCHAR2(100),
  TDTNAME    VARCHAR2(300),
  TDTDESC    VARCHAR2(600),
  TDTICON    VARCHAR2(300),
  ISDEFAULT  NUMBER(38),
  ISVALIDATE NUMBER(38),
  SHOWORDER  NUMBER(38)
);

-- Create table TB_WSM_THEMES_PARAMS
create table TB_WSM_THEMES_PARAMS
(
  PARAMSID   NUMBER(38) not null,
  THEMESID   NUMBER(38),
  PARAMSTYPE VARCHAR2(60),
  PARAMSCODE VARCHAR2(300),
  PARAMSNAME VARCHAR2(300),
  PARAMSDESC VARCHAR2(500),
  ISVALIDATE NUMBER(38),
  SHOWORDER  NUMBER(38)
);

-- Create table TB_WSM_THEMES_SELECTABLE_VALUE
create table TB_WSM_THEMES_SELECTABLE_VALUE
(
  VALUEID      NUMBER(38) not null,
  PARAMSID     NUMBER(38),
  TDTID        NUMBER(38),
  VALUECONTENT VARCHAR2(1000),
  VALUEDESC    VARCHAR2(1000),
  ISVALIDATE   NUMBER(38)
);

-- Create table TB_WSM_UNIT
create table TB_WSM_UNIT
(
  UNITID   VARCHAR2(64) not null,
  LAYOUTID NUMBER(38)
);

-- Create table TB_WSM_UNIT_COLUMN
create table TB_WSM_UNIT_COLUMN
(
  UNITID       VARCHAR2(64),
  COLUMNID     NUMBER(38),
  DEFAULTORDER NUMBER(38) default 0,
  DEFAULTMOVE  NUMBER(38) default 1,
  DEFAULTOPEN  NUMBER(38) default 1,
  DEFAULTSHOW  NUMBER(38) default 1
);

-- Create table TB_WSM_USER
create table TB_WSM_USER
(
  USERID        NUMBER(38) not null,
  ACCOUNT       VARCHAR2(100) not null,
  PASSWORD      VARCHAR2(60),
  USERNAME      VARCHAR2(100) not null,
  SEX           VARCHAR2(2),
  TEL           VARCHAR2(30),
  MOBILE        VARCHAR2(30),
  EMAIL         VARCHAR2(60),
  QQ            VARCHAR2(20),
  DEPARTMENT    VARCHAR2(60),
  SUBDEPARTMENT VARCHAR2(60),
  ORDERID       CHAR(10),
  ISAUTH        VARCHAR2(2),
  ISVALIDATE    VARCHAR2(2) not null,
  USERTYPE      NUMBER(38),
  PHOTO         VARCHAR2(300),
  SALESNO       VARCHAR2(30),
  EMPLOYNO      VARCHAR2(20),
  OAUSER        VARCHAR2(30),
  CARRIERID     NUMBER(38),
  CUSTOMERTYPE  NUMBER(38),
  SELFFETCH     INTEGER,
  FETCHDRIVER   VARCHAR2(30),
  FETCHMOBILE   VARCHAR2(30),
  FETCHCAR      VARCHAR2(30)
);

-- Create table TB_WSM_USER_CHANNEL
create table TB_WSM_USER_CHANNEL
(
  CHANNELID    NUMBER(38),
  USERID       NUMBER(38),
  SYSID        NUMBER(38),
  CHANNELORDER NUMBER(38) default 0,
  ISCURRENT    NUMBER(38) default 0,
  ISSHOW       NUMBER(38) default 1
);

-- Create table TB_WSM_USER_COLUMN
create table TB_WSM_USER_COLUMN
(
  UNITID    VARCHAR2(64),
  COLUMNID  NUMBER(38),
  USERID    NUMBER(38),
  LAYOUTID  NUMBER(38),
  SHOWORDER NUMBER(38) default 0,
  ISSHOW    NUMBER(38) default 1,
  ISOPEN    NUMBER(38) default 1,
  ISMOVE    NUMBER(38) default 1
);

-- Create table TB_WSM_USER_GROUP
create table TB_WSM_USER_GROUP
(
  GROUPID NUMBER(38) not null,
  USERID  NUMBER(38) not null
);

-- Create table TB_WSM_USER_LAYOUT
create table TB_WSM_USER_LAYOUT
(
  LAYOUTID   NUMBER(38),
  USERID     NUMBER(38),
  CHANNELID  NUMBER(38),
  ISSELECTED NUMBER(38) default 0,
  ISSHOW     NUMBER(38) default 1,
  SHOWORDER  NUMBER(38) default 0
);

-- Create table TB_WSM_USER_SYSTEM
create table TB_WSM_USER_SYSTEM
(
  USERID     NUMBER(38),
  SYSID      NUMBER(38),
  USERORDER  NUMBER(38) default 0,
  ISSELECTED NUMBER(38) default 0,
  ISSHOW     NUMBER(38) default 1,
  ISDEFAULT  NUMBER(38) default 0
);