--����SPJ���ݿ�
create database SPJ;

--ʹ�����ݿ�
use SPJ

--����S��
create table s(
	sno char(4) PRIMARY KEY,
	sname varchar(20),
	status char(4),
	city varchar(20)
)
--����P��
create table p(
	pno char(4) PRIMARY KEY,
	pname varchar(20),
	color char(4),
	weight varchar(4)
)
--����J��
create table j(
	jno char(4) PRIMARY KEY,
	jname varchar(20),
	city varchar(20)
)
--����SPJ��
create table spj(
	sno char(4),
	pno char(4),
	jno char(4),
	qty char(4),
	FOREIGN key(sno) references s(sno),
	FOREIGN key(pno) references p(pno),
	FOREIGN key(jno) references j(jno)
)

--�������ݡ�
insert into s values('S1', '����', '20', '���'),
					('S2', 'ʢ��', '10', '����'),
					('S3', '������', '30', '����'),
					('S4', '��̩ʢ', '20', '���'),
					('S5', 'Ϊ��', '30', '�Ϻ�')
					
insert into p values('P1', '��ĸ', '��', '12'),
					('P2', '��˨', '��', '17'),
					('P3', '��˿��', '��', '14'),
					('P4', '��˿��', '��', '14'),
					('P5', '͹��', '��', '40'),
					('P6', '����', '��', '30')
					
insert into j values('J1', '����', '����'),
					('J2', 'һ��', '����'),
					('J3', '���ɳ�', '���'),
					('J4', '�촬��', '���'),
					('J5', '������', '��ɽ'),
					('J6', '���ߵ糧', '����'),
					('J7', '�뵼�峧', '�Ͼ�')
					
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
					   
--��ѯ���ű�����
select * from s
select * from p
select * from j
select * from spj

--(1)��Ӧ����J1����Ĺ�Ӧ�̺���SNO
select distinct sno
from spj
where jno='J1'

--(2)��Ӧ����J1���P1�Ĺ�Ӧ�̺���SNO
select sno
from spj
where jno='j1' and pno='p1'

--(3)��Ӧ����J1���Ϊ��ɫ�Ĺ�Ӧ�̺���SNO
select sno
from spj,p
where jno='j1' and p.pno=spj.pno and color='��'

--(4)��û��ʹ�����Ӧ�������ĺ�ɫ����Ĺ��̺�JNO
select jno
from j
where jno not in(
select jno
from j
where city='���')

--(5)���������˹�Ӧ��S1����Ӧ��ȫ������Ĺ��̺�JNO
select j.jno
from j,spj
where sno='S1' and j.jno=spj.jno

