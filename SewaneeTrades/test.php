<!-- Debbie Lim
     registration page to create an account
 -->
<pre>
<?php
$host = 'kapitanov.sewanee.edu';
$data = 'SewaneeTrades';
$user = 'user';
$pass = 'pass';
$attr = "mysql:host=$host;dbname=$data";

try {
  $pdo = new PDO($attr, $user, $pass);
  echo "hello";
} 
catch (PDOException $e) {
  throw new PDOException($e->getMessage(), (int)$e->getCode());
}

$firstName = "a";
$lastName = "b";
$email = "c";
$phoneNum = "d";
$user = "e";
$password = "f";

$query = "INSERT INTO users(firstName, lastName, email, phoneNum, user, password) VALUES('$firstName', '$lastName', '$email', '$phoneNum', '$user', '$password')";
 echo "$query";
/*
    $result = queryMysql($query);

    print_r($result);

      echo '<h2><center> Account created! Please login ' . $firstName . "</center></h2>";
    }
}

function queryMysql($query)
{
  global $pdo;
  return $pdo->query($query);
}*/
?>