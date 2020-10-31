drop database if exists QuanLyCafe;

create database QuanLyCafe;

use QuanLyCafe;

create table ProductTypes
(
	IDType int primary key auto_increment,
	TypeName nvarchar(50),
	Size nvarchar(10)
);

create table Products
(
	IDProduct int primary key auto_increment,
	ProductName nvarchar(100),
	IDType int,
	Price int,
    constraint FK_ProductType foreign key (IDType) references ProductTypes(IDType)
);

create table Administrators
(
	Username varchar(50) primary key,
	Password varchar(20)
);

create table Employees
(
	Username varchar(50) primary key,
	Password varchar(20),
	NameEmp nvarchar(50),
	Gender nvarchar(10),
	Birthday varchar(20),
	Phone varchar(20),
	Email varchar(50),
	Address nvarchar(255),
	Avatar varchar(50)
);

Create Table Revenues
(
	IDRevenue int primary key auto_increment,
	Date varchar(20),
	Money varchar(20)
);

create table Customers(
	IDCus int primary key auto_increment,
	IdentityCard varchar(20) not null unique,
	CusName nvarchar(50),
	DateAdd varchar(20),
	Phone varchar(20),
	Email varchar(50),
	Quantity int,
	Discount int
);

create table Promotions(
	IDPromo int primary key auto_increment,
	NamePromo nvarchar(50) not null unique,
	DiscountPromo int,
	StartPromo varchar(20),
	EndPromo varchar(20),
	Description nvarchar(300)
);

Create Table Orders(
	IDOrder int primary key auto_increment,
	DateOrder varchar(20),
	TimeOrder varchar(20),
	Username varchar(50),
    constraint FK_Employees foreign key (Username) references Employees(Username)
);

Create Table OrderDetails(
	IDOrder int,
	IDProduct int,
	CusName nvarchar(50),
	Quantity int,
	NamePromo nvarchar(50),
    constraint FK_Orders foreign key (IDOrder) references Orders(IDOrder),
    constraint FK_Products foreign key (IDProduct) references Products(IDProduct),
	constraint PK_OrderDetails primary key (IDOrder, IDProduct)
);

-- Insert 1 Administrators
Insert into Administrators values('admin','$2a$10$egx3hj2ChAZI6UbbCz5xfe6usKCapqKnigQVBkcNfglFUrAqI3hFO');

-- Insert 4 Employees information
Insert into Employees values('huypt','$2a$10$/.iWCo805u9EXXshd/H1N.ZWodmSm.r5a0ocNbQDMVFlFBjJbV7JW',N'Phạm Thế Huy',N'Nam','28/03/1999','0979859283','phamthehuy283@gmail.com',N'Hải Phòng','2.jpg');
Insert into Employees values('kienkh','$2a$10$/.iWCo805u9EXXshd/H1N.ZWodmSm.r5a0ocNbQDMVFlFBjJbV7JW',N'Khuất Huy Kiên',N'Nam','04/07/1999','0963477226','kienkh99@gmail.com',N'Hà Nội','5.jpg');
Insert into Employees values('huynt','$2a$10$/.iWCo805u9EXXshd/H1N.ZWodmSm.r5a0ocNbQDMVFlFBjJbV7JW',N'Nguyễn Tiến Huy',N'Nam','27/09/1999','0981519920','chi1cothe@gmail.com',N'Hà Nội','4.jpg');
Insert into Employees values('khanhvn','$2a$10$/.iWCo805u9EXXshd/H1N.ZWodmSm.r5a0ocNbQDMVFlFBjJbV7JW',N'Vũ Ngọc Khánh',N'Nam','25/10/1998','0395480066','caigichaduoc0@gmail.com',N'Thái Bình','3.jpg');
Insert into Employees values('hungnv','$2a$10$/.iWCo805u9EXXshd/H1N.ZWodmSm.r5a0ocNbQDMVFlFBjJbV7JW',N'Nguyễn Việt Hưng',N'Nam','06/10/1999','0868434000','vt.arrow.06@gmail.com',N'Bắc Giang','1.jpg');

-- Inser 7 ProductTypes
Insert into ProductTypes(TypeName, Size) values(N'Cà phê',N'Nhỏ');
Insert into ProductTypes(TypeName, Size) values(N'Cà phê',N'Vừa');
Insert into ProductTypes(TypeName, Size) values(N'Cà phê',N'Lớn');
Insert into ProductTypes(TypeName, Size) values(N'Nước trái cây',N'Nhỏ');
Insert into ProductTypes(TypeName, Size) values(N'Nước trái cây',N'Vừa');
Insert into ProductTypes(TypeName, Size) values(N'Nước trái cây',N'Lớn');

-- Insert 20 Products
Insert into Products(ProductName,IDType,Price) values(N'Cà phê đá', 1, 20000);
Insert into Products(ProductName,IDType,Price) values(N'Cà phê đá', 2, 25000);
Insert into Products(ProductName,IDType,Price) values(N'Cà phê đá', 3, 30000);
Insert into Products(ProductName,IDType,Price) values(N'Cà phê sữa đá', 1, 25000);
Insert into Products(ProductName,IDType,Price) values(N'Cà phê sữa đá', 2, 30000);
Insert into Products(ProductName,IDType,Price) values(N'Cà phê sữa đá', 3, 35000);
Insert into Products(ProductName,IDType,Price) values(N'ESPRESSO MILK', 1, 30000);
Insert into Products(ProductName,IDType,Price) values(N'ESPRESSO MILK', 2, 40000);
Insert into Products(ProductName,IDType,Price) values(N'ESPRESSO MILK', 3, 50000);
Insert into Products(ProductName,IDType,Price) values(N'CAPPUCCINO', 1, 42000);
Insert into Products(ProductName,IDType,Price) values(N'CAPPUCCINO', 2, 52000);
Insert into Products(ProductName,IDType,Price) values(N'CAPPUCCINO', 3, 62000);
Insert into Products(ProductName,IDType,Price) values(N'Trà đào', 4, 40000);
Insert into Products(ProductName,IDType,Price) values(N'Trà đào', 5, 50000);
Insert into Products(ProductName,IDType,Price) values(N'Trà đào', 6, 60000);
Insert into Products(ProductName,IDType,Price) values(N'Cam ép', 4, 35000);
Insert into Products(ProductName,IDType,Price) values(N'Cam ép', 5, 40000);
Insert into Products(ProductName,IDType,Price) values(N'Sinh tố thập cẩm', 4, 50000);
Insert into Products(ProductName,IDType,Price) values(N'Sinh tố thập cẩm', 5, 60000);

-- Insert 3 Revenues
Insert into Revenues(Date,Money) values('17/01/2020','206000');
Insert into Revenues(Date,Money) values('11/04/2020','179000');
Insert into Revenues(Date,Money) values('20/04/2020','50000');
Insert into Revenues(Date,Money) values('26/05/2020','240000');
Insert into Revenues(Date,Money) values('02/06/2020','126000');
-- Insert into Revenues(Date,Money) values('05/05/2016','52000');
-- Insert into Revenues(Date,Money) values('01/09/2016','45000');
-- Insert into Revenues(Date,Money) values('15/08/2016','45000');
-- Insert into Revenues(Date,Money) values('23/11/2016','110000');

-- Insert 4 Customers
Insert into Customers(IdentityCard,CusName,DateAdd,Phone,Email,Quantity,Discount) values('122261551',N'Vũ Văn Tùng','17/04/2020','01212692802','tung@gmail.com',20,10);
Insert into Customers(IdentityCard,CusName,DateAdd,Phone,Email,Quantity,Discount) values('122261552',N'Nguyễn Huỳnh Thanh Tùng','23/04/2020','01212692802','thanhtung@gmail.com',25,10);
Insert into Customers(IdentityCard,CusName,DateAdd,Phone,Email,Quantity,Discount) values('122261553',N'Nguyễn Ngân','20/08/2020','01212692802','nguyenngan@gmail.com',19,5);
Insert into Customers(IdentityCard,CusName,DateAdd,Phone,Email,Quantity,Discount) values('122261554',N'Nguyễn Văn Trí','11/09/2020','01212692802','tri@gmail.com',10,5);

-- Insert 2 Promotions
Insert into Promotions(NamePromo,DiscountPromo,StartPromo,EndPromo,Description) values(N'Thẻ sinh viên',10,'2020/01/01','2020/12/30',N'Có thẻ sinh viên');

-- Insert 6 Order
Insert into Orders(DateOrder,TimeOrder,Username) values('11/08/2020','19:49:50','huypt');
Insert into Orders(DateOrder,TimeOrder,Username) values('20/08/2020','22:43:50','huypt');
Insert into Orders(DateOrder,TimeOrder,Username) values('23/08/2020','11:12:50','huypt');
Insert into Orders(DateOrder,TimeOrder,Username) values('17/09/2020','15:47:50','huynt');
Insert into Orders(DateOrder,TimeOrder,Username) values('18/09/2020','09:23:50','kienkh');
Insert into Orders(DateOrder,TimeOrder,Username) values('26/09/2020','11:59:50','khanhvn');

-- Insert 9 OrderDetails
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(1,5,N'Vũ Văn Tùng',3,N'Khách hàng VIP');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(1,1,N'Vũ Văn Tùng',2,N'Khách hàng VIP');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(2,2,N'Khách vãng lai',1,N'Thẻ sinh viên');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(2,3,N'Khách vãng lai',2,N'Thẻ sinh viên');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(3,2,N'Khách vãng lai',1,N'Không có');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(5,1,N'Khách vãng lai',2,N'Không có');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(4,6,N'Khách vãng lai',1,N'Thẻ sinh viên');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(4,10,N'Khách vãng lai',3,N'Thẻ sinh viên');
Insert into OrderDetails(IDOrder,IDProduct,CusName,Quantity,NamePromo) values(6,11,N'Khách vãng lai',1,N'Không có');