<?php
  require_once 'header.php';
?>

<head>
  <title>
    Item Listing 
  </title>
</head>


<center>
<h2> I'm listing a(n): </h2>
<div class = "sellOptions"> Book </div>
<div class = "sellOptions"> Item </div>

</center>

<div class = "form">
<center>

<h2 id= "loginTitle">List an item</h2>

  <form id="form">

  Furniture Name: <br><br>
  <input type="name" name="furnitureName" id ="id">

  <br><br> Price: <br><br>
  <input type="name" name="price" id ="id">

  <br><br> Quantity: <br><br>
  <input type="text" name="quantity" id ="id">

  <br><br> Condition of item: <br><br>
  <input type="text" name="itemCondition" id ="id">

  <br><br> Upload an image: <br><br>
  <input type="text" name="image" id ="id">

  <br><br> Brand: <br><br>
  <input type="text" name="brand" id ="id">

  <br><br> Width: <br><br>
  <input type="text" name="width" id ="id">

  <br><br> Height: <br><br>
  <input type="text" name="height" id ="id">

  <br><br> Length: <br><br>
  <input type="text" name="length" id ="id">

  <br><br> Color: <br><br>
  <input type="color" name="color" id ="id">

  <br><br>
  <button class="submit">Submit</button>

  </form><br>

</center>
</div>

</html>
