<?php
	require_once 'access.php';
	
	if (isset($_POST['user'])) 
	{
		$user = sanitizeString($_POST['user']);
		$result = queryMysql("SELECT * FROM users WHERE user = '$user'");

		if ($result -> rowCount())
			echo "<span class = 'taken'> Error: the username '$user' is already taken! </span>";
		else 
			echo "<span class = 'available'> The username '$user' is available! </span>";
	}
?>