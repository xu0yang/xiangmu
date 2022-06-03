create database XU

create table yh
(
  --用户id
  yhid int identity(1,1) primary key,
  --用户名字
  yhmz varchar(30),
  --用户账号
  yhzh varchar(40),
  --用户密码
  yhmm varchar(30) ,
  --用户类型
  yhlx varchar(30)default('用户'),
  --用户电话
  yhdh bigint,
  --用户地址
  yhdz varchar(40)
)


insert into yh(yhzh) values('das')

delete from yh
select * from yh
update yh set yhmz='河马' where yhid=4
--商家表
create table sj
(
  --商家id
  sjid int  primary key,
  --商家名字
  sjmz varchar(30),
  --商家账号
  sjzh varchar(40),
  --商家密码
  sjmm varchar(30),
  --商家类型
  sjlx varchar(40),
  --商家主图片
  sjtp varchar(40),
  --商家电话
  sjdh bigint,
  --商家地址
  sjdz varchar(40),
  --商家介绍
  sjjs varchar(340),
  --营业时间
  yysj varchar(50),
  --商家公告
  sjgg varchar(100),
  --商家附图片
  sjftp1 varchar(30),
  sjftp2 varchar(30),
  sjftp3 varchar(30),
  sjftp4 varchar(30)
)
delete from sj
insert into sj values('sj1','123','小炒','2.jpg',123,'永州','我这个餐厅很牛','2017-2018','爱来不来','a1.jpg','a1.jpg','a1.jpg','a1.jpg')

select * from sj

--商家菜品表
create table sjcp
(
  --菜品id
  cpid int identity(1,1) primary key,
  --商家id
  sjid int foreign key references yh(yhid) ,
  --菜品名字
  cpmz varchar(30),
  --菜品图片
  cptp varchar(30),
  --菜品类型
  cplx varchar(30),
  --菜品描叙
  cpmx varchar(40),
  --菜品价格
  cpjg decimal(6,2),
  --菜品所需时间
  cpsj int,
)

select * from sjcp


--用户订单表
create table yhdd
(
 --订单id
 ddid int identity(1,1) primary key,
 --用户id
 yhid int foreign key references yh(yhid),
 --商家id
 sjid int foreign key references sj(sjid),
 --下单时间
 ddsj datetime,
 --订单价格
 ddjg decimal(5,2),
 --订单菜品图片
 ddcptp varchar(60),
 --订单菜品名字
 ddcpmz varchar(40),
 --订单菜品数量
 ddcpsl int,
 --订单菜品总价
 ddcpdj decimal(5,2),
 --订单所有菜品总价
 ddsycpzj decimal(7,2),
 --订单分数
 ddfs int,
 --订单图片
 ddpjtp varchar(30),
 --订单评价
 ddpj varchar(40),
 --订单状态
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

insert into yhdd values('1','1','2012-12-01',50,1,1,5,'3.img','巨他妈好吃')





insert into yh values('yh1','123','普通会员',123,'永州')





insert into sjcp values(1,'红烧茄子','1.jpg','红烧','非常好吃',12,8)



