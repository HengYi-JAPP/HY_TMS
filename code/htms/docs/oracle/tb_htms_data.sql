insert into tb_system (SYSID, SYSCODE, SYSNAME, SYSPATH, SYSDESC, SHOWORDER, DEFROLEID, ISVALIDATE, ISINSIDE, USERDEFINE, USERID)
values (1, 'htms', 'htms', 'http://www.localhost.com', 'htms', 2, 1, 1, 1, 0, null);

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (9, 'priceType', '��������', '��������', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (1, 'dbtype', '���ݿ�����', '���ݿ�����', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (2, 'dbdriver', '���ݿ�����', '���ݿ�����', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (3, 'privilegeType', 'Ȩ������', 'Ȩ������', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (4, 'USER_TYPE', '�û�����', '�û�����', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (5, 'SEX', '�Ա�', '�Ա�', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (6, 'priceType', '����������', '����������', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (7, 'roleType', '��ɫ����', '��ɫ����', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (8, 'priceUnit', '�Ƽ۵�λ', '�Ƽ۵�λ', '1');


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
values (3, 16, '����Ȩ��', 'operation_privileges', '����Ȩ��', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 17, '����Ȩ��', 'function_privileges', '����Ȩ��', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 18, '���Ȩ��', 'composite_privileges', '���Ȩ��', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 19, '����Ȩ��', 'data_privileges', '����Ȩ��', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 20, '��ʦ', 'teacher', '��ʦ', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 21, 'ѧ��', 'student', 'ѧ��', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 22, '��', 'boy', '��', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 23, 'Ů', 'girl', 'Ů', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (6, 24, '��', 'weight', '��', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (6, 25, 'ǧ��', 'weight', 'ǧ��', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (9, 26, '��', 'package', '��', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 27, '�ͻ�', 'customer', '�ͻ�', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 28, 'ҵ��Ա', 'salesman', 'ҵ��Ա', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 29, '������Ա', 'inside_job', '������Ա', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 30, '�ִ���Ա', 'warehousing', '�ִ���Ա', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 31, '������˾', 'logistics_company', '������˾', '5', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 32, '������', 'carrier', '������', '6', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 33, '˾��', 'driver', '˾��', '7', '1');


insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (1, 'ʯ��', '1000', 'ʯ��', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (2, '�ۺ���', '2000', '�ۺ���', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (4, '����', '9100', '����', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (5, '�ݕ�', '9200', '�ݕ�', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (3, '����', '3000', '����', '', '', '', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (1, 'DTY', '120', 'DTY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (2, 'POY', '130', 'POY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (3, 'ITY', '135', 'ITY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (4, 'FDY', '140', 'FDY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (5, '��Ƭ', '150', '��Ƭ', 1);


insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (1, 1, 'DTY', '120', 'DTY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (2, 2, 'POY', '130', 'POY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (3, 3, 'ITY', '135', 'ITY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (4, 4, 'FDY', '140', 'FDY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (5, 5, '��Ƭ', '150', '��Ƭ', '', 1);


insert into tb_htms_taskschedule (TASKID, TASKNAME, TASKDESC, TASKINTERVAL, TASKTIMEUNIT, TASKCLASS, ISUSE, STARTDATETIME, EDNDATETIME, ISVALIDATE)
values (1, '���۶���ͬ��2', '���۶���ͬ��2', 10, 2, 'com.zzy.htms.schedule.TestScheduleTask', 1, '2017-08-15', '', 1);



insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (1, '�����������͹���ϵͳ Ĭ���û���', -1, '�����������͹���ϵͳ Ĭ���û���', '1', '1', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (2, 'ϵͳ����Ա��', 1, '�����������͹���ϵͳ ����Ա��', '1', '5', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (3, '������˾', 1, '������˾', '1', '3', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (4, '������Ա', 1, '������Ա', '1', '1', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (5, '������Ա', 1, '������Ա', '1', '2', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (6, '������', 1, '������', '1', '4', '1', '0', null);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (2, 'ϵͳ Ĭ�Ͻ�ɫ', '�����������͹���ϵͳ Ĭ�Ͻ�ɫ', '1', 1, '1', null);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (3, '����Ա��ɫ', '�����������͹���ϵͳ ����Ա��ɫ', '1', 1, '1', null);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (4, 'ҵ�����۽�ɫ', 'ҵ�����۽�ɫ', '1', 1, '0', 31);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (5, '���ڽ�ɫ', '���ڽ�ɫ', '1', 1, '0', 32);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (6, '������ɫ', '������ɫ', '1', 1, '0', 34);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (7, '�����̽�ɫ', '�����̽�ɫ', '1', 1, '0', 35);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (1, 2);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (2, 3);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (2, 2);





insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (1, '�����������͹���ϵͳ', 'htms_manage', '�����������͹���ϵͳ����', '/', -1, '17', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (2, 'ϵͳ����', 'htms_role_manage', '�����������͹���ϵͳȨ�޹���', '/', 1, '17', '1', 91, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (3, '�û�����', 'htms._subsystem_user_manage', '�û�����', 'contoller.do?operation=listUser&curpage=1&userNameSH=&sysId=1', 2, '17', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (4, '��������', 'htms._subsystem_organization_manage', '��������', 'contoller.do?operation=listOrganization&curpage=1&groupNameSH=&sysId=1', 2, '17', '1', 2, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (5, '�û������', 'htms._subsystem_group_manage', '�û������', 'contoller.do?operation=listSubSystemGroup&curpage=1&groupNameSH=&sysId=1', 2, '17', '1', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (6, '����', 'htms._subsystem_group_manage_new', '�����û���', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (7, '����', 'htms._subsystem_group_manage_new_save', '���������û���', '/', 6, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (8, '����', 'htms._subsystem_group_manage_new_return', '�����û��鷵��', '/', 6, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (9, 'ɾ��', 'htms._subsystem_group_manage_delete', 'ɾ���û���', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (10, '�޸�', 'htms._subsystem_group_manage_modify', '�޸��û���', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (11, '����', 'htms._subsystem_group_manage_modify_save', '�����û���', '/', 10, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (12, '����', 'htms._subsystem_group_manage_modify_return', '�޸��û��鷵��', '/', 10, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (13, '�鿴', 'htms._subsystem_group_manage_view', '�鿴�û���', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (14, '����', 'htms._subsystem_group_manage_view_return', '�鿴�û��鷵��', '/', 13, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (15, '�Ƿ���Ч', 'htms._subsystem_group_manage_isvalidate', '�Ƿ���Ч', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (16, '����', 'htms._subsystem_group_manage_search', '�����û���', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (17, '����', 'htms._subsystem_group_manage_reset', '�����û���', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (18, '�����û�', 'htms._subsystem_group_manage_adduser', '�����û����û�', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (19, '����', 'htms._subsystem_group_manage_adduser_save', '�����û����û�����', '/', 18, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (20, '����', 'htms._subsystem_group_manage_adduser_return', '�����û����û�����', '/', 18, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (21, '�����û����ɫ', 'htms._subsystem_group_manage_assignrole', '�����û����ɫ', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (22, '����', 'htms._subsystem_group_manage_assignrole_save', '�����û����ɫ����', '/', 21, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (23, '����', 'htms._subsystem_group_manage_assignrole_return', '�����û����ɫ����', '/', 21, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (24, '��ɫ����', 'htms._subsystem_role_manage', '��ɫ����', 'contoller.do?operation=listSubSystemRole&curpage=1&roleNameSH=&sysId=1', 2, '17', '1', 4, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (25, '����', 'htms._subsystem_role_manage_new', '����', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (26, '����', 'htms._subsystem_role_manage_new_save', '����', '/', 25, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (27, '����', 'htms._subsystem_role_manage_new_return', '����', '/', 25, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (28, 'ɾ��', 'htms._subsystem_role_manage_delete', 'ɾ��', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (29, '�޸�', 'htms._subsystem_role_manage_modify', '�޸�', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (30, '����', 'htms._subsystem_role_manage_modify_save', '����', '/', 29, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (31, '����', 'htms._subsystem_role_manage_modify_return', '����', '/', 29, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (32, '�鿴', 'htms._subsystem_role_manage_view', '�鿴', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (33, '����', 'htms._subsystem_role_manage_view_return', '����', '/', 32, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (34, '�Ƿ���Ч', 'htms._subsystem_role_manage_isvalidate', '�Ƿ���Ч', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (35, '����', 'htms._subsystem_role_manage_search', '����', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (36, '����', 'htms._subsystem_role_manage_reset', '����', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (37, 'Ȩ�޷���', 'htms._subsystem_role_manage_assignprivilege', 'Ȩ�޷���', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (38, '����', 'htms._subsystem_role_manage_assignprivilege_save', '����', '/', 37, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (39, '����', 'htms._subsystem_role_manage_assignprivilege_return', '����', '/', 37, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (40, 'Ȩ�޹���', 'htms._subsystem_privilege_manage', 'Ȩ�޹���', 'contoller.do?operation=listSubSystemPrivilege&curpage=1&privNameSH=&sysId=1', 2, '17', '1', 5, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (41, '����', 'htms._subsystem_privilege_manage_new', '����', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (42, '����', 'htms._subsystem_privilege_manage_new_save', '����', '', 41, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (43, '����', 'htms._subsystem_privilege_manage_new_retrun', '����', '', 41, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (44, 'ɾ��', 'htms._subsystem_privilege_manage_delete', 'ɾ��', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (45, '�޸�', 'htms._subsystem_privilege_manage_modify', '�޸�', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (46, '����', 'htms._subsystem_privilege_manage_modify_save', '����', '', 45, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (47, '����', 'htms._subsystem_privilege_manage_modify_return', '����', '', 45, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (48, '�鿴', 'htms._subsystem_privilege_manage_view', '�鿴', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (49, '����', 'htms._subsystem_privilege_manage_view_return', '����', '', 48, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (50, '��Ч', 'htms._subsystem_privilege_manage_isvalidate', '��Ч', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (51, '����', 'htms._subsystem_privilege_manage_search', '����', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (52, '����', 'htms._subsystem_privilege_manage_reset', '����', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (53, '�Ż����ù���', 'htms_subsystem_portal_manage', '�����������͹���ϵͳȨ�޹���', '/', 1, '17', '0', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (54, 'Ƶ������', 'htms._subsystem_channel_manage', 'Ƶ������', 'contoller.do?operation=listSubSystemChannel&curpage=1&channelNameSH=&sysId=1', 53, '17', '0', 2, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (55, '����', 'htms._subsystem_channel_manage_new', '����Ƶ��', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (56, '����', 'htms._subsystem_channel_manage_new_save', '��������Ƶ��', '/', 55, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (57, '����', 'htms._subsystem_channel_manage_new_return', '����Ƶ������', '/', 55, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (58, 'ɾ��', 'htms._subsystem_channel_manage_delete', 'ɾ��Ƶ��', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (59, '�޸�', 'htms._subsystem_channel_manage_modify', '�޸�Ƶ��', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (60, '����', 'htms._subsystem_channel_manage_modify_save', '�޸�Ƶ������', '/', 59, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (61, '����', 'htms._subsystem_channel_manage_modify_return', '�޸�Ƶ������', '/', 59, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (62, '�鿴', 'htms._subsystem_channel_manage_view', '�鿴Ƶ��', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (63, '����', 'htms._subsystem_channel_manage_view_return', '�鿴Ƶ������', '/', 62, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (64, '�Ƿ���Ч', 'htms._subsystem_channel_manage_isvalidate', '�Ƿ���Ч', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (65, '����', 'htms._subsystem_channel_manage_search', '����Ƶ��', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (66, '����', 'htms._subsystem_channel_manage_reset', '����Ƶ��', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (67, '����Ƶ����ɫ', 'htms._subsystem_channel_manage_assignrole', '����Ƶ����ɫ', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (68, '����', 'htms._subsystem_channel_manage_assignrole_save', '����Ƶ����ɫ����', '/', 67, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (69, '����', 'htms._subsystem_channel_manage_assignrole_return', '���䲼�ֽ�ɫ����', '/', 67, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (70, '���ֹ���', 'htms._subsystem_layout_manage', '���ֹ���', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (71, '����', 'htms._subsystem_layout_manage_new', '��������', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (72, '����', 'htms._subsystem_layout_manage_new_save', '�������沼��', '/', 71, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (73, '����', 'htms._subsystem_layout_manage_new_return', '�������ַ���', '/', 71, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (74, 'ɾ��', 'htms._subsystem_layout_manage_delete', 'ɾ������', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (75, '�޸�', 'htms._subsystem_layout_manage_modify', '�޸Ĳ���', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (76, '����', 'htms._subsystem_layout_manage_modify_save', '�޸Ĳ��ֱ���', '/', 75, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (77, '����', 'htms._subsystem_layout_manage_modify_return', '�޸Ĳ��ַ���', '/', 75, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (78, '�鿴', 'htms._subsystem_layout_manage_view', '�鿴����', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (79, '����', 'htms._subsystem_layout_manage_view_return', '�鿴���ַ���', '/', 78, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (80, '�Ƿ���Ч', 'htms._subsystem_layout_manage_isvalidate', '�Ƿ���Ч', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (81, '����', 'htms._subsystem_layout_manage_search', '��������', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (82, '����', 'htms._subsystem_layout_manage_reset', '���ò���', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (83, '�������', 'htms._subsystem_layout_designer', '�������', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (84, '���ϲ�����', 'htms._subsystem_layout_designer_up_row', '���ϲ�����', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (85, '���²�����', 'htms._subsystem_layout_designer_down_row', '���²�����', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (86, '���������', 'htms._subsystem_layout_designer_left_col', '���������', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (87, '���Ҳ�����', 'htms._subsystem_layout_designer_right_col', '���Ҳ�����', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (88, '�����', 'htms._subsystem_layout_designer_split_row', '�����', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (89, '�����', 'htms._subsystem_layout_designer_split_col', '�����', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (90, '���Ϻϲ�', 'htms._subsystem_layout_designer_up_merge', '���Ϻϲ�', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (91, '���ºϲ�', 'htms._subsystem_layout_designer_down_merge', '���ºϲ�', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (92, '����ϲ�', 'htms._subsystem_layout_designer_left_merge', '����ϲ�', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (93, '���Һϲ�', 'htms._subsystem_layout_designer_right_merge', '���Һϲ�', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (94, 'ɾ����', 'htms._subsystem_layout_designer_delete_row', 'ɾ����', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (95, 'ɾ����', 'htms._subsystem_layout_designer_delete_col', 'ɾ����', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (96, '����ģ��', 'htms._subsystem_layout_designer_save_template', '����ģ��', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (97, '����ģ��', 'htms._subsystem_layout_designer_publish_template', '����ģ��', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (98, '������Ŀ', 'htms._subsystem_layout_designer_define_column', '������Ŀ', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (99, '��Ŀ����', 'htms._subsystem_column_manage', '��Ŀ����', 'contoller.do?operation=listSubSystemColumn&curpage=1&columnNameSH=&sysId=1', 53, '17', '0', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (100, '����', 'htms._subsystem_column_manage_new', '������Ŀ', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (101, '����', 'htms._subsystem_column_manage_new_save', '����������Ŀ', '/', 100, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (102, '����', 'htms._subsystem_column_manage_new_return', '������Ŀ����', '/', 100, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (103, 'ɾ��', 'htms._subsystem_column_manage_delete', 'ɾ����Ŀ', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (104, '�޸�', 'htms._subsystem_column_manage_modify', '�޸���Ŀ', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (105, '����', 'htms._subsystem_column_manage_modify_save', '�޸���Ŀ����', '/', 104, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (106, '����', 'htms._subsystem_column_manage_modify_return', '�޸���Ŀ����', '/', 104, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (107, '�鿴', 'htms._subsystem_column_manage_view', '�鿴��Ŀ', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (108, '����', 'htms._subsystem_column_manage_view_return', '�鿴��Ŀ����', '/', 107, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (109, '�Ƿ���Ч', 'htms._subsystem_column_manage_isvalidate', '�Ƿ���Ч', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (110, '����', 'htms._subsystem_column_manage_search', '������Ŀ', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (111, '����', 'htms._subsystem_column_manage_reset', '������Ŀ��������', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (112, '������Ŀ��ɫ', 'htms._subsystem_column_manage_assignrole', '������Ŀ��ɫ', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (113, '����', 'htms._subsystem_column_manage_assignrole_save', '������Ŀ��ɫ����', '/', 112, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (114, '����', 'htms._subsystem_column_manage_assignrole_return', '������Ŀ��ɫ����', '/', 112, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (115, '��Ϣ����', 'htms._subsystem_information_manage', '��Ϣ����', '/', 53, '17', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (116, '�ҵķ��ʼ�¼', 'htms._subsystem_info_mng_accessrecord', '�ҵķ��ʼ�¼', 'contoller.do?operation=viewSubSystemWebRef&sysId=1&columnId=1', 115, '17', '0', 1, 1, '0', null, 1, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (117, '֪ͨ����', 'htms._subsystem_info_mng_noticeannounce', '֪ͨ����', 'contoller.do?operation=listSubSystemNews&sysId=1&columnId=2', 115, '17', '0', 1, 1, '0', null, 2, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (118, '�ҵ�����', 'htms._subsystem_info_mng_idobusiness', '�ҵ�����', 'contoller.do?operation=viewSubSystemWebPart&sysId=1&columnId=3', 115, '17', '0', 1, 1, '0', null, 3, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (119, '����֪ͨ', 'htms._subsystem_info_mng_departnotice', '����֪ͨ', 'contoller.do?operation=listSubSystemNews&sysId=1&columnId=4', 115, '17', '0', 1, 1, '0', null, 4, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (120, '����¼', 'htms._subsystem_info_mng_toremind', '����¼', 'contoller.do?operation=viewSubSystemWebPart&sysId=1&columnId=5', 115, '17', '0', 1, 1, '0', null, 5, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (121, 'ѧУ����', 'htms._subsystem_info_mng_schoolnews', 'ѧУ����', 'contoller.do?operation=listSubSystemNews&sysId=1&columnId=6', 115, '17', '0', 1, 1, '0', null, 6, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (122, '����Ӧ��ϵͳ', 'htms._subsystem_info_mng_commonbusiness', '����Ӧ��ϵͳ', 'contoller.do?operation=listSubSystemPicLink&sysId=1&columnId=7', 115, '17', '0', 1, 1, '0', null, 7, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (123, '�ҵ��ʼ�', 'htms._subsystem_info_mng_myemail', '�ҵ��ʼ�', 'contoller.do?operation=viewSubSystemWebPart&sysId=1&columnId=8', 115, '17', '0', 1, 1, '0', null, 8, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (124, '����Ӧ��ϵͳ', 'htms._subsystem_info_mng_otherfunction', '����Ӧ��ϵͳ', 'contoller.do?operation=listSubSystemPicLink&sysId=1&columnId=9', 115, '17', '0', 1, 1, '0', null, 9, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (125, ' ��Ϣ����', 'htms_info_manage', '�����������͹���ϵͳ ��Ϣ����', '/', 1, '17', '0', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (126, '��������', 'logistic_subsystem_module_manage', '����ģ��', '/', 1, '17', '1', 5, 1, '0', null, null, 17, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (127, '���۶���', 'sales_subsystem_module_manage', '����ģ��', '/', 1, '17', '1', 1, 1, '0', null, null, 16, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (128, '��������', 'dictionary_subsystem_module_manage', '�ֵ�ģ��', '/', 1, '17', '1', 9, 1, '0', null, null, 15, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (129, '��Ʒ���͹���', 'producttype_subsystem_obj_manage', '��Ʒ����', 'contoller.do?operation=listProductType', 128, '17', '1', 3, 1, '0', null, null, 15, 312);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (130, '��Ʒ����', 'product_subsystem_obj_manage', '��Ʒ', 'contoller.do?operation=listProduct', 128, '17', '1', 5, 1, '0', null, null, 15, 313);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (131, '��������', 'factory._subsystem_obj_manage', '����', 'contoller.do?operation=listFactory', 128, '17', '1', 1, 1, '0', null, null, 15, 314);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (132, '��·����', 'route_subsystem_obj_manage', '��·', 'contoller.do?operation=listRoute', 126, '17', '1', 3, 1, '0', null, null, 15, 315);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (133, '��ַ�����', 'area_subsystem_obj_manage', '��ַ��', 'contoller.do?operation=listArea', 128, '17', '1', 7, 1, '0', null, null, 15, 316);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (134, '�ͻ���ַ��', 'customeraddr_subsystem_obj_manage', '�ͻ���ַ��', 'contoller.do?operation=listCustomerAddr', 127, '17', '1', 7, 1, '0', null, null, 16, 317);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (135, '�˼۹���', 'transprice_subsystem_obj_manage', '�˼�', 'contoller.do?operation=listTransPrice', 126, '17', '1', 5, 1, '0', null, null, 15, 318);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (136, '�ͻ�����', 'customer_subsystem_obj_manage', '�ͻ�', 'contoller.do?operation=listCustomer', 127, '17', '1', 5, 1, '0', null, null, 16, 319);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (137, '�ɳ���ϸ', 'senddetail._subsystem_obj_manage', '�ɳ���ϸ', 'contoller.do?operation=listSendDetail', 126, '17', '0', 1, 1, '0', null, null, 17, 320);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (138, '��������', 'custorder_subsystem_obj_manage', '����', 'contoller.do?operation=listCustOrder', 127, '17', '1', 1, 1, '0', null, null, 16, 321);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (139, '�˵���ϸ', 'transportdetail._subsystem_obj_manage', '�˵���ϸ', 'contoller.do?operation=listTransportDetail', 126, '17', '0', 1, 1, '0', null, null, 17, 322);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (140, '�ҵ�����', 'ship_subsystem_obj_manage', '��������', 'contoller.do?operation=listShip', 127, '17', '1', 3, 1, '0', null, null, 16, 323);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (141, '�ų�����', 'send_subsystem_obj_manage', '�ɳ���', 'contoller.do?operation=listSend', 153, '17', '1', 3, 1, '0', null, null, 17, 324);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (142, '������ϸ', 'custorderdetail._subsystem_obj_manage', '������ϸ', 'contoller.do?operation=listCustOrderDetail', 127, '17', '0', 1, 1, '0', null, null, 16, 325);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (143, '�˵�����', 'transport_subsystem_obj_manage', '�˵�', 'contoller.do?operation=listTransport', 153, '17', '1', 1, 1, '0', null, null, 17, 326);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (144, '��������', 'vehicle_subsystem_obj_manage', '����', 'contoller.do?operation=listVehicle', 153, '17', '1', 5, 1, '0', null, null, 17, 327);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (145, '˾������', 'driver_subsystem_obj_manage', '˾��', 'contoller.do?operation=listDriver', 153, '17', '1', 7, 1, '0', null, null, 17, 328);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (146, '�����̹���', 'carrier_subsystem_obj_manage', '������', 'contoller.do?operation=listCarrier', 126, '17', '1', 7, 1, '0', null, null, 17, 329);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (147, '������ϸ', 'shipdetail._subsystem_obj_manage', '������ϸ', 'contoller.do?operation=listShipDetail', 127, '17', '0', 1, 1, '0', null, null, 16, 330);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (148, '������ϸ', 'transferdetail._subsystem_obj_manage', '������ϸ', 'contoller.do?operation=listTransferDetail', 126, '17', '0', 1, 1, '0', null, null, 17, 331);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (149, '����������', 'transfer._subsystem_obj_manage', '������', 'contoller.do?operation=listTransfer', 126, '17', '1', 1, 1, '0', null, null, 17, 332);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (150, '������˾����', 'logistics_subsystem_obj_manage', '������˾', 'contoller.do?operation=listLogistics', 128, '17', '1', 9, 1, '0', null, null, 17, 333);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (151, '�������', 'htms_task_schedule', '�������', 'contoller.do?operation=listScheduleTask', 2, '17', '1', 7, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (152, '��������', 'htms_neiqun', '', '/', 1, '17', '1', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (153, '�����̹���', 'htms_carirr_manage', '', '/', 1, '17', '1', 7, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (154, '��������', 'htms_apply_approve', '��������', 'contoller.do?operation=listApproveShip', 152, '17', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (155, '��־����', 'htms_system_logmng', '��־����', 'contoller.do?operation=listLog', 2, '17', '1', 8, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (157, '�����������', 'htms_manage_shiplist', '', 'contoller.do?operation=managerListShip', 127, '17', '1', 9, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (158, '�ͻ��˼۹���', 'htms_customer_price_manage', '�ͻ��˼۹���', 'contoller.do?operation=listCustomerPrice', 126, '17', '1', 9, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (159, 'ó�����������', 'self_fetch', 'ó��������', 'contoller.do?operation=listSelfFtech', 126, '17', '1', 11, 1, '0', null, null, null, null);





insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 1);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 2);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 3);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 5);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 6);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 7);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 8);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 9);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 10);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 11);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 12);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 13);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 14);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 15);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 16);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 17);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 18);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 19);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 20);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 21);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 22);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 23);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 24);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 25);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 26);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 27);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 28);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 29);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 30);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 31);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 32);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 33);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 34);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 35);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 36);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 37);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 38);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 39);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 40);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 41);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 42);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 43);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 44);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 45);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 46);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 47);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 48);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 49);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 50);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 51);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 52);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 126);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (4, 127);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 127);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 128);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 129);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 130);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 131);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 132);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 133);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 134);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (4, 134);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 135);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (4, 136);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 136);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 138);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (4, 138);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 140);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (4, 140);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 141);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 143);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 144);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 145);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 146);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 149);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 150);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 151);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 152);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 153);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 154);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 155);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (4, 157);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 158);

insert into tb_wsm_role_privilege (ROLEID, PRIVID)
values (3, 159);







insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (1, 'admin', '111', '����Ա', '22', '', '', '', '', '', '', '', '', '1', 35, '', '001,015', '12000077', '', 4, 1, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (2, 'sales', '111', '���۲���', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 31, '', '001', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (3, 'wlgs', '111', '������˾', '22', '', '13567899876', '', '', '', '', '1         ', '', '1', 34, '', '', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (4, 'cys', '111', '������', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 35, '', '', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (5, 'nqsp', '111', '������Ա', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 32, '', '', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (6, '99600022', '111', '����', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 32, '', '001,015', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (7, '0009010011', '123', 'ҵ��Ա', '22', '', '138xxxxxxxx', '', '', '', '', '', '', '1', 31, '', '001,015', '', '', null, 0, null, '', '', '');

insert into tb_wsm_user_group (GROUPID, USERID)
values (1, 1);

insert into tb_wsm_user_group (GROUPID, USERID)
values (2, 1);

insert into tb_wsm_user_group (GROUPID, USERID)
values (4, 2);

insert into tb_wsm_user_group (GROUPID, USERID)
values (5, 5);

insert into tb_wsm_user_group (GROUPID, USERID)
values (4, 7);






