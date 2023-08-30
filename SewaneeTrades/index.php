<!-- Debbie Lim
		 index page for the Sewanee Trades website
 -->

<?php

	require_once 'header.php';

echo <<<_END

<!--
https://www.froglogic.com/blog/accessing-sql-database-javascript-test/
-->

<html>

<head>
	<title>Sewanee Trades</title>
</head>


<center>
<h2 id = 'indexSubHeader'> BUY </h2>
</center>

<img src = "books.jpg" id = "booksImage">

<center>
<div class = "buyOption1"> 
	<a class = "buyLinks" href = "buyTextbooks.php">
	<b> Books </b>
	<p> Choose from a wide range of books or find a cheap secondhand course textbook! </p>	
</a>
</div>

<div class = "buyOption2"> 
	<a href = "buyFurniture.php">	
	<b> Furniture </b>
	<p> Looking for a cheap microwave? Want to buy a fridge? Click here for a bargain! </p>	
	</a>	  
</div>

<h2 id = 'indexSubHeader'> SELL </h2>

<div id = "sellLink">
	<a href = "sell.php"> Are you a graduating senior, or have items you no longer want? Want to pass down your old textbooks? List your items here!	</a></h4>
</div>


<script>
var colorCount=0; 
var r = 225;
var g = 203;
var b = 154; 

var animColor = window.setInterval(

              function color(){
                document.getElementById('sellLink').style.background =  "rgb(" + r + "," + g + "," + b +")";
                r += 15;
                g += 10;
                b += 10;
                if (r == 255 && g == 255 && b == 255) {
                	r -= 15;
                	g -= 15;
                	b -= 15;
                	requestAnimationFrame(color);
                } 
              }
              ,100
            );
color();
</script>


<div id = "footer">
	<h4> Sewanee Trades </h4>
		<a id = "footerLinks" href = "profile.php"> Profile </a>
		<a id = "footerLinks" href = "login.php"> Login </a>			
		<a id = "footerLinks" href = "https://bighack.org/how-to-write-better-alt-text-descriptions-for-accessibility/"> 
			Alt text accessibility reference </a>
		<a id = "footerLinks" href = "https://uxplanet.org/a-primer-to-web-accessibility-for-designers-2c548448c612"> 
			Typography accessibility reference </a>
		<a id = "footerLinks" href = "https://visme.co/blog/website-color-schemes/">
			Color scheme accessibility reference </a>			
	<br>
</div>
</center>
</html>

_END;
?>