CREATE database db_examOnline;
use db_examOnline;
go

--�������ݱ�
--�˻���
create table t_account(
	aID int primary key identity(1,1), --�˻����
    aName varchar(20) not null,	--�˻���
    aPwd varchar(20) not null,	--�˻�����
    rType int not null,		--��ɫ���ͱ��
    id int not null		--��¼�ߵı��
);
create table t_role(
	rID int primary key,	--��ɫ���
    rName varchar(10) not null		--��ɫ����
);
--����Ա��
create table t_manager(
	mID int primary key identity(1,1),	--����Ա���
    mName varchar(20) not null,	--����Ա����
    rID int	not null	--��ɫ���
);
--��ʦ��
create table t_teacher(
	tID int primary key identity(1,1),	--��ʦ�ʺ�
	tName varchar(20) not null,	--��ʦ����
	tSex varchar(2) not null,	--��ʦ�Ա�
	tPos int not null,	--��λ��0:��ʦ;1:����Ա
    rID int	not null	--��ɫ���
);
--ѧ����
create table t_student(
	sID	varchar(20) primary key,	--ѧ�����
	sName varchar(10) not null,		--����
	sSex varchar(2) not null,		--�Ա�
	entrance varchar(20) not null,	--��ѧ���
	classId int not null,		--�༶
	majorId int not null,	--רҵ��� 
    rID int not null	--��ɫ���
);

--��Ŀ��
create table t_question(
	qId int primary key identity(1000,1),--��Ŀ���
	qTitle varchar(100) not null,	--��Ŀ����
	optionA varchar(100),	--ѡ��A
	optionB varchar(100),	--ѡ��B
	optionC varchar(100),	--ѡ��C
	optionD varchar(100),	--ѡ��D
	answer varchar(4) not null,	--��
	qtId int not null,	--��Ŀ���ͣ���ѡ����ѡ�����ԣ�
	qdId int not null,	--���׳̶�
	qsId int not null,	--������Ŀ
);
--DROP TABLE t_question;
--��Ŀ���ױ�
create table t_qDifficuty(
	qdId int primary key identity(1,1),	--���ױ��
	qdName varchar(10) not null,	--��������
);
--��Ŀ���ͱ�
create table t_qType(
	qtId int primary key identity(1,1),	--���ͱ��
	qtName varchar(10) not null,	--��������
);
--��Ŀ������Ŀ��
create table t_qSub(
	qsId int primary key identity(1,1),	--��Ŀ���
	qsName varchar(20) not null,	--��Ŀ����
);
--רҵ��
create table t_major(
	mjId int primary key identity(1,1),	--רҵ���
	mjName varchar(20) not null,	--רҵ����
);
--�Ծ��
create table t_paper(
	pId int primary key identity(1,1),	--�Ծ���
	pName varchar(20) not null,	--�Ծ�����
	pTime int not null,	--����ʱ��
	pTotalScore int not null,	--�ܷ�
	qsId int not null,	--������Ŀ
	mjId int not null,	--����רҵ
	stId int not null,	--�����Ľ׶�
	qNumber int not null,	--��ѡ��Ŀ��
	qScore int not null,	--ÿ�����
	psId int not null,	--�Ծ��״̬���(���á�δ����)
);
--drop table t_paper;
--�Ծ��״̬��
create table t_pState(
	psId int primary key identity(1,1),	--�Ծ��״̬���
	psName varchar(10) not null,	--״̬������
);
--�Ծ�-��Ŀ��ϵ��
create table t_paper_question(
	pqId int primary key identity(1,1),	--��ϵ���
	pId int not null,	--�Ծ���
	qId int not null,	--��Ŀ���
)
--�����
create table t_answer(
	aId int primary key identity(1,1),	--������
	sID varchar(20) not null,	--�����ѧ��
	pId int not null,	--��ǰ�Ծ���
	qId int not null,	--��ǰ��Ŀ���
	answer varchar(4),	--ѧ���� 
);
--�༶-�Ծ��ϵ��
create table t_paper_class(
	pcId int primary key identity(1,1),	--��ϵ���
	pId int not null,	--�Ծ���
	cId int not null,	--�༶���
);
--�༶��
create table t_classInfo(
	cId int primary key identity(1,1),	--�༶���
	cCode varchar(20) not null,	--�༶����
	cName varchar(20) not null,	--�༶����
	mjId int not null,	--����רҵ
	insId int not null,	--����Ա��teacher�������
	iecId int not null,	--��ʦ��teacher�������
	cDate date not null,	--��������
	cStuCount int not null,	--�༶����
	csId int not null,	--�༶״̬
	cRemark varchar(50)		--��ע
);
--�༶״̬
create table t_classStatus(
	csId int primary key identity(1,1),	--״̬���
	csName varchar(20) not null,	--״̬����
);
--�׶α�
create table t_stage(
	stId int primary key identity(1,1),	--�׶α��
	stName varchar(2) not null,	--�׶�����
);

--�����ʼ������
insert into t_account values ('admin','admin',4,1);
insert into t_account values ('yhl','123456',1,20150002);
insert into t_account values ('zzz','123456',2,1);
insert into t_manager values ('Admin',4);
insert into t_role values (1,'ѧ��');
insert into t_role values (2,'��ʦ');
insert into t_role values (4,'����Ա');
--�������ݲ�ѯ
select * from t_manager;
insert into t_teacher values ('Kiss','��',0,2);
insert into t_student values ('20150002','�ƻ���','��','2015',1,1,1);
select * from t_account;
select * from t_student;
select * from t_role


--��������
insert into t_qType values ('��ѡ'),('��ѡ'),('�ϻ�');
insert into t_qDifficuty values ('��'),('��ͨ'),('����');
insert into t_qSub values ('���������'),('PS'),('C����'),('HTML'),('SQLBASE'),('JavaBase'),('javascript'),('SQL'),('Java'),('���ݽṹ'),('JSP'),('Android');
insert into t_major values ('����'),('3G4G'),('����Ӫ��'),('UI'),('ǰ��');
insert into t_pState values ('δ����'),('������'),('���Խ���');
insert into t_classStatus values ('����'),('δ����');
insert into t_stage values ('G1'),('G2'),('G3');


--����б�
--����רҵ�ͽ׶β�ѯ���Ծ���Ϣ
select * from t_paper where mjId = 1 and stId = 1
select stName from t_stage
--��ǰ�Ծ������������Ŀ
select qId from t_paper_question where pId = 1;
--����������
select count(*) from t_question where qid in (select qId from t_paper_question where pId = 1) and qtId = 3;
--ѡ���������
select count(*) from t_question  where qid in (select qId from t_paper_question where pId = 1) and qtId = 1 or qtId = 2;

select * from t_qType

insert into t_question values
	('���������п���ѡ�����ص���','��������','ħ������','ɫ�ʷ�Χ','��','A',1,1,2),
	('.Photoshop��任����Ŀ�ݼ���','Ctrl+D',' Ctrl+T','Shift+D','Shift+T','A',1,1,2),
	('����Ϊ��������Ե�����ǣ�','CPU','�ڴ�','����','�Կ�','A',1,1,1),
	('�����ʶ����ȷ���ǣ�','class','��money','$money','1_a','c',1,1,6),
	('�����ĸ���Java��������ȷ�ı�ʶ����','3com	','import','that','this','C',1,1,6),
	('���������в�����������󷽷����ǣ�','������Ϣ','�̳С���̬','�ࡢ��װ','���̵��� ','D',1,1,6),
	('�������java�����˵���ĸ��ǲ���ȷ�ģ�','������ֻ���б�������ͳ�Ա�����Ķ��壬�������������','���캯�������е����ⷽ��','��һ��Ҫ����Ϊpublic�ģ��ſ���ִ��','һ��java�ļ��п����ж��class����','A',1,1,1),
	('c������Ԥ��������������ĸ���','include','public','private','prodect','A',1,1,6);

insert into t_paper values 
	('PS',100,100,2,1,1,50,2,1),
	('���������_1',100,100,1,1,1,50,2,1),
	('���������_1',100,100,1,2,1,50,2,1),
	('���������_1',100,100,1,3,1,50,2,1),
	('���������_1',100,100,1,4,1,50,2,2),
	('���������_1',100,100,1,5,1,50,2,2),
	('Java����',100,100,6,1,1,50,2,1),
	('C����',100,100,3,2,1,50,2,1),
	('C����',100,100,3,3,1,50,2,1),
	('Java����',100,100,6,2,1,50,2,1);
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

--����pid��ѯ������
select qId from t_paper_question where pId = 1;
select * from t_question where qtId = 3 and qId in (select qId from t_paper_question where pId = 1);