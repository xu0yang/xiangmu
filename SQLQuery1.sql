create database XU

create table yh
(
  --�û�id
  yhid int identity(1,1) primary key,
  --�û�����
  yhmz varchar(30),
  --�û��˺�
  yhzh varchar(40),
  --�û�����
  yhmm varchar(30) ,
  --�û�����
  yhlx varchar(30)default('�û�'),
  --�û��绰
  yhdh bigint,
  --�û���ַ
  yhdz varchar(40)
)


insert into yh(yhzh) values('das')

delete from yh
select * from yh
update yh set yhmz='����' where yhid=4
--�̼ұ�
create table sj
(
  --�̼�id
  sjid int  primary key,
  --�̼�����
  sjmz varchar(30),
  --�̼��˺�
  sjzh varchar(40),
  --�̼�����
  sjmm varchar(30),
  --�̼�����
  sjlx varchar(40),
  --�̼���ͼƬ
  sjtp varchar(40),
  --�̼ҵ绰
  sjdh bigint,
  --�̼ҵ�ַ
  sjdz varchar(40),
  --�̼ҽ���
  sjjs varchar(340),
  --Ӫҵʱ��
  yysj varchar(50),
  --�̼ҹ���
  sjgg varchar(100),
  --�̼Ҹ�ͼƬ
  sjftp1 varchar(30),
  sjftp2 varchar(30),
  sjftp3 varchar(30),
  sjftp4 varchar(30)
)
delete from sj
insert into sj values('sj1','123','С��','2.jpg',123,'����','�����������ţ','2017-2018','��������','a1.jpg','a1.jpg','a1.jpg','a1.jpg')

select * from sj

--�̼Ҳ�Ʒ��
create table sjcp
(
  --��Ʒid
  cpid int identity(1,1) primary key,
  --�̼�id
  sjid int foreign key references yh(yhid) ,
  --��Ʒ����
  cpmz varchar(30),
  --��ƷͼƬ
  cptp varchar(30),
  --��Ʒ����
  cplx varchar(30),
  --��Ʒ����
  cpmx varchar(40),
  --��Ʒ�۸�
  cpjg decimal(6,2),
  --��Ʒ����ʱ��
  cpsj int,
)

select * from sjcp


--�û�������
create table yhdd
(
 --����id
 ddid int identity(1,1) primary key,
 --�û�id
 yhid int foreign key references yh(yhid),
 --�̼�id
 sjid int foreign key references sj(sjid),
 --�µ�ʱ��
 ddsj datetime,
 --�����۸�
 ddjg decimal(5,2),
 --������ƷͼƬ
 ddcptp varchar(60),
 --������Ʒ����
 ddcpmz varchar(40),
 --������Ʒ����
 ddcpsl int,
 --������Ʒ�ܼ�
 ddcpdj decimal(5,2),
 --�������в�Ʒ�ܼ�
 ddsycpzj decimal(7,2),
 --��������
 ddfs int,
 --����ͼƬ
 ddpjtp varchar(30),
 --��������
 ddpj varchar(40),
 --����״̬
 ddzt varchar(30)
)

select * from yhdd


select t.ddsycpzj from(select yhdd.*,ROW_NUMBER()over(partition by ddsj order by ddsj desc ) rn from yhdd ) t where rn=1 and sjid=1 order by ddsj desc
select t.* from(select yhdd.*,ROW_NUMBER()over(partition by ddsj order by ddsj desc ) rn from yhdd ) t where rn=1

select t.* from(select yhdd.*,ROW_NUMBER()over(partition by ddsj order by ddsj desc ) rn from yhdd ) t where rn=1 and sjid=2 order by ddsj desc


select t.* from(select yhdd.*,ROW_NUMBER()over(partition by ddsj order by ddsj desc ) rn from yhdd ) t where rn=1 and sjid=1  order by ddsj desc


select COUNT(t.ddsj) from(select yhdd.*,ROW_NUMBER()over(partition by ddsj order by ddsj desc ) rn from yhdd ) t where rn=1 and sjid=1 

select t.* from(select yhdd.*,ROW_NUMBER()over(partition by ddsj order by ddsj desc ) rn from yhdd ) t where CONVERT(varchar(100),ddsj,23) like '2021-11-10%' and rn=1 and sjid=1  order by ddsj desc


select count(t.ddsj)  from(select yhdd.*,ROW_NUMBER()over(partition by ddsj order by ddsj desc ) rn from yhdd ) t where CONVERT(varchar(100),ddsj,23) like '2021-11-10%' and rn=1 and sjid=1  


select distinct ddsj,ddid,yhid,sjid,ddjg,ddcptp,ddcpmz,ddcpsl,ddsycpzj,ddfs,ddpjtp,ddpj,ddzt from yhdd
delete from yhdd

insert into yhdd values('1','1','2012-12-01',50,1,1,5,'3.img','������ó�')





insert into yh values('yh1','123','��ͨ��Ա',123,'����')





insert into sjcp values(1,'��������','1.jpg','����','�ǳ��ó�',12,8)



