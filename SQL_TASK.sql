Create database KeepNotesDB

create table UserRec
(
user_id int primary key, 
user_name varchar(20),
user_added_date date,
user_password varchar(14),
user_mobile bigint
)

Insert into UserRec values(112233,'Maya','2019-01-02','Maya1214',8012345679),(112244,'Nair','2019-01-11','Welcome',9023778467)
select * from UserRec

create table NoteRec
(
note_id int primary key, 
note_title varchar(30),
note_content varchar(50),
note_status varchar(20),
note_creation_date datetime,
user_id int references UserRec(user_id)
)


Insert into NoteRec values(1,'Today Tasks','1.Check emails and reply to them 2.Start the pro..','InProgress','2019-01-21',112233),
(2,'Training to plan','1.Application related 2.Technical related','Yet to start','2019-01-31',112244),
(3,'Things to have today','1.Fruits 2.More Water','InProgress','2019-01-25',112244)

select * from NoteRec

create table Category
(
category_id int primary key, 
category_name varchar(20),
category_descr varchar(30),
category_creation_date datetime,
category_creator int references UserRec(user_id)
)

Insert into Category values(1,'Official','Office related notes','2019-01-21',112233),
(2,'Diet','Health related notes','2019-01-24',112244)

select * from Category

create table Reminder
(
reminder_id int primary key, 
reminder_name varchar(20),
reminder_descr varchar(30),
reminder_type varchar(20),
reminder_creation_date datetime,
reminder_creator int references UserRec(user_id)
)

Insert into Reminder values(1,'KT reminder','Session on technical queries','Office Reminders','2019-02-12',112233),
(2,'Personal reminder','Pick children','Personal Reminders','2019-02-14',112244)

select * from Reminder

create table NoteCategory
(
notecategory_id int primary key,
note_id int references NoteRec(note_id),
category_id int references Category(category_id)
)
Insert into NoteCategory values(1,1,1),(2,2,1),(3,3,2)
select * from NoteCategory

create table NoteReminder
(
notereminder_id int primary key,
note_id int references NoteRec(note_id),
reminder_id int references Category(category_id)
)
Insert into NoteReminder values(1,3,2),(2,2,1)
select * from NoteReminder

select * from Category
select * from NoteCategory
select * from NoteReminder
select * from Reminder
select * from UserRec
select * from NoteRec

--Query 1:
Select * from UserRec where user_id=112233 and user_password='Maya1214'

--Query 2:
select * from NoteRec where note_creation_date='01-31-2019'

--Query 3:
select * from Category where category_creation_date>'01-22-2019'

--Query 4:
select * from Category where category_id =(select category_id from NoteRec where note_id=1)

--query5: 
select * from NoteRec where user_id=112244

--query6:
select * from NoteRec where user_id=(select category_creator from category where category_id = 1)

--query7:
select * from Reminder where reminder_creator=(select user_id from NoteRec where note_id=2)

--query 8:
Update  NoteRec set note_status='completed' where note_id=3
select * from NoteRec

--query 9:
Update Reminder set reminder_type='Personal Reminders' where reminder_creator= (Select user_id from NoteRec where note_id=1)
select * from Reminder

--query 10:
delete from NoteReminder where note_id=2
select * from NoteReminder