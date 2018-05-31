 --DROP TABLE INSTA_LIKES
 --DROP TABLE INSTA_PICS
 --DROP TABLE INSTA_USERS
 
CREATE TABLE INSTA_USERS(
user_id number(5) primary key,
user_fname varchar2(20), 
user_lname varchar2(20),
email varchar2(20)
)


insert into INSTA_USERS values (1,'Apoorva','Chouhan','apoorva@hotmail.com')
insert into INSTA_USERS values (2,'Tejas','Jadhav','tejas@gmail.com')
insert into INSTA_USERS values (5,'Heta','Naik','heta@gmail.com')
insert into INSTA_USERS values (8,'Malak','Parmar','malak@yahoo.com')
insert into INSTA_USERS values (10,'Vatsal','Shah','vatsal@ hotmail.com')
insert into INSTA_USERS values (11,'Nymphia','Wanchoo','nymphia@ yahoo.com') 

 CREATE TABLE INSTA_PICS(
pic_id number(5) primary key,
pic_caption varchar2(50),
pic_path varchar2(50),
pic_date date,
user_id number(10) references INSTA_USERS(user_id),
arts number(1) DEFAULT 0 NOT NULL,
science number(1) DEFAULT 0 NOT NULL,
music number(1) DEFAULT 0 NOT NULL,
history number(1) DEFAULT 0 NOT NULL,
Engineering number(1) DEFAULT 0 NOT NULL
)

 

insert into INSTA_PICS values (1,'holiday','C:/pics/64565hrht4y.jpg','11-Mar-17',1,1,0,0,1,0)
insert into INSTA_PICS values (2,'holi','C:/mypics/64565hrhjjj4y.jpg','12-May-12',2,0,0,0,1,0)
insert into INSTA_PICS values (3,'bye','C:/photos/6456aa5t4y.jpg','01-Jan-17',5,0,1,0,1,0)
insert into INSTA_PICS values (4,'happy','D:/64565sjsjt4y.jpg','11-Feb-17',8,1,0,0,1,0)
insert into INSTA_PICS values (5,'ssup','D:/pictures/645jajht4y.jpg','11-Mar-17',10,1,0,0,0,1)
insert into INSTA_PICS values (6,'morning','C:/inpics/6akak65hrht4y.jpg','01-Apr-17',11,0,0,1,1,1)
insert into INSTA_PICS values (7,'night','C:/pics/647885hrht4y.jpg','11-Aug-17',1,1,0,1,1,1)
insert into INSTA_PICS values (8,'heyyyaa','C:/tj/pics/6kak565hrht4y.jpg','12-Jul-17',2,0,1,1,1,0)
insert into INSTA_PICS values (9,'hulalla','C:/files/pics/6jaja65hrht4y.jpg','11-Jul-08',8,0,0,0,1,0)
insert into INSTA_PICS values (10, 'yoooo', 'D:/mygalery/ajjarht4y.jpg', '02-Oct-18', 5,1,0,1,1,0)
insert into INSTA_PICS values (11, 'afternoon', 'C:/files/photos/ajaj565hrht4y.jpg', '03-Dec-10',10,1,0,0,1,1)
insert into INSTA_PICS values (12,'cyaaa','C:/files/img/aajht4y.jpg','04-Jul-11',11,1,0,0,1,1)
insert into INSTA_PICS values (13,'noname','C:/instaimgs/647885jsjrht4y.jpg','11-Nov-17',5,1,0,1,1,1)
insert into INSTA_PICS values (14,'justme','D:/instapic/642jmjmjht4y.jpg','11-Sep-17',2,1,0,1,0,1)



 CREATE TABLE INSTA_LIKES(
pic_id number(5) references INSTA_PICS(pic_id) not null,
user_id number(10) references INSTA_USERS(user_id) not null
)


insert into INSTA_LIKES values(1,1)
insert into INSTA_LIKES values(7,2) 
insert into INSTA_LIKES values(2,10)
insert into INSTA_LIKES values(7,5)
insert into INSTA_LIKES values(7,8)
insert into INSTA_LIKES values(7,11)
insert into INSTA_LIKES values(1,2)
insert into INSTA_LIKES values(11,10)
insert into INSTA_LIKES values(10,8)
insert into INSTA_LIKES values(9,5) 
insert into INSTA_LIKES values(10,11)
insert into INSTA_LIKES values(12,10) 
insert into INSTA_LIKES values(13,1)
insert into INSTA_LIKES values(8,1) 
insert into INSTA_LIKES values(2,5) 
insert into INSTA_LIKES values(1,5)
insert into INSTA_LIKES values(7,10)
insert into INSTA_LIKES values(6,2) 
insert into INSTA_LIKES values(14,5) 
insert into INSTA_LIKES values(2,1)
insert into INSTA_LIKES values(14,1)
insert into INSTA_LIKES values(5,1)
insert into INSTA_LIKES values(4,11)
insert into INSTA_LIKES values(2,2)
