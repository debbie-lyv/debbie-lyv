# Debbie Lim
# April 12, 2022
# Project, checkpoint 3
# SQL database and table creation, and test data insertions 

#--------------------------------------------------------------------
drop database if exists SewaneeTrades;
create database SewaneeTrades;
	use SewaneeTrades;

GRANT SELECT, INSERT, DELETE ON SewaneeTrades.* TO 'limy0'@'%' IDENTIFIED BY 'password';
#--------------------------------------------------------------------

create table itemOrder (
	 orderID					int							  AUTO_INCREMENT  NOT NULL  PRIMARY KEY
	,buyerID					int
	,sellerID					int
	,listingID				int
	,orderStatus			varchar(32)
	,orderDoneDate		Date
);

create table buyer (
	 buyerID				  int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,buyerName				varchar(32)
	,buyerEmail				varchar(32)
	,buyerPhoneNum    varchar(32)	
);

create table seller (
	 sellerID				  int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,sellerName				varchar(32)
	,sellerEmail			varchar(32)
	,sellerPhoneNum   varchar(32)
);

create table listing (
	 listingID				int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,sellerID					int
	,bookID						int	
	,textbookID				int
	,furnitureID			int
	,price						int
	,quantity    			int
	,itemCondition		varchar(32)
	,picture					varchar(128)
);

	# addressing the concern of having more than 1 buyer/seller, which may not be of
	# importance to a buyer, I have included an itemCondition column, which will indicate 
	# the state of the item being sold to the buyer (e.g used, acceptable, good, new)

	# pictures will be stored in this table as a url, which will lead to a separate 
	# location with all pictures

create table textbooks (
	 textbookID				int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,textbookName			varchar(32)
	,author						varchar(32)
	,class						varchar(32)
	,ISBN							varchar(32)	
);

create table books (
	 bookID						int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,bookName					varchar(32)
	,author						varchar(32)
	,ISBN							varchar(32)
);

create table furniture (
	 furnitureID			int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,furnitureName		varchar(32)
	,brand						varchar(32)
	,width						int
	,height				    int
	,length						int
	,color						varchar(32)
);


insert into itemOrder(buyerID, sellerID, listingID, orderStatus, orderDoneDate)
	values
	 (1,			2,				3,			"available",						"NULL")
	,(5,			3,				5,			"order complete",				"2022-04-12")
	,(1,			4,				2,			"in process",						"NULL")
	,(4,			1,				4,			"in process",						"NULL")
	,(3,			5,				2,			"available",						"NULL")
	,(4,			2,				1,			"available",						"NULL")		
	,(2,			3,				5,			"order complete",				"2022-03-03")	
	;

insert into buyer(buyerName, buyerEmail, buyerPhoneNum)
	values
	 ("Karen White", 		"whitek0@sewanee.edu",					"+1234567890")
	,("Fred Green", 		"fredgreen@gmail.com",					"+1739571829")
	,("Jane Hill", 			"hillj@sewanee.edu",						"+1939472843")
	,("Austin King", 		"kingaus@sewanee.edu",					"+1294820483")
	,("Ken Lee", 				"kenlee1@gmail.com",						"+1593827848")
	;

insert into seller(sellerName, sellerEmail, sellerPhoneNum)
	values
	 ("Debbie Lim", 		"limy0@sewanee.edu",						"+1572271983")
	,("Carlos Zamora", 	"carlosz2@gmail.com",						"+1872748928")
	,("Gordon Hamsey", 	"bestchef@gmail.edu",						"+1238472910")
	,("Som Eguy", 			"eguys@sewanee.edu",						"+1121309829")
	,("Pheven Darl", 		"teacher@sewanee.edu",					"+1482736281")
	;

insert into listing(sellerID, bookID, textbookID, furnitureID, price, quantity, itemCondition, picture)
values
 (1,			2,				NULL,			NULL,			10,			1,			"new",				
 	"/home/limy0/html/Brownies-Recipe-2-1200.jpg")
,(5,			NULL,			5,				NULL,			5,			1,			"good",
	"/home/limy0/html/Brownies-Recipe-2-1200.jpg")
,(1,			NULL,			NULL,			3,				26, 		2,			"new",
  "/home/limy0/html/Brownies-Recipe-2-1200.jpg")
,(4,		  NULL,			4,				NULL,			13,			2,			"used",
	"/home/limy0/html/Brownies-Recipe-2-1200.jpg")
,(3,			5,				NULL,			NULL, 		8,			3,			"used",
	"/home/limy0/html/Brownies-Recipe-2-1200.jpg")
,(4,			NULL,			NULL,			5, 				15,			1,			"good",
	"/home/limy0/html/Brownies-Recipe-2-1200.jpg")		
,(2,			NULL,			NULL,			2, 				7,			1,			"acceptable",
	"/home/limy0/html/Brownies-Recipe-2-1200.jpg")	
;

insert into textbooks(textbookName, author, class, ISBN)
values
 ("Introduction to Economics",					"A. Profe Ssor",		"Econ101",				"2938427342")
,("Realidades", 												"Someo Neelse",			"Span102",				"1239237918")
,("Biology: human anatomy", 						"M. R. Smart",			"Biol233",				"9283472834")
,("Learning PHP, MySQL, JavaScript",		"Robin Nixon",			"Csci284",				"2034920348")
,("Introduction to Computer Science", 	"Teacher teacher",	"Csci157",				"3459345838")
;

insert into books(bookName, author, ISBN)
values
 ("How to cook eggs", 									"Jordon Hamsey",										"9234920743")
,("Reasons to do work early", 					"Apro Crastinator",									"3458394587")
,("Jokes to tell your dad", 						"Dad Dad",													"2342898593")
,("The 1940s",						 							"Keven Sarl",												"2342121122")
,("Things to do in your free time", 		"Guy Water",												"1231231234")
;

insert into furniture(furnitureName, brand, width, height, length, color)
values
 ("Sofa",					"Ikea",					67,			134,			60,			"black")
,("Microwave",		"Target",				13,			20,				10,			"grey")
,("Fridge",				"Walmart",			58,			21,				120,		"blue")
,("Desk chair",		"Ikea",					23,			13,				10,			"pink")
,("Bean bag",			"Target",				42,			17,				15,			"blue")
;