DROP SEQUENCE Empl_seq ; 
create sequence Empl_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER Empl_PK_trig 
; 

create or replace trigger Empl_PK_trig 
before insert on Empl
for each row 
begin 
select Empl_seq.nextval into :new.Emp_id from dual; 
end; 
/

DROP SEQUENCE Files_seq ; 
create sequence Files_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER Files_PK_trig 
; 

create or replace trigger Files_PK_trig 
before insert on Files
for each row 
begin 
select Files_seq.nextval into :new.File_id from dual; 
end; 
/

DROP SEQUENCE Notice_List_seq ; 
create sequence Notice_List_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER Notice_List_PK_trig 
; 

create or replace trigger Notice_List_PK_trig 
before insert on Notice_List
for each row 
begin 
select Notice_List_seq.nextval into :new.List_Id from dual; 
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
