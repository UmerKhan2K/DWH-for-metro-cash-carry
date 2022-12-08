drop schema if exists `dw` ;
-- drop table if exists FactSales;
-- drop table if exists DimProduct;
-- drop table if exists DimSupplier;
-- drop table if exists DimStore;
-- drop table if exists DimDate;
-- drop table if exists DimCustomer;
commit;

CREATE SCHEMA `dw` ;
USE `dw` ;


create table DimCustomer
(
CID varchar(4) not null PRIMARY KEY,
Cname varchar(30) not null
);


create table DimDate
(
DID int not null PRIMARY KEY AUTO_INCREMENT,
T_Date int,
T_Quarter int,
T_Month int,
T_Year int
);

create table DimProduct
(
price DOUBLE(5,2) DEFAULT 0.0,
PID varchar(6) not null PRIMARY KEY,
Pname varchar(30)
);

create table DimSupplier 
(
SID varchar(5) not null PRIMARY KEY,
Sname varchar(30)
);

create table DimStore
(
STID varchar(4) not null PRIMARY KEY,
STname varchar(20)
);




create table FactSales
(
Quantity DOUBLE(3,0),
Sales int,
C_ID varchar(4),
S_ID varchar(5),
ST_ID varchar(4),
P_ID varchar(6),
D_ID int ,
T_ID double(8,0)
);



alter table FactSales add constraint C_fk foreign key (C_ID) references DimCustomer(CID);
alter table FactSales add constraint S_fk foreign key (S_ID) references DimSupplier(SID);
alter table FactSales add constraint ST_fk foreign key (ST_ID) references DimStore(STID);
alter table FactSales add constraint P_fk foreign key (P_ID) references DimProduct(PID);
alter table FactSales add constraint D_fk foreign key (D_ID) references DimDate(DID);
