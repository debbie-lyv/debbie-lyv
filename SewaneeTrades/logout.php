<?php 

require_once 'header.php';
	if (isset($_SESSION['user'])){
		destroySession();
		echo <<<_START
		<br><div class='center'>You have been logged out.
		Please <a href='index.php'><h4>click here</h4></a>to refresh the screen.</div>
_START;

	}
	else echo "<h2><center>You cannot log out because
	you are not logged in</center></h2>"


?>
