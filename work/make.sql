/* 删除数据库 */
if exists (select * from sys.databases where name = 'make')
	drop database make if exists (select * from sys.databases where name = 'make')
	drop database make

/* 创建数据库 */
create database make;

/* 使用数据库 */
use make;

/* 创建Student 表 */
create table Student
(
	Sno char(9) PRIMARY KEY,
	Sname char(20) unique,
	Ssex char(2),
	Sage smallint,
	Sdept varchar(20)
);

/* 创建Course 表 */
create table Course
(
	Cno char(4) PRIMARY KEY,
	Cname char(40) NOT NULL,
	Cpno char(4),
	Ccredit smallint,
);

/* 创建SC 表 */
create table SC
(
	Sno char(9),
	Cno char(4),
	Grade smallint,
	PRIMARY KEY(Sno, Cno),
	FOREIGN KEY(Sno) REFERENCES Student(Sno),
	FOREIGN KEY(Cno) REFERENCES Course(Cno)
);

/* 插入数据 */
insert into Student values('200215121', '李勇', '男', 20, 'CS'),
						  ('200215122', '刘晨', '女', 19, 'CS'),
                          ('200215123', '王敏', '女', 18, 'MA'),
                          ('200515125', '张立', '男', 19, 'IS');

insert into Course values('1', '数据库', '5', 4),
						 ('2', '数学', '', 2),
                         ('3', '信息系统', '1', 4),
						 ('4', '操作系统', '6', 3),
						 ('5', '数据结构', '7', 4),
						 ('6', '数据处理', '', 2),
						 ('7', 'pascal语言', '6', 4);   
						 
insert into SC values('200215121', '1', 92),
					 ('200215121', '2', 85),
					 ('200215121', '3', 88),
					 ('200215122', '2', 90),
					 ('200215122', '3', 80),
					 ('200215122', '1', 90);						                        
 
/* 查询数据 */                          
select * from Student;
select * from Course;
select * from SC;

