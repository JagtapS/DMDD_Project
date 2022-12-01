

-- CUSTOMER TABLE

INSERT INTO CUSTOMER
	(CustomerID, [Name], [Address], Phone, EmailID)
VALUES
	(201, 'James', '3200 Washington', '18577468056', 'john@example.com'),
	(202, 'Jane', '3210 Roxbury', '18577468058', 'jane@example.com'),
	(203, 'Bill', '3215 Washington', '18577468160', 'bill@example.com'),
	(204, 'Bob', '3230 Roxbury', '1857746865', 'bob@example.com'),
	(205, 'Susan', '360 Huntington', '18577468077', 'susan@example.com'),
	(206, 'Mary', 'Jvue 1800', '18577468954', 'mary@example.com'),
	(207, 'Mike', 'Roxbury Crossing 105', '18577468132', 'mike@example.com'),
	(208, 'Akshay', '32 Clarence Street', '18577468796', 'akshay@example.com'),
	(209, 'Rahul', '28 Bolyston Street', '1857746824', 'Rahul@example.com'),
	(210, 'Tina', '43 Park Drive', '18574658896', 'Tina@example.com'),
	(211, 'Priya', '1167 Park Drive', '18578988058', 'Priya@example.com'),
	(212, 'Rohan', '17 Fort Hill', '18577123058', 'Rohan@example.com'),
	(213, 'Sid', '1 Fenway Park', '18569723058', 'Sid@example.com'),
	(214, 'John Smith', '123 Main Street, Houston, TX', '817-555-1234', 'john.smith@example.com'),
	(215, 'Alice Johnson', '2345 Oak Street, Seattle, WA', '206-555-9876', 'alice.johnson@example.com'),
	(216, 'James Williams', '456 Broadway, San Francisco, CA', '415-555-4321', 'james.williams@example.com'),
	(217, 'Samantha Taylor', '789 Maple Ave, Denver, CO', '303-555-6789', 'samantha.taylor@example.com'),
	(218, 'David Anderson', '123 Central Ave, New York, NY', '212-555-7890', 'david.anderson@example.com'),
	(219, 'Christopher Lee', '456 South Street, Chicago, IL', '312-555-3456', 'christopher.lee@example.com'),
	(220, 'Matthew Jackson', '123 East Street, Miami, FL', '305-555-1234', 'matthew.jackson@example.com'),
	(221, 'Andrew White', '456 West Ave, Phoenix, AZ', '602-555-7890', 'andrew.white@example.com'),
	(222, 'Daniel Harris', '789 South Blvd, Los Angeles, CA', '323-555-6789', 'daniel.harris@example.com'),
	(223, 'Patricia Thompson', '123 Park Place, Austin, TX', '512-555-3456', 'patricia.thompson@example.com'),
	(224, 'Joshua Martinez', '456 Hill Street, Detroit, MI', '313-555-1234', 'joshua.martinez@example.com'),
	(225, 'Sarah Davis', '789 Valley Road, St. Louis, MO', '314-555-9876', 'sarah.davis@example.com');



-- ORDER TABLE
INSERT INTO [ORDER]
	(OrderID, CustomerID)
VALUES
	(301, 201),
	(302, 202),
	(303, 203),
	(304, 204),
	(305, 205),
	(306, 206),
	(307, 207),
	(308, 208),
	(309, 209),
	(310, 210),
	(311, 211),
	(312, 212),
	(313, 213),
	(314, 214),
	(315, 215),
	(316, 216),
	(317, 217),
	(318, 218),
	(319, 219),
	(320, 220),
	(321, 221),
	(322, 222),
	(323, 223),
	(324, 224),
	(325, 225);




INSERT INTO PAYMENT
	(PaymentID, OrderID, [Transaction], OrderStatus)
VALUES
	(10011, 301, 'Online', 'Payment Completed'),
	(10012, 302, 'COD', 'Payment Pending'),
	(10013, 303, 'Online', 'Payment Pending'),
	(10014, 304, 'COD', 'Payment Pending'),
	(10015, 305, 'Online', 'Payment Completed'),
	(10016, 306, 'Online', 'Payment Completed'),
	(10017, 307, 'Online', 'Payment Pending'),
	(10018, 308, 'COD', 'Payment Pending'),
	(10019, 309, 'Online', 'Payment Completed'),
	(10020, 310, 'Online', 'Payment Completed'),
	(10021, 311, 'Online', 'Payment Completed'),
	(10022, 312, 'COD', 'Payment Pending'),
	(10023, 313, 'Online', 'Payment Completed'),
	(10024, 314, 'COD', 'Payment Pending'),
	(10025, 315, 'COD', 'Payment Pending'),
	(10026, 316, 'Online', 'Payment Completed'),
	(10027, 317, 'Online', 'Payment Completed'),
	(10028, 318, 'COD', 'Payment Pending'),
	(10029, 319, 'Online', 'Payment Completed'),
	(10030, 320, 'COD', 'Payment Pending'),
	(10031, 321, 'Online', 'Payment Completed'),
	(10032, 322, 'COD', 'Payment Pending'),
	(10033, 323, 'COD', 'Payment Pending'),
	(10034, 324, 'Online', 'Payment Completed'),
	(10035, 325, 'Online', 'Payment Completed');


INSERT INTO Merchant
	(MerchantID, MerchantName, [Address])
VALUES
	(701, 'AP Retail', '204 Shawmut Ave, Boston, MA'),
	(702, 'Ck electronics', '155 Newbury st, Cambridge'),
	(703, 'JM electronics', '15 Prospect st, Cambridge'),
	(704, 'RJD Suppliers', '275 Alphonso st, Waltham'),
	(705, 'Charles Retail', '244 Newbury st, Cambridge'),
	(706, 'MM electronics', '1295 Cambridge, Inman Sq'),
	(707, 'Sigma electronics', '123 Massachusetts Ave, Boston'),
	(708, 'Cambridge electronics', '255 Harvard Ave, Cambridge'),
	(709, 'KK electronics', '277 Brighton Ave, Brighton'),
	(710, 'Roxbury electronics', '155 Washington Ave, Roxbury'),
	(711, 'JP suppliers', '6 ay Head,Jamaica Plain'),
	(712, 'KD electronics', '55 Arlington Ave, Allston'),
	(713, 'Harvard Retail', '11 Harvard Sq, Cambridge'),
	(714, 'AP Retail', '1414 S. Main Street, Milwaukee, WI 53214'), 
	(715, 'Ck electronics', '298 W. Houston Avenue, New York, NY 10001'), 
	(716, 'JM electronics', '1132 N. Oak Street, Los Angeles, CA 90020'), 
	(717, 'Charles Retail', '2450 E. Washington Avenue, Chicago, IL 60614'), 
	(718, 'Sigma electronics', '1987 S. Elm Street, Phoenix, AZ 85021'), 
	(719, 'MM electronics', '5678 N. River Road, Houston, TX 77058'), 
	(720, 'KK electronics', '4545 E. Washington Avenue, Denver, CO 80202'), 
	(721, 'Cambridge electronics', '3201 W. Main Road, Seattle, WA 98102'), 
	(722, 'Roxbury electronics', '1901 N. Oak Street, San Francisco, CA 94107'), 
	(723, 'JP suppliers', '7676 E. Houston Avenue, Dallas, TX 75206'), 
	(724, 'JP suppliers', '4343 W. Main Street, Miami, FL 33133'), 
	(725, 'Harvard Retail', '2232 S. River Road, Atlanta, GA 30303');




INSERT INTO PRODUCTLINE
		(ProductLineID,ProductLineName)
VALUES
(801, 'Display Devices'),
(802, 'Computer Peripherals'),
(803, 'Computer Peripherals'),
(804, 'Printing Devices'),
(805, 'Audio Devices'),
(806, 'Display Devices'),
(807, 'Audio Devices'),
(808, 'Photography'),
(809, 'Display Devices'),
(810, 'Display Devices'),
(811, 'Smart Accessories'),
(812, 'Smart Accessories'),
(813, 'Display Devices'),
(814, 'Display Devices'),
(815, 'Smart Accessories'),
(816, 'Display Devices'),
(817, 'Smart Accessories'),
(818, 'Smart Accessories'),
(819, 'Display Devices'),
(820, 'Audio Devices'),
(821, 'Display Devices'),
(822, 'Audio Devices'),
(823, 'Display Devices'),
(824, 'Audio Devices'),
(825, 'Display Devices');



INSERT INTO PRODUCTCATEGORY ( CategoryID,AdminID,CategoryName,CategoryDescription)
VALUES
(501,901,'Laptops','All types of Laptops'),
(502,902,'PCs','All types of PCs'),
(503,903,'Mouse','All types of Mouse'),
(504,904,'Printers','All types of Printers'),
(505,905,'Headphones','All types of Headphones'),
(506,906,'Televisions','All types of Televisions'),
(507,907,'Speakers','All types of Speakers'),
(508,908,'Cameras','All types of Cameras'),
(509,909,'Mobiles','All types of Mobiles'),
(510,910,'Tablets','ALL types of Tablets'),
(511,911,'Portable Chargers','All types of Chargers'),
(512,912,'Wearable devices','All types of Wearable devices'),
(513,913,'Projectors','All types of Projectors'),
(514,914,'Televisions','A wide selection of TVs from all major brands.'),
(515,915,'Cameras','Capture all of lifes memories with a digital camera.'),
(516,916,'Laptops','The perfect combination of portability and power in one device.'),
(517,917,'Tablets','Stay connected and keep up with your digital life on the go.'), 
(518,918,'Mobiles','Access the internet and stay connected with a smartphone.'), 
(519,919,'Printers','Print out hard copies of documents, photos, and more.'), 
(520,920,'Headphones','Listen to your favorite music and podcasts with style.'),
(521,921,'Portable Chargers','types of Chargers'),
(522,922,'Wearable devices','types of Wearable devices'),
(523,923,'Speakers','types of Speakers'),
(524,924,'PCs','types of PCs'),
(525,925,'Projectors','Display large images from your laptop or phone with a projector.');




INSERT INTO PRODUCTCATALOGUE
	( CatalogueID, CategoryID, CatalogueName)
VALUES
(601,501,'4k Laptops'),
(602,502,'HD PCs'),
(603,503,'3D Mouse'),
(604,504,'Color Printers'),
(605,505,'Gaming Headphones'),
(606,506,'smart Televisions'),
(607,507,'BT Speakers'),
(608,508,'DSLR Cameras'),
(609,509,'4k Mobiles'),
(610,510,'VR Tablets'),
(611,511,'Metal Chargers'),
(612,512,'Smart Watches'),
(613,513,'4K Projectors'),
(614,514,'bass audio Televisions'),
(615,515,'IMAX Blu ray Cameras'),
(616,516,'Business Laptops'),
(617,517,'Android Tablets'),
(618,518,'Keypad Mobiles'),
(619,519,'BW Printers'),
(620,520,'BT Headphones'),
(621,521,'home control Chargers'),
(622,522,'Fitness band'),
(623,523,'Hd Speakers'),
(624,524,'4K PCs'),
(625,525,'4k projectors');




	INSERT into Product
	  ( ProductID, MerchantID, ProductLineID, CatalogueID, ProductName, Stock, Price)
VALUES
(401, 701, 801, 601, 'Dell Inspiron', 10, 479.99),
(402, 702, 802, 602, 'ASUS ROG', 15, 249.99),
(403, 703, 803, 603, 'Logitech G502', 20, 199.99),
(404, 704, 804, 604, 'HP OfficeJet', 5, 499.99),
(405, 705, 805, 605, 'Beats Studio', 7, 899.99),
(406, 706, 806, 606, 'Samsung QLED', 25, 799.99),
(407, 707, 807, 607, 'JBL Flip', 15, 999.99),
(408, 708, 808, 608, 'Canon EOS', 10, 149.99),
(409, 709, 809, 609, 'Samsung Galaxy S10', 8, 499.99),
(410, 710, 810, 610, 'Microsoft Surface', 5, 299.99),
(411, 711, 811, 611, 'Anker PowerCore', 10, 39.99),
(412, 712, 812, 612, 'Fitbit Versa', 7, 149.99),
(413, 713, 813, 613, 'Epson Home Cinema', 6, 349.99),
(414, 714, 814, 614, 'Sony Bravia', 4, 399.99),
(415, 715, 815, 615, 'Nikon D850', 8, 899.99),
(416, 716, 816, 616, 'HP Pavilion', 12, 399.99),
(417, 717, 817, 617, 'Google Pixel Slate', 10, 149.99),
(418, 718, 818, 618, 'Samsung Omega', 5, 199.99),
(419, 719, 819, 619, 'Epson Expression', 8, 199.99),
(420, 720, 820, 620, 'Sony WH-1000MX3', 9, 59.99),
(421, 721, 821, 621, 'AUKEY 10000mAh', 4, 199.99),
(422, 722, 822, 622, 'Garmin Forerunner', 11, 29.99),
(423, 723, 823, 623, 'Bose SoundLink', 10, 499.99),
(424, 724, 824, 624, 'Dell XPS', 5, 1199.99),
(425, 725, 825, 625, 'LG PF1000UW Ultra Short Throw 4K Projector', 7, 1999.99);



INSERT INTO ORDERLINE
	(OrderID, ProductID, Quantity)
VALUES
	(301, 401, 12),
	(302, 402, 45),
	(303, 403, 34),
	(304, 404, 12),
	(305, 405, 111),
	(306, 406, 65),
	(307, 407, 76),
	(308, 408, 23),
	(309, 409, 75),
	(310, 410, 6),
	(311, 411, 77),
	(312, 412, 22),
	(313, 413, 14),
	(314, 414, 14),
	(315, 415, 16),
	(316, 416, 18),
	(317, 417, 19),
	(318, 418, 23),
	(319, 419, 55),
	(320, 420, 33),
	(321, 421, 44),
	(322, 422, 10),
	(323, 423, 13),
	(324, 424, 12),
	(325, 425, 10);
	



INSERT INTO DELIVERY
	(DeliveryID,CustomerID,OrderID,DeliveryName,Phone)
VALUES
	(101, 201, 301,'Delivery1', '18577468056'),
	(102, 202, 302,'Delivery2', '18577468058'),
	(103, 203, 303,'Delivery3', '18577468160'),
	(104, 204, 304,'Delivery4', '1857746865'),
	(105, 205, 305,'Delivery5', '18577468077'),
	(106, 206, 306,'Delivery6', '18577468954'),
	(107, 207, 307,'Delivery7', '18577468132'),
	(108, 208, 308,'Delivery8', '18577468796'),
	(109, 209, 309,'Delivery9', '1857746824'),
	(110, 210, 310,'Delivery10', '18574658896'),
	(111, 211, 311,'Delivery11', '18578988058'),
	(112, 212, 312,'Delivery12', '18577123058'),
	(113, 213, 313,'Delivery13', '18569723058'),
	(114, 214, 314,'Delivery14', '18569723033'),
	(115, 215, 315,'Delivery15', '18569723022'),
	(116, 216, 316,'Delivery16', '18569723056'),
	(117, 217, 317,'Delivery17', '18569723011'),
	(118, 218, 318,'Delivery18', '18569723099'),
	(119, 219, 319,'Delivery19', '18569723087'),
	(120, 220, 320,'Delivery20', '18569723044'),
	(121, 221, 321,'Delivery21', '18569723056'),
	(122, 222, 322,'Delivery22', '18569723035'),
	(123, 223, 323,'Delivery23', '18569723023'),
	(124, 224, 324,'Delivery24', '18569723012'),
	(125, 225, 325,'Delivery25', '18569723069');
	



