# Debbie Lim
# Edited version of the SQL database,
# following Dr. Dale's comments

#--------------------------------------------------------------------
drop database if exists SewaneeTrades;
create database SewaneeTrades;
	use SewaneeTrades;

GRANT SELECT, INSERT, DELETE ON SewaneeTrades.* TO 'user'@'%' IDENTIFIED BY 'pass';
#--------------------------------------------------------------------

create table itemOrder (
	 orderID					int							  AUTO_INCREMENT  NOT NULL  PRIMARY KEY
	,userID					int
	,listingID				int
	,orderPlaced			Date
	,orderCompleted		Date
);

create table users (
	 userID					int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,firstName				varchar(32)
	,lastName				varchar(32)
	,email					varchar(32)
	,phoneNum    			varchar(32)	
	,user						varchar(32)
	,password				varchar(32)
);

create table listing (
	 listingID				int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,userID					int
	,bookID					int	
	,furnitureID			int
	,price					int
	,quantity    			int
	,itemCondition			varchar(32)
	,picture					varchar(128)
	,listingDate			Date
);

create table books (
	 bookID					int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,bookName				varchar(32)
	,author					varchar(32)
	,ISBN						varchar(13)	
	,classID					int
);

create table courses (
	 classID					int 							AUTO_INCREMENT  NOT NULL  PRIMARY KEY
	,class					varchar(10)
);

create table furniture (
   furnitureID				int 							AUTO_INCREMENT	NOT NULL	PRIMARY KEY
	,furnitureName			varchar(32)
	,brand					varchar(32)
	,width					int
	,height				   int
	,length					int
	,color					varchar(32)
);

insert into itemOrder(userID, listingID, orderPlaced, orderCompleted)
	values
	   (1,			3,			NULL,						NULL)
	  ,(5,			5,			"2021-12-01",			"2022-01-05")
	  ,(7,			2,			"2022-04-12",			NULL)
	  ,(4,			4,			NULL,						NULL)
	  ,(2,			6,			"2022-03-28",			"2022-04-16")
	  ,(2,			1,			"2022-02-17",			NULL)			
	;

insert into users(FirstName, lastName, email, phoneNum, user, password)
	values
	  ("Karen",       "White", 					"whitek0@sewanee.edu",					"+1234567890",		"user1",		"password")
	 ,("Fred",			"Green", 					"fredgreen@gmail.com",					"+1739571829",		"user2",		"password")
	 ,("Ken",			"Lee",			 			"kenlee1@gmail.com",						"+1593827848",		"user3",		"password")
	 ,("Debbie",		"Lim", 						"limy0@sewanee.edu",						"+1572271983",		"user4",		"password")
	 ,("Carlos",		"Zamora", 					"carlosz2@gmail.com",					"+1872748928",		"user5",		"password")
	 ,("Gordon", 		"Hamsey", 					"bestchef@gmail.edu",					"+1238472910",		"user6",		"password")
	 ,("Som", 			"Eguy", 						"eguys@sewanee.edu",						"+1121309829",		"user7",		"password")
	 ,("Bephen",  		"Darl", 						"teacher@sewanee.edu",					"+1482736281",		"user8",		"password")	
;

insert into listing(userID, bookID, furnitureID, price, quantity, itemCondition, picture, listingDate)
	values
  (8,		7,				NULL,			10,		1,		"new",					"CSTextbook.jpg", 		"2021-11-30")
 ,(5,		NULL,			5,				5,			1,		"good",					"CSTextbook.jpg", 		"2021-12-18")
 ,(3,		NULL,			3,				26, 		2,		"new",				   "CSTextbook.jpg", 		"2022-01-04")
 ,(4,		8,				NULL,			13,		2,		"used",					"CSTextbook.jpg", 		"2021-09-15")
 ,(3,		5,				NULL, 		8,			3,		"used",					"CSTextbook.jpg", 		"2021-10-26")
 ,(7,		NULL,			1,				15,		1,		"good",					"CSTextbook.jpg", 		"2021-02-28")		
 ,(2,		1,				NULL, 		7,			1,		"acceptable",			"CSTextbook.jpg", 		"2022-04-18")	
;	

insert into books(bookName, author, ISBN, classID)
	values
 		("How to cook eggs", 							"Jordon Hamsey",						"9234920743",		1)
	  ,("Reasons to do work early", 					"Apro Crastinator",					"3458394587",		1)
	  ,("Jokes to tell your dad", 					"Dad Dad",								"2342898593",		1)
	  ,("The 1940s",						 				"Keven Sarl",							"2342121122",		1)
	  ,("Things to do in your free time", 			"Guy Water",							"1231231234",		1)
	  ,("Introduction to Economics",					"A. Profe Ssor",						"2938427342",		2)
	  ,("Realidades", 									"Someo Neelse",						"1239237918",		3)
	  ,("Biology: human anatomy", 					"M. R. Smart",							"9283472834",		4)
	  ,("Learning PHP, MySQL, JavaScript",			"Robin Nixon",							"2034920348",		5)
	  ,("Introduction to Computer Science", 		"Teacher teacher",					"3459345838",		6)
;

insert into courses(class) 
	values
	   ("n/a")
	  ,("Econ101")
	  ,("Span102")
	  ,("Biol233")
	  ,("Csci284")
	  ,("Csci157")
;

insert into furniture(furnitureName, brand, width, height, length, color)
	values
 		 ("Sofa",				"Ikea",					67,			134,				60,			"black")
		,("Microwave",			"Target",				13,			20,				10,			"grey")
		,("Fridge",				"Walmart",				58,			21,				120,			"blue")
		,("Desk chair",		"Ikea",					23,			13,				10,			"pink")
		,("Bean bag",			"Target",				42,			17,				15,			"blue")
;