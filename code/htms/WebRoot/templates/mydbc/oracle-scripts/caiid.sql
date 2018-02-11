create table CAIID_COLUMN_PARAMS
(
  CAIID INTEGER not null
);
alter table CAIID_COLUMN_PARAMS
  add constraint PK_CAIID_COLUMN_PARAMS primary key (CAIID);

create table CAIID_INFOTYPE_PARAMS
(
  CAIID INTEGER not null
);
alter table CAIID_INFOTYPE_PARAMS
  add constraint PK_CAIID_INFOTYPE_PARAMS primary key (CAIID);

create table CAIID_SERVICE_LIST
(
  CAIID INTEGER not null
);
alter table CAIID_SERVICE_LIST
  add constraint PK_CAIID_SERVICE_LIST primary key (CAIID);

create table CAIID_SERVICE_PARAMS
(
  CAIID INTEGER not null
);
alter table CAIID_SERVICE_PARAMS
  add constraint PK_CAIID_SERVICE_PARAMS primary key (CAIID);

create table CAIID_SQLQUERY_LIST
(
  CAIID INTEGER not null
);
alter table CAIID_SQLQUERY_LIST
  add constraint PK_CAIID_SQLQUERY_LIST primary key (CAIID);

create table CAIID_SQLQUERY_PARAMS
(
  CAIID INTEGER not null
);
alter table CAIID_SQLQUERY_PARAMS
  add constraint PK_CAIID_SQLQUERY_PARAMS primary key (CAIID);

create table CAIID_TB_DATASOURCE
(
  CAIID INTEGER not null
);
alter table CAIID_TB_DATASOURCE
  add constraint PK_CAIID_TB_DATASOURCE primary key (CAIID);


create table CAIID_TB_DICTIONARY
(
  CAIID INTEGER not null
);
alter table CAIID_TB_DICTIONARY
  add constraint PK_CAIID_TB_DICTIONARY primary key (CAIID);


create table CAIID_TB_DIC_TYPE
(
  CAIID INTEGER not null
);
alter table CAIID_TB_DIC_TYPE
  add constraint PK_CAIID_TB_DIC_TYPE primary key (CAIID);

create table CAIID_TB_SYSTEM
(
  CAIID INTEGER not null
);
alter table CAIID_TB_SYSTEM
  add constraint PK_CAIID_TB_SYSTEM primary key (CAIID);

create table CAIID_TB_WSM_BACKGROUND
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_BACKGROUND
  add constraint PK_CAIID_TB_WSM_BACKGROUND primary key (CAIID);

create table CAIID_TB_WSM_CHANNEL
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_CHANNEL
  add constraint PK_CAIID_TB_WSM_CHANNEL primary key (CAIID);

create table CAIID_TB_WSM_CHANNEL_COLUMN
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_CHANNEL_COLUMN
  add constraint PK_CAIID_TB_WSM_CHANNEL_COLUMN primary key (CAIID);

create table CAIID_TB_WSM_COLUMN
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_COLUMN
  add constraint PK_CAIID_TB_WSM_COLUMN primary key (CAIID);

create table CAIID_TB_WSM_CSS
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_CSS
  add constraint PK_CAIID_TB_WSM_CSS primary key (CAIID);

create table CAIID_TB_WSM_CSS_ITEM
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_CSS_ITEM
  add constraint PK_CAIID_TB_WSM_CSS_ITEM primary key (CAIID);


create table CAIID_TB_WSM_GROUP
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_GROUP
  add constraint PK_CAIID_TB_WSM_GROUP primary key (CAIID);

create table CAIID_TB_WSM_INFOTYPE
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_INFOTYPE
  add constraint PK_CAIID_TB_WSM_INFOTYPE primary key (CAIID);

create table CAIID_TB_WSM_INFO_COLUMN
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_INFO_COLUMN
  add constraint PK_CAIID_TB_WSM_INFO_COLUMN primary key (CAIID);

create table CAIID_TB_WSM_LAYOUT
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_LAYOUT
  add constraint PK_CAIID_TB_WSM_LAYOUT primary key (CAIID);

create table CAIID_TB_WSM_LINK_GROUP
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_LINK_GROUP
  add constraint PK_CAIID_TB_WSM_LINK_GROUP primary key (CAIID);

create table CAIID_TB_WSM_LINK_TYPE
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_LINK_TYPE
  add constraint PK_CAIID_TB_WSM_LINK_TYPE primary key (CAIID);

create table CAIID_TB_WSM_LOGIN_LOG
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_LOGIN_LOG
  add constraint PK_CAIID_TB_WSM_LOGIN_LOG primary key (CAIID);


create table CAIID_TB_WSM_ORGANIZATION
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_ORGANIZATION
  add constraint PK_CAIID_TB_WSM_ORGANIZATION primary key (CAIID);

create table CAIID_TB_WSM_PRIVILEGE
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_PRIVILEGE
  add constraint PK_CAIID_TB_WSM_PRIVILEGE primary key (CAIID);

create table CAIID_TB_WSM_ROLE
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_ROLE
  add constraint PK_CAIID_TB_WSM_ROLE primary key (CAIID);

create table CAIID_TB_WSM_SKIN
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_SKIN
  add constraint PK_CAIID_TB_WSM_SKIN primary key (CAIID);

create table CAIID_TB_WSM_SYS_CONF
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_SYS_CONF
  add constraint PK_CAIID_TB_WSM_SYS_CONF primary key (CAIID);

create table CAIID_TB_WSM_THEMES
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_THEMES
  add constraint PK_CAIID_TB_WSM_THEMES primary key (CAIID);

create table CAIID_TB_WSM_USER
(
  CAIID INTEGER not null
);
alter table CAIID_TB_WSM_USER
  add constraint PK_CAIID_TB_WSM_USER primary key (CAIID);

create table CAIID_THEMES_DEFINE_TYPE
(
  CAIID INTEGER not null
);
alter table CAIID_THEMES_DEFINE_TYPE
  add constraint PK_CAIID_THEMES_DEFINE_TYPE primary key (CAIID);

create table CAIID_THEMES_PARAMS
(
  CAIID INTEGER not null
);
alter table CAIID_THEMES_PARAMS
  add constraint PK_CAIID_THEMES_PARAMS primary key (CAIID);

create table CAIID_THEMES_SELECT_VALUE
(
  CAIID INTEGER not null
);
alter table CAIID_THEMES_SELECT_VALUE
  add constraint PK_CAIID_THEMES_SELECT_VALUE primary key (CAIID);


insert into CAIID_COLUMN_PARAMS (CAIID)
values (0);
insert into CAIID_INFOTYPE_PARAMS (CAIID)
values (0);
insert into CAIID_SERVICE_LIST (CAIID)
values (0);
insert into CAIID_SERVICE_PARAMS (CAIID)
values (0);
insert into CAIID_SQLQUERY_LIST (CAIID)
values (0);
insert into CAIID_SQLQUERY_PARAMS (CAIID)
values (0);
insert into CAIID_TB_DATASOURCE (CAIID)
values (0);
insert into CAIID_TB_DICTIONARY (CAIID)
values (0);
insert into CAIID_TB_DIC_TYPE (CAIID)
values (0);
insert into CAIID_TB_SYSTEM (CAIID)
values (0);
insert into CAIID_TB_WSM_BACKGROUND (CAIID)
values (0);
insert into CAIID_TB_WSM_CHANNEL (CAIID)
values (0);
insert into CAIID_TB_WSM_CHANNEL_COLUMN (CAIID)
values (0);
insert into CAIID_TB_WSM_COLUMN (CAIID)
values (0);
insert into CAIID_TB_WSM_CSS (CAIID)
values (0);
insert into CAIID_TB_WSM_CSS_ITEM (CAIID)
values (0);
insert into CAIID_TB_WSM_GROUP (CAIID)
values (0);
insert into CAIID_TB_WSM_INFOTYPE (CAIID)
values (0);
insert into CAIID_TB_WSM_INFO_COLUMN (CAIID)
values (0);
insert into CAIID_TB_WSM_LAYOUT (CAIID)
values (0);
insert into CAIID_TB_WSM_LINK_GROUP (CAIID)
values (0);
insert into CAIID_TB_WSM_LINK_TYPE (CAIID)
values (0);
insert into CAIID_TB_WSM_LOGIN_LOG (CAIID)
values (0);
insert into CAIID_TB_WSM_ORGANIZATION (CAIID)
values (0);
insert into CAIID_TB_WSM_PRIVILEGE (CAIID)
values (0);
insert into CAIID_TB_WSM_ROLE (CAIID)
values (0);
insert into CAIID_TB_WSM_SKIN (CAIID)
values (0);
insert into CAIID_TB_WSM_SYS_CONF (CAIID)
values (0);
insert into CAIID_TB_WSM_THEMES (CAIID)
values (0);
insert into CAIID_TB_WSM_USER (CAIID)
values (0);
insert into CAIID_THEMES_DEFINE_TYPE (CAIID)
values (0);
insert into CAIID_THEMES_PARAMS (CAIID)
values (0);
insert into CAIID_THEMES_SELECT_VALUE (CAIID)
values (0);
commit;
