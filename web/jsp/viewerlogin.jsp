<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Viewer's Login Page</title>
<link rel='stylesheet' href='../css/form-style.css' type='text/css' />      
</head>

	<h1 id="h">Viewer's Login Page</h1>

  

<body onload='document.form1.text1.focus()'>

<div class="mail">
<h2>Email</h2>

<form name="form1" action="../viewlo" method="post" > 

<ul>
<li><input type='email' name='text1'/></li>
<li>&nbsp;</li>
<li class="submit"><input type="submit" name="submit" value="Submit" onclick="ValidateEmail(document.form1.text1)"/></li>
<li>&nbsp;</li>
</ul>
</form>

</div>
<!-- <script src=" ../js/jqureg.js" ></script>-->
<script src="../js/email-validation.js"></script>
</body>
</html>