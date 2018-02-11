export NLS_LANG=AMERICAN_AMERICA.AL32UTF8

exp cram/cram@ORCL  file=C:\MEWSpace\cram\docs\cram-2017-05-05.dmp owner=(cram)
exp cloud/cloud@ORCL  file=C:\MEWSpace\startCloud\docs\cloud-2016-10-31-bak.dmp owner=(cloud)
imp cram/cram@orcl  full=y file=C:\cram-2016-11-08-bak.dmp ignore=y
imp htms/htms@orcl  full=y file=C:\MyWorkSpace\htms\docs\htms-2017-08-05.dmp ignore=y

exp SSOUSER/ssouser888@ORCL  file=C:\SSOUSER.dmp owner=(SSOUSER)

select 'alter table  '|| table_name ||'  move tablespace CRAM;'  from user_tables;
select 'alter index '|| index_name ||' rebuild tablespace CRAM;' from user_indexes;
http://www.cnblogs.com/gw811/p/4120109.html

EXP htms/htms@ORCL    BUFFER=64000 file=C:\MyWorkSpace\hytms\docs\htms-area-2017-09-07.dmp  TABLES=(TB_HTMS_AREA) 


imp htms/htms@ORCL  full=y file=C:\htms-2017101201\htms-2017101201.dmp ignore=y


EXP myportal/myportal@ORCL    BUFFER=64000 file=C:\MEWSpace\dbbak\myportal-webinfo-2017-06-28.dmp  TABLES=(TB_WSM_INFO_WEB,TB_WSM_LINK,TB_WSM_SYS_CONF) 

EXP htms/htms1234@ORCL_23     file=C:\MyWorkSpace\hytms\docs\htms-2017-10-02.dmp owner=(htms)
imp htms/htms@ORCL  full=y file=C:\MyWorkSpace\hytms\docs\htms-2017-09-29.dmp ignore=y
EXP htms/htms@ORCL     file=C:\MyWorkSpace\hytms\docs\htms-2017-09-04.dmp owner=(htms)
EXP htms/htms1234@ORCL_23     file=C:\MyWorkSpace\hytms\docs\htms-20170921.dmp owner=(htms)

EXP  htms/htms1234@ORCL_23    BUFFER=64000 file=C:\MyWorkSpace\hytms\docs\htms-area-2017-09-27.dmp  TABLES=(TB_HTMS_AREA) 
EXP  htms/htms1234@ORCL_23    BUFFER=64000 file=C:\MyWorkSpace\hytms\docs\htms-TB_HTMS_FREIGHT-2017-09-27.dmp  TABLES=(TB_HTMS_FREIGHT) 
imp htms/htms@ORCL  full=y file=C:\MyWorkSpace\hytms\docs\htms-TB_HTMS_FREIGHT-2017-09-27.dmp ignore=y