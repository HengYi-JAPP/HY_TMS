-------------------------- 1）基础表初始化数据，包括字典类型、字典 ------------------------------
--##tb_dic_type
insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (1, 'dbtype', '{$mydbc.system.init.dic.dbtype#}', '{$mydbc.system.init.dic.dbtype#}', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (2, 'dbdriver', '{$mydbc.system.init.dic.dbdriver#}', '{$mydbc.system.init.dic.dbdriver#}', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (3, 'privilegeType', '{$mydbc.system.init.dic.privtype#}', '{$mydbc.system.init.dic.privtype#}', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (4, 'USER_TYPE', '{$mydbc.system.init.dic.usertype#}', '{$mydbc.system.init.dic.usertype#}', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (5, 'SEX', '{$mydbc.system.init.dic.sex#}', '{$mydbc.system.init.dic.sex#}', '1');

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
values (3, 16, '{$mydbc.system.init.dic.operationpriv#}', 'operation_privileges', '{$mydbc.system.init.dic.operationpriv#}', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 17, '{$mydbc.system.init.dic.functionpriv#}', 'function_privileges', '{$mydbc.system.init.dic.functionpriv#}', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 18, '{$mydbc.system.init.dic.compositePriv#}', 'composite_privileges', '{$mydbc.system.init.dic.compositePriv#}', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 19, '{$mydbc.system.init.dic.datapriv#}', 'data_privileges', '{$mydbc.system.init.dic.datapriv#}', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 20, '{$mydbc.system.init.dic.teacher#}', 'teacher', '{$mydbc.system.init.dic.teacher#}', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 21, '{$mydbc.system.init.dic.student#}', 'student', '{$mydbc.system.init.dic.student#}', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 22, '{$mydbc.system.init.dic.boy#}', 'boy', '{$mydbc.system.init.dic.boy#}', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 23, '{$mydbc.system.init.dic.girl#}', 'girl', '{$mydbc.system.init.dic.girl#}', '2', '1');


--##tb_wsm_infotype
insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (1, '{$mydbc.system.init.infotype.qq.name#}', '', '{$mydbc.system.init.infotype.qq.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (2, '{$mydbc.system.init.infotype.news.name#}', '', '{$mydbc.system.init.infotype.news.desc#}', 'contoller.do?operation=listWebSiteNewsList&columnId=$[columnBean.columnId]&columnCode=$[columnBean.columnCode]&columnName=$[columnBean.columnName]&typeId=$[columnBean.infoTypeId]&curpage=0&perPageCount=$[columnBean.listShowNum]', '../plugins/news/index.jsp', 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columdCode=$[columnCode]', 'contoller.do?operation=listSubSystemNews&sysId=$[sysId]', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (3, '{$mydbc.system.init.infotype.service.name#}', '', '{$mydbc.system.init.infotype.service.desc#}', '', '../plugins/service/index.jsp', '', 'contoller.do?operation=listSubSystemService&curpage=1&sysId=$[sysId]', null, 1, 0, 0, 'webService');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (4, '{$mydbc.system.init.infotype.rss.name#}', '', '{$mydbc.system.init.infotype.rss.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (5, '{$mydbc.system.init.infotype.netpage.name#}', '', '{$mydbc.system.init.infotype.netpage.desc#}。', 'jsp/portal/website/plugins/webref/index.jsp', '../plugins/webref/index.jsp', 'jsp/portal/website/plugins/webref/index.jsp', 'contoller.do?operation=viewSubSystemWebRef&sysId=$[sysId]', null, 1, 0, 0, 'webRef');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (6, '{$mydbc.system.init.infotype.message.name#}', '', '{$mydbc.system.init.infotype.message.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (7, '{$mydbc.system.init.infotype.piclink.name#}', '', '{$mydbc.system.init.infotype.piclink.desc#}', '../plugins/piclink/index.jsp', '../plugins/piclink/index.jsp', 'contoller.do', 'contoller.do?operation=listSubSystemPicLink&sysId=$[sysId]', null, 1, 1, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (8, '{$mydbc.system.init.infotype.boke.name#}', '', '{$mydbc.system.init.infotype.boke.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (9, '{$mydbc.system.init.infotype.staticpage.name#}', '', '{$mydbc.system.init.infotype.staticpage.desc#}', 'jsp/portal/website/plugins/webpart/index.jsp', '../plugins/webpart/index.jsp', 'jsp/portal/website/plugins/webpart/index.jsp', 'contoller.do?operation=viewSubSystemWebPart&sysId=$[sysId]', null, 1, 0, 0, 'webPart');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (10, '{$mydbc.system.init.infotype.datasearch.name#}', '', '{$mydbc.system.init.infotype.datasearch.desc#}', '../plugins/sqlquery/list.jsp?sysId=$[sysId]&columnId=$[columnId]&queryId=$[sqlqueryBean.queryId]', '../plugins/sqlquery/index.jsp', '../plugins/sqlquery/view.jsp', 'contoller.do?operation=listSubSystemSQLQuery&curpage=1&sysId=$[sysId]', null, 1, 0, 0, 'sqlquery');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (11, '{$mydbc.system.init.infotype.netfile.name#}', '', '{$mydbc.system.init.infotype.netfile.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (12, '{$mydbc.system.init.infotype.email.name#}', '', '{$mydbc.system.init.infotype.email.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (13, '{$mydbc.system.init.infotype.forum.name#}', '', '{$mydbc.system.init.infotype.forum.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (14, '{$mydbc.system.init.infotype.servay.name#}', '', '{$mydbc.system.init.infotype.servay.desc#}', '', '', '', '', null, 1, 0, 0, '');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (15, '{$mydbc.system.init.infotype.funcomp.name#}', '', '{$mydbc.system.init.infotype.funcomp.desc#}', '', '', '', '', null, 1, 0, 0, 'function_loader_infotype');

insert into tb_wsm_infotype (INFOTYPEID, INFOTYPENAME, INFOTABLENAME, INFOTYPEDESC, LISTLINK, INDEXCONTENTLINK, DETAILCONTENTLINK, MANAGELINK, ISDATAPRIV, ISVALIDATE, ISIMPORT, ISDEPLOY, INFOTYPECODE)
values (-1, '{$mydbc.system.init.infotype.selfdefine.name#}', '', '{$mydbc.system.init.infotype.selfdefine.desc#}', 'http://www.baidu.com/', '../plugins/userdefine/index.jsp', '', '', null, 1, 0, 0, '');
