-------------------------- 1）基础表初始化数据，包括字典类型、字典 ------------------------------
--##tb_dic_type
insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (1, 'dbtype', '数据库类型', '数据库类型', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (2, 'dbdriver', '数据库驱动', '数据库驱动', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (3, 'privilegeType', '权限类型', '权限类型', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (4, 'USER_TYPE', '用户类型', '用户类型', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (5, 'SEX', '性别', '性别', '1');

--##tb_dictionary
insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (1, 1, 'mysql', 'mysql', 'mysql', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (1, 2, 'oracle', 'oracle', 'oracle', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (1, 3, 'sqlserver', 'sqlserver', 'sqlserver', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (1, 4, 'sybase', 'sybase', 'sybase', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (1, 5, 'odbc', 'odbc', 'odbc', '5', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (1, 6, 'postgresql', 'postgresql', 'postgresql', '6', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (1, 7, 'jtds', 'jtds', 'jtds', '7', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 8, 'com.mysql.jdbc.Driver', 'com.mysql.jdbc.Driver', 'com.mysql.jdbc.Driver', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 9, 'org.gjt.mm.mysql.Driver', 'org.gjt.mm.mysql.Driver', 'org.gjt.mm.mysql.Driver', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 10, 'org.postgresql.Driver', 'org.postgresql.Driver', 'org.postgresql.Driver', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 11, 'oracle.jdbc.driver.OracleDriver', 'oracle.jdbc.driver.OracleDriver', 'oracle.jdbc.driver.OracleDriver', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 12, 'com.sybase.jdbc2.jdbc.SybDriver', 'com.sybase.jdbc2.jdbc.SybDriver', 'com.sybase.jdbc2.jdbc.SybDriver', '5', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 13, 'net.sourceforge.jtds.jdbc.Driver', 'net.sourceforge.jtds.jdbc.Driver', 'net.sourceforge.jtds.jdbc.Driver', '6', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 14, 'com.microsoft.jdbc.sqlserver.SQLServerDriver', 'com.microsoft.jdbc.sqlserver.SQLServerDriver', 'com.microsoft.jdbc.sqlserver.SQLServerDriver', '7', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (2, 15, 'sun.jdbc.odbc.JdbcOdbcDriver', 'sun.jdbc.odbc.JdbcOdbcDriver', 'sun.jdbc.odbc.JdbcOdbcDriver', '8', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 16, 'Operation Privilege', 'operation_privileges', 'Operation Privilege', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 17, 'Function Privilege', 'function_privileges', 'Function Privilege', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 18, 'Composite Privilege', 'composite_privileges', 'Composite Privilege', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 19, 'Data Privilege', 'data_privileges', 'Data Privilege', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 20, '老师', 'teacher', '老师', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 21, '学生', 'student', '学生', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 22, '男', 'boy', '男', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 23, '女', 'girl', '女', '2', '1');

  
-------------------------- 2）系统结构模型初始化数据，包括系统、频道、布局、布局单元、栏目、及相互关系------------------------------
--下面tb_system,tb_wsm_column的SYSCODE,SYSNAME数据需要根据创建系统的特性进行修改
--##tb_system
insert into tb_system (SYSID, SYSCODE, SYSNAME, SYSPATH, SYSDESC, SHOWORDER, DEFROLEID, ISVALIDATE, ISINSIDE, USERDEFINE, USERID)
values (2, '$[mysystmpl]', '$[mysystmpl]', 'http://www.localhost.com', '$[mysystmpl]', 2, 1, 1, 1, 0, null);

insert into tb_system (SYSID, SYSCODE, SYSNAME, SYSPATH, SYSDESC, SHOWORDER, DEFROLEID, ISVALIDATE, ISINSIDE, USERDEFINE, USERID)
values (1, '_privilege_system', '门户平台管理系统', 'http://localhost:8080/privilege', '', 1, 1, 1, 0, 0, null);

--##tb_wsm_infotype
insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (1, 'QQ微信', '', '与公用的QQ微信接口对接', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (2, '新闻管理', '', '新闻管理', 'contoller.do?operation=listWebSiteNewsList&columnId=$[columnBean.columnId]&columnCode=$[columnBean.columnCode]&columnName=$[columnBean.columnName]&typeId=$[columnBean.infoTypeId]&curpage=0&perPageCount=$[columnBean.listShowNum]', '../plugins/news/index.jsp', 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columdCode=$[columnCode]', 'contoller.do?operation=listSubSystemNews&sysId=$[sysId]', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (3, '服务类型', '', '服务类型', '', '../plugins/service/index.jsp', '', 'contoller.do?operation=listSubSystemService&curpage=1&sysId=$[sysId]', null, 1, 0, 0, 'webService');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (4, 'RSS汇聚', '', '通过配置RSS源进行信息汇聚', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (5, '页面嵌套', '', '内容通过嵌套引用外部的URL地址加载得来。对应webref类型。', 'jsp/portal/website/plugins/webref/index.jsp', '../plugins/webref/index.jsp', 'jsp/portal/website/plugins/webref/index.jsp', 'contoller.do?operation=viewSubSystemWebRef&sysId=$[sysId]', null, 1, 0, 0, 'webRef');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (6, '短信消息', '', '实现通用短信接口的对接，收短信，发短信', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (7, '图片链接', '', '图片及链接管理', '../plugins/piclink/index.jsp', '../plugins/piclink/index.jsp', 'contoller.do', 'contoller.do?operation=listSubSystemPicLink&sysId=$[sysId]', null, 1, 1, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (8, '博客', '', '集成内部博客', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (9, '静态栏目', '', '栏目内容是静态页面的，不需要每次都加载。', 'jsp/portal/website/plugins/webpart/index.jsp', '../plugins/webpart/index.jsp', 'jsp/portal/website/plugins/webpart/index.jsp', 'contoller.do?operation=viewSubSystemWebPart&sysId=$[sysId]', null, 1, 0, 0, 'webPart');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (10, '数据查询', '', '通过定义数据源、数据查询语句，直接从数据库中查询数据，并进行展示；目前只支持横竖列表查询', '../plugins/sqlquery/list.jsp?sysId=$[sysId]&columnId=$[columnId]&queryId=$[sqlqueryBean.queryId]', '../plugins/sqlquery/index.jsp', '../plugins/sqlquery/view.jsp', 'contoller.do?operation=listSubSystemSQLQuery&curpage=1&sysId=$[sysId]', null, 1, 0, 0, 'sqlquery');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (11, '网上文件', '', '在网页上模拟文件及文件夹的管理方式管理资源', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (12, '电子邮件', '', '1）对内发送电子邮件；2）通过配置，管理收发外部邮件', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (13, '论坛', '', '集成内部论坛', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (14, '问卷调查', '', '配置不同的调查问卷', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (15, '组合功能', '', '通过菜单或树形目录的形式，对其他系统的功能从不同的视觉或业务进行组合，点击时可以打开或加载。', '', '', '', '', null, 1, 0, 0, 'function_loader_infotype');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (-1, '用户自定义栏目', '', '用户自定义栏目该类型用于其他栏目选择，是一种虚拟的数据数据;无须后台管理该编号将固定：_user_self_define_column_type_0000000000000000000000000000000000改为16', 'http://www.baidu.com/', '../plugins/userdefine/index.jsp', '', '', null, 1, 0, 0, '');

--##tb_wsm_channel 
insert into tb_wsm_channel (CHANNELID, SYSID, INFOTYPEID, CHANNELNAME, CHANNELCODE, CHANNELURL, SELECTEDCLASS, DEFAULTCLASS, CHANNELDESC, LOADSTYLE, ISVALIDATE, DEFAULTORDER, DEFAULTSHOW, DEFAULTSELECT, BEFOREICON, AFTERICON, SHOWHEIGHT, USERDEFINE, USERID)
values (1, 2, null, 'Home Page', '', '', '', '', 'Home Page', '1', 1, 1, 1, 1, 'simpleupload/themes/icons/$[mysystmpl]/house.png', '', 800, 0, null);

--##tb_wsm_layout
insert into tb_wsm_layout (LAYOUTID, CHANNELID, LAYOUTNAME, LAYOUTTEMPL, LAYOUTLOGO, LAYOUTSELECTEDLOGO, LAYOUTDESC, ISVALIDATE, DEFAULTORDER, DEFAULTSELECT, DEFAULTSHOW, USERDEFINE, USERID)
values (1, 1, 'Home Page', '1.jsp', '', '', 'Home Page', 1, 1, 1, 1, 0, null);

--##tb_wsm_unit
insert into tb_wsm_unit (UNITID, LAYOUTID)
values ('weiasbzZVcyEnwma2hIcGz0Z9H6xkuIxUWI30R9CfwVxO2LnCVwwFjw6ktalIppW', 1);

insert into tb_wsm_unit (UNITID, LAYOUTID)
values ('iJucDQGp1YcuUTEffTGCockKeZOAIEEMrxouVZdajUA3iQRS9PCFdw2eyqBOexSd', 1);

insert into tb_wsm_unit (UNITID, LAYOUTID)
values ('Bfll3rNKhNemwnQc3iFI91GSA3yei9X2W16hDJkgzmoVjOmflrI8HnLI73B8ArWj', 1);

insert into tb_wsm_unit (UNITID, LAYOUTID)
values ('0ccHuTqE34QRTZTHbPRJUegkCtfkJuJLgF1R4IxzdpAXf5JZ6s3K0ARIcnxYn0R7', 1);

insert into tb_wsm_unit (UNITID, LAYOUTID)
values ('3t3QPFeqAnEQrfdtridNeP2jdIpCWOFwlJJshtNq70ifUIaIb6WSc5kDWM5QiGF0', 1);

--##tb_wsm_column
insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (1, null, 2, 5, 'My access record', 'My_access_record', '', '', 'jsp/wsites/$[mysystmpl]/specify/access_record.jsp', '1', '', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (2, null, 2, 2, 'Notification announcement', 'Notification_announcement', '', '../plugins/news/index8list.jsp', 'contoller.do?operation=listWebSiteNewsList&curpage=0&perPageCount=12&forward=jsp/wsites/$[mysystmpl]/plugins/news/list.jsp', '1', 'Notification announcement', '1', '', '10', '13', '7', '11', 8, null, null, 1, 1, '', '', 0, 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columnCode=$[columnCode]&forward=jsp/wsites/$[mysystmpl]/plugins/news/view.jsp', 1, 1, 1, 1, 269, -1, 1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (3, null, 2, 9, 'I do business', 'I_do_business', '', '', '', '1', 'I do business', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (4, null, 2, 2, 'Department notice', 'Department_notice', '', '../plugins/news/index8list.jsp', 'contoller.do?operation=listWebSiteNewsList&curpage=0&perPageCount=12&forward=jsp/wsites/$[sysCode]/plugins/news/list.jsp', '1', 'Department notice', '1', '', '10', '13', '7', '11', 8, null, null, 1, 1, '', '', 0, 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columnCode=$[columnCode]&forward=jsp/wsites/$[mysystmpl]/plugins/news/view.jsp', 1, 1, 1, 1, 267, -1, 1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (5, null, 2, 9, 'To remind', 'To_remind', '', '', 'jsp/wsites/$[mysystmpl]/specify/to_remain.jsp', '1', 'To remind', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (6, null, 2, 2, 'School news', 'School_news', '', '../plugins/news/index8list.jsp', 'contoller.do?operation=listWebSiteNewsList&curpage=0&perPageCount=12&forward=jsp/wsites/$[currentSysCode]/plugins/news/list.jsp', '1', 'School news', '1', '', '10', '13', '7', '11', 8, null, null, 1, 1, '', '', 0, 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columnCode=$[columnCode]&forward=jsp/wsites/$[currentSysCode]/plugins/news/view.jsp', 1, 1, 1, 1, 267, -1, 1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (7, null, 2, 7, 'Common business system', 'Common_business_system', '', '', '', '1', 'Common business system', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (8, null, 2, 9, 'My mail', 'My_mail', '', '', '', '1', 'My mail', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 180, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (9, null, 2, 7, 'Other business functions', 'Other_business_functions', '', '../plugins/piclink/indexlist.jsp', '', '1', 'Other business functions', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);


--##tb_wsm_unit_column
insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('weiasbzZVcyEnwma2hIcGz0Z9H6xkuIxUWI30R9CfwVxO2LnCVwwFjw6ktalIppW', 1, 1, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('Bfll3rNKhNemwnQc3iFI91GSA3yei9X2W16hDJkgzmoVjOmflrI8HnLI73B8ArWj', 2, 1, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('weiasbzZVcyEnwma2hIcGz0Z9H6xkuIxUWI30R9CfwVxO2LnCVwwFjw6ktalIppW', 3, 2, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('Bfll3rNKhNemwnQc3iFI91GSA3yei9X2W16hDJkgzmoVjOmflrI8HnLI73B8ArWj', 4, 2, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('weiasbzZVcyEnwma2hIcGz0Z9H6xkuIxUWI30R9CfwVxO2LnCVwwFjw6ktalIppW', 5, 3, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('Bfll3rNKhNemwnQc3iFI91GSA3yei9X2W16hDJkgzmoVjOmflrI8HnLI73B8ArWj', 6, 3, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('3t3QPFeqAnEQrfdtridNeP2jdIpCWOFwlJJshtNq70ifUIaIb6WSc5kDWM5QiGF0', 7, 1, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('3t3QPFeqAnEQrfdtridNeP2jdIpCWOFwlJJshtNq70ifUIaIb6WSc5kDWM5QiGF0', 8, 2, 1, 1, 1);

insert into tb_wsm_unit_column (UNITID, COLUMNID, DEFAULTORDER, DEFAULTMOVE, DEFAULTOPEN, DEFAULTSHOW)
values ('3t3QPFeqAnEQrfdtridNeP2jdIpCWOFwlJJshtNq70ifUIaIb6WSc5kDWM5QiGF0', 9, 3, 1, 1, 1);


-------------------------- 3）样式配置表，包括主题、皮肤、样式、样式项、及相互关系------------------------------
--下面tb_wsm_themes中的THEMESNAME、THEMESCODE、THEMESDESC需要根据系统进行修改
--##tb_wsm_themes
insert into tb_wsm_themes (THEMESID, THEMESNAME, THEMESCODE, THEMESDESC, ISVALIDATE, SHOWORDER, ISDEFAULT)
values (1, '$[mysystmpl] Style', ' $[mysystmpl]', '$[mysystmpl] Style', 1, 1, 1);

--##tb_wsm_sys_themes
insert into tb_wsm_sys_themes (THEMESID, SYSID, ISDEFAULT)
values (1, 2, null);

--##tb_wsm_skin
insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (1, 1, 'Latest News Skin', 'ethnet-latest-news-cloumn-skin', 'Latest News Skin', 8, 1, 1, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (2, 1, 'News Cloumn Skin', 'ethnet-news-cloumn-skin', 'News Cloumn Skin', 8, 1, 1, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (3, 1, 'sidebar style', 'banner', 'sidebar style', 16, 1, 0, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (4, 1, 'sidebar menu style', 'banner-channel', 'sidebar menu style', 4, 1, null, 0, 0, 0, 1, 'simpleupload/themes/tempfiles/system_/bannermenu.css');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (5, 1, 'footer style', 'footer', 'footer style', 7, 1, null, 0, 0, 0, 1, 'simpleupload/themes/tempfiles/system_/footer.jsp');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (6, 1, 'default section details the skin', 'default-view-column-skin', 'default section details the skin', 10, 1, 0, 0, 1, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (7, 1, 'news widget details page default style', 'news-plugin-default-view-column-skin', 'news widget details page default style', 16, 1, 0, 0, 1, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (8, 1, 'head style', 'header', 'head style', 2, 1, null, 0, 0, 0, 1, 'simpleupload/themes/tempfiles/system_/header.css');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (9, 1, 'Home overall skin', 'index', 'Home overall skin', 1, 1, null, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (10, 1, 'shalldow blue column border', 'shalldow-blue-cloumn-skin', 'shalldow blue column border', 8, 1, 1, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (11, 1, 'news widget, Page default style', 'news-plugin-default-list-skin', 'news widget, Page default style', 15, 1, 0, 0, 0, 1, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (12, 1, 'Home global body style definition', 'body', 'Home global body style definition', 5, 1, null, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (13, 1, 'Home News widget default style', 'news-plugin-default-index-skin', 'Home News widget default style', 15, 1, 0, 1, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (14, 1, 'Channel loader style definitions', 'channel', 'Channel loader style definitions', 6, 1, null, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (15, 1, 'default column list skin', 'default-list-column-skin', 'default column list skin', 11, 1, 0, 0, 0, 1, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (16, 1, 'blue column border', 'blue-color-cloumn-skin', 'default column borders', 8, 1, 1, 0, 0, 0, 1, '');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (19, 1, 'sub_channel', 'sub_channel', 'sub_channel', 11, 1, 0, 0, 0, 0, 1, 'simpleupload/themes/tempfiles/system_/sub-channel.css');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (17, 1, 'navigation', 'navigation', 'navigation', 11, 1, 0, 0, 0, 0, 1, 'simpleupload/themes/tempfiles/system_/navigation.css');

insert into tb_wsm_skin (SKINID, THEMESID, SKINNAME, SKINCODE, SKINDESC, SHOWORDER, ISDEFAULT, ISCOLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, ISVALIDATE, SKINFILEPATH)
values (18, 1, 'layout-loader', 'layout_loader', 'layout-loader', 11, 1, 0, 0, 0, 0, 1, 'simpleupload/themes/tempfiles/system_/layout-loader.css');

--##tb_wsm_css
insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (1, 1, 'column loader [column header] style', 'column-loader-box-title', 'column loader [column header] style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (2, 1, 'column loader [column head -logo] style', 'column-loader-box-title-logo', 'column loader [column head -logo] style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (3, 1, 'column loader [column header - spare blank] style', 'column-loader-box-title-blank', 'column loader [column header - spare blank] style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (4, 1, 'column loader style', 'column-loader-box', 'column loader style', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (5, 1, 'column loader [section head - configuration area] style', 'column-loader-box-title-config', 'column loader [section head - configuration area] style', '', 9, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (6, 1, 'column loader [column content boxes] style definitions', 'column-loader-box-content-box', 'column loader [column content boxes] style definitions', '', 11, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (7, 1, 'column loader [column content - an upper - left] style definitions', 'column-loader-box-content-top-left', 'column loader [column content - an upper - left] Style Definitions', '', 13, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (8, 1, 'column loader [column content - an upper - middle] style definitions', 'column-loader-box-content-top-middle', 'column loader [column content - an upper - middle] Style Definitions', '', 14, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (9, 1, 'column loader [column content - middle - left] style definitions', 'column-loader-box-content-middle-left', 'column loader [column content - middle - left] Style Definitions', '', 16, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (10, 1, 'column loader [column content - middle - middle] style definitions', 'column-loader-box-content-middle-middle', 'column loader [column content - middle - middle] Style Definitions', '', 17, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (11, 1, 'column loader [column content - lower part - left] style definitions', 'column-loader-box-content-bottom-left', 'column loader [column content - lower part - left] Style Definitions', '', 19, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (12, 1, 'column loader [column content - lower part - right] style definitions', 'column-loader-box-content-bottom-right', 'column loader [column content - lower part - right] style definitions', '', 21, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (13, 1, 'column loader tr, th, td style', 'column-loader-box tr,th,td', 'column loader tr, th, td style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (14, 1, 'column loader [column header] heading styles', 'column-loader-box-title-box', 'column loader [column header] heading style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (15, 1, 'column loader [column header] title tr, th, td style', 'column-loader-box-title-box tr,th,td', 'column loader [column header] title tr, th, td style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (16, 1, 'column loader [column content] style definitions', 'column-loader-box-content', 'column loader [column content] style definitions', '', 10, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (17, 1, 'column loader [column content boxes] tr, th, td style definitions', 'column-loader-box-content-box tr,th,td', 'column loader [column content boxes] tr, th, td style definitions', '', 12, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (18, 1, 'column loader [column content - middle - right] style definitions', 'column-loader-box-content-middle-right', 'column loader [column content - middle - right] style definitions', '', 18, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (19, 1, 'column loader [column content - lower part - the middle] style definitions', 'column-loader-box-content-bottom-middle', 'column loader [column content - lower part - the middle] Style Definitions', '', 20, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (20, 1, 'column loader [column header - title content] style', 'column-loader-box-title-name', 'column loader [column header - title content] style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (21, 1, 'column loader [column content - an upper - right] style definitions', 'column-loader-box-content-top-right', 'column loader [column content - an upper - right] style definitions', '', 15, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (22, 2, 'column loader style', 'column-loader-box', 'column loader style', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (23, 2, 'column loader tr, th, td style', 'column-loader-box tr,th,td', 'column loader tr, th, td style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (24, 2, 'column loader [column header] heading styles', 'column-loader-box-title-box', 'column loader [column header] heading style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (25, 2, 'column loader [column header - title content] style', 'column-loader-box-title-name', 'column loader [column header - title content] style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (26, 2, 'column loader [column content] style definitions', 'column-loader-box-content', 'column loader [column content] style definitions', '', 10, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (27, 2, 'column loader [column content boxes] tr, th, td style definitions', 'column-loader-box-content-box tr,th,td', 'column loader [column content boxes] tr, th, td style definitions', '', 12, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (28, 2, 'column loader [column content - middle - right] style definitions', 'column-loader-box-content-middle-right', 'column loader [column content - middle - right] style definitions', '', 18, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (29, 2, 'column loader [column content - lower part - the middle] style definitions', 'column-loader-box-content-bottom-middle', 'column loader [column content - lower part - the middle] Style Definitions', '', 20, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (30, 2, 'column loader [column head -logo] style', 'column-loader-box-title-logo', 'column loader [column head -logo] style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (31, 2, 'column loader [column header - spare blank] style', 'column-loader-box-title-blank', 'column loader [column header - spare blank] style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (32, 2, 'column loader [section head - configuration area] style', 'column-loader-box-title-config', 'column loader [section head - configuration area] style', '', 9, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (33, 2, 'column loader [column content - an upper - left] style definitions', 'column-loader-box-content-top-left', 'column loader [column content - an upper - left] Style Definitions', '', 13, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (34, 2, 'column loader [column content - middle - left] style definitions', 'column-loader-box-content-middle-left', 'column loader [column content - middle - left] Style Definitions', '', 16, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (35, 2, 'column loader [column content - middle - middle] style definitions', 'column-loader-box-content-middle-middle', 'column loader [column content - middle - middle] Style Definitions', '', 17, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (36, 2, 'column loader [column content - lower part - left] style definitions', 'column-loader-box-content-bottom-left', 'column loader [column content - lower part - left] Style Definitions', '', 19, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (37, 2, 'column loader [column header] title tr, th, td style', 'column-loader-box-title-box tr,th,td', 'column loader [column header] title tr, th, td style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (38, 2, 'column loader [column content - an upper - right] style definitions', 'column-loader-box-content-top-right', 'column loader [column content - an upper - right] style definitions', '', 15, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (39, 2, 'column loader [column header] style', 'column-loader-box-title', 'column loader [column header] style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (40, 2, 'column loader [column content boxes] style definitions', 'column-loader-box-content-box', 'column loader [column content boxes] style definitions', '', 11, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (41, 2, 'column loader [column content - an upper - middle] style definitions', 'column-loader-box-content-top-middle', 'column loader [column content - an upper - middle] Style Definitions', '', 14, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (42, 2, 'column loader [column content - lower part - right] style definitions', 'column-loader-box-content-bottom-right', 'column loader [column content - lower part - right] style definitions', '', 21, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (43, 3, 'left sidebar', 'global-body-banner-left', 'left sidebar', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (44, 3, 'sidebar on the right side of the body', 'global-body-banner-right', 'sidebar on the right side of the body', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (45, 3, 'section of the principal th, td style', 'global-body-banner th,td', 'section of the principal th, td style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (46, 3, 'middle section of the principal', 'global-body-banner-middle', 'sidebar central body', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (47, 3, 'section of the principal style', 'global-body-banner', 'section of the principal style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (48, 8, 'header logo', 'header-logo', 'header logo', '', 17, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (49, 8, 'head table th, td style', 'global-body-header th,td', 'head table th, td style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (50, 8, 'head [intermediate] style', 'global-body-header-middle', 'head [intermediate] style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (51, 8, 'head [intermediate content boxes - part] (element cartridge) style', 'header-top-box', 'head [intermediate content boxes - part] (element cartridge) style', '', 9, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (52, 8, 'head [on the right] Shape', 'global-body-header-right', 'head [on the right] Shape', '', 15, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (53, 8, 'head [left] Shape', 'global-body-header-left', 'head [left] Shape', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (54, 8, 'head [intermediate content box] style', 'global-body-header-middle-box', 'head [intermediate content box] style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (55, 8, 'head [intermediate content box] th td style', 'global-body-header-middle-box th,td', 'head [intermediate content box] th td style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (56, 8, 'head [an upper] (element cartridge) style', 'header-top-cell-box', 'head [an upper] (element cartridge) style', '', 10, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (57, 8, 'head [intermediate content boxes - part] (element cartridge) link style', 'header-top-cell-box a', 'head [intermediate content boxes - part] (element cartridge) link style', '', 11, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (58, 8, 'system switch box', 'system-switcher-box', 'system switch box', '', 12, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (59, 8, 'head [intermediate content box - the middle part of] style', 'global-body-header-middle-box-middle', 'head [intermediate content box - the middle part of] style', '', 13, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (60, 8, 'head surface background', 'headerSurfaceBackground', 'head surface background', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (61, 8, 'global head style page layout', 'global-body-header', 'Home page layout global head style definitions', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (62, 8, 'head [intermediate content boxes - part] Shape', 'global-body-header-middle-box-top', 'head [intermediate content boxes - part] Shape', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (63, 8, 'head [intermediate content box - the lower portion] style', 'global-body-header-middle-box-bottom', 'head [intermediate content box - the lower portion] style', '', 14, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (64, 8, 'basic styles', '.base_table', 'basic style', '"margin:0px;border:0px;paddin:0px;"', 0, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (65, 9, 'to the right of the middle part of style', 'index-global-layout-right-padding-middle', 'to the right of the middle part of style', '', 13, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (66, 9, 'lower right part style', 'index-global-layout-right-padding-bottom', 'on the right lower part of style', '', 14, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (67, 9, 'intermediate body style', 'index-global-layout-body', 'intermediate body style', '', 15, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (68, 9, 'middle system load frame style', 'index-global-system-loader', 'middle system load frame style', '', 16, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (69, 9, 'body home style', 'index-global-body', 'Home body style', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (70, 9, 'Home outermost table style', 'index-global-layout', 'Home outermost table style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (71, 9, 'Home outermost table tr style', 'index-global-layout tr', 'Home outermost table tr style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (72, 9, 'Home outermost table th, td style', 'index-global-layout th,td', 'Home outermost table th, td style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (73, 9, 'left border style', 'index-global-layout-left-padding', 'left border style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (74, 9, 'left content style', 'global-body-left-content', 'left content style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (75, 9, 'on the left part of the style', 'index-global-layout-left-padding-top', 'on the left part of the style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (76, 9, 'left middle part of style', 'index-global-layout-left-padding-middle', 'left middle part of style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (77, 9, 'lower left part of the style', 'index-global-layout-left-padding-bottom', 'left lower part of style', '', 9, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (78, 9, 'content to the right of the style', 'global-body-right-content', 'content to the right of the style', '', 11, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (79, 9, 'on the right border style', 'index-global-layout-right-padding', 'on the right border style', '', 10, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (80, 9, 'on the right part of the style', 'index-global-layout-right-padding-top', 'on the right part of the style', '', 12, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (81, 10, 'column loader tr, th, td style', 'column-loader-box tr,th,td', 'column loader tr, th, td style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (82, 10, 'column loader [column header] heading styles', 'column-loader-box-title-box', 'column loader [column header] heading style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (83, 10, 'column loader [column header - title content] style', 'column-loader-box-title-name', 'column loader [column header - title content] style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (84, 10, 'column loader [column content] style definitions', 'column-loader-box-content', 'column loader [column content] style definitions', '', 10, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (85, 10, 'column loader [column content boxes] tr, th, td style definitions', 'column-loader-box-content-box tr,th,td', 'column loader [column content boxes] tr, th, td style definitions', '', 12, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (86, 10, 'column loader [column content - middle - right] style definitions', 'column-loader-box-content-middle-right', 'column loader [column content - middle - right] style definitions', '', 18, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (87, 10, 'column loader [column content - lower part - the middle] style definitions', 'column-loader-box-content-bottom-middle', 'column loader [column content - lower part - the middle] Style Definitions', '', 20, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (88, 10, 'column loader [column head -logo] style', 'column-loader-box-title-logo', 'column loader [column head -logo] style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (89, 10, 'column loader [column header - spare blank] style', 'column-loader-box-title-blank', 'column loader [column header - spare blank] style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (90, 10, 'column loader [column content boxes] style definitions', 'column-loader-box-content-box', 'column loader [column content boxes] style definitions', '', 11, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (91, 10, 'column loader [column content - an upper - left] style definitions', 'column-loader-box-content-top-left', 'column loader [column content - an upper - left] Style Definitions', '', 13, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (92, 10, 'column loader [column content - middle - left] style definitions', 'column-loader-box-content-middle-left', 'column loader [column content - middle - left] Style Definitions', '', 16, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (93, 10, 'column loader [column content - middle - middle] style definitions', 'column-loader-box-content-middle-middle', 'column loader [column content - middle - middle] Style Definitions', '', 17, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (94, 10, 'column loader [column content - lower part - left] style definitions', 'column-loader-box-content-bottom-left', 'column loader [column content - lower part - left] Style Definitions', '', 19, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (95, 10, 'column loader style', 'column-loader-box', 'column loader style', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (96, 10, 'column loader [column header] title tr, th, td style', 'column-loader-box-title-box tr,th,td', 'column loader [column header] title tr, th, td style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (97, 10, 'column loader [column content - an upper - right] style definitions', 'column-loader-box-content-top-right', 'column loader [column content - an upper - right] style definitions', '', 15, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (98, 10, 'column loader [column header] style', 'column-loader-box-title', 'column loader [column header] style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (99, 10, 'column loader [section head - configuration area] style', 'column-loader-box-title-config', 'column loader [section head - configuration area] style', '', 9, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (100, 10, 'column loader [column content - an upper - middle] style definitions', 'column-loader-box-content-top-middle', 'column loader [column content - an upper - middle] Style Definitions', '', 14, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (101, 10, 'column loader [column content - lower part - right] style definitions', 'column-loader-box-content-bottom-right', 'column loader [column content - lower part - right] style definitions', '', 21, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (102, 11, 'message box style', 'news-list-box', 'message box style', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (103, 11, 'info box [row] style', 'news-list-box-line', 'info box [row] style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (104, 11, 'info box [row] in the [title] element style', 'news-list-box-line-title-cell', 'info box [row] in the [title] element of style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (105, 11, 'info box [row] in [Profile] element style', 'news-list-box-line-introduction-cell', 'info box [row] in [Profile] element of style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (106, 11, 'info box [row] in [Publisher] element style', 'news-list-box-line-publisher-cell', 'info box [row] in [Publisher] element of style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (107, 11, 'info box [row] [Date] element style', 'news-list-box-line-datetime-cell', 'info box [row] [Date] element of style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (108, 11, 'info box [row] in the [title - link] element style', 'news-list-box-line-title-link-cell', 'info box [row] in the [title - link] element of style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (109, 11, 'info box [row] in the [title -logo] element style', 'news-list-box-line-title-logo', 'info box [row] in the [title -logo] element of style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (110, 12, 'left main content style', 'global-body-content-left', 'left main content style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (111, 12, 'main contents of the intermediate style', 'global-body-content-middle', 'main content of the intermediate style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (112, 12, 'main content', 'global-body-content', 'main content', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (113, 12, 'main content of the right of style', 'global-body-content-right', 'main content of the right of style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (114, 13, 'message box style', 'news-index-box', 'message box style', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (115, 13, 'info box [row] style', 'news-index-box-line', 'info box [row] style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (116, 13, 'info box [row] in the [title] element style', 'news-index-box-line-title-cell', 'info box [row] in the [title] element of style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (117, 13, 'info box [row] in the [title -logo] element style', 'news-index-box-line-title-logo', 'info box [row] in the [title -logo] element of style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (118, 13, 'info box [row] in [Profile] element style', 'news-index-box-line-introduction-cell', 'info box [row] in [Profile] element of style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (119, 13, 'info box [row] in [Publisher] element style', 'news-index-box-line-publisher-cell', 'info box [row] in [Publisher] element of style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (120, 13, 'info box [row] [Date] element style', 'news-index-box-line-datetime-cell', 'info box [row] [Date] element of style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (121, 13, 'info box [row] in the [title - link] element style', 'news-index-box-line-title-link-cell', 'info box [row] in the [title - link] element of style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (122, 14, 'Channel loader', 'channel-loader', 'Channel loader', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (123, 14, 'channel head cartridge loader style', 'channel-loader-banner-box', 'channel head cartridge loader style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (124, 14, 'Channel loader head style', 'channel-loader-banner', 'Channel loader head style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (125, 14, 'middle channel loader head style', 'channel-loader-banner-middle', 'middle channel loader head style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (126, 14, 'layout box elements defined style', 'layout-define-box-cell', 'layout box elements defined style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (127, 14, 'Layout menu box', 'layout-menu-box', 'Layout menu box', '', 10, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (128, 14, 'menu item is selected layout style', 'layout-menu-item-selected', 'menu item is selected layout style', '', 12, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (129, 14, 'content channels loader', 'channel-loader-content', 'content channels loader', '', 14, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (130, 14, 'content channels loader tr, th, td', 'channel-loader-content tr,th,td', 'content channels loader tr, th, td', '', 15, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (131, 14, 'content channels loader middle style', 'channel-loader-content-middle', 'content channels loader middle style', '', 17, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (132, 14, 'layout definition box style', 'layout-define-box', 'layout definition box style', '', 19, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (133, 14, 'channel bottom loading style', 'channel-loader-footer', 'channel bottom loading style', '', 22, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (134, 14, 'Channel loader middle bottom of the Styles', 'channel-loader-footer-middle', 'Channel loader bottom middle style', '', 24, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (135, 14, 'Channel loader tr, th, td style', 'channel-loader tr,th,td', 'Channel loader tr, th, td style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (136, 14, 'left channel loader head style', 'channel-loader-banner-left', 'left channel loader head style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (137, 14, 'channel loading head to the right style', 'channel-loader-banner-right', 'channel loading head to the right style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (138, 14, 'links style layout definition box element', 'layout-define-box-cell a', 'links style layout definition box element', '', 9, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (139, 14, 'Layout menu item', 'layout-menu-item', 'Layout menu item', '', 11, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (140, 14, 'content channels loader box', 'channel-loader-content-box', 'content channels loader box', '', 13, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (141, 14, 'content left channel loader style', 'channel-loader-content-left', 'content left channel loader style', '', 16, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (142, 14, 'content to the right channel loader style', 'channel-loader-content-right', 'content to the right channel loader style', '', 18, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (143, 14, 'channel layout loader', 'channel-layout-loader', 'channel layout loader', '', 20, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (144, 14, 'channel bottom loading cassette style', 'channel-loader-footer-box', 'channel bottom loading cassette style', '', 21, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (145, 14, 'at the bottom of the left channel loader style', 'channel-loader-footer-left', 'at the bottom of the left channel loader style', '', 23, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (146, 14, 'Channel loader bottom right of the style', 'channel-loader-footer-right', 'Channel loader bottom right of the style', '', 25, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (147, 16, 'column loader style', 'column-loader-box', 'column loader style', '', 1, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (148, 16, 'column loader [column header] heading styles', 'column-loader-box-title-box', 'column loader [column header] heading style', '', 4, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (149, 16, 'column loader [column header - title content] style', 'column-loader-box-title-name', 'column loader [column header - title content] style', '', 7, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (150, 16, 'column loader [column content] style definitions', 'column-loader-box-content', 'column loader [column content] style definitions', '', 10, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (151, 16, 'column loader [column content boxes] tr, th, td style definitions', 'column-loader-box-content-box tr,th,td', 'column loader [column content boxes] tr, th, td style definitions', '', 12, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (152, 16, 'column loader [column content - middle - right] style definitions', 'column-loader-box-content-middle-right', 'column loader [column content - middle - right] style definitions', '', 18, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (153, 16, 'column loader [column header] style', 'column-loader-box-title', 'column loader [column header] style', '', 3, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (154, 16, 'column loader [column content - lower part - the middle] style definitions', 'column-loader-box-content-bottom-middle', 'column loader [column content - lower part - the middle] Style Definitions', '', 20, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (155, 16, 'column loader [column header - spare blank] style', 'column-loader-box-title-blank', 'column loader [column header - spare blank] style', '', 8, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (156, 16, 'column loader [section head - configuration area] style', 'column-loader-box-title-config', 'column loader [section head - configuration area] style', '', 9, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (157, 16, 'column loader [column content - an upper - left] style definitions', 'column-loader-box-content-top-left', 'column loader [column content - an upper - left] Style Definitions', '', 13, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (158, 16, 'column loader [column content - an upper - middle] style definitions', 'column-loader-box-content-top-middle', 'column loader [column content - an upper - middle] Style Definitions', '', 14, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (159, 16, 'column loader [column content - middle - middle] style definitions', 'column-loader-box-content-middle-middle', 'column loader [column content - middle - middle] Style Definitions', '', 17, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (160, 16, 'column loader [column content - lower part - left] style definitions', 'column-loader-box-content-bottom-left', 'column loader [column content - lower part - left] Style Definitions', '', 19, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (161, 16, 'column loader tr, th, td style', 'column-loader-box tr,th,td', 'column loader tr, th, td style', '', 2, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (162, 16, 'column loader [column header] title tr, th, td style', 'column-loader-box-title-box tr,th,td', 'column loader [column header] title tr, th, td style', '', 5, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (163, 16, 'column loader [column content - an upper - right] style definitions', 'column-loader-box-content-top-right', 'column loader [column content - an upper - right] style definitions', '', 15, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (164, 16, 'column loader [column head -logo] style', 'column-loader-box-title-logo', 'column loader [column head -logo] style', '', 6, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (165, 16, 'column loader [column content boxes] style definitions', 'column-loader-box-content-box', 'column loader [column content boxes] style definitions', '', 11, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (166, 16, 'column loader [column content - middle - left] style definitions', 'column-loader-box-content-middle-left', 'column loader [column content - middle - left] Style Definitions', '', 16, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (167, 16, 'column loader [column content - lower part - right] style definitions', 'column-loader-box-content-bottom-right', 'column loader [column content - lower part - right] style definitions', '', 21, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (168, 10, 'folder column', 'folderColumn', 'folder column', '', 22, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (169, 10, 'unfolder column', 'unfolderColumn', 'unfolder column', '', 23, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (170, 10, 'close column', 'closeColumn', 'close column', '', 25, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (171, 10, 'column more info', 'columnMoreInfo', 'column more info', '', 24, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (172, 16, 'unfolder column', 'unfolderColumn', 'unfolder column', '', 23, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (173, 16, 'folder column', 'folderColumn', 'folder column', '', 22, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (174, 16, 'close column', 'closeColumn', 'close column', '', 25, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (175, 16, 'column more info', 'columnMoreInfo', 'column more info', '', 24, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (176, 16, 'unfolder column hidden', 'unfolderColumnHidden', 'unfolder column', '', 23, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (177, 16, 'folder column hidden', 'folderColumnHidden', 'folder column', '', 22, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (178, 10, 'unfolder column hidden', 'unfolderColumnHidden', 'unfolder column', '', 23, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (179, 10, 'folder column hidden', 'folderColumnHidden', 'folder column', '', 22, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (180, 5, 'clxx_1simpleupload_themes_tempfiles_system__footer', 'clxx_1simpleupload_themes_tempfiles_system__footer', 'clxx_1simpleupload_themes_tempfiles_system__footer', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (181, 5, 'clxx_2simpleupload_themes_tempfiles_system__footer', 'clxx_2simpleupload_themes_tempfiles_system__footer', 'clxx_2simpleupload_themes_tempfiles_system__footer', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (182, 5, 'clxx_3simpleupload_themes_tempfiles_system__footer', 'clxx_3simpleupload_themes_tempfiles_system__footer', 'clxx_3simpleupload_themes_tempfiles_system__footer', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (183, 5, 'clxx_4simpleupload_themes_tempfiles_system__footer', 'clxx_4simpleupload_themes_tempfiles_system__footer', 'clxx_4simpleupload_themes_tempfiles_system__footer', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (184, 5, 'clxx_5simpleupload_themes_tempfiles_system__footer', 'clxx_5simpleupload_themes_tempfiles_system__footer', 'clxx_5simpleupload_themes_tempfiles_system__footer', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (185, 5, 'global-body-footer', 'global-body-footer', 'global-body-footer', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (186, 5, 'global-body-footer-top', 'global-body-footer-top', 'global-body-footer-top', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (187, 5, 'global-body-footer-top-left', 'global-body-footer-top-left', 'global-body-footer-top-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (188, 5, 'global-body-footer-top-middle', 'global-body-footer-top-middle', 'global-body-footer-top-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (189, 5, 'global-body-footer-top-right', 'global-body-footer-top-right', 'global-body-footer-top-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (190, 5, 'global-body-footer-middle', 'global-body-footer-middle', 'global-body-footer-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (191, 5, 'global-body-footer-bottom', 'global-body-footer-bottom', 'global-body-footer-bottom', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (192, 5, 'global-body-footer-top-content', 'global-body-footer-top-content', 'global-body-footer-top-content', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (193, 5, 'global-body-footer-top-content-share', 'global-body-footer-top-content-share', 'global-body-footer-top-content-share', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (194, 5, 'linkbox', 'linkbox', 'linkbox', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (195, 5, 'linkboxmargin', 'linkboxmargin', 'linkboxmargin', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (196, 5, 'linkbox tr td', 'linkbox tr td', 'linkbox tr td', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (197, 5, 'linkbox tr td a', 'linkbox tr td a', 'linkbox tr td a', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (198, 5, 'linkcarbox', 'linkcarbox', 'linkcarbox', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (199, 5, 'linkcarbox tr td', 'linkcarbox tr td', 'linkcarbox tr td', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (200, 5, 'linkcarbox tr td div', 'linkcarbox tr td div', 'linkcarbox tr td div', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (201, 5, 'linkcarbox tr td div a', 'linkcarbox tr td div a', 'linkcarbox tr td div a', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (202, 5, 'copyright', 'copyright', 'copyright', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (203, 5, 'global-body-footer-middle-left', 'global-body-footer-middle-left', 'global-body-footer-middle-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (204, 5, 'global-body-footer-middle-middle', 'global-body-footer-middle-middle', 'global-body-footer-middle-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (205, 5, 'global-body-footer-middle-right', 'global-body-footer-middle-right', 'global-body-footer-middle-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (206, 5, 'global-body-footer-bottom-left', 'global-body-footer-bottom-left', 'global-body-footer-bottom-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (207, 5, 'global-body-footer-bottom-middle', 'global-body-footer-bottom-middle', 'global-body-footer-bottom-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (208, 5, 'global-body-footer-bottom-right', 'global-body-footer-bottom-right', 'global-body-footer-bottom-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (209, 4, 'cmenu-box', 'cmenu-box', 'cmenu-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (210, 4, '.cmenu-box tr', '.cmenu-box tr', '.cmenu-box tr', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (211, 4, '.cmenu-item-box', '.cmenu-item-box', '.cmenu-item-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (212, 4, '.cmenu-config', '.cmenu-config', '.cmenu-config', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (213, 4, '.cmenu-item-name-box', '.cmenu-item-name-box', '.cmenu-item-name-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (214, 4, '.cmenu-item-name-indent-box', '.cmenu-item-name-indent-box', '.cmenu-item-name-indent-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (215, 4, '.cmenu-item-name-before-icon-box', '.cmenu-item-name-before-icon-box', '.cmenu-item-name-before-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (216, 4, '.cmenu-item-name-text-box', '.cmenu-item-name-text-box', '.cmenu-item-name-text-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (217, 4, '.cmenu-item-name-after-icon-box', '.cmenu-item-name-after-icon-box', '.cmenu-item-name-after-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (218, 4, '.cmenu-item-name-text', '.cmenu-item-name-text', '.cmenu-item-name-text', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (219, 4, '.cmitem-selected', '.cmitem-selected', '.cmitem-selected', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (220, 4, '.cmsubmenu-box', '.cmsubmenu-box', '.cmsubmenu-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (221, 4, '.cmsubmenu-item-name-box', '.cmsubmenu-item-name-box', '.cmsubmenu-item-name-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (222, 4, '.cmsubmenu-item-name-indent-box', '.cmsubmenu-item-name-indent-box', '.cmsubmenu-item-name-indent-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (223, 4, '.cmsubmenu-item-name-before-icon-box', '.cmsubmenu-item-name-before-icon-box', '.cmsubmenu-item-name-before-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (224, 4, '.cmsubmenu-item-name-text-box', '.cmsubmenu-item-name-text-box', '.cmsubmenu-item-name-text-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (225, 4, '.cmsubmenu-item-name-after-icon-box', '.cmsubmenu-item-name-after-icon-box', '.cmsubmenu-item-name-after-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (226, 4, '.cmsubmenu-item-name-text', '.cmsubmenu-item-name-text', '.cmsubmenu-item-name-text', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (227, 4, '.cmsubmenu-item-selected', '.cmsubmenu-item-selected', '.cmsubmenu-item-selected', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (228, 8, 'header-box', 'header-box', 'header-box', '', 28, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (229, 8, '.header-box-left', '.header-box-left', '.header-box-left', '', 29, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (230, 8, '.header-box-middle', '.header-box-middle', '.header-box-middle', '', 26, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (231, 8, '.header-box-right', '.header-box-right', '.header-box-right', '', 27, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (232, 8, '.header-logo-box', '.header-logo-box', '.header-logo-box', '', 32, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (233, 8, '.header-logo-box-logo', '.header-logo-box-logo', '.header-logo-box-logo', '', 33, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (234, 8, '.header-logo-box-name', '.header-logo-box-name', '.header-logo-box-name', '', 30, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (235, 8, '.header-logo-box-name-box', '.header-logo-box-name-box', '.header-logo-box-name-box', '', 31, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (236, 8, '.header-logo-box-name-box-name', '.header-logo-box-name-box-name', '.header-logo-box-name-box-name', '', 20, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (237, 8, '.header-logo-box-name-box-desc', '.header-logo-box-name-box-desc', '.header-logo-box-name-box-desc', '', 21, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (238, 8, '.header-logo-box-name-myportal', '.header-logo-box-name-myportal', '.header-logo-box-name-myportal', '', 18, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (239, 8, '.header-box-right-box', '.header-box-right-box', '.header-box-right-box', '', 19, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (240, 8, '.searchinput', '.searchinput', '.searchinput', '', 24, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (241, 8, '.searchbuttona', '.searchbuttona', '.searchbuttona', '', 25, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (242, 8, '.searchbutton', '.searchbutton', '.searchbutton', '', 22, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (243, 8, '.searchkeyword', '.searchkeyword', '.searchkeyword', '', 23, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (244, 17, 'navigation-box', 'navigation-box', 'navigation-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (245, 17, '.navigation-box-left', '.navigation-box-left', '.navigation-box-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (246, 17, '.navigation-box-right', '.navigation-box-right', '.navigation-box-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (247, 17, '.navigation-box-left-box', '.navigation-box-left-box', '.navigation-box-left-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (248, 17, '.navigation-box-left-box-title', '.navigation-box-left-box-title', '.navigation-box-left-box-title', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (249, 17, '.navigation-box-left-box-title-comma', '.navigation-box-left-box-title-comma', '.navigation-box-left-box-title-comma', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (250, 17, '.navigation-box-left-box-path', '.navigation-box-left-box-path', '.navigation-box-left-box-path', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (251, 18, '.layout-box', '.layout-box', '.layout-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (252, 18, '.layout-list-box', '.layout-list-box', '.layout-list-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (253, 18, '.layout-list-box-left', '.layout-list-box-left', '.layout-list-box-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (254, 18, '.layout-list-box-middle', '.layout-list-box-middle', '.layout-list-box-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (255, 18, '.layout-list-box-right', '.layout-list-box-right', '.layout-list-box-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (256, 18, '.layout-loader-box', '.layout-loader-box', '.layout-loader-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (257, 18, '.layout-loader-box-left', '.layout-loader-box-left', '.layout-loader-box-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (258, 18, '.layout-loader-box-middle', '.layout-loader-box-middle', '.layout-loader-box-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (259, 18, '.layout-loader-box-right', '.layout-loader-box-right', '.layout-loader-box-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (260, 18, '.layout-list-box-time-box', '.layout-list-box-time-box', '.layout-list-box-time-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (261, 18, '.layout-list-box-layout-box', '.layout-list-box-layout-box', '.layout-list-box-layout-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (262, 18, '.layout-list-box-layout-box-title', '.layout-list-box-layout-box-title', '.layout-list-box-layout-box-title', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (263, 18, '.layout-list-box-layout-box-layout', '.layout-list-box-layout-box-layout', '.layout-list-box-layout-box-layout', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (264, 18, '.layout-list-box-layout-box-layout-selected', '.layout-list-box-layout-box-layout-selected', '.layout-list-box-layout-box-layout-selected', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (265, 18, '.layout-list-box-layout-box-layout a', '.layout-list-box-layout-box-layout a', '.layout-list-box-layout-box-layout a', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (266, 19, 'sub-channel', 'sub-channel', 'sub-channel', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (267, 19, '.sub-channel-header-box', '.sub-channel-header-box', '.sub-channel-header-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (268, 19, '.sub-channel-header', '.sub-channel-header', '.sub-channel-header', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (269, 19, '.sub-channel-header-left', '.sub-channel-header-left', '.sub-channel-header-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (270, 19, '.sub-channel-header-middle', '.sub-channel-header-middle', '.sub-channel-header-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (271, 19, '.sub-channel-header-right', '.sub-channel-header-right', '.sub-channel-header-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (272, 19, '.sub-channel-body', '.sub-channel-body', '.sub-channel-body', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (273, 19, '.sub-channel-body-left', '.sub-channel-body-left', '.sub-channel-body-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (274, 19, '.sub-channel-body-middle', '.sub-channel-body-middle', '.sub-channel-body-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (275, 19, '.sub-channel-body-right', '.sub-channel-body-right', '.sub-channel-body-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (276, 19, '.sub-channel-content', '.sub-channel-content', '.sub-channel-content', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (277, 19, '.sub-channel-content-left', '.sub-channel-content-left', '.sub-channel-content-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (278, 19, '.sub-channel-content-middle', '.sub-channel-content-middle', '.sub-channel-content-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (279, 19, '.sub-channel-content-right', '.sub-channel-content-right', '.sub-channel-content-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (280, 19, '.sub-channel-content-box', '.sub-channel-content-box', '.sub-channel-content-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (281, 19, '.sub-channel-content-box-left', '.sub-channel-content-box-left', '.sub-channel-content-box-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (282, 19, '.sub-channel-content-box-middle', '.sub-channel-content-box-middle', '.sub-channel-content-box-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (283, 19, '.sub-channel-content-box-right', '.sub-channel-content-box-right', '.sub-channel-content-box-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (284, 19, '.channel-content-loader-box', '.channel-content-loader-box', '.channel-content-loader-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (285, 19, '.sub-channel-navigation-left', '.sub-channel-navigation-left', '.sub-channel-navigation-left', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (286, 19, '.sub-channel-navigation-middle', '.sub-channel-navigation-middle', '.sub-channel-navigation-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (287, 19, '.sub-channel-navigation-right', '.sub-channel-navigation-right', '.sub-channel-navigation-right', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (288, 19, '.sub-channel-menus', '.sub-channel-menus', '.sub-channel-menus', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (289, 19, '.sub-channel-menus-top', '.sub-channel-menus-top', '.sub-channel-menus-top', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (290, 19, '.sub-channel-menus-middle', '.sub-channel-menus-middle', '.sub-channel-menus-middle', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (291, 19, '.sub-channel-menus-bottom', '.sub-channel-menus-bottom', '.sub-channel-menus-bottom', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (292, 19, '.channel-menu-item-box', '.channel-menu-item-box', '.channel-menu-item-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (293, 19, '.pscmenu-item-name-box', '.pscmenu-item-name-box', '.pscmenu-item-name-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (294, 19, '.pscmenu-item-name-indent-box', '.pscmenu-item-name-indent-box', '.pscmenu-item-name-indent-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (295, 19, '.pscmenu-item-name-before-icon-box', '.pscmenu-item-name-before-icon-box', '.pscmenu-item-name-before-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (296, 19, '.pscmenu-item-name-text-box', '.pscmenu-item-name-text-box', '.pscmenu-item-name-text-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (297, 19, '.pscmenu-item-name-after-icon-box', '.pscmenu-item-name-after-icon-box', '.pscmenu-item-name-after-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (298, 19, '.pscmenu-item-name-text', '.pscmenu-item-name-text', '.pscmenu-item-name-text', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (299, 19, '.pscmsubmenu-box', '.pscmsubmenu-box', '.pscmsubmenu-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (300, 19, '.pscmsubmenu-item-box', '.pscmsubmenu-item-box', '.pscmsubmenu-item-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (301, 19, '.pscmsubmenu-item-name-box', '.pscmsubmenu-item-name-box', '.pscmsubmenu-item-name-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (302, 19, '.pscmsubmenu-item-name-indent-box', '.pscmsubmenu-item-name-indent-box', '.pscmsubmenu-item-name-indent-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (303, 19, '.pscmsubmenu-item-name-before-icon-box', '.pscmsubmenu-item-name-before-icon-box', '.pscmsubmenu-item-name-before-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (304, 19, '.pscmsubmenu-item-name-text-box', '.pscmsubmenu-item-name-text-box', '.pscmsubmenu-item-name-text-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (305, 19, '.pscmsubmenu-item-name-after-icon-box', '.pscmsubmenu-item-name-after-icon-box', '.pscmsubmenu-item-name-after-icon-box', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (306, 19, '.pscmsubmenu-item-name-text', '.pscmsubmenu-item-name-text', '.pscmsubmenu-item-name-text', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (307, 19, '.pscmsubmenu-item-selected', '.pscmsubmenu-item-selected', '.pscmsubmenu-item-selected', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (308, 19, '.pscmenu-selected', '.pscmenu-selected', '.pscmenu-selected', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (309, 19, '.pscmsubmenu-item-selected table', '.pscmsubmenu-item-selected table', '.pscmsubmenu-item-selected table', '', 999, 1, null);

insert into tb_wsm_css (CSSID, OWNERID, CSSNAME, CSSCODE, CSSDESC, CSSCONTENT, SHOWORDER, ISVALIDATE, OWNERTYPE)
values (310, 19, '.pscmsubmenu-item-selected table td', '.pscmsubmenu-item-selected table td', '.pscmsubmenu-item-selected table td', '', 999, 1, null);

--##tb_wsm_css_item
insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1, 1, 'font-family', 'Microsoft YaHei', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (2, 1, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (3, 1, 'font-size', '26px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (4, 1, 'font-color', '#333333;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (5, 1, 'color', '#333333;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (6, 1, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (7, 1, 'height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (8, 1, 'line-height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (9, 1, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (10, 1, 'border-bottom', '1px solid #e4e4e4', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (11, 1, 'background-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (12, 2, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (13, 2, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (14, 2, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (15, 4, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (16, 4, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (17, 4, 'border-width', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (18, 4, 'border-style', 'solid', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (19, 4, 'background-color', '#f3f3f3;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (20, 4, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (21, 4, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (22, 4, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (23, 4, 'border-color', '#8cc441', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (24, 5, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (25, 5, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (26, 5, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (27, 6, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (28, 6, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (29, 6, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (30, 6, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (31, 6, 'background-color', '#f3f3f3;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (32, 6, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (33, 6, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (34, 6, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (35, 6, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (36, 7, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (37, 7, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (38, 8, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (39, 8, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (40, 9, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (41, 9, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (42, 10, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (43, 10, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (44, 11, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (45, 11, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (46, 12, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (47, 12, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (48, 13, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (49, 14, 'line-height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (50, 14, 'height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (51, 14, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (52, 14, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (53, 14, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (54, 14, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (55, 14, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (56, 14, 'background-color', '#f3f3f3;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (57, 14, 'font-family', 'Microsoft YaHei', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (58, 14, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (59, 14, 'font-size', '26px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (60, 14, 'font-color', '#333333', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (61, 14, 'color', '#333333', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (62, 14, 'letter-spacing', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (63, 14, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (64, 14, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (65, 15, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (66, 15, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (67, 16, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (68, 16, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (69, 16, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (70, 16, 'background-color', '#f0fbe0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (71, 17, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (72, 18, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (73, 18, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (74, 19, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (75, 19, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (76, 20, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (77, 21, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (78, 21, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (79, 22, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (80, 22, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (81, 22, 'border-width', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (82, 22, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (83, 22, 'border-color', '#8cc441', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (84, 22, 'border-style', 'solid', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (85, 22, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (86, 22, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (87, 23, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (88, 24, 'height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (89, 24, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (90, 24, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (91, 24, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (92, 24, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (93, 24, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (94, 24, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (95, 24, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (96, 24, 'font-family', 'Microsoft YaHei', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (97, 24, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (98, 24, 'font-size', '26px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (99, 24, 'font-color', '#333333', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (100, 24, 'color', '#333333', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (101, 24, 'letter-spacing', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (102, 24, 'line-height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (103, 25, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (104, 26, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (105, 26, 'background-color', '#f0fbe0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (106, 26, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (107, 26, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (108, 27, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (109, 28, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (110, 28, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (111, 29, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (112, 29, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (113, 30, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (114, 30, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (115, 30, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (116, 32, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (117, 32, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (118, 32, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (119, 33, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (120, 33, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (121, 34, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (122, 34, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (123, 35, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (124, 35, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (125, 36, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (126, 36, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (127, 37, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (128, 37, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (129, 38, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (130, 38, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (131, 39, 'font-family', 'Microsoft YaHei', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (132, 39, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (133, 39, 'font-size', '26px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (134, 39, 'font-color', '#333333;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (135, 39, 'color', '#333333;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (136, 39, 'background-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (137, 39, 'height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (138, 39, 'line-height', '55px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (139, 39, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (140, 39, 'border-bottom', '1px solid #e4e4e4', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (141, 39, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (142, 40, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (143, 40, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (144, 40, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (145, 40, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (146, 40, 'background-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (147, 40, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (148, 40, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (149, 40, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (150, 40, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (151, 41, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (152, 41, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (153, 42, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (154, 42, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (155, 43, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (156, 46, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (157, 47, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (158, 47, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (159, 47, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (160, 47, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (161, 47, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (162, 47, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (163, 48, 'background-image', 'simpleupload/themes/global/background/ethedunet-logo.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (164, 48, 'background-repeat', 'no-repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (165, 48, 'width', '66px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (166, 48, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (167, 48, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (168, 48, 'height', '66px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (169, 49, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (170, 50, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (171, 50, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (172, 50, 'height', '114px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (173, 51, 'display', 'inline', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (174, 52, 'height', '114px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (175, 52, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (176, 54, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (177, 54, 'height', '114px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (178, 54, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (179, 54, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (180, 54, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (181, 55, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (182, 56, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (183, 56, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (184, 56, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (185, 56, 'color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (186, 56, 'font-family', 'Arial,Simsun', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (187, 56, 'font-size', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (188, 56, 'font-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (189, 56, 'padding-right', '10px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (190, 57, 'font-family', 'Arial,Simsun', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (191, 57, 'font-size', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (192, 57, 'font-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (193, 57, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (194, 57, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (195, 57, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (196, 57, 'color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (197, 58, 'width', '80px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (198, 59, 'height', '30px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (199, 59, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (200, 60, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (201, 60, 'height', '114px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (202, 60, 'position', 'absolute', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (203, 60, 'z-index', '-1', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (204, 60, 'filter', 'progid:DXImageTransform.Microsoft.alpha(opacity=70)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (205, 60, 'left', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (206, 60, 'margin', '0 auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (207, 60, 'background-color', '$[global_color]', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (208, 60, 'opacity', '0.7', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (209, 60, 'top', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (210, 61, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (211, 61, 'height', '114px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (212, 61, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (213, 61, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (214, 61, 'border', '0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (215, 62, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (216, 62, 'vertical-align', 'bottom', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (217, 62, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (218, 62, 'height', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (219, 63, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (220, 63, 'vertical-align', 'bottom', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (221, 63, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (222, 63, 'height', '60px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (223, 67, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (224, 67, 'width', '1080px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (225, 68, 'width', '1080px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (226, 68, 'overflow', 'hidden', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (227, 68, 'background-color', 'transparent', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (228, 68, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (229, 69, 'margin', '0px auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (230, 69, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (231, 69, 'background-repeat', 'no-repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (232, 69, 'background-image', 'simpleupload/themes/global/background/bg.jpg', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (233, 70, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (234, 70, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (235, 70, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (236, 70, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (237, 70, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (238, 70, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (239, 71, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (240, 71, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (241, 72, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (242, 73, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (243, 73, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (244, 73, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (245, 74, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (246, 74, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (247, 74, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (248, 74, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (249, 74, 'margin-top', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (250, 74, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (251, 74, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (252, 78, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (253, 78, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (254, 78, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (255, 78, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (256, 78, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (257, 78, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (258, 78, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (259, 78, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (260, 79, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (261, 79, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (262, 79, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (263, 81, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (264, 84, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (265, 84, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (266, 84, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (267, 84, 'background-color', '#f0fbe0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (268, 85, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (269, 86, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (270, 86, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (271, 87, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (272, 87, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (273, 88, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (274, 88, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (275, 88, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (276, 90, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (277, 90, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (278, 90, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (279, 90, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (280, 90, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (281, 90, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (282, 90, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (283, 90, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (284, 91, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (285, 91, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (286, 92, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (287, 92, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (288, 94, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (289, 94, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (290, 96, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (291, 96, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (292, 97, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (293, 97, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (294, 99, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (295, 99, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (296, 99, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (297, 100, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (298, 100, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (299, 101, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (300, 101, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (301, 102, 'background-color', '#f0fbe0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (302, 102, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (303, 102, 'font-color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (304, 102, 'color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (305, 102, 'text-indent', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (306, 102, 'letter-spacing', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (307, 102, 'white-space', 'nowrap', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (308, 102, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (309, 102, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (310, 102, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (311, 102, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (312, 102, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (313, 102, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (314, 102, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (315, 102, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (316, 102, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (317, 103, 'border-color', '#aeb1aa', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (318, 103, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (319, 103, 'line-height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (320, 103, 'border', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (321, 103, 'border-style', 'dotted', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (322, 103, 'height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (323, 104, 'line-height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (324, 104, 'height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (325, 104, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (326, 107, 'width', '100px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (327, 108, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (328, 108, 'color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (329, 108, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (330, 108, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (331, 108, 'font-color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (332, 109, 'width', '18px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (333, 109, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (334, 109, 'background-image', 'themes/website/green/images/plugins/news/news-index-info-logo.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (335, 109, 'background-repeat', 'no-repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (336, 109, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (337, 109, 'background-position', 'center center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (338, 110, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (339, 112, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (340, 112, 'min-height', '300px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (341, 112, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (342, 112, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (343, 112, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (344, 112, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (345, 113, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (346, 114, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (347, 114, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (348, 114, 'font-color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (349, 114, 'color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (350, 114, 'text-indent', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (351, 114, 'letter-spacing', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (352, 114, 'white-space', 'nowrap', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (353, 114, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (354, 114, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (355, 114, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (356, 114, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (357, 114, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (358, 114, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (359, 114, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (360, 114, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (361, 115, 'line-height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (362, 115, 'border', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (363, 115, 'height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (364, 115, 'border-color', '#aeb1aa', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (365, 115, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (366, 115, 'border-style', 'dotted', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (367, 116, 'height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (368, 116, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (369, 116, 'line-height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (370, 117, 'background-repeat', 'no-repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (371, 117, 'background-position', 'center center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (372, 117, 'background-image', 'themes/website/green/images/plugins/news/news-index-info-logo.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (373, 117, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (374, 117, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (375, 117, 'width', '18px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (376, 120, 'width', '100px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (377, 121, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (378, 121, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (379, 121, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (380, 121, 'color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (381, 121, 'font-color', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (382, 122, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (383, 122, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (384, 122, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (385, 122, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (386, 122, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (387, 122, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (388, 122, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (389, 122, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (390, 123, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (391, 123, 'background-color', ' #bedf90', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (392, 123, 'height', '30px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (393, 124, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (394, 124, 'height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (395, 124, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (396, 124, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (397, 124, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (398, 124, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (399, 124, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (400, 125, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (401, 126, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (402, 126, 'font-weight', 'bold', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (403, 126, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (404, 126, 'font-color', '#5b8542', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (405, 126, 'color', '#5b8542', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (406, 126, 'letter-spacing', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (407, 126, 'margin-top', '10px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (408, 126, 'height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (409, 126, 'line-height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (410, 126, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (411, 126, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (412, 126, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (413, 126, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (414, 127, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (415, 127, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (416, 127, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (417, 127, 'height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (418, 127, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (419, 127, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (420, 127, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (421, 127, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (422, 128, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (423, 128, 'font-weight', 'bold', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (424, 128, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (425, 128, 'font-color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (426, 128, 'color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (427, 128, 'background-color', '#5b8542', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (428, 128, 'width', '100px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (429, 128, 'height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (430, 128, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (431, 128, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (432, 128, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (433, 128, 'letter-spacing', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (434, 129, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (435, 129, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (436, 129, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (437, 129, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (438, 129, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (439, 129, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (440, 129, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (441, 129, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (442, 129, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (443, 130, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (444, 131, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (445, 131, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (446, 131, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (447, 131, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (448, 131, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (449, 131, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (450, 131, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (451, 132, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (452, 132, 'height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (453, 132, 'line-height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (454, 132, 'display', 'inline', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (455, 132, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (456, 132, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (457, 132, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (458, 132, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (459, 132, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (460, 132, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (461, 133, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (462, 133, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (463, 133, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (464, 133, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (465, 133, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (466, 133, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (467, 133, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (468, 134, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (469, 134, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (470, 134, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (471, 135, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (472, 136, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (473, 137, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (474, 137, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (475, 137, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (476, 138, 'letter-spacing', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (477, 138, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (478, 138, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (479, 138, 'color', '#5b8542', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (480, 138, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (481, 138, 'font-color', '#5b8542', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (482, 138, 'font-weight', 'bold', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (483, 139, 'font-family', '微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (484, 139, 'font-weight', 'bold', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (485, 139, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (486, 139, 'font-color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (487, 139, 'color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (488, 139, 'background-color', '#cccccc', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (489, 139, 'width', '100px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (490, 139, 'height', '25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (491, 139, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (492, 139, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (493, 139, 'letter-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (494, 140, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (495, 140, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (496, 141, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (497, 142, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (498, 143, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (499, 143, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (500, 143, 'float', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (501, 143, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (502, 143, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (503, 143, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (504, 143, 'overflow', 'hidden', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (505, 143, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (506, 143, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (507, 145, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (508, 146, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (509, 150, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (510, 150, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (511, 150, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (512, 150, 'background-color', '#f0fbe0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (513, 151, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (514, 152, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (515, 152, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (516, 154, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (517, 154, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (518, 156, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (519, 156, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (520, 156, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (521, 157, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (522, 157, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (523, 158, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (524, 158, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (525, 160, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (526, 160, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (527, 161, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (528, 162, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (529, 162, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (530, 163, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (531, 163, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (532, 164, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (533, 164, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (534, 164, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (535, 166, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (536, 166, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (537, 167, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (538, 167, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (539, 53, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (540, 53, 'height', '71px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (541, 53, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (542, 53, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (543, 53, 'background-repeat', 'no-repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (544, 53, 'background-position', 'middle middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (545, 144, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (546, 144, 'height', '2px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (547, 144, 'display', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (548, 153, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (549, 153, 'height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (550, 153, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (551, 153, 'background-color', '#31a3e8', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (552, 98, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (553, 98, 'height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (554, 98, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (555, 98, 'background-color', '#d8ebf7', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (556, 82, 'font-family', 'Arial,Simsun', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (557, 82, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (558, 82, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (559, 82, 'font-color', '#0388d9', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (560, 82, 'color', '#0388d9', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (561, 82, 'letter-spacing', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (562, 82, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (563, 82, 'height', '30px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (564, 82, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (565, 82, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (566, 82, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (567, 82, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (568, 82, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (569, 82, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (570, 95, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (571, 95, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (572, 95, 'border-width', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (573, 95, 'border-style', 'solid', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (574, 95, 'border-color', '#bddff4', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (575, 95, 'margin', '10px 0px 0px 0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (576, 95, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (577, 95, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (578, 148, 'font-family', 'Arial,Simsun', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (579, 148, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (580, 148, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (581, 148, 'font-color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (582, 148, 'color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (583, 148, 'letter-spacing', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (584, 148, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (585, 148, 'height', '32px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (586, 148, 'line-height', '32px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (587, 148, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (588, 148, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (589, 148, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (590, 148, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (591, 148, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (592, 148, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (593, 148, 'background-color', '#31a3e8', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (594, 111, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (595, 111, 'background-color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (596, 170, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (597, 170, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (598, 170, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (599, 170, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (600, 170, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (601, 170, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (602, 170, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (603, 170, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (604, 170, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (605, 170, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (606, 170, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (607, 170, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (608, 170, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (609, 170, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (610, 170, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (611, 170, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (612, 170, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (613, 170, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (614, 170, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (615, 170, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (616, 170, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (617, 170, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (618, 170, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (619, 170, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (620, 170, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (621, 170, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (622, 170, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (623, 170, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (624, 170, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (625, 170, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (626, 170, 'background-position', '-53px -166px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (627, 170, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (628, 170, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (629, 170, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (630, 170, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (631, 170, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (632, 171, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (633, 171, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (634, 171, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (635, 171, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (636, 171, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (637, 171, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (638, 171, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (639, 171, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (640, 171, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (641, 171, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (642, 171, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (643, 171, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (644, 171, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (645, 171, 'position', 'static', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (646, 171, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (647, 171, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (648, 171, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (649, 171, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (650, 171, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (651, 171, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (652, 171, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (653, 171, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (654, 171, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (655, 171, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (656, 171, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (657, 171, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (658, 171, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (659, 171, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (660, 171, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (661, 171, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (662, 171, 'background-position', '-78px -166px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (663, 171, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (664, 171, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (665, 171, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (666, 171, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (667, 171, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (668, 178, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (669, 178, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (670, 178, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (671, 178, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (672, 178, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (673, 178, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (674, 178, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (675, 178, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (676, 178, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (677, 178, 'display', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (678, 178, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (679, 178, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (680, 178, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (681, 178, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (682, 178, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (683, 178, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (684, 178, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (685, 178, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (686, 178, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (687, 178, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (688, 178, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (689, 178, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (690, 178, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (691, 178, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (692, 178, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (693, 178, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (694, 178, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (695, 178, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (696, 178, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (697, 178, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (698, 178, 'background-position', '-29px -166px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (699, 178, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (700, 178, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (701, 178, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (702, 178, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (703, 178, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (704, 169, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (705, 169, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (706, 169, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (707, 169, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (708, 169, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (709, 169, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (710, 169, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (711, 169, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (712, 169, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (713, 169, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (714, 169, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (715, 169, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (716, 169, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (717, 169, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (718, 169, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (719, 169, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (720, 169, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (721, 169, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (722, 169, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (723, 169, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (724, 169, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (725, 169, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (726, 169, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (727, 169, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (728, 169, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (729, 169, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (730, 169, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (731, 169, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (732, 169, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (733, 169, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (734, 169, 'background-position', '-29px -166px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (735, 169, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (736, 169, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (737, 169, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (738, 169, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (739, 169, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (740, 179, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (741, 179, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (742, 179, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (743, 179, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (744, 179, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (745, 179, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (746, 179, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (747, 179, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (748, 179, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (749, 179, 'display', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (750, 179, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (751, 179, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (752, 179, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (753, 179, 'position', 'static', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (754, 179, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (755, 179, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (756, 179, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (757, 179, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (758, 179, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (759, 179, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (760, 179, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (761, 179, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (762, 179, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (763, 179, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (764, 179, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (765, 179, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (766, 179, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (767, 179, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (768, 179, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (769, 179, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (770, 179, 'background-position', '-6px -166px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (771, 179, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (772, 179, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (773, 179, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (774, 179, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (775, 179, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (776, 168, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (777, 168, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (778, 168, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (779, 168, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (780, 168, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (781, 168, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (782, 168, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (783, 168, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (784, 168, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (785, 168, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (786, 168, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (787, 168, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (788, 168, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (789, 168, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (790, 168, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (791, 168, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (792, 168, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (793, 168, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (794, 168, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (795, 168, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (796, 168, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (797, 168, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (798, 168, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (799, 168, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (800, 168, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (801, 168, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (802, 168, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (803, 168, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (804, 168, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (805, 168, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (806, 168, 'background-position', '-6px -166px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (807, 168, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (808, 168, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (809, 168, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (810, 168, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (811, 168, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (812, 174, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (813, 174, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (814, 174, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (815, 174, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (816, 174, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (817, 174, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (818, 174, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (819, 174, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (820, 174, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (821, 174, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (822, 174, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (823, 174, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (824, 174, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (825, 174, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (826, 174, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (827, 174, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (828, 174, 'clear', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (829, 174, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (830, 174, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (831, 174, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (832, 174, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (833, 174, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (834, 174, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (835, 174, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (836, 174, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (837, 174, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (838, 174, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (839, 174, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (840, 174, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (841, 174, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (842, 174, 'background-position', '-53px -146px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (843, 174, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (844, 174, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (845, 174, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (846, 174, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (847, 174, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (848, 175, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (849, 175, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (850, 175, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (851, 175, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (852, 175, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (853, 175, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (854, 175, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (855, 175, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (856, 175, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (857, 175, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (858, 175, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (859, 175, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (860, 175, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (861, 175, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (862, 175, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (863, 175, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (864, 175, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (865, 175, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (866, 175, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (867, 175, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (868, 175, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (869, 175, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (870, 175, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (871, 175, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (872, 175, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (873, 175, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (874, 175, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (875, 175, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (876, 175, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (877, 175, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (878, 175, 'background-position', '-78px -146px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (879, 175, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (880, 175, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (881, 175, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (882, 175, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (883, 175, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (884, 172, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (885, 172, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (886, 172, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (887, 172, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (888, 172, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (889, 172, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (890, 172, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (891, 172, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (892, 172, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (893, 172, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (894, 172, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (895, 172, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (896, 172, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (897, 172, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (898, 172, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (899, 172, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (900, 172, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (901, 172, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (902, 172, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (903, 172, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (904, 172, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (905, 172, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (906, 172, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (907, 172, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (908, 172, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (909, 172, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (910, 172, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (911, 172, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (912, 172, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (913, 172, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (914, 172, 'background-position', '-29px -146px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (915, 172, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (916, 172, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (917, 172, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (918, 172, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (919, 172, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (920, 176, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (921, 176, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (922, 176, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (923, 176, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (924, 176, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (925, 176, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (926, 176, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (927, 176, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (928, 176, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (929, 176, 'display', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (930, 176, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (931, 176, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (932, 176, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (933, 176, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (934, 176, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (935, 176, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (936, 176, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (937, 176, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (938, 176, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (939, 176, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (940, 176, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (941, 176, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (942, 176, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (943, 176, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (944, 176, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (945, 176, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (946, 176, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (947, 176, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (948, 176, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (949, 176, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (950, 176, 'background-position', '-29px -146px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (951, 176, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (952, 176, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (953, 176, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (954, 176, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (955, 176, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (956, 173, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (957, 173, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (958, 173, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (959, 173, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (960, 173, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (961, 173, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (962, 173, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (963, 173, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (964, 173, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (965, 173, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (966, 173, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (967, 173, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (968, 173, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (969, 173, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (970, 173, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (971, 173, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (972, 173, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (973, 173, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (974, 173, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (975, 173, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (976, 173, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (977, 173, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (978, 173, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (979, 173, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (980, 173, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (981, 173, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (982, 173, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (983, 173, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (984, 173, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (985, 173, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (986, 173, 'background-position', '-6px -146px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (987, 173, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (988, 173, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (989, 173, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (990, 173, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (991, 173, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (992, 177, 'font-weight', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (993, 177, 'font-style', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (994, 177, 'font-variant', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (995, 177, 'white-space', 'normal', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (996, 177, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (997, 177, 'text-transform', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (998, 177, 'direction', 'ltr', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (999, 177, 'width', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1000, 177, 'height', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1001, 177, 'display', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1002, 177, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1003, 177, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1004, 177, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1005, 177, 'position', 'relative', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1006, 177, 'cursor', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1007, 177, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1008, 177, 'clear', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1009, 177, 'border-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1010, 177, 'border-top-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1011, 177, 'border-right-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1012, 177, 'border-bottom-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1013, 177, 'border-left-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1014, 177, 'outline-style', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1015, 177, 'padding-left', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1016, 177, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1017, 177, 'border-collapse', 'separate', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1018, 177, 'list-style-type', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1019, 177, 'list-style-position', 'inside', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1020, 177, 'background-image', 'simpleupload/themes/global/background/icon.png', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1021, 177, 'background-repeat', 'repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1022, 177, 'background-position', '-6px -146px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1023, 177, 'overflow', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1024, 177, 'overflow-x', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1025, 177, 'overflow-y', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1026, 177, 'background-attachment', 'scroll', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1027, 177, '@media', 'all', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1028, 159, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1029, 159, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1030, 159, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1031, 159, 'background-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1032, 93, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1033, 93, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1034, 93, 'background-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1035, 147, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1036, 147, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1037, 147, 'margin', '10px 0px 0px 0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1038, 147, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1039, 147, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1040, 180, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1041, 180, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1042, 181, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1043, 181, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1044, 181, 'padding-top', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1045, 182, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1046, 182, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1047, 182, ' color', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1048, 182, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1049, 183, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1050, 183, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1051, 184, 'width', '120px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1052, 184, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1053, 186, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1054, 186, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1055, 186, 'margin-bottom', ' 20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1056, 187, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1057, 188, 'width', '1080px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1058, 189, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1059, 190, 'background', ' #3c99d2', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1060, 191, 'background', ' #3c99d2', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1061, 192, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1062, 192, 'padding', ' 25px 0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1063, 193, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1064, 193, 'border-bottom', ' 1px solid #c8dbe9', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1065, 193, 'padding-top', ' 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1066, 193, 'padding-bottom', ' 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1067, 193, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1068, 194, 'width', '160px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1069, 194, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1070, 194, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1071, 195, 'margin-top', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1072, 196, 'width', '160px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1073, 196, 'margin-top', '5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1074, 196, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1075, 196, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1076, 196, 'color', ' #6d6d6d', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1077, 197, 'color', ' #0072cf', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1078, 197, 'margin-top', ' 10px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1079, 197, 'font-weight', ' bold', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1080, 197, 'text-decoration', ' none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1081, 198, 'width', '200px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1082, 198, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1083, 198, ' height', ' 60px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1084, 199, 'width', '200px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1085, 199, ' height', ' 45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1086, 199, 'border-radius', ' 3px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1087, 199, 'margin-bottom', ' 5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1088, 199, 'line-height', ' 37px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1089, 199, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1090, 199, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1091, 200, 'background', ' #c1d8ec', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1092, 200, 'height', ' 37px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1093, 200, 'width', ' 160px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1094, 200, 'border-radius', ' 3px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1095, 200, 'margin-bottom', ' 5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1096, 200, 'padding-left', ' 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1097, 200, 'color', '#666666', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1098, 200, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1099, 200, 'line-height', ' 37px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1100, 200, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1101, 200, ' text-decoration', ' none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1102, 201, 'background', ' #c1d8ec', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1103, 201, 'height', ' 37px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1104, 201, 'width', ' 160px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1105, 201, 'border-radius', ' 3px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1106, 201, 'margin-bottom', ' 5px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1107, 201, 'color', '#666666', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1108, 201, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1109, 201, 'line-height', ' 37px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1110, 201, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1111, 201, ' text-decoration', ' none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1112, 202, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1113, 202, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1114, 202, ' color', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1115, 202, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1116, 185, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1117, 185, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1118, 185, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1119, 185, 'margin-top', ' 20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1120, 185, 'background-color', '#3c99d2', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1121, 203, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1122, 45, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1123, 45, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1124, 45, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1125, 44, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1126, 44, 'height', '44px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1127, 44, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1128, 44, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1129, 44, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1130, 44, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1131, 44, 'background-color', '#1261b0;', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1132, 209, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1133, 209, 'height', '40px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1134, 209, 'border', '0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1135, 209, '	border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1136, 209, ' 	border-spacing', '0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1137, 209, ' text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1138, 209, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1139, 209, 'bgcolor', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1140, 209, 'background', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1141, 209, 'background-color', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1142, 210, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1143, 210, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1144, 210, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1145, 210, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1146, 211, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1147, 211, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1148, 211, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1149, 211, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1150, 211, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1151, 211, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1152, 211, 'bgcolor', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1153, 211, 'background', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1154, 211, 'background-color', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1155, 211, 'color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1156, 211, 'font-size', ' 16px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1157, 211, 'cursor', 'pointer', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1158, 212, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1159, 212, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1160, 212, 'border-right', ' 1px solid #1373d3', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1161, 212, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1162, 212, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1163, 212, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1164, 212, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1165, 212, 'bgcolor', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1166, 212, 'background', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1167, 212, 'background-color', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1168, 212, 'color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1169, 212, 'font-size', ' 16px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1170, 212, 'cursor', 'pointer', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1171, 213, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1172, 213, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1173, 213, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1174, 213, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1175, 213, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1176, 213, 'bgcolor', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1177, 213, 'background', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1178, 213, 'background-color', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1179, 214, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1180, 214, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1181, 214, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1182, 214, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1183, 215, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1184, 216, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1185, 216, 'float', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1186, 216, 'width', 'initial', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1187, 217, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1188, 218, 'color', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1189, 218, 'font-size', ' 16px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1190, 218, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1191, 218, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1192, 218, 'float', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1193, 218, 'width', 'initial', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1194, 219, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1195, 219, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1196, 219, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1197, 219, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1198, 219, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1199, 219, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1200, 219, 'bgcolor', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1201, 219, 'background', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1202, 219, 'background-color', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1203, 219, 'cursor', 'pointer', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1204, 221, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1205, 221, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1206, 221, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1207, 221, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1208, 221, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1209, 222, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1210, 222, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1211, 222, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1212, 222, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1213, 222, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1214, 223, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1215, 223, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1216, 223, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1217, 223, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1218, 223, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1219, 224, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1220, 224, 'float', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1221, 224, 'width', 'initial', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1222, 225, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1223, 225, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1224, 225, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1225, 225, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1226, 225, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1227, 226, 'color', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1228, 226, 'font-size', ' 16px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1229, 226, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1230, 226, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1231, 226, 'float', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1232, 226, 'width', 'initial', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1233, 227, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1234, 227, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1235, 227, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1236, 227, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1237, 227, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1238, 227, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1239, 227, 'bgcolor', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1240, 227, 'background', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1241, 227, 'background-color', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1242, 227, 'cursor', 'pointer', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1243, 228, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1244, 228, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1245, 229, 'width', '366px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1246, 229, 'vertical-valign', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1247, 230, 'width', '160px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1248, 231, 'width', '330px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1249, 231, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1250, 231, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1251, 232, 'width', '366px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1252, 233, 'width', '66px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1253, 233, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1254, 234, 'width', '130px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1255, 234, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1256, 234, 'padding-left', '15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1257, 235, 'height', '48px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1258, 235, 'font-size', ' 24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1259, 235, 'color', ' #046699', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1260, 235, ' font-family', ' arial,simsun', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1261, 235, 'line-height', ' 25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1262, 235, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1263, 236, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1264, 237, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1265, 237, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1266, 237, 'color', '#046699', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1267, 237, ' font-family', ' arial,simsun', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1268, 237, 'line-height', ' 25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1269, 238, 'border-left', ' 1px solid #0c75ad', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1270, 238, 'font-size', ' 24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1271, 238, 'height', ' 24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1272, 238, 'width', '170px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1273, 238, 'line-height', ' 24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1274, 238, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1275, 238, 'padding-left', '15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1276, 238, 'font-size', ' 24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1277, 238, 'font-family', ' arial,simsun', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1278, 238, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1279, 238, 'color', ' #01619e', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1280, 239, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1281, 239, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1282, 239, 'color', 'white', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1283, 239, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1284, 240, 'height', ' 28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1285, 240, 'line-height', ' 28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1286, 240, 'border', ' 2px solid #0296f0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1287, 240, 'width', ' 270px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1288, 240, 'border-radius', ' 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1289, 240, 'outline', ' none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1290, 240, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1291, 240, 'background', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1292, 241, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1293, 243, 'color', 'white', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1294, 243, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1295, 244, 'background', 'rgb(0, 114, 207)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1296, 244, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1297, 244, 'height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1298, 245, 'width', '50%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1299, 245, 'line-height', '38px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1300, 245, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1301, 246, 'width', '100px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1302, 246, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1303, 247, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1304, 247, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1305, 247, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1306, 247, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1307, 247, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1308, 247, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1309, 247, 'color', '#ffffff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1310, 247, 'font-size', '14px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1311, 247, 'font-family', ' 微软雅黑', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1312, 248, 'width', '120px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1313, 248, 'line-height', '24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1314, 248, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1315, 248, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1316, 249, 'width', '3px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1317, 249, 'line-height', '24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1318, 249, 'text-align', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1319, 249, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1320, 250, 'line-height', '24px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1321, 250, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1322, 250, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1323, 251, 'width', '1060px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1324, 251, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1325, 251, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1326, 251, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1327, 251, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1328, 251, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1329, 251, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1330, 252, 'background', 'rgb(78, 174, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1331, 252, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1332, 252, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1333, 253, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1334, 254, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1335, 254, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1336, 255, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1337, 256, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1338, 256, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1339, 257, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1340, 258, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1341, 258, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1342, 258, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1343, 259, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1344, 260, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1345, 260, 'color', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1346, 260, 'font-size', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1347, 260, 'padding-left', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1348, 260, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1349, 260, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1350, 260, 'line-height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1351, 261, 'float', 'right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1352, 261, 'display', 'inline', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1353, 261, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1354, 261, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1355, 261, 'line-height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1356, 262, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1357, 262, 'color', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1358, 262, 'font-size', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1359, 262, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1360, 262, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1361, 262, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1362, 262, 'line-height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1363, 263, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1364, 263, 'color', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1365, 263, 'font-size', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1366, 263, 'padding', '0px 8px 0px 8px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1367, 263, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1368, 263, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1369, 263, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1370, 263, 'line-height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1371, 264, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1372, 264, 'color', 'red', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1373, 264, 'font-weight', 'blod', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1374, 264, 'background', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1375, 264, 'font-size', '12px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1376, 264, 'padding', '0px 8px 0px 8px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1377, 264, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1378, 264, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1379, 264, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1380, 264, 'line-height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1381, 265, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1382, 265, 'color', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1383, 165, 'text-decoration', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1384, 165, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1385, 165, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1386, 165, 'visibility', 'visible', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1387, 165, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1388, 165, 'border-width', '1px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1389, 165, 'border-style', 'solid', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1390, 165, 'border-color', '#31a3e8', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1391, 165, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1392, 165, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1393, 165, 'caption-side', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1394, 165, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1395, 165, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1396, 165, 'background-color', 'rgb(255, 255, 255)', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1397, 266, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1398, 266, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1399, 266, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1400, 266, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1401, 266, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1402, 266, 'background', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1403, 266, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1404, 266, ' border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1405, 266, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1406, 267, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1407, 267, 'height', '220px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1408, 267, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1409, 267, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1410, 267, ' border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1411, 267, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1412, 268, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1413, 268, 'height', '220px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1414, 268, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1415, 268, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1416, 268, ' border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1417, 269, 'width', '0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1418, 269, 'height', '220px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1419, 271, 'width', '0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1420, 271, 'height', '220px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1421, 272, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1422, 272, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1423, 272, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1424, 272, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1425, 272, ' border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1426, 273, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1427, 274, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1428, 274, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1429, 274, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1430, 275, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1431, 276, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1432, 276, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1433, 276, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1434, 276, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1435, 276, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1436, 276, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1437, 276, ' border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1438, 277, 'width', '180px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1439, 277, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1440, 277, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1441, 277, 'margin-right', '18px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1442, 278, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1443, 278, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1444, 278, ' border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1445, 279, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1446, 279, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1447, 279, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1448, 279, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1449, 280, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1450, 280, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1451, 280, 'padding', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1452, 280, 'margin', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1453, 280, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1454, 280, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1455, 280, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1456, 281, 'width', '18px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1457, 281, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1458, 282, 'width', '880px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1459, 282, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1460, 283, 'width', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1461, 283, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1462, 284, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1463, 284, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1464, 284, 'float', ' right', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1465, 284, 'border', ' 1px solid #c4e0f1', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1466, 284, 'border-radius', ' 3px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1467, 284, 'over-flow', 'hidden', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1468, 285, 'width', '0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1469, 285, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1470, 286, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1471, 286, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1472, 286, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1473, 287, 'width', '0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1474, 287, 'height', '28px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1475, 288, 'width', '180px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1476, 288, 'height', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1477, 288, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1478, 288, ' border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1479, 288, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1480, 289, 'width', '180px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1481, 289, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1482, 290, 'width', '180px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1483, 290, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1484, 290, 'vertical-align', 'top', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1485, 291, 'width', '180px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1486, 291, 'height', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1487, 292, 'position', 'absolute', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1488, 292, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1489, 292, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1490, 292, 'height', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1491, 292, 'background', '#787878', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1492, 293, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1493, 293, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1494, 293, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1495, 293, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1496, 293, 'border-bottom', ' 1px solid #c4e0f1', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1497, 293, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1498, 293, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1499, 294, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1500, 294, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1501, 294, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1502, 294, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1503, 295, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1504, 296, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1505, 296, 'float', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1506, 296, 'width', 'initial', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1507, 297, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1508, 298, 'color', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1509, 298, 'font-size', ' 16px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1510, 298, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1511, 298, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1512, 298, 'float', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1513, 298, 'width', 'initial', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1514, 299, 'display', 'block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1515, 299, 'width', '180px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1516, 299, 'height', ' auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1517, 299, 'line-height', ' 60px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1518, 299, 'float', ' left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1519, 299, 'border', ' 1px solid #c4e0f1', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1520, 299, 'border-radius', ' 3px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1521, 299, 'background', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1522, 299, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1523, 299, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1524, 300, 'height', ' 60px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1525, 300, 'line-height', ' 60px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1526, 300, 'border-bottom', ' 1px solid #e4e4e4', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1527, 300, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1528, 300, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1529, 301, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1530, 301, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1531, 301, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1532, 301, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1533, 301, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1534, 302, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1535, 302, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1536, 302, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1537, 302, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1538, 302, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1539, 303, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1540, 303, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1541, 303, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1542, 303, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1543, 303, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1544, 304, 'display', ' block', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1545, 304, 'padding-left', ' 10px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1546, 304, 'color', ' #333333', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1547, 304, 'font', ' 12px/1.5 arial,simsun,\588b\4f53', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1548, 305, 'width', '20px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1549, 305, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1550, 305, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1551, 305, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1552, 305, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1553, 306, 'border', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1554, 306, '	border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1555, 306, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1556, 307, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1557, 307, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1558, 307, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1559, 307, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1560, 307, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1561, 307, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1562, 307, 'bgcolor', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1563, 307, 'background', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1564, 307, 'background-color', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1565, 307, 'cursor', 'pointer', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1566, 308, 'float', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1567, 308, 'padding', ' 0 15px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1568, 308, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1569, 308, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1570, 308, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1571, 308, 'text-vertical', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1572, 308, 'bgcolor', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1573, 308, 'background', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1574, 308, 'background-color', '#1261cb', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1575, 308, 'cursor', 'pointer', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1576, 309, 'background', ' #3dacef', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1577, 309, 'height', ' 34px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1578, 309, 'line-height', ' 34px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1579, 309, ' border-radius', ' 3px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1580, 309, 'color', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1581, 309, 'font-color', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1582, 309, 'border-collapse', 'collapse', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1583, 309, 'border-spacing', '0px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1584, 310, 'color', ' #fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1585, 310, 'font-color', '#fff', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1586, 270, 'width', '100%', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1587, 270, 'height', '220px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1588, 270, 'background-image', 'simpleupload/themes/global/background/s_banner.jpg', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1589, 220, 'width', 'auto', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1590, 220, 'height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1591, 220, 'line-height', '45px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1592, 220, 'display', 'none', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1593, 220, 'text-align', 'center', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1594, 220, 'position', 'absolute', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1595, 220, 'background-color', '#1261b0', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1596, 242, 'width', ' 16px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1597, 242, 'height', ' 16px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1598, 242, 'clear', ' 25px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1599, 242, 'padding-bottom', ' -2px', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1600, 242, 'background', 'url(simpleupload/themes/global/background/icon.png ) -2px -32px no-repeat', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1601, 149, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1602, 149, 'vertical-align', 'middle', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1603, 83, 'text-align', 'left', '', 1);

insert into tb_wsm_css_item (ITEMID, CSSID, ITEMCODE, ITEMVALUE, ITEMVAR, ISVALIDATE)
values (1604, 83, 'vertical-align', 'middle', '', 1);


-------------------------- 3）信息模型表初始化数据，包括信息类型、信息栏目对应表、新闻信息、引用信息、片断信息、链接信息、图片信息、服务信息、SQL查询信息、及相互关系------------------------------

--##tb_wsm_info_news
insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (3, 'Notice on the application of funds for the selection of the best ...', '', 'Notice on the application of funds for the selection of the best ...Notice on the application of funds for the selection of the best ...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (1, 'Notice on doing a good job in the fourth phase of the "333 project"...', '', 'Notice on doing a good job in the fourth phase of the "333 project"...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (35, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (36, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (4, 'Notice on doing a good job in the fourth phase of the "333 project" ...', '', 'Notice on doing a good job in the fourth phase of the "333 project" ...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (5, 'University of Newcastle, Australia, the former vice president to visit ...', '', 'University of Newcastle, Australia, the former vice president to visit ...University of Newcastle, Australia, the former vice president to visit ...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (10, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (12, 'Notice on doing a good job in the fourth phase of the "333 project"...', '', 'Notice on doing a good job in the fourth phase of the "333 project"...Notice on doing a good job in the fourth phase of the "333 project"...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (37, 'Notice on the application of funds for the selection of the best ...', '', 'Notice on the application of funds for the selection of the best ...', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (38, 'Notice on doing a good job in the fourth phase of the "333 project" ...', '', 'Notice on doing a good job in the fourth phase of the "333 project" ...', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (39, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (40, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (41, 'Notice on the application of funds for the selection of the best ...', '', 'Notice on the application of funds for the selection of the best ...', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (42, 'Notice on doing a good job in the fourth phase of the "333 project" ...', '', 'Notice on doing a good job in the fourth phase of the "333 project" ...Notice on doing a good job in the fourth phase of the "333 project" ...', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (43, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-14', '2', '2016-06-14', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (9, 'Urgent - on the report submitted to the University of Jiangsu ...', '', 'Urgent - on the report submitted to the University of Jiangsu ...Urgent - on the report submitted to the University of Jiangsu ...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (11, 'Notice on the application of funds for the selection of the best ...', '', 'Notice on the application of funds for the selection of the best ...Notice on the application of funds for the selection of the best ...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (2, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (32, '2015 second half Title Computer Examination by the personnel list', '', '2015 second half Title Computer Examination by the personnel list2015 second half Title Computer Examination by the personnel list', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (33, 'Notice on the application of funds for the selection of the best ...', '', 'Notice on the application of funds for the selection of the best ...Notice on the application of funds for the selection of the best ...Notice on the application of funds for the selection of the best ...', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (34, 'Notice on doing a good job in the fourth phase of the "333 project"...', '', 'Notice on doing a good job in the fourth phase of the "333 project"...', '', 'no content,please editor your content', '2', '2016-06-14', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (6, 'The first five working conference of Library and Information Work ...', '', 'The first five working conference of Library and Information Work ...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (7, 'Notice on the application of funds for the selection of the best ...', '', 'Notice on the application of funds for the selection of the best ...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

insert into tb_wsm_info_news (INFOID, TITLE, SUBTILE, INTRODUCTION, KEYWORD, CONTENTS, DRAFTOR, CREATETIME, MODIFIER, MODIFYTIME, APPROVER, APPROVETIME, ISVALIDATE, INDEXPIC)
values (8, 'Notice on doing a good job in the fourth phase of the "333 project"...', '', 'Notice on doing a good job in the fourth phase of the "333 project"...Notice on doing a good job in the fourth phase of the "333 project"...', '', 'no content,please editor your content', '2', '2016-06-08', '', '', '', '', '', '');

--##tb_wsm_info_ref
insert into tb_wsm_info_ref (INFOID, REFLINK, REFDESC, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, ISVALIDATE, REFNAME)
values (13, '../specify/access_record.jsp', '', '2', '2016-06-08 22:07:12', '2', '2016-06-08 22:07:12', 1, 'My access record');

--##tb_wsm_info_web
insert into tb_wsm_info_web (INFOID, WEBNAME, WEBCONTENT, WEBDESC, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, ISVALIDATE)
values (31, 'My mail', '<body style="line-height:30px;font-family:宋体;font-size:14px;"><p><iframe allowtransparency="true" frameborder="0" height="175" hspace="0" marginheight="0" marginwidth="0" onload="" scrolling="no" src="../specify/my_email.jsp" style="height:175px;width:100%;" vspace="0" width="100"></iframe></p></body></html>', '', '2', '2016-06-14 00:52:25', '2', '2016-06-14 00:52:25', 1);

insert into tb_wsm_info_web (INFOID, WEBNAME, WEBCONTENT, WEBDESC, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, ISVALIDATE)
values (14, 'I do business', '<body style="line-height:30px;font-family:宋体;font-size:14px;"><p><iframe allowtransparency="true" frameborder="0" height="265" hspace="0" marginheight="0" marginwidth="0" onload="" scrolling="no" src="../specify/i_do_business.jsp" style="height:265px;width:100%;" vspace="0" width="100"></iframe></p></body>', '', '2', '2016-06-13 16:27:25', '2', '2016-06-13 16:27:25', 1);

insert into tb_wsm_info_web (INFOID, WEBNAME, WEBCONTENT, WEBDESC, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, ISVALIDATE)
values (15, 'To remind', '<body style="line-height:30px;font-family:宋体;font-size:14px;">	<p><iframe allowtransparency="true" frameborder="0" height="265" hspace="0" marginheight="0" marginwidth="0" onload="" scrolling="no" src="../specify/to_remain.jsp" style="height:265px;width:100%;" vspace="0" width="100"></iframe></p></body>', '', '2', '2016-06-13 16:47:07', '2', '2016-06-13 16:47:07', 1);

--##tb_wsm_link_type
insert into tb_wsm_link_type (LINKTYPEID, SYSID, LINKTYPENAME, LINKTYPEDESC, ISVALIDATE)
values (1, 2, 'Common Function', 'Common Function', 1);

insert into tb_wsm_link_type (LINKTYPEID, SYSID, LINKTYPENAME, LINKTYPEDESC, ISVALIDATE)
values (2, 2, 'Other business functions', 'Other business functions', 1);

--##tb_wsm_link_group
insert into tb_wsm_link_group (LINKGROUPID, LINKTYPEID, SYSID, LINKGROUPNAME, LINKGROUPDESC, SHOWGROUPNAME, SHOWORDER, ISVALIDATE)
values (1, 1, 2, 'Common Function Group', 'Common Function Group', 1, 1, 1);

insert into tb_wsm_link_group (LINKGROUPID, LINKTYPEID, SYSID, LINKGROUPNAME, LINKGROUPDESC, SHOWGROUPNAME, SHOWORDER, ISVALIDATE)
values (2, 2, 2, 'Teaching management service', 'Teaching management service', 1, 1, 1);

insert into tb_wsm_link_group (LINKGROUPID, LINKTYPEID, SYSID, LINKGROUPNAME, LINKGROUPDESC, SHOWGROUPNAME, SHOWORDER, ISVALIDATE)
values (3, 2, 2, 'Financial management services', 'Financial management services', 1, 2, 1);

--##tb_wsm_link
insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (16, 1, 1, 'Cooperative offer', 'Cooperative offer', 'http://www.google.com', 'Cooperative offer', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon1.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 1, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (17, 1, 1, 'personnel management', 'personnel management', 'http://www.google.com', 'personnel management', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon2.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 2, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (18, 1, 1, 'Science and Engineering Management', 'Science and Engineering Management', 'http://www.google.com', 'Science and Engineering Management', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon3.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 3, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (19, 1, 1, 'financial management', 'financial management', 'http://www.google.com', 'financial management', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon4.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 4, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (20, 1, 1, 'Teaching management', 'Teaching management', 'http://www.google.com', 'Teaching management', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon5.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 5, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (21, 1, 1, 'Scientific research management', 'Scientific research management', 'http://www.google.com', 'Scientific research management', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon6.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 6, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (22, 1, 1, 'Books management', 'Books management', 'http://www.google.com', 'Books management', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon7.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 7, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (23, 1, 1, 'Information Delivery', 'Information Delivery', 'http://www.google.com', 'Information Delivery', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon8.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 8, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (24, 1, 1, 'asset management', 'asset management', 'http://www.google.com', 'asset management', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon9.png', 48, 48, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 9, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (25, 2, 2, 'Examination arrangement', 'Examination arrangement', 'http://www.google.com', 'Examination arrangement', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon1.png', 32, 32, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 1, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (26, 2, 2, 'Student achievementSite schedule', 'Student achievementSite schedule', 'http://www.google.com', 'Student achievementSite schedule', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon1.png', 32, 32, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 2, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (27, 2, 2, 'Training planPersonal schedule', 'Training planPersonal schedule', 'http://www.google.com', 'Training planPersonal schedule', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon1.png', 32, 32, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 3, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (28, 3, 2, 'Examination arrangement', 'Examination arrangement', 'http://www.google.com', 'Examination arrangement', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon1.png', 32, 32, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 4, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (29, 3, 2, 'Student achievementSite schedule', 'Student achievementSite schedule', 'http://www.google.com', 'Student achievementSite schedule', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon1.png', 32, 32, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 5, 1, 1, 1);

insert into tb_wsm_link (LINKID, LINKGROUPID, LINKTYPEID, LINKNAME, LINKTITLE, LINKADDR, LINKDESC, LINKICONPATH, LINKICONWIDTH, LINKICONHEIGHT, LINKICONADDR, SHOWCONTENTS, CONTENTS, PUBLISHER, PUBLISHDATETIME, DRAFTER, DRAFDATETIME, SHOWLINKICON, SHOWORDER, ISSEE, ISCLICK, ISVALIDATE)
values (30, 3, 2, 'Training planPersonal schedule', 'Training planPersonal schedule', 'http://www.google.com', 'Training planPersonal schedule', 'simpleupload/$[mysystmpl]/pulgins/linkpic/s_icon1.png', 32, 32, 'http://www.google.com', 1, '', '', '2016-06-13', '', '2016-06-13', 1, 6, 1, 1, 1);

--##tb_wsm_info_column
insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 1, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 2, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 3, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 4, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 5, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 6, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 7, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 8, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 9, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 10, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 11, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 12, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (1, 13, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (3, 14, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (5, 15, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 16, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 17, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 18, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 19, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 20, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 21, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 22, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 23, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (7, 24, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (9, 25, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (9, 26, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (9, 27, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (9, 28, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (9, 29, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (9, 30, 1, 0, 0, 0);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (8, 31, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 32, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 33, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 34, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (2, 35, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 36, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 37, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 38, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (6, 39, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 40, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 41, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 42, 1, 0, 0, 1);

insert into tb_wsm_info_column (COLUMNID, INFOID, ISVALIDATE, ISRECOMMEND, ISTOP, APPROVESTATUS)
values (4, 43, 1, 0, 0, 1);


-------------------------- 4）权限模型初始化数据，包括机构、用户、用户组、权限、角色、及相互关系------------------------------
--##tb_wsm_user
insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO)
values (1, 'admin', '111', 'admin', '22', '', '', '', '', '', '', '', '', '1', 4, '');

--##tb_wsm_group
insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (1, 'portal platform to manage user groups', null, 'Privilege System Group', '1', '1', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (2, 'Administrators group', 1, 'Administrators group', '1', '1', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (3, '$[mysystmpl]User Group', -1, '$[mysystmpl]User Group', '1', '1', '2', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (4, 'Administrators group', 3, '$[mysystmpl]User Administrators Group', '1', '1', '2', '0', null);

--##tb_wsm_user_group
insert into tb_wsm_user_group (GROUPID, USERID)
values (1, 1);

insert into tb_wsm_user_group (GROUPID, USERID)
values (2, 1);

insert into tb_wsm_user_group (GROUPID, USERID)
values (3, 1);

insert into tb_wsm_user_group (GROUPID, USERID)
values (4, 1);

--##tb_wsm_role
insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT)
values (2, '$[mysystmpl]Administrator role', '$[mysystmpl]Administrator role', '1', 2, '1');

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT)
values (1, 'internet $[mysystmpl] administrator role', 'internet $[mysystmpl] administrator role', '1', 1, '0');

--##tb_wsm_privilege
insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (1, '门户平台权限管理', 'privilege_system_manage', '权限系统权限管理', '/', null, '17', '1', 2, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (2, '门户配置管理', 'ps_portal_config_manage', '门户各类配置管理，包括门户、栏目、信息、主题目皮肤等等', '', 1, '17', '1', 8, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (3, '各系统权限管理', 'ps_all_system_privillege_manage', '各个系统的权限管理', ' ', 1, '17', '1', 99, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (4, '系统开发配置管理', 'ps_develop_config_manage', '系统开发及框架平台相关的配置管理', ' ', 1, '17', '1', 99, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (5, '我的栏目', 'ps_all_type_info_manage', '各类信息管理', '  ', 1, '17', '1', 9, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (6, '布局管理', 'portal_layout_manage', '布局管理', 'contoller.do?operation=listLayout&layoutNameSH=&curpage=1', 2, '17', '1', 1, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (7, '栏目管理', 'portal_column_manage', '栏目管理', 'contoller.do?operation=listColumn&columnNameSH=&curpage=1', 2, '17', '1', 8, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (8, '频道管理', 'portal_channel_manage', '', 'contoller.do?operation=listChannel&channelNameSH=&curpage=', 2, '17', '1', 9, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (9, '信息类型管理', 'portal_infotype', '信息类型管理', 'contoller.do?operation=listInfoType&curpage=1&infoTypeNameSH=', 2, '17', '1', 90, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (10, '背景颜色管理', 'ps_background_manage', '背景颜色管理', 'contoller.do?operation=listBackground&curpage=1&bgdNameSH=&bgdCodeSH', 2, '17', '1', 99, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (11, '皮肤管理', 'ps_skin_manage', '皮肤管理', 'contoller.do?operation=listSkin&curpage=1&skinNameSH=&skinCodeSH', 2, '17', '1', null, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (12, '应用系统管理', 'ps_application_system_manage', '应用系统管理', 'contoller.do?operation=listSystem&curpage=1&sysNameSH=', 2, '17', '1', null, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (13, '主题管理', 'ps_themes_manage', '主题管理', 'contoller.do?operation=listThemes&curpage=1&sysId=1', 2, '17', '1', null, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (14, '图片链接信息管理', 'ps_picture_link_manage', '各个系统的图片及链接管理', '  ', 5, '17', '1', 9, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (15, '静态栏目管理', 'ps_static_column_manage', '静态栏目管理', 'contoller.do?operation=listWebPart&sysId=[$sysId]&columnId=[$columnId]', 5, '17', '1', 9, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (16, '页面嵌套管理', 'webref_infomng', '页面嵌套管理', 'contoller.do?operation=listWebRef&infoTypeCode=webRef&curpage=1&titleSH=', 5, '17', '1', 18, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (17, '服务配置管理', 'webservice_infomng', '服务配置管理', 'contoller.do?operation=listService&infoTypeCode=webService&curpage=1&serviceNameSH=', 5, '17', '1', 66, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (18, '新闻信息管理', 'portal_infotype_news', '信息管理', 'contoller.do?operation=listNews&curpage=1&titleSH=', 5, '17', '1', 91, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (19, '数据库查询管理', 'sqlquery_infomng', '', 'contoller.do?operation=listSQLQuery&infoTypeCode=sqlquery&curpage=1&queryNameSH=', 5, '17', '1', 99, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (20, '标签管理', 'tag_privilige', '标签管理', 'contoller.do?operation=listTag&curpage=1&tagNameSH=&tagCodeSH', 4, '17', '1', 77, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (21, '标签类型管理', 'pcg_tag_type_mng', '标签类型管理', 'contoller.do?operation=listTagType&curpage=1&tagNameSH=&tagTypeCodeSH', 4, '17', '1', 89, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (22, '开发辅助工具', 'ps_develop_tools', '开发辅助工具', 'contoller.do?operation=listProject&curpage=1&projectNameSH=&projectCodeSH', 4, '17', '1', 99, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (23, '验证规则管理', 'vrule_mng_privilege', '', 'contoller.do?operation=listVRule&curpage=1&vRuleNameSH=&vRuleCodeSH', 4, '17', '1', 99, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (24, '数据源管理', 'ps_datasource_manage', '数据源管理', 'contoller.do?operation=listDatasource&curpage=1&dbsNameSH=', 4, '17', '1', null, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (25, '字典数据管理', 'ps_dictionary_data_manage', '字典数据管理', 'contoller.do?operation=listDictionary&curpage=1&dicCodeSH=&dicNameSH=', 4, '17', '1', null, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (26, '字典类型管理', 'ps_dictionary_type_manage', '字典类型管理', 'contoller.do?operation=listDictionaryType&curpage=1&typeCodeSH=&typeNameSH=', 4, '17', '1', null, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (27, '图片-链接类管理', 'pic_link_infomng', '图片-链接类管理', 'contoller.do?operation=listPicLink&sysId=1', 14, '17', '1', 9, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (28, '图片-链接类型管理', 'pic_link_type_infomng', '图片-链接类型管理', 'contoller.do?operation=listPicLinkType&sysId=1', 14, '17', '1', 9, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (29, '图片-链接分组管理', 'pic_link_group_infomng', '图片-链接分组管理', 'contoller.do?operation=listPicLinkGroup&sysId=1', 14, '17', '1', 9, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (30, '用户管理', 'ps_user_manage', '用户管理', 'contoller.do?operation=listUser&curpage=1', 3, '17', '1', 1, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (31, '用户组管理', 'ps_group_manage', '用户组管理', 'contoller.do?operation=listGroup&curpage=1&groupNameSH=', 3, '17', '1', 2, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (32, '机构管理', 'ps_organization_manage', '机构管理', 'contoller.do?operation=listOrganization&curpage=1&orgNameSH=', 3, '17', '1', 3, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (33, '角色管理', 'ps_role_manage', '角色管理', 'contoller.do?operation=listRole&curpage=1&roleNameSH=', 3, '17', '1', 4, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (34, '权限管理', 'ps_privilege_resource_manage', '权限管理', 'contoller.do?operation=listPrivilege&curpage=1&privNameSH=&privCodeSH', 3, '17', '1', 5, 1, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (35, '$[mysystmpl] Manage', '$[mysystmpl]_manage', '$[mysystmpl] Rights Management', '/', -1130, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (36, 'System Management', '$[mysystmpl]_role_manage', '$[mysystmpl] Rights Management', '/', 35, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (37, 'User group management', '$[mysystmpl]._subsystem_group_manage', 'User group management', 'contoller.do?operation=listSubSystemGroup&curpage=1&groupNameSH=&sysId=2', 36, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (38, 'Add', '$[mysystmpl]._subsystem_group_manage_new', 'Add User Group', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (39, 'Save', '$[mysystmpl]._subsystem_group_manage_new_save', 'Save new user group', '/', 38, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (40, 'Back', '$[mysystmpl]._subsystem_group_manage_new_return', 'Back', '/', 38, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (41, 'Delete', '$[mysystmpl]._subsystem_group_manage_delete', 'Delete a user group', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (42, 'Modify', '$[mysystmpl]._subsystem_group_manage_modify', 'Modifying User Groups', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (43, 'Save', '$[mysystmpl]._subsystem_group_manage_modify_save', 'Save User Groups', '/', 42, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (44, 'Back', '$[mysystmpl]._subsystem_group_manage_modify_return', 'Back', '/', 42, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (45, 'View', '$[mysystmpl]._subsystem_group_manage_view', 'View User Groups', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (46, 'Back', '$[mysystmpl]._subsystem_group_manage_view_return', 'Back', '/', 45, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (47, 'Are valid', '$[mysystmpl]._subsystem_group_manage_isvalidate', 'Are valid', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (48, 'Search', '$[mysystmpl]._subsystem_group_manage_search', 'Search User Groups', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (49, 'Reset', '$[mysystmpl]._subsystem_group_manage_reset', 'Reset a user group', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (50, 'Add user', '$[mysystmpl]._subsystem_group_manage_adduser', 'Add the user group of users', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (51, 'Save', '$[mysystmpl]._subsystem_group_manage_adduser_save', 'Add the user to save the user group', '/', 50, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (52, 'Back', '$[mysystmpl]._subsystem_group_manage_adduser_return', 'Back ', '/', 50, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (53, 'Assign roles', '$[mysystmpl]._subsystem_group_manage_assignrole', 'Assign User Group Roles', '/', 37, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (54, 'Save', '$[mysystmpl]._subsystem_group_manage_assignrole_save', 'Assign User Group Roles save', '/', 53, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (55, 'Back', '$[mysystmpl]._subsystem_group_manage_assignrole_return', 'Back ', '/', 53, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (56, 'Role Management', '$[mysystmpl]._subsystem_role_manage', 'Role Management', 'contoller.do?operation=listSubSystemRole&curpage=1&roleNameSH=&sysId=2', 36, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (57, 'Add', '$[mysystmpl]._subsystem_role_manage_new', 'Add', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (58, 'Save', '$[mysystmpl]._subsystem_role_manage_new_save', 'Save', '/', 57, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (59, 'Back', '$[mysystmpl]._subsystem_role_manage_new_return', 'Back', '/', 57, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (60, 'Delete', '$[mysystmpl]._subsystem_role_manage_delete', 'Delete', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (61, 'Modify', '$[mysystmpl]._subsystem_role_manage_modify', 'Modify', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (62, 'Save', '$[mysystmpl]._subsystem_role_manage_modify_save', 'Save', '/', 61, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (63, 'Back', '$[mysystmpl]._subsystem_role_manage_modify_return', 'Back', '/', 61, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (64, 'View', '$[mysystmpl]._subsystem_role_manage_view', 'View', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (65, 'Back', '$[mysystmpl]._subsystem_role_manage_view_return', 'Back', '/', 64, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (66, 'Are valid', '$[mysystmpl]._subsystem_role_manage_isvalidate', 'Are valid', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (67, 'Search', '$[mysystmpl]._subsystem_role_manage_search', 'Search', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (68, 'Reset', '$[mysystmpl]._subsystem_role_manage_reset', 'Reset', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (69, 'Rights Assignment', '$[mysystmpl]._subsystem_role_manage_assignprivilege', 'Rights Assignment', '/', 56, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (70, 'Save', '$[mysystmpl]._subsystem_role_manage_assignprivilege_save', 'Save', '/', 69, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (71, 'Back', '$[mysystmpl]._subsystem_role_manage_assignprivilege_return', 'Back', '/', 69, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (72, 'Rights Management', '$[mysystmpl]._subsystem_privilege_manage', 'Rights Management', 'contoller.do?operation=listSubSystemPrivilege&curpage=1&privNameSH=&sysId=2', 36, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (73, 'Add', '$[mysystmpl]._subsystem_privilege_manage_new', 'Add', '', 72, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (74, 'Save', '$[mysystmpl]._subsystem_privilege_manage_new_save', 'Save', '', 73, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (75, 'Back', '$[mysystmpl]._subsystem_privilege_manage_new_retrun', 'Back', '', 73, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (76, 'Delete', '$[mysystmpl]._subsystem_privilege_manage_delete', 'Delete', '', 72, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (77, 'Modify', '$[mysystmpl]._subsystem_privilege_manage_modify', 'Modify', '', 72, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (78, 'Save', '$[mysystmpl]._subsystem_privilege_manage_modify_save', 'Save(', '', 77, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (79, 'Back', '$[mysystmpl]._subsystem_privilege_manage_modify_return', 'Back', '', 77, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (80, 'View', '$[mysystmpl]._subsystem_privilege_manage_view', 'View', '', 72, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (81, 'Back', '$[mysystmpl]._subsystem_privilege_manage_view_return', 'Back', '', 80, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (82, 'Valid', '$[mysystmpl]._subsystem_privilege_manage_isvalidate', 'Valid', '', 72, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (83, 'Search', '$[mysystmpl]._subsystem_privilege_manage_search', 'Search', '', 72, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (84, 'Reset', '$[mysystmpl]._subsystem_privilege_manage_reset', 'Reset', '', 72, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (85, '$[mysystmpl] configuration management', '$[mysystmpl]._subsystem_portal_manage', '$[mysystmpl] Rights Management', '/', 35, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (86, 'Channel management', '$[mysystmpl]._subsystem_channel_manage', 'Channel management', 'contoller.do?operation=listSubSystemChannel&curpage=1&channelNameSH=&sysId=2', 85, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (87, 'Add', '$[mysystmpl]._subsystem_channel_manage_new', 'New channel', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (88, 'Save', '$[mysystmpl]._subsystem_channel_manage_new_save', 'Added save channel', '/', 87, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (89, 'Back', '$[mysystmpl]._subsystem_channel_manage_new_return', 'Back', '/', 87, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (90, 'Delete', '$[mysystmpl]._subsystem_channel_manage_delete', 'Delete channel', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (91, 'Modify', '$[mysystmpl]._subsystem_channel_manage_modify', 'Edit Channel', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (92, 'Save', '$[mysystmpl]._subsystem_channel_manage_modify_save', 'Save', '/', 91, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (93, 'Back', '$[mysystmpl]._subsystem_channel_manage_modify_return', 'Back', '/', 91, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (94, 'View', '$[mysystmpl]._subsystem_channel_manage_view', 'View Channel', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (95, 'Back', '$[mysystmpl]._subsystem_channel_manage_view_return', 'Back', '/', 94, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (96, 'Are valid', '$[mysystmpl]._subsystem_channel_manage_isvalidate', 'Are valid', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (97, 'Search', '$[mysystmpl]._subsystem_channel_manage_search', 'Channel search', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (98, 'Reset', '$[mysystmpl]._subsystem_channel_manage_reset', 'Reset Channel', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (99, 'Assign roles', '$[mysystmpl]._subsystem_channel_manage_assignrole', 'Distribution channel role', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (100, 'Save', '$[mysystmpl]._subsystem_channel_manage_assignrole_save', 'Assign roles to save channel', '/', 99, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (101, 'Back', '$[mysystmpl]._subsystem_channel_manage_assignrole_return', 'Back', '/', 99, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (102, 'Layout Manager', '$[mysystmpl]._subsystem_layout_manage', 'Layout Manager', '/', 86, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (103, 'Add', '$[mysystmpl]._subsystem_layout_manage_new', 'New layout', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (104, 'Save', '$[mysystmpl]._subsystem_layout_manage_new_save', 'Save new layout', '/', 103, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (105, 'Back', '$[mysystmpl]._subsystem_layout_manage_new_return', 'Back ', '/', 103, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (106, 'Delete', '$[mysystmpl]._subsystem_layout_manage_delete', 'Delete layout', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (107, 'Modify', '$[mysystmpl]._subsystem_layout_manage_modify', 'Modify Layout', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (108, 'Save', '$[mysystmpl]._subsystem_layout_manage_modify_save', 'Modify the layout to save', '/', 107, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (109, 'Back', '$[mysystmpl]._subsystem_layout_manage_modify_return', 'Back', '/', 107, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (110, 'View', '$[mysystmpl]._subsystem_layout_manage_view', 'View Layout', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (111, 'Back', '$[mysystmpl]._subsystem_layout_manage_view_return', 'Back', '/', 110, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (112, 'Are valid', '$[mysystmpl]._subsystem_layout_manage_isvalidate', 'Are valid', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (113, 'Search', '$[mysystmpl]._subsystem_layout_manage_search', 'Search layout', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (114, 'Reset', '$[mysystmpl]._subsystem_layout_manage_reset', 'Reset Layout', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (115, 'Layout', '$[mysystmpl]._subsystem_layout_designer', 'Layout', '/', 102, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (116, 'Insert row up', '$[mysystmpl]._subsystem_layout_designer_up_row', 'Insert row up', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (117, 'Insert row down', '$[mysystmpl]._subsystem_layout_designer_down_row', 'Insert row down', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (118, 'Insert column left', '$[mysystmpl]._subsystem_layout_designer_left_col', 'Insert column left', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (119, 'Insert column right', '$[mysystmpl]._subsystem_layout_designer_right_col', 'Insert column right', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (120, 'Split rows', '$[mysystmpl]._subsystem_layout_designer_split_row', 'Split rows', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (121, 'Split columns', '$[mysystmpl]._subsystem_layout_designer_split_col', 'Split columns', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (122, 'Merger up', '$[mysystmpl]._subsystem_layout_designer_up_merge', 'Merger up', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (123, 'Merge down', '$[mysystmpl]._subsystem_layout_designer_down_merge', 'Merge down', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (124, 'Merge left ', '$[mysystmpl]._subsystem_layout_designer_left_merge', 'Merge left ', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (125, 'Merge right', '$[mysystmpl]._subsystem_layout_designer_right_merge', 'Merge right', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (126, 'Delete Row', '$[mysystmpl]._subsystem_layout_designer_delete_row', 'Delete Row', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (127, 'Delete Column', '$[mysystmpl]._subsystem_layout_designer_delete_col', 'Delete Column', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (128, 'Save Template', '$[mysystmpl]._subsystem_layout_designer_save_template', 'Save Template', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (129, 'Publish template', '$[mysystmpl]._subsystem_layout_designer_publish_template', 'Publish template', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (130, 'Custom Columns', '$[mysystmpl]._subsystem_layout_designer_define_column', 'Custom Columns', '/', 115, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (131, 'Column Management', '$[mysystmpl]._subsystem_column_manage', 'Column Management', 'contoller.do?operation=listSubSystemColumn&curpage=1&columnNameSH=&sysId=2', 85, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (132, 'Add', '$[mysystmpl]._subsystem_column_manage_new', 'New column', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (133, 'Save', '$[mysystmpl]._subsystem_column_manage_new_save', 'Add column', '/', 132, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (134, 'Back', '$[mysystmpl]._subsystem_column_manage_new_return', 'Back', '/', 132, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (135, 'Delete', '$[mysystmpl]._subsystem_column_manage_delete', 'Delete column', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (136, 'Modify', '$[mysystmpl]._subsystem_column_manage_modify', 'Modify column', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (137, 'Save', '$[mysystmpl]._subsystem_column_manage_modify_save', 'Save', '/', 136, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (138, 'Back', '$[mysystmpl]._subsystem_column_manage_modify_return', 'Back', '/', 136, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (139, 'View', '$[mysystmpl]._subsystem_column_manage_view', 'View', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (140, 'Back', '$[mysystmpl]._subsystem_column_manage_view_return', 'Back', '/', 139, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (141, 'Are valid', '$[mysystmpl]._subsystem_column_manage_isvalidate', 'Are valid', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (142, 'Search', '$[mysystmpl]._subsystem_column_manage_search', 'Search columns', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (143, 'Reset', '$[mysystmpl]._subsystem_column_manage_reset', 'Reset search', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (144, 'Assign roles', '$[mysystmpl]._subsystem_column_manage_assignrole', 'Assigned roles column', '/', 131, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (145, 'Save', '$[mysystmpl]._subsystem_column_manage_assignrole_save', 'Save', '/', 144, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (146, 'Back', '$[mysystmpl]._subsystem_column_manage_assignrole_return', 'Back', '/', 144, '16', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (147, 'Information Management', '$[mysystmpl]._subsystem_information_manage', 'Information Management', '/', 35, '17', '1', 1, 2, '0', null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (148, 'My access record', '$[mysystmpl]._subsystem_My_access_record_manage', 'Information Management', 'contoller.do?operation=viewSubSystemWebRef&sysId=2&columnId=1', 147, '17', '1', 1, 2, '0', null, 32);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (149, 'Notification announcement', '$[mysystmpl]._subsystem_Notification_announcement_manage', 'Information Management', 'contoller.do?operation=listSubSystemNews&sysId=2&columnId=2', 147, '17', '1', 1, 2, '0', null, 33);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (150, 'I do business', '$[mysystmpl]._subsystem_I_do_business_manage', 'Information Management', 'contoller.do?operation=viewSubSystemWebPart&sysId=2&columnId=3', 147, '17', '1', 1, 2, '0', null, 34);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (151, 'Department notice', '$[mysystmpl]._subsystem_Department_notice_manage', 'Information Management', 'contoller.do?operation=listSubSystemNews&sysId=2&columnId=4', 147, '17', '1', 1, 2, '0', null, 35);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (152, 'To remind', '$[mysystmpl]._subsystem_To_remind_manage', 'Information Management', 'contoller.do?operation=viewSubSystemWebPart&sysId=2&columnId=5', 147, '17', '1', 1, 2, '0', null, 36);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (153, 'School news', '$[mysystmpl]._subsystem_School_news_manage', 'Information Management', 'contoller.do?operation=listSubSystemNews&sysId=2&columnId=6', 147, '17', '1', 1, 2, '0', null, 37);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (154, 'Common business system', '$[mysystmpl]._subsystem_Common_business_system_manage', 'Information Management', 'contoller.do?operation=listSubSystemPicLink&sysId=2&columnId=7', 147, '17', '1', 1, 2, '0', null, 38);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (155, 'My mail', '$[mysystmpl]._subsystem_My_mail_manage', 'Information Management', 'contoller.do?operation=viewSubSystemWebPart&sysId=2&columnId=8', 147, '17', '1', 1, 2, '0', null, 39);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID)
values (156, 'Other business functions', '$[mysystmpl]._subsystem_Other_business_functions_manage', 'Information Management', 'contoller.do?operation=listSubSystemPicLink&sysId=2&columnId=9', 147, '17', '1', 1, 2, '0', null, 40);

--##tb_wsm_role_privilege
insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 1);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 2);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 3);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 4);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 5);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 6);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 7);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 8);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 9);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 10);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 11);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 12);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 13);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 14);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 15);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 16);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 17);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 18);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 19);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 20);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 21);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 22);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 23);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 24);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 25);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 26);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 27);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 28);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 29);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 30);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 31);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 32);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 33);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (1, 34);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 35);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 36);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 37);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 38);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 39);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 40);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 41);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 42);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 43);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 44);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 45);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 46);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 47);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 48);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 49);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 50);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 51);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 52);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 53);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 54);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 55);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 56);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 57);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 58);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 59);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 60);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 61);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 62);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 63);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 64);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 65);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 66);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 67);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 68);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 69);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 70);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 71);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 72);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 73);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 74);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 75);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 76);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 77);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 78);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 79);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 80);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 81);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 82);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 83);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 84);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 85);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 86);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 87);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 88);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 89);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 90);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 91);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 92);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 93);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 94);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 95);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 96);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 97);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 98);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 99);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 100);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 101);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 102);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 103);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 104);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 105);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 106);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 107);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 108);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 109);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 110);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 111);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 112);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 113);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 114);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 115);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 116);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 117);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 118);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 119);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 120);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 121);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 122);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 123);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 124);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 125);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 126);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 127);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 128);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 129);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 130);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 131);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 132);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 133);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 134);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 135);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 136);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 137);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 138);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 139);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 140);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 141);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 142);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 143);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 144);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 145);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 146);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 147);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 148);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 149);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 150);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 151);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 152);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 153);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 154);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 155);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (2, 156);

--##tb_wsm_role_channel
insert into tb_wsm_role_channel (ROLEID, CHANNELID)
values (2, 1);

--##tb_wsm_role_column
insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 2);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 3);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 4);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 5);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 6);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 7);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 8);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 9);

insert into tb_wsm_role_column (ROLEID, COLUMNID)
values (2, 1);

--##tb_wsm_group_role
insert into tb_wsm_group_role (GROUPID, ROLEID)
values (1, 1);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (1, 2);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (3, 2);