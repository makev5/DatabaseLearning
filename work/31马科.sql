-- 1����SC���в�ѯѡ���˿γ̵�ѧ��ѧ�š�ע��ȥ���ظ����С�
select distinct sno from sc;

-- 2����ѯ�Ȳ�����Ϣϵ����ѧϵ��Ҳ���Ǽ������ѧϵ��ѧ�����������Ա�
select sname, ssex from student where sdept not in('CS', 'MA', 'IS');

-- 3����ѯȫ��ѧ���������ѯ���������ϵ��ϵ���������У�ͬһϵ�е�ѧ�������併�����С�
select * from student order by sdept, Sage desc;

-- 4����ѯѡ����3�ſγ̵�ѧ����ѧ�ż���ɼ�����ѯ����������������С�
select sno, grade from sc where cno='3' order by grade desc;

-- 5����������ѡ�޿γ̺�Ϊ2��4��ѧ��ѧ��
select X.sno from sc X,sc Y where X.sno=Y.sno and X.cno=2 and Y.cno=4;

-- 6����ѯÿ��ѧ����ѧ�š�������ѡ�޵Ŀγ������ɼ�
select s.sno, sname, cname, grade 
from student s, Course, sc
where sc.cno=Course.Cno and sc.sno=s.Sno;


-- 7����ѯ��ѧ�ֳ���6�ֵ�ͬѧѧ�ţ�������ѡ�޿ε���������ѧ��
select sno, sname, COUNT(Cno), SUM(Ccredit)
from (select s.Sno, sname, c.Cno, c.Ccredit from student s, sc, Course c where s.Sno=sc.sno and c.Cno=sc.cno as sc1
group by Sno
having SUM(Ccredit)>6


-- 8����ѯѡ��1�ſγ̵�������Ů����������ʾ�κţ��Ա�������
select c.cno, s.ssex,COUNT(1) cnt
from student s, Course c, sc 
where s.Sno=sc.sno and c.Cno=sc.cno and sc.cno=1
group by c.cno,s.Ssex;

-- 9������ѧ2�ſγ̵�ѧ����������
select s.sno, sname
from sc, student s
where s.Sno=sc.sno and cno=2;

-- 10������ƽ���ɼ���ߵ�ѧ��ѧ�š�
select sno
from sc
group by sno
having AVG(grade)>=ALL
	(
		select AVG(grade) 
		from sc group by sno
	 )

-- 11����ѯû��ѡ��1�ſγ̵�ѧ��������
select sname
from student
where sno in(
select sno from sc where cno!=1);

-- 12����ѯѡ����ȫ���γ̵�ѧ��������
-- ����ѧ����ѡ����Ϣ������SC���У� Ҫ��֪��ĳ��ѧ���Ƿ�ѡ����ȫ���γ̣�����������Ҫ֪�����м��ſγ̣�������Ҫ����������Σ�ѧ��ѡ�������������Ҫɨ��SCȫ��ͳ�Ƴ�ѡ�������пγ̵�ѧ���ţ������STUDENT���и���ѧ���Ŵ������ ��
select sname
from student
where sno in(
	select Sno
	from sc 
	group by sno
	having COUNT(*) = (select COUNT(*) from Course)
)

-- 13����������ͬѧ��ѧ�Ŀγ̵Ŀγ̺š�
select distinct cno 
from sc
where cno not in(
select cno
from sc
where sno in(
	select sno
	from student
	where sname='����'
)
)

-- 14������ѧ�ű�����ͬѧ�󣬶��������С��ѧ��������
select sname
from student
where Sno>(
select sno
from student
where Sname='����') and sage<(select sage
from student
where Sname='����')

-- 15�����������Ůͬѧƽ���������ѧ�����������䡣
select Sname, Sage
from student 
where Sage>(
select AVG(Sage) 
from student 
where Ssex='Ů') and Ssex='��';

