#--------------------------------------------------------------------
#	1) Search for a book listing from a seller whose name is Debbie
#--------------------------------------------------------------------

SELECT books.bookName, price, quantity, itemCondition, picture FROM books, listing, seller
	WHERE listing.bookID = books.bookID
	AND sellerName LIKE "%Debbie%"
	;

#--------------------------------------------------------------------
#	2) Search for all sellers who are selling Csci284 textbooks
#--------------------------------------------------------------------

SELECT sellerName, sellerEmail, sellerPhoneNum FROM listing, seller, textbooks
	WHERE listing.sellerID = seller.sellerID
	AND textbooks.textbookID = listing.textbookID
	AND class LIKE "Csci284"
	;

#--------------------------------------------------------------------
#	3) Search for microwaves under $10
#--------------------------------------------------------------------

SELECT furnitureName, brand, width, height, length, color, price, quantity, itemCondition, picture FROM furniture, listing
	WHERE listing.furnitureID = furniture.furnitureID
	AND furnitureName LIKE "%microwave%"
	AND price < 10
	;

#--------------------------------------------------------------------
#	4) Search for the sellers listing fridges and Csci157 books for sale
#--------------------------------------------------------------------

SELECT sellerName, sellerEmail, sellerPhoneNum FROM seller, furniture, textbooks, listing
	WHERE furniture.furnitureID = listing.furnitureID
	AND textbooks.textbookID = listing.textbookID
	AND furnitureName LIKE "%Fridge"
	AND class LIKE "%Csci157"
	;

#--------------------------------------------------------------------
#	5) Search for all sellers who are selling more than 1 fridge, who have an "@sewanee.edu" email
#--------------------------------------------------------------------

SELECT sellerName, sellerEmail, sellerPhoneNum FROM listing, seller, furniture
	WHERE furniture.furnitureID = listing.furnitureID
	AND seller.sellerID = listing.sellerID
	AND sellerEmail LIKE "%@sewanee.edu%"
  AND furnitureName LIKE "%Fridge%"
	AND quantity > 1
	;

#--------------------------------------------------------------------
#	6) Who was the top seller from 2021 to 2022?
#--------------------------------------------------------------------	

SELECT sellerName from seller, itemOrder
	WHERE seller.sellerID = itemOrder.sellerID
	AND "2023-01-01" > orderDoneDate
	AND "2021-01-01" < orderDoneDate
	ORDER BY orderDoneDate DESC LIMIT 1
	;

#--------------------------------------------------------------------
#	7) List all furniture in the best condition
#--------------------------------------------------------------------	

SELECT furnitureName, brand, width, height, length, color, price, quantity, itemCondition, picture FROM furniture, listing
	WHERE listing.furnitureID = furniture.furnitureID
	AND itemCondition LIKE "new" 
	;