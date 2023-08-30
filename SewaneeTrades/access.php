<!-- Debbie Lim
		 php to access the SQL database
 -->

<?php

$host = 'kapitanov.sewanee.edu';
$data = 'SewaneeTrades';
$user = 'user';
$pass = 'pass';
$attr = "mysql:host=$host;dbname=$data";

try {
  $pdo = new PDO($attr, $user, $pass);
} 
catch (PDOException $e) {
  throw new PDOException($e->getMessage(), (int)$e->getCode());
}

function queryMysql($query)
{
	global $pdo;
	return $pdo->query($query);
}

function destroySession()
{
	$_SESSION=array();
	if (session_id() != "" || isset($_COOKIE[session_name()]))
		setcookie(session_name(), '', time()-2592000, '/');
	session_destroy();
}

function sanitizeString($var)
{
	global $pdo;
	$var = strip_tags($var);
	$var = htmlentities($var);
	if (get_magic_quotes_gpc())
		$var = stripslashes($var);
	$result = $pdo->quote($var);
	return str_replace("'","", $result);
}

function get_post($pdo, $var)
{
return $pdo->quote($_POST[$var]);
}
?>
