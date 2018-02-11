
-------------------------- 1）基础表，包括字典类型、字典、数据源、日志 ------------------------------
--[TB_DIC_TYPE]
-- Create table
create table TB_DIC_TYPE
(
  TYPEID     INTEGER not null,
  TYPECODE   VARCHAR2(64) not null,
  TYPENAME   VARCHAR2(300) not null,
  TYPEDESC   VARCHAR2(100),
  ISVALIDATE VARCHAR2(10) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_DIC_TYPE
  add constraint PK_TB_DIC_TYPE primary key (TYPEID);
  
--[TB_DICTIONARY]
-- Create table
create table TB_DICTIONARY
(
  TYPEID     INTEGER not null,
  DICID      INTEGER not null,
  DICNAME    VARCHAR2(300) not null,
  DICCODE    VARCHAR2(64) not null,
  DICDESC    VARCHAR2(300),
  SHOWORDER  VARCHAR2(10) not null,
  ISVALIDATE VARCHAR2(10) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_DICTIONARY
  add constraint PK_TB_DICTIONARY primary key (DICID);
alter table TB_DICTIONARY
  add constraint DIC_TYPE_REF_ITEMS foreign key (TYPEID)
  references TB_DIC_TYPE (TYPEID);
  
--[TB_DATASOURCE]
-- Create table
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

--[TB_WSM_LOGIN_LOG]
-- Create table
create table TB_WSM_LOGIN_LOG
(
  LOGID      INTEGER not null,
  LOGUSER    INTEGER,
  OPERATION  VARCHAR2(100),
  LOGTIME    VARCHAR2(30) not null,
  CREATETIME VARCHAR2(30),
  ISVALIDATE INTEGER not null,
  LOGIP      VARCHAR2(64),
  LOGDESC    VARCHAR2(300)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_LOGIN_LOG
  add constraint PK_TB_WSM_LOGIN_LOG primary key (LOGID);

  
  
-------------------------- 2）结构表，包括系统、频道、布局、布局单元、栏目、及相互关系------------------------------
--[TB_SYSTEM]
-- Create table
create table TB_SYSTEM
(
  SYSID      INTEGER not null,
  SYSCODE    VARCHAR2(100) not null,
  SYSNAME    VARCHAR2(100) not null,
  SYSPATH    VARCHAR2(500) not null,
  SYSDESC    VARCHAR2(1000),
  SHOWORDER  INTEGER,
  DEFROLEID  INTEGER,
  ISVALIDATE INTEGER not null,
  ISINSIDE   INTEGER default 0,
  USERDEFINE INTEGER default 0,
  USERID     INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_SYSTEM
  add constraint PK_TB_SYSTEM primary key (SYSID);
--[TB_WSM_INFOTYPE]
-- Create table
create table TB_WSM_INFOTYPE
(
  INFOTYPEID        INTEGER not null,
  INFOTYPENAME      VARCHAR2(300),
  INFOTABLENAME     VARCHAR2(300),
  INFOTYPEDESC      VARCHAR2(1000),
  LISTLINK          VARCHAR2(500),
  INDEXCONTENTLINK  VARCHAR2(500),
  DETAILCONTENTLINK VARCHAR2(500),
  MANAGELINK        VARCHAR2(500),
  ISDATAPRIV        INTEGER,
  ISVALIDATE        INTEGER,
  ISIMPORT          INTEGER,
  ISDEPLOY          INTEGER,
  INFOTYPECODE      VARCHAR2(300)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFOTYPE
  add constraint PK_TB_WSM_INFOTYPE primary key (INFOTYPEID);
--[TB_WSM_CHANNEL]
-- Create table
create table TB_WSM_CHANNEL
(
  CHANNELID     INTEGER not null,
  SYSID         INTEGER,
  INFOTYPEID    INTEGER,
  CHANNELNAME   VARCHAR2(300),
  CHANNELCODE   VARCHAR2(300),
  CHANNELURL    VARCHAR2(300),
  SELECTEDCLASS VARCHAR2(300),
  DEFAULTCLASS  VARCHAR2(300),
  CHANNELDESC   VARCHAR2(300),
  LOADSTYLE     VARCHAR2(30),
  ISVALIDATE    INTEGER default 1,
  DEFAULTORDER  INTEGER default 0,
  DEFAULTSHOW   INTEGER default 1,
  DEFAULTSELECT INTEGER default 0,
  BEFOREICON    VARCHAR2(300),
  AFTERICON     VARCHAR2(300),
  SHOWHEIGHT    INTEGER,
  USERDEFINE    INTEGER default 0,
  USERID        INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_CHANNEL
  add constraint PK_TB_WSM_CHANNEL primary key (CHANNELID);
alter table TB_WSM_CHANNEL
  add constraint CHANNEL_REF_INFOTYPE foreign key (INFOTYPEID)
  references TB_WSM_INFOTYPE (INFOTYPEID);
alter table TB_WSM_CHANNEL
  add constraint SITE_REF_CHANNEL foreign key (SYSID)
  references TB_SYSTEM (SYSID);

--[TB_WSM_LAYOUT]
-- Create table
create table TB_WSM_LAYOUT
(
  LAYOUTID           INTEGER not null,
  CHANNELID          INTEGER,
  LAYOUTNAME         VARCHAR2(100) not null,
  LAYOUTTEMPL        VARCHAR2(300) not null,
  LAYOUTLOGO         VARCHAR2(300),
  LAYOUTSELECTEDLOGO VARCHAR2(300),
  LAYOUTDESC         VARCHAR2(300),
  ISVALIDATE         INTEGER default 1,
  DEFAULTORDER       INTEGER default 0,
  DEFAULTSELECT      INTEGER default 0,
  DEFAULTSHOW        INTEGER default 1,
  USERDEFINE         INTEGER default 0,
  USERID             INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_LAYOUT
  add constraint PK_TB_WSM_LAYOUT primary key (LAYOUTID);
alter table TB_WSM_LAYOUT
  add constraint CHANNEL_REF_SITE foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);

--[TB_WSM_UNIT]
-- Create table
create table TB_WSM_UNIT
(
  UNITID   VARCHAR2(64) not null,
  LAYOUTID INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_UNIT
  add constraint PK_TB_WSM_UNIT primary key (UNITID);
alter table TB_WSM_UNIT
  add constraint LAYOUT_REF_UNIT foreign key (LAYOUTID)
  references TB_WSM_LAYOUT (LAYOUTID);
  
--[TB_WSM_COLUMN]  
-- Create table
create table TB_WSM_COLUMN
(
  COLUMNID        INTEGER not null,
  PARENTCOLUMNID  INTEGER default -1,
  SYSID           INTEGER,
  INFOTYPEID      INTEGER,
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
  INDEXSHOWNUM    INTEGER,
  LISTSHOWNUM     INTEGER,
  INDEXSHOWLEN    INTEGER,
  ISDEFAULTLOAD   INTEGER,
  DEFAULTMOVE     INTEGER,
  BEFOREICON      VARCHAR2(300),
  AFTERICON       VARCHAR2(300),
  JUSTCONTENT     INTEGER default 0,
  VIEWLINK        VARCHAR2(300),
  DEFAULTORDER    INTEGER,
  DEFAULTSHOW     INTEGER,
  DEFAULTOPEN     INTEGER,
  ISPERSONALIZE   INTEGER,
  CONTENTHEIGHT   INTEGER,
  CONTENTWIDTH    INTEGER,
  ISMORE          INTEGER,
  USERDEFINE      INTEGER default 0,
  USERID          INTEGER,
  COLUMNCONTENT   CLOB
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_COLUMN
  add constraint PK_TB_WSM_COLUMN primary key (COLUMNID);
alter table TB_WSM_COLUMN
  add constraint COLUMN_REF_INFOTYPE foreign key (INFOTYPEID)
  references TB_WSM_INFOTYPE (INFOTYPEID);
alter table TB_WSM_COLUMN
  add constraint COLUMN_REF_SITE foreign key (SYSID)
  references TB_SYSTEM (SYSID);
  
--[TB_WSM_COLUMN_PARAMS]  
-- Create table
create table TB_WSM_COLUMN_PARAMS
(
  PARAMSID       INTEGER not null,
  COLUMNID       INTEGER,
  PARAMSVAR      VARCHAR2(300) not null,
  PARAMSNAME     VARCHAR2(300) not null,
  PARAMSVALUE    VARCHAR2(300),
  PARAMSDEFVALUE VARCHAR2(300),
  PARAMSDESC     VARCHAR2(300),
  ISVALIDATE     INTEGER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_COLUMN_PARAMS
  add constraint PK_TB_WSM_COLUMN_PARAMS primary key (PARAMSID);
  
  
  
--[TB_WSM_CHANNEL_COLUMN]  
-- Create table
create table TB_WSM_CHANNEL_COLUMN
(
  CCID       INTEGER not null,
  CHANNELID  INTEGER,
  COLUMNID   INTEGER,
  PARENTID   INTEGER,
  SHOWNAME   VARCHAR2(200),
  SYSID      INTEGER,
  SHOWORDER  INTEGER,
  BEFOREICON VARCHAR2(300),
  AFTERICON  VARCHAR2(300),
  SHOWHEIGHT INTEGER,
  USERDEFINE INTEGER default 0,
  USERID     INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_CHANNEL_COLUMN
  add constraint PK_TB_WSM_CHANNEL_COLUMN primary key (CCID);
alter table TB_WSM_CHANNEL_COLUMN
  add constraint CHANNNEL_REF_COMPOSITE foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);
alter table TB_WSM_CHANNEL_COLUMN
  add constraint COLUMN_REF_COMPOSITE foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);

--[TB_WSM_UNIT_COLUMN]
-- Create table
create table TB_WSM_UNIT_COLUMN
(
  UNITID       VARCHAR2(64),
  COLUMNID     INTEGER,
  DEFAULTORDER INTEGER default 0,
  DEFAULTMOVE  INTEGER default 1,
  DEFAULTOPEN  INTEGER default 1,
  DEFAULTSHOW  INTEGER default 1
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_UNIT_COLUMN
  add constraint COLUMN_REF_UNIT foreign key (UNITID)
  references TB_WSM_UNIT (UNITID);
alter table TB_WSM_UNIT_COLUMN
  add constraint UNIT_REF_COLUMN foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);
  
--[TB_WSM_SYS_CONF]  
-- Create table
create table TB_WSM_SYS_CONF
(
  CONFIGID      INTEGER not null,
  SYSID         INTEGER,
  CONFIGTYPE    VARCHAR2(64),
  CONFIGNAME    VARCHAR2(300) not null,
  CONFIGCODE    VARCHAR2(300) not null,
  CONFIGDESC    VARCHAR2(300),
  CONFIGCONTENT CLOB,
  VERSIONNO     VARCHAR2(30) not null,
  ISREF         INTEGER not null,
  ISVALIDATE    INTEGER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_SYS_CONF
  add constraint PK_TB_WSM_SITE_CONF primary key (CONFIGID);
  
--[TB_WSM_SYS_BACKGROUND]  
-- Create table
create table TB_WSM_SYS_BACKGROUND
(
  SYSID     INTEGER,
  BGDID     INTEGER,
  ISDEFAULT INTEGER
);
  

-------------------------- 3）样式配置表，包括主题、皮肤、样式、样式项、及相互关系------------------------------
--[TB_WSM_THEMES]
-- Create table
create table TB_WSM_THEMES
(
  THEMESID   INTEGER not null,
  THEMESNAME VARCHAR2(300),
  THEMESCODE VARCHAR2(300),
  THEMESDESC VARCHAR2(1000),
  ISVALIDATE INTEGER,
  SHOWORDER  INTEGER,
  ISDEFAULT  INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_THEMES
  add constraint PK_TB_WSM_THEMES primary key (THEMESID);
  
--[TB_WSM_SKIN]  
-- Create table
create table TB_WSM_SKIN
(
  SKINID          INTEGER not null,
  THEMESID        INTEGER,
  SKINNAME        VARCHAR2(300),
  SKINCODE        VARCHAR2(300),
  SKINDESC        VARCHAR2(1000),
  SHOWORDER       INTEGER,
  ISDEFAULT       INTEGER,
  ISCOLUMNSKIN    INTEGER,
  INDEXCOLUMNSKIN INTEGER,
  VIEWCOLUMNSKIN  INTEGER,
  LISTCOLUMNSKIN  INTEGER,
  ISVALIDATE      INTEGER,
  SKINFILEPATH    VARCHAR2(300)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_SKIN
  add constraint PK_TB_WSM_SKIN primary key (SKINID);
alter table TB_WSM_SKIN
  add constraint SKIN_REF_THEMES foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID);
  
--[TB_WSM_CSS]  
-- Create table
create table TB_WSM_CSS
(
  CSSID      INTEGER not null,
  OWNERID    INTEGER,
  CSSNAME    VARCHAR2(300),
  CSSCODE    VARCHAR2(300),
  CSSDESC    VARCHAR2(1000),
  CSSCONTENT VARCHAR2(3000),
  SHOWORDER  INTEGER,
  ISVALIDATE INTEGER,
  OWNERTYPE  INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_CSS
  add constraint PK_TB_WSM_CSS primary key (CSSID);
  
--[TB_WSM_CSS_ITEM]  
-- Create table
create table TB_WSM_CSS_ITEM
(
  ITEMID     INTEGER not null,
  CSSID      INTEGER,
  ITEMCODE   VARCHAR2(100) not null,
  ITEMVALUE  VARCHAR2(1000),
  ITEMVAR    VARCHAR2(64),
  ISVALIDATE INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_CSS_ITEM
  add constraint PK_TB_WSM_CSS_ITEM primary key (ITEMID);
alter table TB_WSM_CSS_ITEM
  add constraint CSS_REF_ITEM foreign key (CSSID)
  references TB_WSM_CSS (CSSID);
  
--[TB_WSM_SYS_THEMES]  
-- Create table
create table TB_WSM_SYS_THEMES
(
  THEMESID  INTEGER,
  SYSID     INTEGER,
  ISDEFAULT INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_SYS_THEMES
  add constraint SYS_REF_THEMES foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID); 

--[TB_WSM_THEMES_DEFINE_TYPE]
-- Create table
create table TB_WSM_THEMES_DEFINE_TYPE
(
  TDTID      INTEGER not null,
  THEMESID   INTEGER,
  TDTCODE    VARCHAR2(100),
  TDTNAME    VARCHAR2(300),
  TDTDESC    VARCHAR2(600),
  TDTICON    VARCHAR2(300),
  ISDEFAULT  INTEGER,
  ISVALIDATE INTEGER,
  SHOWORDER  INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_THEMES_DEFINE_TYPE
  add constraint PK_TB_WSM_THEMES_DEFINE_TYPE primary key (TDTID);
alter table TB_WSM_THEMES_DEFINE_TYPE
  add constraint THEMES_REF_DEFINE_TYPE foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID);

--[TB_WSM_THEMES_PARAMS]
-- Create table
create table TB_WSM_THEMES_PARAMS
(
  PARAMSID   INTEGER not null,
  THEMESID   INTEGER,
  PARAMSTYPE VARCHAR2(60),
  PARAMSCODE VARCHAR2(300),
  PARAMSNAME VARCHAR2(300),
  PARAMSDESC VARCHAR2(500),
  ISVALIDATE INTEGER,
  SHOWORDER  INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_THEMES_PARAMS
  add constraint PK_TB_WSM_THEMES_PARAMS primary key (PARAMSID);
alter table TB_WSM_THEMES_PARAMS
  add constraint THEMES_REF_PARAS foreign key (THEMESID)
  references TB_WSM_THEMES (THEMESID);

--TB_WSM_THEMES_SELECTABLE_VALUE
-- Create table
create table TB_WSM_THEMES_SELECTABLE_VALUE
(
  VALUEID      INTEGER not null,
  PARAMSID     INTEGER,
  TDTID        INTEGER,
  VALUECONTENT VARCHAR2(1000),
  VALUEDESC    VARCHAR2(1000),
  ISVALIDATE   INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_THEMES_SELECTABLE_VALUE
  add constraint PK_TB_WSM_THEMES_SELECTABLE_VA primary key (VALUEID);
alter table TB_WSM_THEMES_SELECTABLE_VALUE
  add constraint PARAMS_REF_VALUE foreign key (PARAMSID)
  references TB_WSM_THEMES_PARAMS (PARAMSID);
alter table TB_WSM_THEMES_SELECTABLE_VALUE
  add constraint TYPE_REF_SELECTABLE_VALUE foreign key (TDTID)
  references TB_WSM_THEMES_DEFINE_TYPE (TDTID);


-------------------------- 3）信息模型表，包括信息类型、信息栏目对应表、新闻信息、引用信息、片断信息、链接信息、图片信息、服务信息、SQL查询信息、及相互关系------------------------------


--[TB_WSM_INFOTYPE_PARAMS]
-- Create table
create table TB_WSM_INFOTYPE_PARAMS
(
  PARAMSID       INTEGER not null,
  INFOTYPEID     INTEGER,
  PARAMSVAR      VARCHAR2(300) not null,
  PARAMSNAME     VARCHAR2(300) not null,
  PARAMSVALUE    VARCHAR2(300),
  PARAMSDEFVALUE VARCHAR2(300),
  PARAMSDESC     VARCHAR2(300),
  ISVALIDATE     INTEGER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFOTYPE_PARAMS
  add constraint PK_TB_WSM_INFOTYPE_PARAMS primary key (PARAMSID);
alter table TB_WSM_INFOTYPE_PARAMS
  add constraint INFOTYPE_REF_PARAMS foreign key (INFOTYPEID)
  references TB_WSM_INFOTYPE (INFOTYPEID);

--[TB_WSM_INFO_COLUMN]
-- Create table
create table TB_WSM_INFO_COLUMN
(
  COLUMNID      INTEGER,
  INFOID        INTEGER,
  ISVALIDATE    INTEGER,
  ISRECOMMEND   INTEGER,
  ISTOP         INTEGER,
  APPROVESTATUS INTEGER
);

--[TB_WSM_INFO_NEWS]
-- Create table
create table TB_WSM_INFO_NEWS
(
  INFOID       INTEGER not null,
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_NEWS
  add constraint PK_TB_WSM_INFO_NEWS primary key (INFOID);

--[TB_WSM_INFO_WEB]
-- Create table
create table TB_WSM_INFO_WEB
(
  INFOID     INTEGER not null,
  WEBNAME    VARCHAR2(100),
  WEBCONTENT CLOB,
  WEBDESC    VARCHAR2(500),
  CREATOR    VARCHAR2(64),
  CREATETIME VARCHAR2(64),
  MODIFIER   VARCHAR2(64),
  MODIFYTIME VARCHAR2(64),
  ISVALIDATE INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_WEB
  add constraint PK_TB_WSM_INFO_WEB primary key (INFOID);

--[TB_WSM_INFO_REF]
-- Create table
create table TB_WSM_INFO_REF
(
  INFOID     INTEGER not null,
  REFLINK    VARCHAR2(500) not null,
  REFDESC    VARCHAR2(500),
  CREATOR    VARCHAR2(64),
  CREATETIME VARCHAR2(64),
  MODIFIER   VARCHAR2(64),
  MODIFYTIME VARCHAR2(64),
  ISVALIDATE INTEGER,
  REFNAME    VARCHAR2(100)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_REF
  add constraint PK_TB_WSM_INFO_REF primary key (INFOID);

--[TB_WSM_LINK_TYPE]
-- Create table
create table TB_WSM_LINK_TYPE
(
  LINKTYPEID   INTEGER not null,
  SYSID        INTEGER,
  LINKTYPENAME VARCHAR2(300),
  LINKTYPEDESC VARCHAR2(300),
  ISVALIDATE   INTEGER default 1
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_LINK_TYPE
  add constraint PK_TB_WSM_LINK_TYPE primary key (LINKTYPEID);

--[TB_WSM_LINK_GROUP]
-- Create table
create table TB_WSM_LINK_GROUP
(
  LINKGROUPID   INTEGER not null,
  LINKTYPEID    INTEGER,
  SYSID         INTEGER,
  LINKGROUPNAME VARCHAR2(300) not null,
  LINKGROUPDESC VARCHAR2(300),
  SHOWGROUPNAME INTEGER default 1,
  SHOWORDER     INTEGER default 100,
  ISVALIDATE    INTEGER default 1
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_LINK_GROUP
  add constraint PK_TB_WSM_LINK_GROUP primary key (LINKGROUPID);
alter table TB_WSM_LINK_GROUP
  add constraint LINK_GROUP_REF_TYPE foreign key (LINKTYPEID)
  references TB_WSM_LINK_TYPE (LINKTYPEID);

--[TB_WSM_LINK]
-- Create table
create table TB_WSM_LINK
(
  LINKID          INTEGER not null,
  LINKGROUPID     INTEGER,
  LINKTYPEID      INTEGER,
  LINKNAME        VARCHAR2(300) not null,
  LINKTITLE       VARCHAR2(300) not null,
  LINKADDR        VARCHAR2(300) not null,
  LINKDESC        VARCHAR2(300),
  LINKICONPATH    VARCHAR2(300) not null,
  LINKICONWIDTH   INTEGER default 50,
  LINKICONHEIGHT  INTEGER default 50,
  LINKICONADDR    VARCHAR2(300),
  SHOWCONTENTS    INTEGER default 0,
  CONTENTS        CLOB,
  PUBLISHER       VARCHAR2(64),
  PUBLISHDATETIME VARCHAR2(30),
  DRAFTER         VARCHAR2(64),
  DRAFDATETIME    VARCHAR2(30),
  SHOWLINKICON    INTEGER default 1,
  SHOWORDER       INTEGER default 100,
  ISSEE           INTEGER default 1,
  ISCLICK         INTEGER default 1,
  ISVALIDATE      INTEGER default 1
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_LINK
  add constraint PK_TB_WSM_LINK primary key (LINKID);
alter table TB_WSM_LINK
  add constraint FK_TB_WSM_L_REFERENCE_TB_WSM_L foreign key (LINKTYPEID)
  references TB_WSM_LINK_TYPE (LINKTYPEID);
alter table TB_WSM_LINK
  add constraint GROUP_REF_LINK foreign key (LINKGROUPID)
  references TB_WSM_LINK_GROUP (LINKGROUPID);

--[TB_WSM_INFO_SERVICE]
-- Create table
create table TB_WSM_INFO_SERVICE
(
  SERVICEID      INTEGER not null,
  SERVICENAME    VARCHAR2(300),
  SERVICEADDRESS VARCHAR2(300),
  INVOKESTYLE    VARCHAR2(30),
  SEIVCEPLATFORM VARCHAR2(30),
  SHOWSTYLE      VARCHAR2(30),
  SHOWNUM        INTEGER,
  ISVALIDATE     INTEGER,
  ISSHOWTITLE    INTEGER,
  SHOWLENGTH     INTEGER,
  REPLACESTRING  VARCHAR2(30),
  TITLEROWNUM    INTEGER,
  TITLECOLNUM    INTEGER,
  SERVICEDESC    VARCHAR2(500),
  INVOKEMETHOD   VARCHAR2(300)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_SERVICE
  add constraint PK_TB_WSM_INFO_SERVICE primary key (SERVICEID);

--[TB_WSM_INFO_SERVICE_LIST]
-- Create table
create table TB_WSM_INFO_SERVICE_LIST
(
  CONFIGID   INTEGER not null,
  SERVICEID  INTEGER,
  TITLE      VARCHAR2(100) not null,
  VARNAME    VARCHAR2(100) not null,
  WIDTH      VARCHAR2(10),
  ALIGN      VARCHAR2(30),
  VALIGN     VARCHAR2(30),
  TARGET     VARCHAR2(30),
  EXCHANGE   VARCHAR2(500),
  ISVIEW     INTEGER,
  ISVALIDATE INTEGER not null,
  SHOWORDER  INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_SERVICE_LIST
  add constraint PK_TB_WSM_INFO_SERVICE_LIST primary key (CONFIGID);
alter table TB_WSM_INFO_SERVICE_LIST
  add constraint SERVICE_REF_LIST foreign key (SERVICEID)
  references TB_WSM_INFO_SERVICE (SERVICEID);

--[TB_WSM_INFO_SERVICE_PARAMS]
-- Create table
create table TB_WSM_INFO_SERVICE_PARAMS
(
  PARAMID    INTEGER not null,
  SERVICEID  INTEGER,
  PARAMCODE  VARCHAR2(100) not null,
  PARAMNAME  VARCHAR2(100) not null,
  PARAMDESC  VARCHAR2(300),
  PARAMVAR   VARCHAR2(100),
  PARAMVALUE VARCHAR2(100),
  ISVALIDATE INTEGER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_SERVICE_PARAMS
  add constraint PK_TB_WSM_INFO_SERVICE_PARAMS primary key (PARAMID);
alter table TB_WSM_INFO_SERVICE_PARAMS
  add constraint SERVICE_REF_PARAMS foreign key (SERVICEID)
  references TB_WSM_INFO_SERVICE (SERVICEID);

--[TB_WSM_INFO_SQLQUERY]
-- Create table
create table TB_WSM_INFO_SQLQUERY
(
  QUERYID         INTEGER not null,
  QUERYNAME       VARCHAR2(300),
  INDEXSQL        VARCHAR2(3000),
  LISTSQL         VARCHAR2(3000),
  VIEWSQL         VARCHAR2(3000),
  SHOWSTYLE       VARCHAR2(30),
  SHOWNUM         INTEGER,
  ISVALIDATE      INTEGER,
  ISSHOWTITLE     INTEGER,
  SHOWLENGTH      INTEGER,
  REPLACESTRING   VARCHAR2(30),
  TITLEROWNUM     INTEGER,
  TITLECOLNUM     INTEGER,
  QUERYDESC       VARCHAR2(500),
  QUERYDETAILPAGE VARCHAR2(500),
  DBSID           INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_SQLQUERY
  add constraint PK_TB_WSM_INFO_SQLQUERY primary key (QUERYID);

--[TB_WSM_INFO_SQLQUERY_LIST]
-- Create table
create table TB_WSM_INFO_SQLQUERY_LIST
(
  CONFIGID   INTEGER not null,
  QUERYID    INTEGER,
  TITLE      VARCHAR2(100) not null,
  VARNAME    VARCHAR2(100) not null,
  WIDTH      VARCHAR2(10),
  ALIGN      VARCHAR2(30),
  VALIGN     VARCHAR2(30),
  TARGET     VARCHAR2(30),
  EXCHANGE   VARCHAR2(500),
  ISVIEW     INTEGER,
  ISVALIDATE INTEGER not null,
  SHOWORDER  INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_SQLQUERY_LIST
  add constraint PK_TB_WSM_INFO_SQLQUERY_LIST primary key (CONFIGID);
alter table TB_WSM_INFO_SQLQUERY_LIST
  add constraint QUERY_REF_LIST foreign key (QUERYID)
  references TB_WSM_INFO_SQLQUERY (QUERYID);

--[TB_WSM_INFO_SQLQUERY_PARAMS]
-- Create table
create table TB_WSM_INFO_SQLQUERY_PARAMS
(
  PARAMID    INTEGER not null,
  QUERYID    INTEGER,
  PARAMCODE  VARCHAR2(100) not null,
  PARAMNAME  VARCHAR2(100) not null,
  PARAMDESC  VARCHAR2(300),
  PARAMVAR   VARCHAR2(100),
  PARAMVALUE VARCHAR2(100),
  ISVALIDATE INTEGER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_INFO_SQLQUERY_PARAMS
  add constraint PK_TB_WSM_INFO_SQLQUERY_PARAMS primary key (PARAMID);
alter table TB_WSM_INFO_SQLQUERY_PARAMS
  add constraint QUERY_REF_PARAMS foreign key (QUERYID)
  references TB_WSM_INFO_SQLQUERY (QUERYID);

--[TB_WSM_FILES_STORE]
-- Create table
create table TB_WSM_FILES_STORE
(
  FILEID      VARCHAR2(64) not null,
  FILENAME    VARCHAR2(500),
  FILEFORMAT  VARCHAR2(100),
  FILESIZE    INTEGER,
  DISKPATH    VARCHAR2(500),
  ACCESSCOUNT INTEGER default 0,
  FILETYPE    VARCHAR2(300),
  CREATETIME  VARCHAR2(30),
  CREATOR     VARCHAR2(64),
  ISVALIDATE  VARCHAR2(30) default '1'
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_FILES_STORE
  add constraint PK_TB_WSM_FILES_STORE primary key (FILEID);

--[TB_WSM_PICS]
-- Create table
create table TB_WSM_PICS
(
  INFOID     INTEGER not null,
  DISKPATH   VARCHAR2(500),
  ACCESSPATH VARCHAR2(500),
  PICFORMAT  VARCHAR2(50),
  PICSIZE    INTEGER,
  PICHEIGHT  INTEGER,
  PICWIDTH   INTEGER,
  CREATETIME VARCHAR2(30),
  CREATOR    VARCHAR2(64)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_PICS
  add constraint PK_TB_WSM_PICS primary key (INFOID);


-------------------------- 4）权限模型表，包括机构、用户、用户组、权限、角色、及相互关系------------------------------
--[TB_WSM_ORGANIZATION]
-- Create table
create table TB_WSM_ORGANIZATION
(
  ORGID         INTEGER not null,
  ORGCODE       VARCHAR2(100) not null,
  ORGNAME       VARCHAR2(100) not null,
  ORGDESC       VARCHAR2(300),
  ORGSIMPLENAME VARCHAR2(100),
  ORGALIAS      VARCHAR2(100),
  ORGENGNAME    VARCHAR2(100),
  ORGPARENTID   INTEGER default -1,
  ISVALIDATE    VARCHAR2(2) not null,
  SHOWORDER     VARCHAR2(30)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_ORGANIZATION
  add constraint PK_TB_WSM_ORGANIZTION primary key (ORGID);

--[TB_WSM_ORGANIZATION_USER]  
-- Create table
create table TB_WSM_ORGANIZATION_USER
(
  ORGID  INTEGER not null,
  USERID INTEGER not null
);
  
  
--[TB_WSM_USER]
-- Create table
create table TB_WSM_USER
(
  USERID        INTEGER not null,
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
  USERTYPE      INTEGER,
  PHOTO         VARCHAR2(300)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_USER
  add constraint PK_TB_WSM_USER primary key (USERID);

--[TB_WSM_GROUP]
-- Create table
create table TB_WSM_GROUP
(
  GROUPID       INTEGER not null,
  GROUPNAME     VARCHAR2(100) not null,
  GROUPPARENTID INTEGER default -1,
  GROUPDESC     VARCHAR2(300),
  ISVALIDATE    VARCHAR2(2) not null,
  SHOWORDER     VARCHAR2(10),
  SYSID         VARCHAR2(64) not null,
  ISDEFAULT     VARCHAR2(2) default 0,
  DEFAULTID     INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_GROUP
  add constraint PK_TB_WSM_GROUP primary key (GROUPID);

--[TB_WSM_USER_GROUP]
-- Create table
create table TB_WSM_USER_GROUP
(
  GROUPID INTEGER not null,
  USERID  INTEGER not null
);

--[TB_WSM_PRIVILEGE]
-- Create table
create table TB_WSM_PRIVILEGE
(
  PRIVID       INTEGER not null,
  PRIVNAME     VARCHAR2(100) not null,
  PRIVCODE     VARCHAR2(100) not null,
  PRIVDESC     VARCHAR2(300),
  PRIVADDR     VARCHAR2(300),
  PRIVPARENTID INTEGER default -1,
  PRIVTYPE     VARCHAR2(64) not null,
  ISVALIDATE   VARCHAR2(2) not null,
  PRIVORDER    NUMBER default 1,
  SYSID        INTEGER not null,
  ISDEFAULT    VARCHAR2(2) default 0,
  DEFAUTLID    INTEGER,
  COLUMNID     INTEGER,
  MODULEID     INTEGER,
  OBJID        INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_PRIVILEGE
  add constraint PK_TB_WSM_PRIVILEGE primary key (PRIVID);

--[TB_WSM_ROLE]
-- Create table
create table TB_WSM_ROLE
(
  ROLEID     INTEGER not null,
  ROLENAME   VARCHAR2(100) not null,
  ROLEDESC   VARCHAR2(300),
  ISVALIDATE VARCHAR2(2) not null,
  SYSID      INTEGER not null,
  ISDEFAULT  VARCHAR2(2) default 0
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_ROLE
  add constraint PK_TB_WSM_ROLE primary key (ROLEID);

--[TB_WSM_ROLE_PRIVILEGE]
-- Create table
create table TB_WSM_ROLE_PRIVILEGE
(
  ROLEID INTEGER not null,
  PRIVID INTEGER not null
);

--[TB_WSM_GROUP_ROLE]
-- Create table
create table TB_WSM_GROUP_ROLE
(
  GROUPID INTEGER not null,
  ROLEID  INTEGER not null
);

--[TB_WSM_ROLE_CHANNEL]
-- Create table
create table TB_WSM_ROLE_CHANNEL
(
  ROLEID    INTEGER,
  CHANNELID INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_ROLE_CHANNEL
  add constraint CHANNEL_REF_ROLE foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);
alter table TB_WSM_ROLE_CHANNEL
  add constraint ROLE_REF_CHANNEL foreign key (ROLEID)
  references TB_WSM_ROLE (ROLEID);

--[TB_WSM_ROLE_COLUMN]
-- Create table
create table TB_WSM_ROLE_COLUMN
(
  ROLEID   INTEGER,
  COLUMNID INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_ROLE_COLUMN
  add constraint COLUMN_REF_ROLE foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);
alter table TB_WSM_ROLE_COLUMN
  add constraint ROLE_REF_COLUMN foreign key (ROLEID)
  references TB_WSM_ROLE (ROLEID);


-------------------------- 5）个性化模型表，包括系统、频道、布局、栏目------------------------------
--[TB_WSM_USER_SYSTEM]
-- Create table
create table TB_WSM_USER_SYSTEM
(
  USERID     INTEGER,
  SYSID      INTEGER,
  USERORDER  INTEGER default 0,
  ISSELECTED INTEGER default 0,
  ISSHOW     INTEGER default 1,
  ISDEFAULT  INTEGER default 0
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_USER_SYSTEM
  add constraint SITE_REF_USER foreign key (SYSID)
  references TB_SYSTEM (SYSID);
alter table TB_WSM_USER_SYSTEM
  add constraint USER_REF_SITE foreign key (USERID)
  references TB_WSM_USER (USERID);

--[TB_WSM_USER_CHANNEL]
-- Create table
create table TB_WSM_USER_CHANNEL
(
  CHANNELID    INTEGER,
  USERID       INTEGER,
  SYSID        INTEGER,
  CHANNELORDER INTEGER default 0,
  ISCURRENT    INTEGER default 0,
  ISSHOW       INTEGER default 1
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_USER_CHANNEL
  add constraint CHANNEL_REF_USER foreign key (CHANNELID)
  references TB_WSM_CHANNEL (CHANNELID);
alter table TB_WSM_USER_CHANNEL
  add constraint USER_REF_CHANNEL foreign key (USERID)
  references TB_WSM_USER (USERID);

--[TB_WSM_USER_LAYOUT]
-- Create table
create table TB_WSM_USER_LAYOUT
(
  LAYOUTID   INTEGER,
  USERID     INTEGER,
  CHANNELID  INTEGER,
  ISSELECTED INTEGER default 0,
  ISSHOW     INTEGER default 1,
  SHOWORDER  INTEGER default 0
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_USER_LAYOUT
  add constraint LAYOUT_REF_USER foreign key (LAYOUTID)
  references TB_WSM_LAYOUT (LAYOUTID);
alter table TB_WSM_USER_LAYOUT
  add constraint USER_REF_LAYOUT foreign key (USERID)
  references TB_WSM_USER (USERID);

--[TB_WSM_USER_COLUMN]
-- Create table
create table TB_WSM_USER_COLUMN
(
  UNITID    VARCHAR2(64),
  COLUMNID  INTEGER,
  USERID    INTEGER,
  LAYOUTID  INTEGER,
  SHOWORDER INTEGER default 0,
  ISSHOW    INTEGER default 1,
  ISOPEN    INTEGER default 1,
  ISMOVE    INTEGER default 1
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_WSM_USER_COLUMN
  add constraint COLUMN_REF_USER foreign key (COLUMNID)
  references TB_WSM_COLUMN (COLUMNID);
alter table TB_WSM_USER_COLUMN
  add constraint USER_REF_COLUMN foreign key (USERID)
  references TB_WSM_USER (USERID);






























  
  
  
  
  
  
  
  
  
  
  
  
