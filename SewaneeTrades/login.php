<!-- Debbie Lim
     page to login to a personal account
 -->

<?php

require_once 'header.php';

$error = $user = $password = "";

if (isset($_POST['user']))
{
  $user = sanitizeString($_POST['user']);
  $password = sanitizeString($_POST['password']);    
    

  if ($user == "" || $password == "")
    $error = 'Error: some fields left blank!<br><br>';
 else 
  {
    $result = queryMysql("SELECT user, password FROM users WHERE user = '$user' AND password = '$password'");

    if ($result->rowCount() == 0)
    {
    	$error = "Invalid login attempt <br><br>";
    }
    else 
    {
    	$_SESSION['user'] = $user;
    	$_SESSION['password'] = $password;
    	die("<h2><center> You are now logged in $user <center></h2>");
    }
  }
}

echo <<<_END

<center>
<form class="form" method = 'post' action = 'login.php?r=$randstr'>

  <h2 id = "loginTitle">Enter login details:</h2>

  $error

  <label>User Name</label><br><br>
  <input type="text" name="user" placeholder="E.g user1">

  <br><br> Password: <br><br>
  <input type="text" name="password">

  <br><br><button type ='submit' class="submit">Submit</button>

  </form><br>

  <div id = "sellLink"><a href = 'register.php'> Don't have an account? Register here! </a></div>

</div>
</center>
_END;
?>