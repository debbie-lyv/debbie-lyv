<?php

require_once 'header.php';

	echo <<<_START
	<html>

<head>
	<title>Sewanee Trades</title>
</head>

 <h2 id = "furnitureTag"><center> Furniture for Sale </center></h2>

<form method=post action="buyFurniture.php"> 
<ul class = "sidebar">

	<li class = "filters">
		Furniture type: <br>
    <input type="radio" name="furnitureName" value="microwave"> Microwave <br>
		<input type="radio" name="furnitureName" value="sofa"> Sofa <br>
		<input type="radio" name="furnitureName" value="fridge"> Fridge <br>
		<input type="radio" name="furnitureName" value="chair"> Chair <br>
	</li>
	<li class = "filters">
		Brand: <br>
    <input type="radio" name="brand" value="ikea"> Ikea <br>
		<input type="radio" name="brand" value="target"> Target <br>
		<input type="radio" name="brand" value="walmart"> Walmart <br>
	</li>	
	<li class = "filters">
		Select a color: <br>
    <input type="radio" name="color" value="black"> Black <br>
		<input type="radio" name="color" value="grey"> Grey <br>
		<input type="radio" name="color" value="blue"> Blue <br>
		<input type="radio" name="color" value="pink"> Pink <br>
	</li>
	<li class = "filters">
		Price (\$): <div id = 'num'></div> <input type="range" name = "price" min="1" max = "100" value="50" class="slider" id="range">
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
	<li class = "filters"> <input type = "submit"> </button></li>
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

	$result = $pdo->query("SELECT firstName, lastName, email, phoneNum, furnitureName, brand, width, height, length, color, price, quantity, itemCondition, picture, listingDate 
		FROM listing, users, furniture 
		WHERE users.userID = listing.userID
		AND furniture.furnitureID = listing.furnitureID");
	
	if (isset($_POST['furnitureName']) 
	|| isset($_POST['brand']) 
	|| isset($_POST['color']) 
	|| isset($_POST['price']) 
	|| isset($_POST['quantity'])				
	|| isset($_POST['itemCondition'])) 					
	{

	  $furnitureName = get_post($pdo, 'furnitureName');
	  $brand = get_post($pdo, 'brand');
	  $color = get_post($pdo, 'color');
	  $price = get_post($pdo, 'price');
	  $quantity = get_post($pdo, 'quantity');      
	  $itemCondition = get_post($pdo, 'itemCondition');

	  $query = "SELECT furnitureName, brand, width, height, length, color, picture, quantity, itemCondition 
	  FROM listing, users, furniture
		WHERE users.userID = listing.userID
    AND listing.furnitureID = furniture.furnitureID
    AND courses.classID = books.classID
    AND (furnitureName LIKE $furnitureName
    OR brand LIKE $brand
    OR color LIKE $color    
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
		$r4 = htmlspecialchars($row['furnitureName']);
		$r5 = htmlspecialchars($row['brand']);
		$r6 = htmlspecialchars($row['width']);
		$r7 = htmlspecialchars($row['height']);
		$r8 = htmlspecialchars($row['length']);
		$r9 = htmlspecialchars($row['color']);
		$r10 = htmlspecialchars($row['price']);		
		$r11 = htmlspecialchars($row['quantity']);
		$r12 = htmlspecialchars($row['itemCondition']);	
		/*$r12 = htmlspecialchars($row['picture']);	*/
		$r13 = "CSTextbook.jpg";
		$r14 = htmlspecialchars($row['listingDate']);
		
		echo <<<_START


	<div class = "boxes"> 
		<img src = "$r13" alt = "Image of furniture" id = listPic width = "200"><br>
		<b> $r4 (\$$r10) </b> <br> 
		<div class = "hidden">		
		Seller: $r0 $r1 <br>
		Email: $r2 <br>
		Phone Number: $r3 <br>
		Brand: $r5 <br>
		Dimensions (in): $r6 x $r7 x $r8 <br>
		Color: $r9 <br> 
		Quantity: $r10 <br>
		Condition: $r11	<br>
		Date of Listing: $r14 <br>
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

