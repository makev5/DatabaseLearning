-- 1、在SC表中查询选修了课程的学生学号。注意去掉重复的行。
select distinct sno from sc;

-- 2、查询既不是信息系、数学系，也不是计算机科学系的学生的姓名和性别。
select sname, ssex from student where sdept not in('CS', 'MA', 'IS');

-- 3、查询全体学生情况，查询结果按所在系的系号升序排列，同一系中的学生按年龄降序排列。
select * from student order by sdept, Sage desc;

-- 4、查询选修了3号课程的学生的学号及其成绩，查询结果按分数降序排列。
select sno, grade from sc where cno='3' order by grade desc;

-- 5、检索至少选修课程号为2和4的学生学号
select X.sno from sc X,sc Y where X.sno=Y.sno and X.cno=2 and Y.cno=4;

-- 6、查询每个学生的学号、姓名、选修的课程名及成绩
select s.sno, sname, cname, grade 
from student s, Course, sc
where sc.cno=Course.Cno and sc.sno=s.Sno;


-- 7、查询总学分超过6分的同学学号，姓名，选修课的门数，总学分
select sno, sname, COUNT(Cno), SUM(Ccredit)
from (select s.Sno, sname, c.Cno, c.Ccredit from student s, sc, Course c where s.Sno=sc.sno and c.Cno=sc.cno as sc1
group by Sno
having SUM(Ccredit)>6


-- 8、查询选修1号课程的男生和女生人数，显示课号，性别，人数。
select c.cno, s.ssex,COUNT(1) cnt
from student s, Course c, sc 
where s.Sno=sc.sno and c.Cno=sc.cno and sc.cno=1
group by c.cno,s.Ssex;

-- 9、检索学2号课程的学号与姓名。
select s.sno, sname
from sc, student s
where s.Sno=sc.sno and cno=2;

-- 10、检索平均成绩最高的学生学号。
select sno
from sc
group by sno
having AVG(grade)>=ALL
	(
		select AVG(grade) 
		from sc group by sno
	 )

-- 11、查询没有选修1号课程的学生姓名。
select sname
from student
where sno in(
select sno from sc where cno!=1);

-- 12、查询选修了全部课程的学生姓名。
-- 首先学生的选课信息存在于SC表中， 要想知道某个学生是否选修了全部课程，至少我们需要知道共有几门课程，这是首要的条件。其次，学生选修了与否，我们又要扫描SC全表，统计出选修了所有课程的学生号，最后在STUDENT表中根据学生号打出姓名 。
select sname
from student
where sno in(
	select Sno
	from sc 
	group by sno
	having COUNT(*) = (select COUNT(*) from Course)
)

-- 13、检索刘晨同学不学的课程的课程号。
select distinct cno 
from sc
where cno not in(
select cno
from sc
where sno in(
	select sno
	from student
	where sname='刘晨'
)
)

-- 14、检索学号比刘晨同学大，而年龄比他小的学生姓名。
select sname
from student
where Sno>(
select sno
from student
where Sname='刘晨') and sage<(select sage
from student
where Sname='刘晨')

-- 15、求年龄大于女同学平均年龄的男学生姓名和年龄。
select Sname, Sage
from student 
where Sage>(
select AVG(Sage) 
from student 
where Ssex='女') and Ssex='男';

