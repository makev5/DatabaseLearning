--创建SPJ数据库
create database SPJ;

--使用数据库
use SPJ

--创建S表
create table s(
	sno char(4) PRIMARY KEY,
	sname varchar(20),
	status char(4),
	city varchar(20)
)
--创建P表
create table p(
	pno char(4) PRIMARY KEY,
	pname varchar(20),
	color char(4),
	weight varchar(4)
)
--创建J表
create table j(
	jno char(4) PRIMARY KEY,
	jname varchar(20),
	city varchar(20)
)
--创建SPJ表
create table spj(
	sno char(4),
	pno char(4),
	jno char(4),
	qty char(4),
	FOREIGN key(sno) references s(sno),
	FOREIGN key(pno) references p(pno),
	FOREIGN key(jno) references j(jno)
)

--插入数据·
insert into s values('S1', '精益', '20', '天津'),
					('S2', '盛锡', '10', '北京'),
					('S3', '东方红', '30', '北京'),
					('S4', '丰泰盛', '20', '天津'),
					('S5', '为民', '30', '上海')
					
insert into p values('P1', '螺母', '红', '12'),
					('P2', '螺栓', '绿', '17'),
					('P3', '螺丝刀', '蓝', '14'),
					('P4', '螺丝刀', '红', '14'),
					('P5', '凸轮', '蓝', '40'),
					('P6', '齿轮', '红', '30')
					
insert into j values('J1', '三建', '北京'),
					('J2', '一汽', '长春'),
					('J3', '弹簧厂', '天津'),
					('J4', '造船厂', '天津'),
					('J5', '机车厂', '唐山'),
					('J6', '无线电厂', '常州'),
					('J7', '半导体厂', '南京')
					
insert into spj values ('S1', 'P1', 'J1', '200'),
					   ('S1', 'P1', 'J3', '100'),
					   ('S1', 'P1', 'J4', '700'),
					   ('S1', 'P2', 'J2', '100'),
					   ('S2', 'P3', 'J1', '400'),
					   ('S2', 'P3', 'J2', '200'),
					   ('S2', 'P3', 'J4', '500'),
					   ('S2', 'P3', 'J5', '400'),
					   ('S2', 'P5', 'J1', '400'),
					   ('S2', 'P5', 'J2', '100'),
					   ('S3', 'P1', 'J1', '200'),
					   ('S3', 'P3', 'J1', '200'),
					   ('S4', 'P5', 'J1', '100'),
					   ('S4', 'P6', 'J3', '300'),
					   ('S4', 'P6', 'J4', '200'),
					   ('S5', 'P2', 'J4', '100'),
					   ('S5', 'P3', 'J1', '200'),
					   ('S5', 'P6', 'J2', '200'),
					   ('S5', 'P6', 'J4', '500')
					   
--查询四张表数据
select * from s
select * from p
select * from j
select * from spj

--(1)求供应工程J1零件的供应商号码SNO
select distinct sno
from spj
where jno='J1'

--(2)求供应工程J1零件P1的供应商号码SNO
select sno
from spj
where jno='j1' and pno='p1'

--(3)求供应工程J1零件为红色的供应商号码SNO
select sno
from spj,p
where jno='j1' and p.pno=spj.pno and color='红'

--(4)求没有使用天津供应商生产的红色零件的工程号JNO
select jno
from j
where jno not in(
select jno
from j
where city='天津')

--(5)求至少用了供应商S1所供应的全部零件的工程号JNO
select j.jno
from j,spj
where sno='S1' and j.jno=spj.jno

