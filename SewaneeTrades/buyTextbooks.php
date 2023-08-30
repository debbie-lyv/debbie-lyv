<?php

require_once 'header.php';


	echo <<<_START
	<html>

<head>
	<title>Sewanee Trades</title>
</head>

 <h2 id = "furnitureTag"><center> Books for Sale </center></h2>

<form method=post action="buyTextbooks.php"> 
<ul class = "sidebar">

	<li class = "filters">
		Author: <br>
    <input type="radio" name="author" value="Someo Neelse"> Someo Neelse <br>
		<input type="radio" name="author" value="M. R. Smart"> M. R. Smart <br>
		<input type="radio" name="author" value="Guy Water"> Guy Water <br>
		<input type="radio" name="author" value="Jordon Hamsey"> Jordon Hamsey <br>
		<input type="radio" name="author" value="Apro Crastinator"> Apro Crastinator <br>
		<input type="radio" name="author" value="Dad Dad"> Dad Dad <br>
		<input type="radio" name="author" value="Keven Sarl"> Keven Sarl <br>	
		<input type="radio" name="author" value="Robin Nixon"> Robin Nixon <br>
		<input type="radio" name="author" value="Teacher teacher"> Teacher teacher <br>									
	</li>
	<li class = "filters">
		Class: <br>
    <input type="radio" name="class" value="Span102"> Span102 <br>
		<input type="radio" name="class" value="Biol233"> Biol233 <br>
		<input type="radio" name="class" value="Econ101"> Econ101 <br>
		<input type="radio" name="class" value="Csci284"> Csci284 <br>
		<input type="radio" name="class" value="Csci157"> Csci157 <br>	
		<input type="radio" name="class" value="n/a"> n/a <br>					
	</li>	
	<li class = "filters">
		Price (\$): <div id = 'num'></div><input type="range" name = "price" min="1" max = "100" value="1" class="slider" id="range">
	</li>	
	<li class = "filters">
		Quantity: <br>
   	<select name="quantity" size="5" multiple="multiple">
    	<option value="1"> 1 </option>
    	<option value="2"> 2 </option>
    	<option value="3"> 3 </option>
    	<option value="4"> 4 </option>
    	<option value="5"> 5 or more </option>            
  	</select>
	</li>
	<li class = "filters">
		Item condition
   	<select name="itemCondition" size="4" multiple="multiple">
    	<option value="new"> New </option>
    	<option value="good"> Good </option>
    	<option value="acceptable"> Acceptable </option>
    	<option value="used"> Used </option>         
  	</select>
	</li>
	<li class = "filters"><input type = "submit"></li>
</ul>
</form>

<script>
var slider = document.getElementById("range");
var output = document.getElementById("num");
output.innerHTML = slider.value;

slider.oninput = function() {
  output.innerHTML = this.value;
} 
</script>


_START;


	$result = $pdo->query(
		"SELECT firstName, lastName, email, phoneNum, bookName, author, 
		ISBN, class, price, quantity, itemCondition, picture, listingDate 
		FROM listing, users, books, courses 
		WHERE users.userID = listing.userID
    AND listing.bookID = books.bookID
    AND courses.classID = books.classID");
	
		
if  (isset($_POST['author']) 
	|| isset($_POST['class'])  
	|| isset($_POST['price']) 
	|| isset($_POST['quantity'])				
	|| isset($_POST['itemCondition'])) 					
	{

	  $author = get_post($pdo, 'author');
	  $class = get_post($pdo, 'class');
	  $price = get_post($pdo, 'price');
	  $quantity = get_post($pdo, 'quantity');      
	  $itemCondition = get_post($pdo, 'itemCondition'); 

	$query = "SELECT firstName, lastName, email, phoneNum, bookName, author, 
		ISBN, class, price, quantity, itemCondition, picture, listingDate 
		FROM listing, users, books, courses 
		WHERE users.userID = listing.userID
    AND listing.bookID = books.bookID
    AND courses.classID = books.classID
    AND (author LIKE $author
    OR class LIKE $class
    OR price <= $price
    OR quantity = $quantity
    OR itemCondition LIKE $itemCondition)";
	$result = $pdo->query($query);
	}

	while($row = $result->fetch())
	{
		$r0 = htmlspecialchars($row['firstName']);
		$r1 = htmlspecialchars($row['lastName']);
		$r2 = htmlspecialchars($row['email']);		
		$r3 = htmlspecialchars($row['phoneNum']);
		$r4 = htmlspecialchars($row['bookName']);
		$r5 = htmlspecialchars($row['author']);
		$r6 = htmlspecialchars($row['ISBN']);
		$r7 = htmlspecialchars($row['class']);
		$r8 = htmlspecialchars($row['price']);		
		$r9 = htmlspecialchars($row['quantity']);
		$r10 = htmlspecialchars($row['itemCondition']);	
		$r11 = "CSTextbook.jpg";
		$r12 = htmlspecialchars($row['listingDate']);

	echo <<<_START

	<div class = "boxes"> 

	<img src = '$r11' alt = 'Image of Book' id = listPic width = '200'><br>
	<b> $r4 <br>
	(\$$r8) </b><br>
	<div class = "hidden">
		Seller: $r0 $r1 <br>
		Email: $r2 <br>
		Phone Number: $r3 <br>
		Author: $r5 <br>
		ISBN: $r6 <br>
		Class: $r7 <br>
		Quantity: $r9 <br>
		Condition: $r10	<br>
		Date of Listing: $r12 <br>
	</div>

	</div>

	<script>
		$(document).ready(function() {
			$(".hidden").hide();			

			$(".boxes").click(function() {
				$(".hidden").show();
			});	

	});		
	</script>

_START;
	}

?>

