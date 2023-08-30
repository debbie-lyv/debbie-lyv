<!-- Debbie Lim
		 header page used in every php page
 -->

<?php
	session_start();

require_once 'access.php';

$userstr = 'Welcome Guest';
$randstr = substr(md5(rand()), 0, 7);

if (isset($_SESSION['user']))
{
	$user = $_SESSION['user'];
	$loggedin = TRUE;
	$userstr = "Logged in as: $user";
} else $loggedin = FALSE;

echo "<div id = 'user'>$userstr</div";
?>

<!DOCTYPE html>
<html>
	<head>
		<link rel = 'stylesheet' href = 'index.css'>
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
	</head>

<center><h1> Sewanee Trades </h1></center>

<div class = "menu">
<ul> 
  <li class = "menuOptions"><a class = "menulinks" href = "index.php"> Home </a></li>
  <li class = "menuOptions"><a class = "menulinks" href = "profile.php"> Profile </a></li>
  <li class = "menuOptions"><a class = "menulinks" href = "login.php"> Login </a></li>  
  <li class = "menuOptions"><a class = "menulinks" href = "sell.php"> Sell </a></li>
  <li class = "dropdown">
  	<p class = "dropdownItems"> Buy </p>
  	<div class = "dropdownLinks">
  		<a href = "buyTextbooks.php"> Buy Books </a>
  		<a href = "buyFurniture.php"> Buy Furniture </a>
  	</div>
  </li>	   
  <li class = "menuOptions"><input class = "menulinks" name= search placeholder='Search'></li>
</ul>
</div>
</html>

