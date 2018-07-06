/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/7/4 17:05:24                            */
/*==============================================================*/


drop table if exists News_article;

drop table if exists News_liked;

drop table if exists News_type;

drop table if exists Permission;

drop table if exists Review;

drop table if exists Review_liked;

drop table if exists Role;

drop table if exists Role_Per_Rel;

drop table if exists User;

drop table if exists User_Follow_Rel;

/*==============================================================*/
/* Table: News_article                                          */
/*==============================================================*/
create table News_article
(
   id                   int not null auto_increment,
   type_id              int,
   title                varchar(128),
   Publish_time         datetime,
   content              text,
   from_host            varchar(128),
   read_total           int,
   primary key (id)
);

/*==============================================================*/
/* Table: News_liked                                            */
/*==============================================================*/
create table News_liked
(
   id                   int not null auto_increment,
   News_id              int,
   User_id              int,
   primary key (id)
);

/*==============================================================*/
/* Table: News_type                                             */
/*==============================================================*/
create table News_type
(
   id                   int not null auto_increment,
   name                 varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: Permission                                            */
/*==============================================================*/
create table Permission
(
   id                   int not null auto_increment,
   name                 varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: Review                                                */
/*==============================================================*/
create table Review
(
   ID                   int not null auto_increment,
   Use_id               int,
   News_id              int,
   Rev_content          varchar(256),
   primary key (ID)
);

/*==============================================================*/
/* Table: Review_liked                                          */
/*==============================================================*/
create table Review_liked
(
   R_liked_id           int not null auto_increment,
   ID                   int,
   Use_id               int,
   is_liked             bool,
   primary key (R_liked_id)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role
(
   id                   int not null auto_increment,
   name                 varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: Role_Per_Rel                                          */
/*==============================================================*/
create table Role_Per_Rel
(
   Per_id               int not null,
   Role_id              int not null,
   primary key (Per_id, Role_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   id                   int not null auto_increment,
   Rol_id               int,
   name                 varchar(16),
   password             varchar(256),
   Last_login_time      datetime,
   nick_name            varchar(32),
   head_icon            varchar(256),
   primary key (id)
);

/*==============================================================*/
/* Table: User_Follow_Rel                                       */
/*==============================================================*/
create table User_Follow_Rel
(
   id                   int not null,
   User_id              int not null,
   primary key (id, User_id)
);

alter table News_article add constraint FK_Relationship_4 foreign key (type_id)
      references News_type (id) on delete restrict on update restrict;

alter table News_liked add constraint FK_NEW_LIKED foreign key (News_id)
      references News_article (id) on delete restrict on update restrict;

alter table News_liked add constraint FK_N_LIKED_USER foreign key (User_id)
      references User (id) on delete restrict on update restrict;

alter table Review add constraint FK_Relationship_14 foreign key (Use_id)
      references User (id) on delete restrict on update restrict;

alter table Review add constraint FK_Relationship_15 foreign key (News_id)
      references News_article (id) on delete restrict on update restrict;

alter table Review_liked add constraint FK_REVIEW_LIKED foreign key (ID)
      references Review (ID) on delete restrict on update restrict;

alter table Review_liked add constraint FK_R_LIKED_USER foreign key (Use_id)
      references User (id) on delete restrict on update restrict;

alter table Role_Per_Rel add constraint FK_Role_Power_1 foreign key (Per_id)
      references Permission (id) on delete restrict on update restrict;

alter table Role_Per_Rel add constraint FK_Role_Power_2 foreign key (Role_id)
      references Role (id) on delete restrict on update restrict;

alter table User add constraint FK_Role_User foreign key (Rol_id)
      references Role (id) on delete restrict on update restrict;

alter table User_Follow_Rel add constraint FK_Relationship_12 foreign key (User_id)
      references User (id) on delete restrict on update restrict;

alter table User_Follow_Rel add constraint FK_Relationship_13 foreign key (id)
      references News_type (id) on delete restrict on update restrict;

