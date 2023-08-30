<!-- Debbie Lim
     registration page to create an account
 -->

<?php
  require_once 'header.php';

echo <<<_END

<script>
  function checkUser(user)
  {
    if (user.value == '')
    {
      $('#used').html('&nbsp;')
      return
    }
    $.post
    (
      'checkUser.php'
      ,{ user : user.value }
      ,function(data)
      {
        $('#used').html(data)
      }
    )
  }

</script>

_END;

$error = $user = $password = "";
if (isset($_SESSION['user'])) destroySession();

if (isset($_POST['user']))
{
  $firstName = sanitizeString($_POST['firstName']);
  $lastName = sanitizeString($_POST['lastName']);
  $email = sanitizeString($_POST['email']);
  $phoneNum = sanitizeString($_POST['phoneNum']);
  $user = sanitizeString($_POST['user']);
  $password = sanitizeString($_POST['password']);    
  $confirm = sanitizeString($_POST['confirm']);    

  if ($user == "" || $password == "")
    $error = 'Error: some fields left blank!<br><br>';
  elseif ($password != $confirm) 
    $error = 'Error: passwords do not match! <br><br>';
  else 
  {
    $result = queryMysql("INSERT INTO users(firstName, lastName, email, phoneNum, user, password) VALUES('$firstName', '$lastName', '$email', '$phoneNum', '$user', '$password')");

    print_r($result);

      echo '<h2><center> Account created! Please login ' . $firstName . "</center></h2>";
    }
}

echo <<<_END
<head>
  <title>
    User Registration
  </title>

</head>



<div class = "form">
<center>

  <form class="form" method = 'post' action = 'register.php?r=$randstr'>

  <h2 id = "loginTitle">Create An Account</h2>

  $error

  <label>First Name</label><br><br>
  <input type="name" name="firstName" placeholder="E.g: Debbie">

   <br><br><label>Last Name</label><br><br>
  <input type="name" name="lastName"placeholder="E.g: Lim">

  <br><br><label>Email</label><br><br>
  <input type="text" name="email" maxlength = '50' placeholder="E.g: user@sewanee.edu">

  <br><br> <label>Phone Number</label><br><br>
  <input type="text" name="phoneNum" placeholder="E.g: +1-234-567-8900">

  <br><br><label>User Name</label><br><br>
  <input type="text" maxlength='16' name="user" placeholder="E.g user1" 
  onBlur='checkUser(this)'>
  <div id = 'used'></div>

  <br><br> Password: <br><br>
  <input type="text" name="password">

  <br><br> Confirm Password: <br><br>
  <input type="text" name="confirm" id ="confirm">

  <br><br>
  <button type ='submit' class="submit">Submit</button>

  </form><br>

</center>
</div>

</html>
_END;
?>