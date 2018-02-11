create tablespace htms
logging
datafile '/opt/oracle/app/oracle/oradata/orcl/htms.dbf' 
size 32m 
autoextend on 
next 32m maxsize 2048m
extent management local;


create user htms identified by htms
default tablespace htms;


grant connect,resource,mgmt_user,aq_administrator_role,dba to htms;


--查看被锁表
SELECT object_name, machine, s.sid, s.serial# 
FROM gv$locked_object l, dba_objects o, gv$session s 
WHERE l.object_id　= o.object_id 
AND l.session_id = s.sid; 
--清除被锁表
alter system kill session 'sid, serial#'; 
ALTER system kill session '132, 117'; 

--生成清除被锁表的SQL语句
SELECT   concat('alter system kill session  ''',concat(s.sid,concat(',', concat(s.serial#,''';')) ))
FROM gv$locked_object l, dba_objects o, gv$session s 
WHERE l.object_id　= o.object_id 
AND l.session_id = s.sid; 