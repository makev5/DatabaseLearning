/* ɾ�����ݿ� */
if exists (select * from sys.databases where name = 'make')
	drop database make if exists (select * from sys.databases where name = 'make')
	drop database make

/* �������ݿ� */
create database make;

/* ʹ�����ݿ� */
use make;

/* ����Student �� */
create table Student
(
	Sno char(9) PRIMARY KEY,
	Sname char(20) unique,
	Ssex char(2),
	Sage smallint,
	Sdept varchar(20)
);

/* ����Course �� */
create table Course
(
	Cno char(4) PRIMARY KEY,
	Cname char(40) NOT NULL,
	Cpno char(4),
	Ccredit smallint,
);

/* ����SC �� */
create table SC
(
	Sno char(9),
	Cno char(4),
	Grade smallint,
	PRIMARY KEY(Sno, Cno),
	FOREIGN KEY(Sno) REFERENCES Student(Sno),
	FOREIGN KEY(Cno) REFERENCES Course(Cno)
);

/* �������� */
insert into Student values('200215121', '����', '��', 20, 'CS'),
						  ('200215122', '����', 'Ů', 19, 'CS'),
                          ('200215123', '����', 'Ů', 18, 'MA'),
                          ('200515125', '����', '��', 19, 'IS');

insert into Course values('1', '���ݿ�', '5', 4),
						 ('2', '��ѧ', '', 2),
                         ('3', '��Ϣϵͳ', '1', 4),
						 ('4', '����ϵͳ', '6', 3),
						 ('5', '���ݽṹ', '7', 4),
						 ('6', '���ݴ���', '', 2),
						 ('7', 'pascal����', '6', 4);   
						 
insert into SC values('200215121', '1', 92),
					 ('200215121', '2', 85),
					 ('200215121', '3', 88),
					 ('200215122', '2', 90),
					 ('200215122', '3', 80),
					 ('200215122', '1', 90);						                        
 
/* ��ѯ���� */                          
select * from Student;
select * from Course;
select * from SC;

