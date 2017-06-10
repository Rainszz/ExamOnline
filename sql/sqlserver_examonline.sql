CREATE database db_examOnline;
use db_examOnline;
go

--创建数据表
--账户表
create table t_account(
	aID int primary key identity(1,1), --账户编号
    aName varchar(20) not null,	--账户名
    aPwd varchar(20) not null,	--账户密码
    rType int not null,		--角色类型编号
    id int not null		--登录者的编号
);
create table t_role(
	rID int primary key,	--角色编号
    rName varchar(10) not null		--角色名称
);
--管理员表
create table t_manager(
	mID int primary key identity(1,1),	--管理员编号
    mName varchar(20) not null,	--管理员名称
    rID int	not null	--角色编号
);
--教师表
create table t_teacher(
	tID int primary key identity(1,1),	--教师帐号
	tName varchar(20) not null,	--教师名称
	tSex varchar(2) not null,	--教师性别
	tPos int not null,	--岗位：0:讲师;1:辅导员
    rID int	not null	--角色编号
);
--学生表
create table t_student(
	sID	varchar(20) primary key,	--学生编号
	sName varchar(10) not null,		--姓名
	sSex varchar(2) not null,		--性别
	entrance varchar(20) not null,	--入学年份
	classId int not null,		--班级
	majorId int not null,	--专业编号 
    rID int not null	--角色编号
);

--题目表
create table t_question(
	qId int primary key identity(1000,1),--题目编号
	qTitle varchar(100) not null,	--题目标题
	optionA varchar(100),	--选项A
	optionB varchar(100),	--选项B
	optionC varchar(100),	--选项C
	optionD varchar(100),	--选项D
	answer varchar(4) not null,	--答案
	qtId int not null,	--题目类型（单选、多选、机试）
	qdId int not null,	--难易程度
	qsId int not null,	--所属科目
);
--DROP TABLE t_question;
--题目难易表
create table t_qDifficuty(
	qdId int primary key identity(1,1),	--难易编号
	qdName varchar(10) not null,	--难易名称
);
--题目类型表
create table t_qType(
	qtId int primary key identity(1,1),	--类型编号
	qtName varchar(10) not null,	--类型名称
);
--题目所属科目表
create table t_qSub(
	qsId int primary key identity(1,1),	--科目编号
	qsName varchar(20) not null,	--科目名称
);
--专业表
create table t_major(
	mjId int primary key identity(1,1),	--专业编号
	mjName varchar(20) not null,	--专业名称
);
--试卷表
create table t_paper(
	pId int primary key identity(1,1),	--试卷编号
	pName varchar(20) not null,	--试卷名称
	pTime int not null,	--考试时间
	pTotalScore int not null,	--总分
	qsId int not null,	--所属科目
	mjId int not null,	--所属专业
	stId int not null,	--所属的阶段
	qNumber int not null,	--已选题目数
	qScore int not null,	--每题分数
	psId int not null,	--试卷的状态编号(启用、未启用)
);
--drop table t_paper;
--试卷的状态表
create table t_pState(
	psId int primary key identity(1,1),	--试卷的状态编号
	psName varchar(10) not null,	--状态的名称
);
--试卷-题目关系表
create table t_paper_question(
	pqId int primary key identity(1,1),	--关系编号
	pId int not null,	--试卷编号
	qId int not null,	--题目编号
)
--答题表
create table t_answer(
	aId int primary key identity(1,1),	--答题编号
	sID varchar(20) not null,	--答题的学生
	pId int not null,	--当前试卷编号
	qId int not null,	--当前题目编号
	answer varchar(4),	--学生答案 
);
--班级-试卷关系表
create table t_paper_class(
	pcId int primary key identity(1,1),	--关系编号
	pId int not null,	--试卷编号
	cId int not null,	--班级编号
);
--班级表
create table t_classInfo(
	cId int primary key identity(1,1),	--班级编号
	cCode varchar(20) not null,	--班级代码
	cName varchar(20) not null,	--班级名称
	mjId int not null,	--所属专业
	insId int not null,	--辅导员（teacher表外键）
	iecId int not null,	--讲师（teacher表外键）
	cDate date not null,	--开班日期
	cStuCount int not null,	--班级人数
	csId int not null,	--班级状态
	cRemark varchar(50)		--备注
);
--班级状态
create table t_classStatus(
	csId int primary key identity(1,1),	--状态编号
	csName varchar(20) not null,	--状态名称
);
--阶段表
create table t_stage(
	stId int primary key identity(1,1),	--阶段编号
	stName varchar(2) not null,	--阶段名称
);

--插入初始化数据
insert into t_account values ('admin','admin',4,1);
insert into t_account values ('yhl','123456',1,20150002);
insert into t_account values ('zzz','123456',2,1);
insert into t_manager values ('Admin',4);
insert into t_role values (1,'学生');
insert into t_role values (2,'讲师');
insert into t_role values (4,'管理员');
--测试数据查询
select * from t_manager;
insert into t_teacher values ('Kiss','男',0,2);
insert into t_student values ('20150002','闫华磊','男','2015',1,1,1);
select * from t_account;
select * from t_student;
select * from t_role


--插入数据
insert into t_qType values ('单选'),('多选'),('上机');
insert into t_qDifficuty values ('简单'),('普通'),('困难');
insert into t_qSub values ('计算机基础'),('PS'),('C语言'),('HTML'),('SQLBASE'),('JavaBase'),('javascript'),('SQL'),('Java'),('数据结构'),('JSP'),('Android');
insert into t_major values ('高软'),('3G4G'),('网络营销'),('UI'),('前端');
insert into t_pState values ('未开考'),('考试中'),('考试结束');
insert into t_classStatus values ('启用'),('未启用');
insert into t_stage values ('G1'),('G2'),('G3');


--题库列表
--根据专业和阶段查询的试卷信息
select * from t_paper where mjId = 1 and stId = 1
select stName from t_stage
--当前试卷包含的所有题目
select qId from t_paper_question where pId = 1;
--机试题总数
select count(*) from t_question where qid in (select qId from t_paper_question where pId = 1) and qtId = 3;
--选择题的总数
select count(*) from t_question  where qid in (select qId from t_paper_question where pId = 1) and qtId = 1 or qtId = 2;

select * from t_qType

insert into t_question values
	('以下命令中可以选择像素的是','套索工具','魔棒工具','色彩范围','羽化','A',1,1,2),
	('.Photoshop里变换对象的快捷键是','Ctrl+D',' Ctrl+T','Shift+D','Shift+T','A',1,1,2),
	('被称为计算机大脑的组件是？','CPU','内存','主板','显卡','A',1,1,1),
	('下面标识符正确的是？','class','￥money','$money','1_a','c',1,1,6),
	('下面哪个是Java语言中正确的标识符？','3com	','import','that','this','C',1,1,6),
	('下述概念中不属于面向对象方法的是？','对象、消息','继承、多态','类、封装','过程调用 ','D',1,1,6),
	('下面关于java中类的说法哪个是不正确的？','类体中只能有变量定义和成员方法的定义，不能有其他语句','构造函数是类中的特殊方法','类一定要声明为public的，才可以执行','一个java文件中可以有多个class定义','A',1,1,1),
	('c语言中预编译陈述对象是哪个？','include','public','private','prodect','A',1,1,6);

insert into t_paper values 
	('PS',100,100,2,1,1,50,2,1),
	('计算机基础_1',100,100,1,1,1,50,2,1),
	('计算机基础_1',100,100,1,2,1,50,2,1),
	('计算机基础_1',100,100,1,3,1,50,2,1),
	('计算机基础_1',100,100,1,4,1,50,2,2),
	('计算机基础_1',100,100,1,5,1,50,2,2),
	('Java基础',100,100,6,1,1,50,2,1),
	('C语言',100,100,3,2,1,50,2,1),
	('C语言',100,100,3,3,1,50,2,1),
	('Java基础',100,100,6,2,1,50,2,1);
insert into t_paper_question values
	(9,1006)
	(1,1000),
	(2,1000),
	(3,1000),
	(4,1000),
	(5,1000),
	(6,1001),
	(6,1002),
	(6,1003),
	(6,1004),
	(7,1001),
	(7,1002),
	(7,1003),
	(7,1004),
	(8,1005),
	(8,1005);

--根据pid查询机试题
select qId from t_paper_question where pId = 1;
select * from t_question where qtId = 3 and qId in (select qId from t_paper_question where pId = 1);