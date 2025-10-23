USE DBLZ2
create table STUDENTS(
  ID int not null Identity(1,1) primary key,
  NAME char(20) not null,
  SURNAME char(20) not null,
  SECOND_NAME char(20),
  BIRTH char(20) not null,
  GROUP_NUM int not null
)

insert STUDENTS values
('П','Федоренко','Р','25.12.1997',1),
('О','Зингел ','','25.12.1985',1),
('Н','Савицкая','','22.09.1987',2),
('М','Ковальчук','Е','17.06.1992',2),
('Т','Ковриго','Р','13.05.1992',3),
('Н','Шарапо','','14.08.1992',3)


create table GROUPS(
  ID int not null identity(1,1) primary key,
  GROUP_NAME char(20) not null,
  COURS int not null
)


insert GROUPS values ('ПО-135',1),('ПО-235',2),('ПО-335',3)


alter table STUDENTS add CONSTRAINT fk_to_students FOREIGN key (GROUP_NUM) references GROUPS(ID)


create table SUBJECT(
	ID int not null identity(1,1) primary key,
   	SUBJ_NAME char(50) not null,
  	HOURS int not null
)


insert SUBJECT values 
('Физика',200),
('Математика',120),
('Основы алгоритмизации',70),
('Проектирование БД',130),
('Средства визуального программирования ',90),
('Объектно-ориентированное программирование',70)


create table PLANS(
	ID int not null Identity(1,1) primary key,
  	GROUP_NAME int not null,
  	SUB_NAME int not null
)


insert PLANS values (1,1),(2,2),(3,3),(1,4),(2,5),(3,6)


alter table PLANS add CONSTRAINT fk_to_plans FOREIGN key (GROUP_NAME) references GROUPS(ID)
alter table PLANS add CONSTRAINT fk_to_plans_2 FOREIGN key (SUB_NAME) references SUBJECT(ID)
 

select STUDENTS.ID, NAME,SURNAME,SECOND_NAME,BIRTH,GROUPS.GROUP_NAME,GROUPS.COURS from STUDENTS
    join GROUPS on GROUPS.ID = STUDENTS.GROUP_NUM


select PLANS.ID, SUBJ_NAME,COURS,HOURS from PLANS
 	join GROUPS on GROUPS.ID = PLANS.GROUP_NAME
    join SUBJECT on SUBJECT.ID = PLANS.SUB_NAME


update GROUPS Set GROUP_NAME = 'ПО-134' where ID = 1

delete from GROUPS where GROUP_NAME = 'ПО-135'

update SUBJECT set HOURS =+ 30 where ID in (5,6)

alter TABLE SUBJECT add STATUS varchar(25)
UPDATE SUBJECT set STATUS = 'ЗАЧЕТ' where ID in (5,6)

alter TABLE STUDENTS drop column SECOND_NAME



Create table STUD
(ID int not  null IDENTITY(1,1),
LAST_NAME nvarchar(25) not null,
F_NAME nvarchar(25) not null,
S_NAME nvarchar(25),
FORM_ADUC nvarchar(10) not null default 'очная',
FACULT nvarchar(10) not null default 'ФПМ',
YEAR int  not null default 1,
ALL_HOURS int default NULL,
INCLASS_HOURS int default NULL,
BIRTH date,
IN_DATE date,   
EXAM float default NULL,
CONSTRAINT PK_stud Primary key (ID)
);
insert into STUD 
(LAST_NAME,F_NAME,S_NAME,FORM_ADUC,FACULT,YEAR,ALL_HOURS,INCLASS_HOURS,BIRTH,IN_DATE,EXAM) values
(N'Стрынгель',N'К',null,N'заочная',N'ФПК',1,300,100,'19831212','20160901',8),
(N'Козлова',N'Д',N'Е',N'заочная',N'ФПК',2,300,100,'19831012','20150901',8.4),
(N'Федоров',N'Н',N'Н',N'заочная',N'ФПК',3,300,100,'19811207','20140901',7),
(N'Рингель',N'П',N'О',N'заочная',N'ФПК',3,300,100,'19730215','20160901',8),
(N'Бежик',N'Н',N'Н',N'вечерняя',N'ФПК',1,500,400,'19931211','2016-09-01',4.5),
(N'Осипчик',N'Н',N'Н',N'вечерняя',N'ФПК',1,500,400,'19831216','20150901',7.7),
(N'Белый',N'С',N'С',N'вечерняя',N'ФПК',2,450,370,'19870627','20150901',6.7),
(N'Ботяновский',N'А',N'С',N'вечерняя',N'ФПК',2,450,370,'19870723','20150901',7.6),
(N'Слободницкий',N'С',N'А',N'вечерняя',N'ФПК',2,450,370,'19870803','20150901',6.7),
(N'Рогатка',N'П',N'Р',N'очная',N'ФПМ',1,500,450,'19861027','20160901',7.4),
(N'Федоренко',N'П',N'Р',N'очная',N'ФПМ',1,500,450,'19950426','20160901',5.6),
(N'Зингель',N'П',N'В',N'очная',N'ФПМ',2,500,450,'19900425','20150901',3.4),
(N'Михеенок',N'Л',N'Н',N'очная',N'ФПМ',2,500,450,'19890313','20150901',5.3),
(N'Савицкая',N'Л',N'Н',N'очная',N'ФПМ',3,450,400, '19950705','20140901',7.7),
(N'Ковальчук',N'О',N'Е',N'заочная',N'ФПМ',1,350,100,'19640523','20160901',7.6),
(N'Заболотная',N'Л',N'И',N'заочная',N'ФПМ',1,350,100,'19860914','20160901',4.7),
(N'Ковриго',N'И',null,N'заочная',N'ФПМ',2,360,120,'19920301', '20150901',7.7),
(N'Шарапо',N'М',null,N'заочная',N'ФПМ',2,360,120,'19970325', '20150901',8.7),
(N'Сафроненко',N'Н',N'Л',N'заочная',N'ФПМ',3,370,130, '19920525','20140901',7.7),
(N'Зайцева',N'Т',N'Я',N'заочная',N'ФПМ',3,370,130,'19940725','20140901',5.6);

Create table TEACHERS
(ID int not  null IDENTITY(1,1),
LAST_NAME nvarchar(25) not null,
F_NAME nvarchar(25) not null,
S_NAME nvarchar(25),
SUBJECT nvarchar(150),
FORM_ADUC nvarchar(10) not null default 'очная',
FACULT nvarchar(10) not null default 'ФПМ',
YEAR int default 1 not NULL,
HOURS int default NULL,
BIRTH date,
WORK_START_DATE date,
CONSTRAINT PK_teach Primary key (ID)
);

insert into TEACHERS values
(N'Скворцов',N'К',null,N'Дифференциальные исчисления',N'очная',N'ФПМ',1,150,'19831212','20160901'),
(N'Скворцов',N'К',null,N'Геометрия и алгебра',N'очная',N'ФПМ',1,200,'19831212','20160901'),
(N'Сидоренко',N'Л',N'К',N'Теория вероятности',N'очная',N'ФПМ',1,100,'19831212','20160901'),
(N'Скворцов',N'К',null,N'Дифференциальные исчисления',N'заочная',N'ФПМ',1,34,'19831212','20160901'),
(N'Сидоренко',N'Л',N'К',N'Геометрия и алгебра',N'заочная',N'ФПМ',1,50,'19831212','20160901'),
(N'Сидоренко',N'Л',N'К',N'Теория вероятности',N'заочная',N'ФПМ',1,16,'19831212','20160901'),
(N'Круглов',N'К',N'Д',N'Теория множеств',N'очная',N'ФПМ',2,150,'19860825','20140901'),
(N'Круглов',N'К',N'Д',N'Методы численного анализа',N'очная',N'ФПМ',2,150,'19860825','20140901'),
(N'Загорова',N'К',N'Д',N'Прикладная статистика',N'очная',N'ФПМ',2,150,'19791005','20100901'),
(N'Круглов',N'К',N'Д',N'Теория множеств',N'заочная',N'ФПМ',2,40,'19860825','20140901'),
(N'Круглов',N'К',N'Д',N'Методы численного анализа',N'заочная',N'ФПМ',2,40,'19860825','20140901'),
(N'Загорова',N'К',N'Д',N'Прикладная статистика',N'заочная',N'ФПМ',2,40,'19791005','20100901'),
(N'Зуров',N'П',null,N'Философия',N'очная',N'ФПМ',3,50,'19780712','20160901'),
(N'Зуров',N'П',null,N'Социология',N'очная',N'ФПМ',3,50,'19780712','20160901'),
(N'Сидоренко',N'Л',N'К',N'Методы машинного обучения',N'очная',N'ФПМ',3,150,'19831212','20160901')


--Задание 1
SELECT LAST_NAME
FROM STUD 
where LAST_NAME like '%б%' or LAST_NAME like '%о%'

--Задание 2
select * 
from STUD
where LAST_NAME like 'К%' and S_NAME is null

--Задание 3
select *
from STUD
where len(LAST_NAME) >= 8

--Задание 4
select *
from STUD
where len(LAST_NAME) ! = 7 and LAST_NAME like '%а%'

--Задание 5
select * 
from STUD
where FACULT like 'ФПМ' and YEAR in (1,2)
order by LAST_NAME ASC

--Задание 6
select *
from STUD
where FACULT like 'ФПК' and FORM_ADUC like 'заочная' and EXAM >= 6
order by EXAM desc

--Задание 7
select *
from TEACHERS
order by LAST_NAME asc
 
 --Задание 8
select *
from TEACHERS
where FACULT like 'ФПМ' and YEAR = 1 and HOURS >100

--Задание 9
select *, DATEDIFF (YEAR, WORK_START_DATE, GETDATE()) as experience
from TEACHERS
where DATEDIFF (YEAR, WORK_START_DATE, GETDATE())>3 AND S_NAME is null 

--Задание 10
select SUBJECT
from TEACHERS 
where FACULT like 'ФПМ' and YEAR = 3

--Задание 11
select YEAR,FORM_ADUC,LAST_NAME,F_NAME,S_NAME
from TEACHERS
where FACULT like 'ФПМ'and HOURS >100

--Задание 12
select FACULT,YEAR, FORM_ADUC,LAST_NAME,F_NAME,S_NAME
from TEACHERS
where S_NAME is null

--Задание 13
select LAST_NAME,F_NAME,S_NAME,DATEDIFF (YEAR, BIRTH, GETDATE()) as AGE
from  TEACHERS
where DATEDIFF (YEAR, BIRTH, GETDATE()) > 30

--Задание 14
select LAST_NAME,F_NAME,S_NAME,DATEDIFF (YEAR, BIRTH, GETDATE()) as AGE
from  TEACHERS
where DATEDIFF (YEAR, BIRTH, GETDATE()) between 35 and 40
order by LAST_NAME asc

--Задание 15
select LAST_NAME,F_NAME,S_NAME,BIRTH
from  TEACHERS
where MONTH (BIRTH)= 10
order by BIRTH asc
