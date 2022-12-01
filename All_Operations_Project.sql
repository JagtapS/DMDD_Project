-----------------STORED PROCEDURE----------------------------


--1. Stored Procedure for getting the details of the Products

CREATE PROCEDURE GetAllProductDetails 
AS
BEGIN

SELECT P.PRODUCTID,P.PRODUCTNAME,C.CATEGORYID,C.CATEGORYNAME,PC.CATALOGUEID,PC.CATALOGUENAME,P.STOCK
FROM PRODUCTCATEGORY C
        
         INNER JOIN PRODUCTCATALOGUE PC ON C.CATEGORYID = PC.CATEGORYID 
 
                INNER JOIN PRODUCT P ON PC.CATALOGUEID = P.CATALOGUEID;

END

EXEC GetAllProductDetails

GO



--2. Stored Procedure for Product SELECT, INSERT, UPDATE, DELETE


CREATE PROCEDURE [dbo].[ProductCRUDOperation]
      @Action varchar(10),
      @ProductID int = NULL,
	@MerchantID int = NULL,
	@ProductLineID int = NULL,
	@CatalogueID int = NULL,
	@ProductName varchar(255) = NULL,
	@Stock varchar(255) = NULL
AS
BEGIN
      SET NOCOUNT ON;
 
      --SELECT
      IF @Action = 'SELECT'
      BEGIN

            SELECT ProductID,ProductName,ProductLineID,MerchantID,CatalogueID,Stock
            from PRODUCT
      END
 
      --INSERT
      IF @Action = 'INSERT'
      BEGIN

            INSERT INTO dbo.PRODUCT ([ProductID],[MerchantID],[ProductLineID],[CatalogueID],[ProductName],[Stock])
      
            VALUES (@ProductID, @MerchantID, @ProductLineID,@CatalogueID, @ProductName, @Stock)
      
      END
 
      --UPDATE
      IF @Action = 'UPDATE'
      BEGIN

            UPDATE PRODUCT
            SET ProductID = @ProductID, MerchantID =@MerchantID, ProductLineID =@ProductLineID, CatalogueID =@CatalogueID,
            ProductName =@ProductName, Stock =@Stock
            where ProductID =@ProductID

      END
 
      --DELETE
      IF @Action = 'DELETE'
      BEGIN
            DELETE from PRODUCT
            WHERE ProductID =@ProductID

      END
END

    EXEC [dbo].[ProductCRUDOperation] @Action = 'SELECT'


    EXEC [dbo].[ProductCRUDOperation] @Action = 'INSERT', 
      @ProductID = 410,
	@MerchantID= 710 ,
	@ProductLineID = 810,
	@CatalogueID = 610,
	@ProductName = 'Winter Max',
	@Stock =69


  EXEC  [dbo].[ProductCRUDOperation] @Action = 'UPDATE',
    @ProductID = 413,
	@MerchantID= 713 ,
	@ProductLineID = 813,
	@CatalogueID = 613,
	@ProductName = 'OPTOMA ZU2200',
	@Stock =110            


EXEC [dbo].[ProductCRUDOperation] @Action= 'DELETE',
                  @ProductID = 410

GO

--------------- STORED PROCEDURE OR ADMIN PASSWORD COLUMN DATA ENCRYPTION AND DECRYPTION---------------------

Create Master Key Encryption by PASSWORD = 'Here!s^%eP@$$'
-- — to check how many keys are defined in the database.
SELECT name KeyName,
   symmetric_key_id KeyID,
   key_length KeyLength,
   algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;
 

-- – Creation of certificate which will be used to decrypt symmetric key.
CREATE CERTIFICATE Certificate_SafeAdminPassword WITH SUBJECT = 'My Admin Password Protection';
 

-- - for verifying the certificate run below query:
 

SELECT name CertName,
   certificate_id CertID,
   pvt_key_encryption_type_desc EncryptType,
   issuer_name Issuer
FROM sys.certificates;
 

 

-- - Creation of symmetric key to encrypt column data.
Create Symmetric Key AdminPass
With Algorithm = AES_256
Encryption by Certificate Certificate_SafeAdminPassword;
 

 

-- - For verifying all the keys :
 

SELECT name KeyName,
   symmetric_key_id KeyID,
   key_length KeyLength,
   algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;
 

-- - Start of encryption all in one session, first open the symmetric key:
 
GO
OPEN SYMMETRIC KEY AdminPass

-- - Encryption:

-- go
-- SELECT * from [ADMIN]

GO

--3. Stored procedure for Encryption of Admin Password in the Admin Table 


CREATE PROCEDURE AdminPasswordEncryption  @Admin_ID INT, @Admin_Name VARCHAR(30),@Admin_Password VARCHAR(30)

AS
BEGIN
OPEN SYMMETRIC KEY AdminPass
        DECRYPTION BY CERTIFICATE Certificate_SafeAdminPassword;
Insert into [ADMIN] (AdminID, AdminName,[Password]) VALUES
        (@Admin_ID,@Admin_Name,(ENCRYPTBYKEY(KEY_GUID('AdminPass'), @Admin_Password)))
Close symmetric key AdminPass

END
-- select * from [Admin]


      -- Exec AdminPasswordEncryption 901, 'Pass@1', 'Kevin'
	-- Exec AdminPasswordEncryption 902, 'Pass@2', 'Lex'
	-- Exec AdminPasswordEncryption 903, 'Pass@3', 'Laura'
	-- Exec AdminPasswordEncryption 904, 'Pass@4', 'Pravin'
	-- Exec AdminPasswordEncryption 905, 'Pass@5', 'Nicolas'
	-- Exec AdminPasswordEncryption 906, 'Pass@6', 'Nick'
	-- Exec AdminPasswordEncryption 907, 'Pass@7', 'Brian'
	-- Exec AdminPasswordEncryption 908, 'Pass@8', 'John'
	-- Exec AdminPasswordEncryption 909, 'Pass@9', 'Mark'
	-- Exec AdminPasswordEncryption 910, 'Pass@10', 'Mi'
	-- Exec AdminPasswordEncryption 911, 'Pass@11', 'Marcus'
	-- Exec AdminPasswordEncryption 912, 'Pass@12', 'Steve'
	-- Exec AdminPasswordEncryption 913, 'Pass@13', 'David'
	-- Exec AdminPasswordEncryption 914, 'Pass@14', 'Jason'
	-- Exec AdminPasswordEncryption 915, 'Pass@15', 'Andrew'
	-- Exec AdminPasswordEncryption 916, 'Pass@16', 'Neil'
	-- Exec AdminPasswordEncryption 917, 'Pass@17', 'Chris'
	-- Exec AdminPasswordEncryption 918, 'Pass@18', 'Shane'
	-- Exec AdminPasswordEncryption 919, 'Pass@19', 'Mitchel'
	-- Exec AdminPasswordEncryption 920, 'Pass@20', 'Tim'
	-- Exec AdminPasswordEncryption 921, 'Pass@21', 'Dave'
	-- Exec AdminPasswordEncryption 922, 'Pass@22', 'Adam'
	-- Exec AdminPasswordEncryption 923, 'Pass@23', 'Frank'
	-- Exec AdminPasswordEncryption 924, 'Pass@24', 'Dwayne'
	-- Exec AdminPasswordEncryption 925, 'Pass@25', 'Rick'

	

GO


 ---4. Stored Procedure for Decryption of the Admin Password-------------------------


CREATE procedure DecryptAdPAssword @AdminID int
AS
BEGIN

OPEN SYMMETRIC KEY AdminPass

       DECRYPTION BY CERTIFICATE Certificate_SafeAdminPassword;

       SELECT *, CONVERT(VARCHAR, DecryptByKey([Password]) )  AS Decrypted_Admin_Password FROM dbo.[ADMIN] 
       WHERE AdminId = @AdminID;


-- Close Symmetric key
Close symmetric key AdminPass

END
EXEC DecryptAdPAssword 926


GO




----------- User Defined Function to get Product Stock  -----------------------------------

Create FUNCTION GetProductStock 
(@ProductName varchar(30))
returns TABLE AS
RETURN

    SELECT P.ProductName, P.STOCK FROM PRODUCT P WHERE P.ProductName = @ProductName;
GO

SELECT * from [dbo].GetProductStock('HP OfficeJet');



-----------------------------Non-Clustered Indexes ---------------------------


------------ NON-CLUSTERED INDEX ON  ADMIN TABLE FOR ADMIN NAMES --------------------

select * into  dbo.AdminTable_TEST FROM [Admin]

select * from AdminTable_TEST
select * from [Admin]

drop index idx_Admin_Name on AdminTable_TEST
-- drop table dbo.Books_TEST2


create CLUSTERED index idx_Admin_Name
on AdminTable_TEST ([AdminName])
go

create NONCLUSTERED index nix_Admin_Name
on AdminTable_TEST ([AdminName] ASC)
go

sp_helpindex 'dbo.AdminTable_TEST'

--------------- NON-CLUSTERED INDEX ON PRODUCT TABLE FOR PRODUCT NAMES---------------

SELECT * FROM PRODUCT


select * into  dbo.PRODUCT_TEST FROM [PRODUCT]

select * from PRODUCT_TEST
select * from [PRODUCT]

-- drop index idx_Admin_Name on PRODUCT_TEST
-- drop table dbo.PRODUCT_TEST


create CLUSTERED index idx_PRODUCT_NAME
on PRODUCT_TEST ([PRODUCTNAME])
go

create NONCLUSTERED index nix_PRODUCT_NAME
on PRODUCT_TEST ([PRODUCTNAME])
go

sp_helpindex 'dbo.PRODUCT_TEST'


--------------- NON-CLUSTERED INDEX ON CUSTOMER TABLE FOR CUSTOMER NAMES---------------
SELECT * FROM CUSTOMER

select * into  dbo.CUSTOMER_TEST FROM CUSTOMER

select * from CUSTOMER_TEST
select * from CUSTOMER

-- drop index idx_Admin_Name on PRODUCT_TEST
-- drop table dbo.PRODUCT_TEST


create CLUSTERED index idx_CUSTOMER_NAME
on CUSTOMER_TEST ([NAME])
go

create NONCLUSTERED index NIX_CUSTOMER_NAME
on CUSTOMER_TEST ([NAME])
go

sp_helpindex 'dbo.CUSTOMER_TEST'



--------------- NON-CLUSTERED INDEX ON MERCHANT TABLE FOR MERCHANT NAMES---------------
SELECT * FROM MERCHANT

select * into  dbo.MERCHANT_TEST FROM MERCHANT

select * from MERCHANT_TEST
select * from MERCHANT

-- drop index idx_Admin_Name on PRODUCT_TEST
-- drop table dbo.PRODUCT_TEST


create CLUSTERED index idx_MERCHANT_NAME
on MERCHANT_TEST ([MERCHANTNAME])
go

create NONCLUSTERED index NIX_MERCHANT_NAME
on MERCHANT_TEST ([MERCHANTNAME])
go

sp_helpindex 'dbo.MERCHANT_TEST'





----------------------------- TRIGGERS ------------------------------------------


GO

--1. TRIGGER FOR NOT ALLOWING UPDATE OPERATION IN ADMIN TABLE AS IT CONTAINS SENSITIVE INFORMATION


CREATE TRIGGER TrUpdate 
ON [ADMIN]
FOR UPDATE
AS
BEGIN
  PRINT 'YOU CANNOT PERFORM UPDATE OPERATION'
  ROLLBACK TRANSACTION
END


UPDATE [ADMIN] 
SET AdminName = 'Satyam'
where AdminId =901;

select * from [PRODUCT]


GO
-----------------------2. TRIGGER FOR  SHOW DATE AND TIME TRIGGER FOR DELETED PAYMENTID ----------------------  
CREATE TRIGGER DeleteRecords
ON Payment
AFTER DELETE
AS
BEGIN
       DECLARE @PaymentID int,
               @OrderID int,
		   @TRANSACTION varchar(255),
               @OrderStatus varchar(255);
		

               select @PaymentID = d.PaymentID from deleted d;
               select @OrderID = d.OrderID from deleted d;
               select @TRANSACTION = d.[Transaction] from deleted d;
               SELECT @OrderStatus = d.OrderStatus from deleted d;

		
       
       INSERT INTO AUDITPAYMENTLOGS (PaymentID,OrderID,[Transaction],OrderStatus,DeletedPaymentDetails)
       VALUES (@PaymentID,@OrderID,@TRANSACTION,@OrderStatus, GETDATE())

END

delete from PAYMENT where PaymentID =10011;
GO
SELECT * from AUDITPAYMENTLOGS;
GO
SELECT * from payment;




------------------------------------ VIEWS ----------------------------------



-- CUSTOMER VIEW TO GIVE THE DETAILS OF THE CUSTOMER AND ITS ASSOCIATED PRODUCT DETAILS & DELIVERY
GO
CREATE VIEW [CUSTOMERSVIEW] 
AS
SELECT O.ORDERID, C.CUSTOMERID, C.[Name], C.[Address], C.EmailID, C.Phone, D.DELIVERYID, P.Price, PAY.[Transaction], PAY.OrderStatus
from CUSTOMER C INNER JOIN DELIVERY D
	ON C.CustomerID = D.CustomerID
	INNER JOIN [ORDER] O
	ON O.OrderID = D.OrderID
	INNER JOIN PAYMENT PAY
	ON PAY.OrderID = O.OrderID
	INNER JOIN ORDERLINE OL
	ON OL.OrderID = O.OrderID
	INNER JOIN PRODUCT P
	ON P.ProductID = OL.ProductID

	WHERE (OrderStatus = 'Payment pending' AND Price > 100);
	GO
	SELECT * FROM [CUSTOMERSVIEW];

-- select * from PAYMENT

GO



-- OREDERVIEW TO GIVE REPORT WHEN ORDER QUANTITY > 50 
ALTER VIEW [ORDERSVIEW]
AS 
SELECT  O.CustomerID, O.ORDERID, P.PRODUCTID, OL.QUANTITY, P.CatalogueID, P.Stock, P.ProductName
FROM [ORDER] O INNER JOIN ORDERLINE OL
	ON O.OrderID = OL.OrderID
	INNER JOIN PRODUCT P
	ON P.ProductID = OL.ProductID

	WHERE P.Stock < 100;
GO
SELECT * FROM [ORDERSVIEW];

-- SELECT * FROM ORDERLINE
-- SELECT * FROM PRODUCT
-- WHERE Stock =100;

GO




-- CUSTOMERSVIEW TO GIVE REPORT WHEN CUSTOMER PAYMENT IS PENDING AND PRICE IS MORE THAN $100.
	
CREATE VIEW [CUSTOMERSVIEW] 
AS
SELECT O.ORDERID, C.CUSTOMERID, C.[Name], C.[Address], C.EmailID, C.Phone, D.DELIVERYID, P.Price, PAY.[Transaction], PAY.OrderStatus
from CUSTOMER C INNER JOIN DELIVERY D
	ON C.CustomerID = D.CustomerID
	INNER JOIN [ORDER] O
	ON O.OrderID = D.OrderID
	INNER JOIN PAYMENT PAY
	ON PAY.OrderID = O.OrderID
	INNER JOIN ORDERLINE OL
	ON OL.OrderID = O.OrderID
	INNER JOIN PRODUCT P
	ON P.ProductID = OL.ProductID

	WHERE (OrderStatus = 'Payment Pending' AND Price > 100);
	
      GO
	SELECT * FROM [CUSTOMERSVIEW];

