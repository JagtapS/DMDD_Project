

CREATE DATABASE ECOMMERCE
USE ECOMMERCE;
 GO

create table CUSTOMER
(
	CustomerID int not null,
	[Name] varchar(255),
	[Address] varchar(255),
	Phone varchar(255),
	EmailID varchar(255)
		CONSTRAINT Customer_PK primary key (CustomerID),
		CONSTRAINT EmailID_CHECK CHECK(EmailID LIKE '%___@___%.__%'),
        CONSTRAINT CK_Phone CHECK (LEN(Phone) between 10 and 13 )

);

create table [ORDER]
(
	OrderID int NOT NULL ,
	CustomerID int NOT NULL,
	CONSTRAINT ORDER_PK PRIMARY KEY (OrderID),
	CONSTRAINT ORDER_FK FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);


create table PAYMENT
(
	PaymentID int not null,
	OrderID int not null,
	[Transaction] varchar(20),
	OrderStatus varchar(20),
	CONSTRAINT PAYMENT_PK PRIMARY KEY (PaymentID),
	CONSTRAINT PAYMENT_FK FOREIGN KEY (OrderID) references [ORDER](OrderID),
	CONSTRAINT OrderStatus_CHECK CHECK(OrderStatus = 'Payment Completed' OR OrderStatus = 'Payment Pending')
);


create table MERCHANT
(
	MerchantID int NOT NULL,
	MerchantName varchar(255),
	CONSTRAINT MerchantName_ck check(
    MerchantName in ('AP Retail','Ck electronics','JM electronics','RJD Suppliers',
					 'Charles Retail','MM electronics','Sigma electronics','Cambridge electronics','KK electronics',
					 'Roxbury electronics','JP suppliers','KD electronics','Harvard Retail')),
	[Address] varchar(255),
	CONSTRAINT Merchant_PK PRIMARY KEY (MerchantID)
);

CREATE TABLE PRODUCTLINE
(
	ProductLineID int NOT NULL,
	ProductLineName varchar(255),
	CONSTRAINT ProductLineName_ck check(
	ProductLineName in ('Display Devices', 'Computer Peripherals','Printing Devices',
						 'Audio Devices', 'Photography', 'Smart Accessories')),
	CONSTRAINT ProductLine_PK PRIMARY KEY (ProductLineID)
);


CREATE TABLE [ADMIN]
(
	AdminID int NOT NULL,
	[Password] varchar(100),
	AdminName varchar(255),
	CONSTRAINT ADMIN_PK PRIMARY KEY(AdminID),

);



CREATE TABLE PRODUCTCATEGORY
(
	CategoryID int NOT NULL,
	AdminID int NOT NULL,
	CategoryName varchar(255),
	CONSTRAINT CategoryName_ck check(
    CategoryName in ('Laptops','PCs','Mouse','Printers','Headphones','Televisions',
					'Speakers','Cameras','Mobiles','Tablets','Portable Chargers','Wearable Devices','Projectors')),
    CategoryDescription varchar(255),
	CONSTRAINT PRODUCTCATEGORY_PK PRIMARY KEY(CategoryID),
	CONSTRAINT PRODUCTCATEGORY_FK FOREIGN KEY (AdminID) REFERENCES [ADMIN](AdminID),
);


CREATE TABLE PRODUCTCATALOGUE
(
	CatalogueID int NOT NULL,
	CategoryID int NOT NULL,
	CatalogueName varchar (255),
	CONSTRAINT PRODUCTCATALOGUE_PK PRIMARY KEY(CatalogueID),
	CONSTRAINT PRODUCTCATALOGUE_FK FOREIGN KEY (CategoryID) REFERENCES PRODUCTCATEGORY(CategoryID),
);


CREATE table PRODUCT
(
	ProductID int NOT NULL,
	MerchantID int NOT NULL,
	ProductLineID int NOT NULL,
	CatalogueID int NOT NULL,
	ProductName varchar(255),
	Stock varchar(255),
	Price int
	CONSTRAINT Product_PK PRIMARY KEY (ProductID),
	CONSTRAINT Product_FK1 FOREIGN KEY (MerchantID) references MERCHANT(MerchantID),
	CONSTRAINT Product_FK2 FOREIGN KEY (ProductLineID) references PRODUCTLINE(ProductLineID),
	CONSTRAINT Product_FK3 FOREIGN KEY (CatalogueID) references PRODUCTCATALOGUE(CatalogueID),
	CONSTRAINT CHECK_Price CHECK(Price > 0)
);


create table ORDERLINE
(
	OrderID int not null,
	ProductID int not null,
	Quantity int,
	CONSTRAINT ORDERLINE_PK PRIMARY KEY (OrderID,ProductID),
	CONSTRAINT ORDERLINE_FK1 FOREIGN KEY (OrderID) REFERENCES [ORDER](OrderID),
	CONSTRAINT ORDERLINE_FK2 FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
);




CREATE TABLE DELIVERY
(
	DeliveryID int NOT NULL,
	CustomerID int NOT NULL,
	OrderID int NOT NULL,
	DeliveryName varchar(255),
	Phone varchar(11),
	CONSTRAINT DELIVERY_PK PRIMARY KEY(DeliveryID),
	CONSTRAINT DELIVERY_FK1 FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
	CONSTRAINT DELIVERY_FK2 FOREIGN KEY (OrderID) REFERENCES [ORDER](OrderID),
);


GO

----------------------- AUDIT PRODUCT LOGS -------------------------

CREATE TABLE AUDITPAYMENTLOGS
(
PaymentID int,
	OrderID int,
	[Transaction] varchar(20),
	OrderStatus varchar(20),
DeletedPaymentDetails DATETIME
);


-- SELECT * FROM AUDITPAYMENTLOGS

GO

SELECT *
FROM CUSTOMER;
SELECT *
FROM [ORDER];
SELECT *
FROM PAYMENT;
SELECT *
FROM MERCHANT;
SELECT *
FROM ProductLine;
SELECT *
FROM [ADMIN];
SELECT *
FROM PRODUCTCATEGORY;
SELECT *
FROM PRODUCTCATALOGUE;
SELECT *
FROM PRODUCT;
SELECT *
FROM ORDERLINE;
SELECT *
FROM DELIVERY;



