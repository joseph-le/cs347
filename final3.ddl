DROP SEQUENCE Empl_seq ; 
create sequence Empl_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger Empl_PK_trig 
before insert on Empl
for each row 
begin 
select Empl_seq.nextval into :new.Emp_id from dual; 
end; 
/
alter table Empl add created date ; 
alter table Empl add created_by VARCHAR2 (255) ; 
alter table Empl add row_version_number integer ; 
alter table Empl add updated date ; 
alter table Empl add updated_by VARCHAR2 (255) ; 
/
create or replace trigger Empl_AUD_trig 
before insert or update on Empl 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE Files_seq ; 
create sequence Files_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger Files_PK_trig 
before insert on Files
for each row 
begin 
select Files_seq.nextval into :new.File_id from dual; 
end; 
/
alter table Files add created date ; 
alter table Files add created_by VARCHAR2 (255) ; 
alter table Files add row_version_number integer ; 
alter table Files add updated date ; 
alter table Files add updated_by VARCHAR2 (255) ; 
/
create or replace trigger Files_AUD_trig 
before insert or update on Files 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE Notice_List_seq ; 
create sequence Notice_List_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger Notice_List_PK_trig 
before insert on Notice_List
for each row 
begin 
select Notice_List_seq.nextval into :new.List_Id from dual; 
end; 
/
alter table Notice_List add created date ; 
alter table Notice_List add created_by VARCHAR2 (255) ; 
alter table Notice_List add row_version_number integer ; 
alter table Notice_List add updated date ; 
alter table Notice_List add updated_by VARCHAR2 (255) ; 
/
create or replace trigger Notice_List_AUD_trig 
before insert or update on Notice_List 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP INDEX Empl_Emp_id_FK_0 ;
CREATE INDEX Empl_Emp_id_FK_0 ON Files(Empl_Emp_id) ;
DROP INDEX Empl_Emp_id_FK_1 ;
CREATE INDEX Empl_Emp_id_FK_1 ON NL_Members(Empl_Emp_id) ;
DROP INDEX Notice_List_List_Id_FK_2 ;
CREATE INDEX Notice_List_List_Id_FK_2 ON NL_Members(Notice_List_List_Id) ;
DROP INDEX Notice_List_List_Id1_FK_3 ;
CREATE INDEX Notice_List_List_Id1_FK_3 ON NL_Members(Notice_List_List_Id1) ;
