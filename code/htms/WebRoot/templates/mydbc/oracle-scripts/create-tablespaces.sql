create tablespace systmpl
logging
datafile 'C:/oracle/product/10.2.0/oradata/orcl/systmpl.dbf' 
size 32m 
autoextend on 
next 32m maxsize 2048m
extent management local;


create user systmpl identified by systmpl
default tablespace systmpl;


grant connect,resource,mgmt_user,aq_administrator_role,dba to systmpl;