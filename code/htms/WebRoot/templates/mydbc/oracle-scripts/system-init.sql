  
-------------------------- 2）系统结构模型初始化数据，包括系统、频道、布局、布局单元、栏目、及相互关系------------------------------
--下面tb_system,tb_wsm_column的SYSCODE,SYSNAME数据需要根据创建系统的特性进行修改
--##tb_system
insert into tb_system (SYSID, SYSCODE, SYSNAME, SYSPATH, SYSDESC, SHOWORDER, DEFROLEID, ISVALIDATE, ISINSIDE, USERDEFINE, USERID)
values (1, '$[mysystmpl]', '$[mysystmpl]', 'http://www.localhost.com', '$[mysystmpl]', 2, 1, 1, 1, 0, null);


--##tb_wsm_channel 
insert into tb_wsm_channel (CHANNELID, SYSID, INFOTYPEID, CHANNELNAME, CHANNELCODE, CHANNELURL, SELECTEDCLASS, DEFAULTCLASS, CHANNELDESC, LOADSTYLE, ISVALIDATE, DEFAULTORDER, DEFAULTSHOW, DEFAULTSELECT, BEFOREICON, AFTERICON, SHOWHEIGHT, USERDEFINE, USERID)
values (1, 1, null, '{$mydbc.system.init.system.channel.name#}', '', '', '', '', '{$mydbc.system.init.system.channel.desc#}', '1', 1, 1, 1, 1, 'simpleupload/themes/icons/$[mysystmpl]/house.png', '', 800, 0, null);

--##tb_wsm_layout
insert into tb_wsm_layout (LAYOUTID, CHANNELID, LAYOUTNAME, LAYOUTTEMPL, LAYOUTLOGO, LAYOUTSELECTEDLOGO, LAYOUTDESC, ISVALIDATE, DEFAULTORDER, DEFAULTSELECT, DEFAULTSHOW, USERDEFINE, USERID)
values (1, 1, '{$mydbc.system.init.system.layout.name#}', '1.jsp', '', '', '{$mydbc.system.init.system.layout.name#}', 1, 1, 1, 1, 0, null);

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
values (1, null, 1, 5, '{$mydbc.system.init.system.column.accessrecord.name#}', 'My_access_record', '', '', 'jsp/wsites/$[mysystmpl]/specify/access_record.jsp', '1', '{$mydbc.system.init.system.column.accessrecord.desc#}', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (2, null, 1, 2, '{$mydbc.system.init.system.column.notification.name#}', 'Notification_announcement', '', '../plugins/news/index8list.jsp', 'contoller.do?operation=listWebSiteNewsList&curpage=0&perPageCount=12&forward=jsp/wsites/$[mysystmpl]/plugins/news/list.jsp', '1', '{$mydbc.system.init.system.column.notification.desc#}', '1', '', '10', '13', '7', '11', 8, null, null, 1, 1, '', '', 0, 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columnCode=$[columnCode]&forward=jsp/wsites/$[mysystmpl]/plugins/news/view.jsp', 1, 1, 1, 1, 269, -1, 1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (3, null, 1, 9, '{$mydbc.system.init.system.column.idobusiness.name#}', 'I_do_business', '', '', '', '1', '{$mydbc.system.init.system.column.idobusiness.desc#}', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (4, null, 1, 2, '{$mydbc.system.init.system.column.departmentnotice.name#}', 'Department_notice', '', '../plugins/news/index8list.jsp', 'contoller.do?operation=listWebSiteNewsList&curpage=0&perPageCount=12&forward=jsp/wsites/$[sysCode]/plugins/news/list.jsp', '1', '{$mydbc.system.init.system.column.departmentnotice.desc#}', '1', '', '10', '13', '7', '11', 8, null, null, 1, 1, '', '', 0, 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columnCode=$[columnCode]&forward=jsp/wsites/$[mysystmpl]/plugins/news/view.jsp', 1, 1, 1, 1, 267, -1, 1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (5, null, 1, 9, '{$mydbc.system.init.system.column.toremind.name#}', 'To_remind', '', '', 'jsp/wsites/$[mysystmpl]/specify/to_remain.jsp', '1', '{$mydbc.system.init.system.column.toremind.desc#}', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (6, null, 1, 2, '{$mydbc.system.init.system.column.schoolnews.name#}', 'School_news', '', '../plugins/news/index8list.jsp', 'contoller.do?operation=listWebSiteNewsList&curpage=0&perPageCount=12&forward=jsp/wsites/$[currentSysCode]/plugins/news/list.jsp', '1', '{$mydbc.system.init.system.column.schoolnews.desc#}', '1', '', '10', '13', '7', '11', 8, null, null, 1, 1, '', '', 0, 'contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]&columnName=$[columnName]&columnId=$[columnId]&columnCode=$[columnCode]&forward=jsp/wsites/$[currentSysCode]/plugins/news/view.jsp', 1, 1, 1, 1, 267, -1, 1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (7, null, 1, 7, '{$mydbc.system.init.system.column.commonbusiness.name#}', 'Common_business_system', '', '', '', '1', '{$mydbc.system.init.system.column.commonbusiness.desc#}', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (8, null, 1, 9, '{$mydbc.system.init.system.column.email.name#}', 'My_mail', '', '', '', '1', '{$mydbc.system.init.system.column.email.desc#}', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 180, -1, -1, 0, null, null);

insert into tb_wsm_column (COLUMNID, PARENTCOLUMNID, SYSID, INFOTYPEID, COLUMNNAME, COLUMNCODE, LOGO, CONTENTLINK, MORELINK, ISASYNCLOAD, COLUMNDESC, ISVALIDATE, COLUMNLOADER, COLUMNSKIN, INDEXCOLUMNSKIN, VIEWCOLUMNSKIN, LISTCOLUMNSKIN, INDEXSHOWNUM, LISTSHOWNUM, INDEXSHOWLEN, ISDEFAULTLOAD, DEFAULTMOVE, BEFOREICON, AFTERICON, JUSTCONTENT, VIEWLINK, DEFAULTORDER, DEFAULTSHOW, DEFAULTOPEN, ISPERSONALIZE, CONTENTHEIGHT, CONTENTWIDTH, ISMORE, USERDEFINE, USERID, COLUMNCONTENT)
values (9, null, 1, 7, '{$mydbc.system.init.system.column.otherfunction.name#}', 'Other_business_functions', '', '../plugins/piclink/indexlist.jsp', '', '1', '{$mydbc.system.init.system.column.otherfunction.desc#}', '1', '', '16', '13', '6', '15', null, null, null, 1, 1, '', '', 0, '', 1, 1, 1, 1, 269, -1, -1, 0, null, null);


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


