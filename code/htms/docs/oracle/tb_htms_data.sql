insert into tb_system (SYSID, SYSCODE, SYSNAME, SYSPATH, SYSDESC, SHOWORDER, DEFROLEID, ISVALIDATE, ISINSIDE, USERDEFINE, USERID)
values (1, 'htms', 'htms', 'http://www.localhost.com', 'htms', 2, 1, 1, 1, 0, null);

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (9, 'priceType', '按包计算', '按包计算', '1');

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

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (6, 'priceType', '按重量计算', '按重量计算', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (7, 'roleType', '角色类型', '角色类型', '1');

insert into tb_dic_type (TYPEID, TYPECODE, TYPENAME, TYPEDESC, ISVALIDATE)
values (8, 'priceUnit', '计价单位', '计价单位', '1');


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
values (3, 16, '操作权限', 'operation_privileges', '操作权限', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 17, '功能权限', 'function_privileges', '功能权限', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 18, '组合权限', 'composite_privileges', '组合权限', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (3, 19, '数据权限', 'data_privileges', '数据权限', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 20, '老师', 'teacher', '老师', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (4, 21, '学生', 'student', '学生', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 22, '男', 'boy', '男', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (5, 23, '女', 'girl', '女', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (6, 24, '吨', 'weight', '吨', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (6, 25, '千克', 'weight', '千克', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (9, 26, '包', 'package', '包', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 27, '客户', 'customer', '客户', '1', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 28, '业务员', 'salesman', '业务员', '2', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 29, '内勤人员', 'inside_job', '内勤人员', '3', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 30, '仓储人员', 'warehousing', '仓储人员', '4', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 31, '物流公司', 'logistics_company', '物流公司', '5', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 32, '承运商', 'carrier', '承运商', '6', '1');

insert into tb_dictionary (TYPEID, DICID, DICNAME, DICCODE, DICDESC, SHOWORDER, ISVALIDATE)
values (7, 33, '司机', 'driver', '司机', '7', '1');


insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (1, '石化', '1000', '石化', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (2, '聚合物', '2000', '聚合物', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (4, '逸鹏', '9100', '逸鹏', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (5, '逸暻', '9200', '逸暻', '', '', '', 1);

insert into tb_htms_factory (FACTORYID, FACTORYNAME, FACTORYCODE, FACTORYDESC, FACTORYADDRESS, FACTORYCONTACTOR, FACTORYTELPHONE, ISVLIDATE)
values (3, '高新', '3000', '高新', '', '', '', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (1, 'DTY', '120', 'DTY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (2, 'POY', '130', 'POY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (3, 'ITY', '135', 'ITY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (4, 'FDY', '140', 'FDY', 1);

insert into tb_htms_producttype (TYPEID, TYPENAME, TYPECODE, TYPEDESC, ISVALIDATE)
values (5, '切片', '150', '切片', 1);


insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (1, 1, 'DTY', '120', 'DTY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (2, 2, 'POY', '130', 'POY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (3, 3, 'ITY', '135', 'ITY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (4, 4, 'FDY', '140', 'FDY', '', 1);

insert into tb_htms_product (PRODUCTID, TYPEID, PRODUCTNAME, PRODUCTCODE, PRODUCTDESC, SAPNO, ISVALIDATE)
values (5, 5, '切片', '150', '切片', '', 1);


insert into tb_htms_taskschedule (TASKID, TASKNAME, TASKDESC, TASKINTERVAL, TASKTIMEUNIT, TASKCLASS, ISUSE, STARTDATETIME, EDNDATETIME, ISVALIDATE)
values (1, '销售订单同步2', '销售订单同步2', 10, 2, 'com.zzy.htms.schedule.TestScheduleTask', 1, '2017-08-15', '', 1);



insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (1, '恒逸物流配送管理系统 默认用户组', -1, '恒逸物流配送管理系统 默认用户组', '1', '1', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (2, '系统管理员组', 1, '恒逸物流配送管理系统 管理员组', '1', '5', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (3, '物流公司', 1, '物流公司', '1', '3', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (4, '销售人员', 1, '销售人员', '1', '1', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (5, '内勤人员', 1, '内勤人员', '1', '2', '1', '0', null);

insert into tb_wsm_group (GROUPID, GROUPNAME, GROUPPARENTID, GROUPDESC, ISVALIDATE, SHOWORDER, SYSID, ISDEFAULT, DEFAULTID)
values (6, '承运商', 1, '承运商', '1', '4', '1', '0', null);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (2, '系统 默认角色', '恒逸物流配送管理系统 默认角色', '1', 1, '1', null);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (3, '管理员角色', '恒逸物流配送管理系统 管理员角色', '1', 1, '1', null);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (4, '业务销售角色', '业务销售角色', '1', 1, '0', 31);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (5, '内勤角色', '内勤角色', '1', 1, '0', 32);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (6, '物流角色', '物流角色', '1', 1, '0', 34);

insert into tb_wsm_role (ROLEID, ROLENAME, ROLEDESC, ISVALIDATE, SYSID, ISDEFAULT, ROLETYPE)
values (7, '承运商角色', '承运商角色', '1', 1, '0', 35);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (1, 2);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (2, 3);

insert into tb_wsm_group_role (GROUPID, ROLEID)
values (2, 2);





insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (1, '恒逸物流配送管理系统', 'htms_manage', '恒逸物流配送管理系统管理', '/', -1, '17', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (2, '系统管理', 'htms_role_manage', '恒逸物流配送管理系统权限管理', '/', 1, '17', '1', 91, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (3, '用户管理', 'htms._subsystem_user_manage', '用户管理', 'contoller.do?operation=listUser&curpage=1&userNameSH=&sysId=1', 2, '17', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (4, '机构管理', 'htms._subsystem_organization_manage', '机构管理', 'contoller.do?operation=listOrganization&curpage=1&groupNameSH=&sysId=1', 2, '17', '1', 2, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (5, '用户组管理', 'htms._subsystem_group_manage', '用户组管理', 'contoller.do?operation=listSubSystemGroup&curpage=1&groupNameSH=&sysId=1', 2, '17', '1', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (6, '新增', 'htms._subsystem_group_manage_new', '新增用户组', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (7, '保存', 'htms._subsystem_group_manage_new_save', '新增保存用户组', '/', 6, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (8, '返回', 'htms._subsystem_group_manage_new_return', '新增用户组返回', '/', 6, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (9, '删除', 'htms._subsystem_group_manage_delete', '删除用户组', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (10, '修改', 'htms._subsystem_group_manage_modify', '修改用户组', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (11, '保存', 'htms._subsystem_group_manage_modify_save', '保存用户组', '/', 10, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (12, '返回', 'htms._subsystem_group_manage_modify_return', '修改用户组返回', '/', 10, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (13, '查看', 'htms._subsystem_group_manage_view', '查看用户组', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (14, '返回', 'htms._subsystem_group_manage_view_return', '查看用户组返回', '/', 13, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (15, '是否有效', 'htms._subsystem_group_manage_isvalidate', '是否有效', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (16, '搜索', 'htms._subsystem_group_manage_search', '搜索用户组', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (17, '重置', 'htms._subsystem_group_manage_reset', '重置用户组', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (18, '增加用户', 'htms._subsystem_group_manage_adduser', '增加用户组用户', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (19, '保存', 'htms._subsystem_group_manage_adduser_save', '增加用户组用户保存', '/', 18, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (20, '返回', 'htms._subsystem_group_manage_adduser_return', '增加用户组用户返回', '/', 18, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (21, '分配用户组角色', 'htms._subsystem_group_manage_assignrole', '分配用户组角色', '/', 5, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (22, '保存', 'htms._subsystem_group_manage_assignrole_save', '分配用户组角色保存', '/', 21, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (23, '返回', 'htms._subsystem_group_manage_assignrole_return', '分配用户组角色返回', '/', 21, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (24, '角色管理', 'htms._subsystem_role_manage', '角色管理', 'contoller.do?operation=listSubSystemRole&curpage=1&roleNameSH=&sysId=1', 2, '17', '1', 4, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (25, '新增', 'htms._subsystem_role_manage_new', '新增', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (26, '保存', 'htms._subsystem_role_manage_new_save', '保存', '/', 25, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (27, '返回', 'htms._subsystem_role_manage_new_return', '返回', '/', 25, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (28, '删除', 'htms._subsystem_role_manage_delete', '删除', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (29, '修改', 'htms._subsystem_role_manage_modify', '修改', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (30, '保存', 'htms._subsystem_role_manage_modify_save', '保存', '/', 29, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (31, '返回', 'htms._subsystem_role_manage_modify_return', '返回', '/', 29, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (32, '查看', 'htms._subsystem_role_manage_view', '查看', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (33, '返回', 'htms._subsystem_role_manage_view_return', '返回', '/', 32, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (34, '是否有效', 'htms._subsystem_role_manage_isvalidate', '是否有效', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (35, '搜索', 'htms._subsystem_role_manage_search', '搜索', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (36, '重置', 'htms._subsystem_role_manage_reset', '重置', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (37, '权限分配', 'htms._subsystem_role_manage_assignprivilege', '权限分配', '/', 24, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (38, '保存', 'htms._subsystem_role_manage_assignprivilege_save', '保存', '/', 37, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (39, '返回', 'htms._subsystem_role_manage_assignprivilege_return', '返回', '/', 37, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (40, '权限管理', 'htms._subsystem_privilege_manage', '权限管理', 'contoller.do?operation=listSubSystemPrivilege&curpage=1&privNameSH=&sysId=1', 2, '17', '1', 5, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (41, '新增', 'htms._subsystem_privilege_manage_new', '新增', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (42, '保存', 'htms._subsystem_privilege_manage_new_save', '保存', '', 41, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (43, '返回', 'htms._subsystem_privilege_manage_new_retrun', '返回', '', 41, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (44, '删除', 'htms._subsystem_privilege_manage_delete', '删除', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (45, '修改', 'htms._subsystem_privilege_manage_modify', '修改', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (46, '保存', 'htms._subsystem_privilege_manage_modify_save', '保存', '', 45, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (47, '返回', 'htms._subsystem_privilege_manage_modify_return', '返回', '', 45, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (48, '查看', 'htms._subsystem_privilege_manage_view', '查看', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (49, '返回', 'htms._subsystem_privilege_manage_view_return', '返回', '', 48, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (50, '有效', 'htms._subsystem_privilege_manage_isvalidate', '有效', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (51, '搜索', 'htms._subsystem_privilege_manage_search', '搜索', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (52, '重置', 'htms._subsystem_privilege_manage_reset', '重置', '', 40, '16', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (53, '门户配置管理', 'htms_subsystem_portal_manage', '恒逸物流配送管理系统权限管理', '/', 1, '17', '0', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (54, '频道管理', 'htms._subsystem_channel_manage', '频道管理', 'contoller.do?operation=listSubSystemChannel&curpage=1&channelNameSH=&sysId=1', 53, '17', '0', 2, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (55, '新增', 'htms._subsystem_channel_manage_new', '新增频道', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (56, '保存', 'htms._subsystem_channel_manage_new_save', '新增保存频道', '/', 55, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (57, '返回', 'htms._subsystem_channel_manage_new_return', '新增频道返回', '/', 55, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (58, '删除', 'htms._subsystem_channel_manage_delete', '删除频道', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (59, '修改', 'htms._subsystem_channel_manage_modify', '修改频道', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (60, '保存', 'htms._subsystem_channel_manage_modify_save', '修改频道保存', '/', 59, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (61, '返回', 'htms._subsystem_channel_manage_modify_return', '修改频道返回', '/', 59, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (62, '查看', 'htms._subsystem_channel_manage_view', '查看频道', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (63, '返回', 'htms._subsystem_channel_manage_view_return', '查看频道返回', '/', 62, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (64, '是否有效', 'htms._subsystem_channel_manage_isvalidate', '是否有效', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (65, '搜索', 'htms._subsystem_channel_manage_search', '搜索频道', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (66, '重置', 'htms._subsystem_channel_manage_reset', '重置频道', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (67, '分配频道角色', 'htms._subsystem_channel_manage_assignrole', '分配频道角色', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (68, '保存', 'htms._subsystem_channel_manage_assignrole_save', '分配频道角色保存', '/', 67, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (69, '返回', 'htms._subsystem_channel_manage_assignrole_return', '分配布局角色返回', '/', 67, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (70, '布局管理', 'htms._subsystem_layout_manage', '布局管理', '/', 54, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (71, '新增', 'htms._subsystem_layout_manage_new', '新增布局', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (72, '保存', 'htms._subsystem_layout_manage_new_save', '新增保存布局', '/', 71, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (73, '返回', 'htms._subsystem_layout_manage_new_return', '新增布局返回', '/', 71, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (74, '删除', 'htms._subsystem_layout_manage_delete', '删除布局', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (75, '修改', 'htms._subsystem_layout_manage_modify', '修改布局', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (76, '保存', 'htms._subsystem_layout_manage_modify_save', '修改布局保存', '/', 75, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (77, '返回', 'htms._subsystem_layout_manage_modify_return', '修改布局返回', '/', 75, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (78, '查看', 'htms._subsystem_layout_manage_view', '查看布局', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (79, '返回', 'htms._subsystem_layout_manage_view_return', '查看布局返回', '/', 78, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (80, '是否有效', 'htms._subsystem_layout_manage_isvalidate', '是否有效', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (81, '搜索', 'htms._subsystem_layout_manage_search', '搜索布局', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (82, '重置', 'htms._subsystem_layout_manage_reset', '重置布局', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (83, '布局设计', 'htms._subsystem_layout_designer', '布局设计', '/', 70, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (84, '向上插入行', 'htms._subsystem_layout_designer_up_row', '向上插入行', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (85, '向下插入行', 'htms._subsystem_layout_designer_down_row', '向下插入行', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (86, '向左插入列', 'htms._subsystem_layout_designer_left_col', '向左插入列', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (87, '向右插入列', 'htms._subsystem_layout_designer_right_col', '向右插入列', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (88, '拆成行', 'htms._subsystem_layout_designer_split_row', '拆成行', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (89, '拆成列', 'htms._subsystem_layout_designer_split_col', '拆成列', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (90, '向上合并', 'htms._subsystem_layout_designer_up_merge', '向上合并', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (91, '向下合并', 'htms._subsystem_layout_designer_down_merge', '向下合并', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (92, '向左合并', 'htms._subsystem_layout_designer_left_merge', '向左合并', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (93, '向右合并', 'htms._subsystem_layout_designer_right_merge', '向右合并', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (94, '删除行', 'htms._subsystem_layout_designer_delete_row', '删除行', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (95, '删除列', 'htms._subsystem_layout_designer_delete_col', '删除列', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (96, '保存模板', 'htms._subsystem_layout_designer_save_template', '保存模板', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (97, '发布模板', 'htms._subsystem_layout_designer_publish_template', '发布模板', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (98, '定制栏目', 'htms._subsystem_layout_designer_define_column', '定制栏目', '/', 83, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (99, '栏目管理', 'htms._subsystem_column_manage', '栏目管理', 'contoller.do?operation=listSubSystemColumn&curpage=1&columnNameSH=&sysId=1', 53, '17', '0', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (100, '新增', 'htms._subsystem_column_manage_new', '新增栏目', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (101, '保存', 'htms._subsystem_column_manage_new_save', '新增保存栏目', '/', 100, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (102, '返回', 'htms._subsystem_column_manage_new_return', '新增栏目返回', '/', 100, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (103, '删除', 'htms._subsystem_column_manage_delete', '删除栏目', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (104, '修改', 'htms._subsystem_column_manage_modify', '修改栏目', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (105, '保存', 'htms._subsystem_column_manage_modify_save', '修改栏目保存', '/', 104, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (106, '返回', 'htms._subsystem_column_manage_modify_return', '修改栏目返回', '/', 104, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (107, '查看', 'htms._subsystem_column_manage_view', '查看栏目', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (108, '返回', 'htms._subsystem_column_manage_view_return', '查看栏目返回', '/', 107, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (109, '是否有效', 'htms._subsystem_column_manage_isvalidate', '是否有效', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (110, '搜索', 'htms._subsystem_column_manage_search', '搜索栏目', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (111, '重置', 'htms._subsystem_column_manage_reset', '重置栏目搜索条件', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (112, '分配栏目角色', 'htms._subsystem_column_manage_assignrole', '分配栏目角色', '/', 99, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (113, '保存', 'htms._subsystem_column_manage_assignrole_save', '分配栏目角色保存', '/', 112, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (114, '返回', 'htms._subsystem_column_manage_assignrole_return', '分配栏目角色返回', '/', 112, '16', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (115, '信息管理', 'htms._subsystem_information_manage', '信息管理', '/', 53, '17', '0', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (116, '我的访问记录', 'htms._subsystem_info_mng_accessrecord', '我的访问记录', 'contoller.do?operation=viewSubSystemWebRef&sysId=1&columnId=1', 115, '17', '0', 1, 1, '0', null, 1, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (117, '通知公告', 'htms._subsystem_info_mng_noticeannounce', '通知公告', 'contoller.do?operation=listSubSystemNews&sysId=1&columnId=2', 115, '17', '0', 1, 1, '0', null, 2, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (118, '我的事务', 'htms._subsystem_info_mng_idobusiness', '我的事务', 'contoller.do?operation=viewSubSystemWebPart&sysId=1&columnId=3', 115, '17', '0', 1, 1, '0', null, 3, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (119, '部门通知', 'htms._subsystem_info_mng_departnotice', '部门通知', 'contoller.do?operation=listSubSystemNews&sysId=1&columnId=4', 115, '17', '0', 1, 1, '0', null, 4, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (120, '备忘录', 'htms._subsystem_info_mng_toremind', '备忘录', 'contoller.do?operation=viewSubSystemWebPart&sysId=1&columnId=5', 115, '17', '0', 1, 1, '0', null, 5, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (121, '学校新闻', 'htms._subsystem_info_mng_schoolnews', '学校新闻', 'contoller.do?operation=listSubSystemNews&sysId=1&columnId=6', 115, '17', '0', 1, 1, '0', null, 6, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (122, '公共应用系统', 'htms._subsystem_info_mng_commonbusiness', '公共应用系统', 'contoller.do?operation=listSubSystemPicLink&sysId=1&columnId=7', 115, '17', '0', 1, 1, '0', null, 7, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (123, '我的邮件', 'htms._subsystem_info_mng_myemail', '我的邮件', 'contoller.do?operation=viewSubSystemWebPart&sysId=1&columnId=8', 115, '17', '0', 1, 1, '0', null, 8, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (124, '其他应用系统', 'htms._subsystem_info_mng_otherfunction', '其他应用系统', 'contoller.do?operation=listSubSystemPicLink&sysId=1&columnId=9', 115, '17', '0', 1, 1, '0', null, 9, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (125, ' 信息管理', 'htms_info_manage', '恒逸物流配送管理系统 信息管理', '/', 1, '17', '0', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (126, '物流管理', 'logistic_subsystem_module_manage', '物流模块', '/', 1, '17', '1', 5, 1, '0', null, null, 17, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (127, '销售订单', 'sales_subsystem_module_manage', '销售模块', '/', 1, '17', '1', 1, 1, '0', null, null, 16, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (128, '基础数据', 'dictionary_subsystem_module_manage', '字典模块', '/', 1, '17', '1', 9, 1, '0', null, null, 15, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (129, '产品类型管理', 'producttype_subsystem_obj_manage', '产品类型', 'contoller.do?operation=listProductType', 128, '17', '1', 3, 1, '0', null, null, 15, 312);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (130, '产品管理', 'product_subsystem_obj_manage', '产品', 'contoller.do?operation=listProduct', 128, '17', '1', 5, 1, '0', null, null, 15, 313);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (131, '厂区管理', 'factory._subsystem_obj_manage', '厂区', 'contoller.do?operation=listFactory', 128, '17', '1', 1, 1, '0', null, null, 15, 314);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (132, '线路管理', 'route_subsystem_obj_manage', '线路', 'contoller.do?operation=listRoute', 126, '17', '1', 3, 1, '0', null, null, 15, 315);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (133, '地址库管理', 'area_subsystem_obj_manage', '地址库', 'contoller.do?operation=listArea', 128, '17', '1', 7, 1, '0', null, null, 15, 316);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (134, '客户地址库', 'customeraddr_subsystem_obj_manage', '客户地址库', 'contoller.do?operation=listCustomerAddr', 127, '17', '1', 7, 1, '0', null, null, 16, 317);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (135, '运价管理', 'transprice_subsystem_obj_manage', '运价', 'contoller.do?operation=listTransPrice', 126, '17', '1', 5, 1, '0', null, null, 15, 318);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (136, '客户管理', 'customer_subsystem_obj_manage', '客户', 'contoller.do?operation=listCustomer', 127, '17', '1', 5, 1, '0', null, null, 16, 319);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (137, '派车明细', 'senddetail._subsystem_obj_manage', '派车明细', 'contoller.do?operation=listSendDetail', 126, '17', '0', 1, 1, '0', null, null, 17, 320);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (138, '发货申请', 'custorder_subsystem_obj_manage', '订单', 'contoller.do?operation=listCustOrder', 127, '17', '1', 1, 1, '0', null, null, 16, 321);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (139, '运单明细', 'transportdetail._subsystem_obj_manage', '运单明细', 'contoller.do?operation=listTransportDetail', 126, '17', '0', 1, 1, '0', null, null, 17, 322);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (140, '我的申请', 'ship_subsystem_obj_manage', '发货申请', 'contoller.do?operation=listShip', 127, '17', '1', 3, 1, '0', null, null, 16, 323);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (141, '排车管理', 'send_subsystem_obj_manage', '派车单', 'contoller.do?operation=listSend', 153, '17', '1', 3, 1, '0', null, null, 17, 324);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (142, '订单明细', 'custorderdetail._subsystem_obj_manage', '订单明细', 'contoller.do?operation=listCustOrderDetail', 127, '17', '0', 1, 1, '0', null, null, 16, 325);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (143, '运单管理', 'transport_subsystem_obj_manage', '运单', 'contoller.do?operation=listTransport', 153, '17', '1', 1, 1, '0', null, null, 17, 326);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (144, '车辆管理', 'vehicle_subsystem_obj_manage', '车辆', 'contoller.do?operation=listVehicle', 153, '17', '1', 5, 1, '0', null, null, 17, 327);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (145, '司机管理', 'driver_subsystem_obj_manage', '司机', 'contoller.do?operation=listDriver', 153, '17', '1', 7, 1, '0', null, null, 17, 328);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (146, '承运商管理', 'carrier_subsystem_obj_manage', '承运商', 'contoller.do?operation=listCarrier', 126, '17', '1', 7, 1, '0', null, null, 17, 329);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (147, '申请明细', 'shipdetail._subsystem_obj_manage', '申请明细', 'contoller.do?operation=listShipDetail', 127, '17', '0', 1, 1, '0', null, null, 16, 330);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (148, '调拨明细', 'transferdetail._subsystem_obj_manage', '调拨明细', 'contoller.do?operation=listTransferDetail', 126, '17', '0', 1, 1, '0', null, null, 17, 331);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (149, '调拨单管理', 'transfer._subsystem_obj_manage', '调拨单', 'contoller.do?operation=listTransfer', 126, '17', '1', 1, 1, '0', null, null, 17, 332);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (150, '物流公司管理', 'logistics_subsystem_obj_manage', '物流公司', 'contoller.do?operation=listLogistics', 128, '17', '1', 9, 1, '0', null, null, 17, 333);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (151, '任务调度', 'htms_task_schedule', '任务调度', 'contoller.do?operation=listScheduleTask', 2, '17', '1', 7, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (152, '内勤审批', 'htms_neiqun', '', '/', 1, '17', '1', 3, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (153, '承运商管理', 'htms_carirr_manage', '', '/', 1, '17', '1', 7, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (154, '申请审批', 'htms_apply_approve', '申请审批', 'contoller.do?operation=listApproveShip', 152, '17', '1', 1, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (155, '日志管理', 'htms_system_logmng', '日志管理', 'contoller.do?operation=listLog', 2, '17', '1', 8, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (157, '发货申请管理', 'htms_manage_shiplist', '', 'contoller.do?operation=managerListShip', 127, '17', '1', 9, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (158, '客户运价管理', 'htms_customer_price_manage', '客户运价管理', 'contoller.do?operation=listCustomerPrice', 126, '17', '1', 9, 1, '0', null, null, null, null);

insert into tb_wsm_privilege (PRIVID, PRIVNAME, PRIVCODE, PRIVDESC, PRIVADDR, PRIVPARENTID, PRIVTYPE, ISVALIDATE, PRIVORDER, SYSID, ISDEFAULT, DEFAUTLID, COLUMNID, MODULEID, OBJID)
values (159, '贸易商自提管理', 'self_fetch', '贸易商自提', 'contoller.do?operation=listSelfFtech', 126, '17', '1', 11, 1, '0', null, null, null, null);





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
values (1, 'admin', '111', '管理员', '22', '', '', '', '', '', '', '', '', '1', 35, '', '001,015', '12000077', '', 4, 1, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (2, 'sales', '111', '销售测试', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 31, '', '001', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (3, 'wlgs', '111', '物流公司', '22', '', '13567899876', '', '', '', '', '1         ', '', '1', 34, '', '', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (4, 'cys', '111', '承运商', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 35, '', '', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (5, 'nqsp', '111', '内勤人员', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 32, '', '', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (6, '99600022', '111', '测试', '23', '', '13567899876', '', '', '', '', '1         ', '', '1', 32, '', '001,015', '', '', null, null, null, '', '', '');

insert into tb_wsm_user (USERID, ACCOUNT, PASSWORD, USERNAME, SEX, TEL, MOBILE, EMAIL, QQ, DEPARTMENT, SUBDEPARTMENT, ORDERID, ISAUTH, ISVALIDATE, USERTYPE, PHOTO, SALESNO, EMPLOYNO, OAUSER, CARRIERID, CUSTOMERTYPE, SELFFETCH, FETCHDRIVER, FETCHMOBILE, FETCHCAR)
values (7, '0009010011', '123', '业务员', '22', '', '138xxxxxxxx', '', '', '', '', '', '', '1', 31, '', '001,015', '', '', null, 0, null, '', '', '');

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






