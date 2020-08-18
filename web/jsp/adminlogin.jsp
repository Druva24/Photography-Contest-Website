<!doctype html>
<html>
<head>
  <title></title>
  <style type = "text/css">
    *{
      margin:0;
      padding:0;
      font-family :sans-serif;
	  background-image:url(http://onehdwallpaper.com/wp-content/uploads/2015/07/Beautiful-Good-Morning-HD-Photography.jpg);
    }
    body{
      height: 100%;
      width: 100%;
      background-image: url(http://onehdwallpaper.com/wp-content/uploads/2015/07/Beautiful-Good-Morning-HD-Photography.jpg);
      background-position: center;
      background-size: cover;
      position: absolute;
    }
	.login-form{
		height: 100vh;
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 15px;
	}
    .form-box{
      width: 300px;
      height: 450px;
      position: relative;
      margin: 8% auto;
      background: rgba(0,0,0,0.8);
      padding: 50px;
	  display: flex;
	  flex-direction: column; 
    }
    .input-group{
      top:130px;
      position: absolute;
      width: 300px;
      transition: .5s;
	  display: flex;
	  flex-direction: column;
    }
    .input-field{
      width: 100%;
      padding: 10px 0;
      margin: 15px 0;
      font-size: 16px;
      color: #fff;
      font-weight: 200;
      border-left:12px;
      border-top:0;
      border-right:0;
      border-bottom: 2px solid #999;
      outline : none;
	  display: flex;
	  flex-direction: column;
      background: transparent;
    }
    .submit-btn{
      width: 110px;
	  height: 50px;
      padding: 20px 30px;
      cursor: pointer;
      display:block;
      margin: auto;
      background: rgba(10,20,10,0.7);
      border: 0;
      outline: none;
      border-radius: 30px;
	  font-size: 16px;
      color: #fff;
      font-weight: 200;
    }
    .checkbox{
      margin: 30px 10px 30px 0;
    }
    span{
      color:#777;
      font-size: 12px;
      bottom: 68px;
      position: absolute;
    }
    #login{
      left: 50px;
    }
    
	
/*responsive*/
@media(max-width: 500px){
body{
	min-width: 100%;
	padding: 30px;
}
.form-box{
	min-width: 100%;
}
}
  </style>


<!--<script type = "text/javascript">

  var check_userid= /^[a-z]+$/;;
/*  var check_email= /^[a-zA-Z]{2,}[.]?[-]?[A-Za-z0-9]{1,}[@]{1}[a-zA-Z0-9]{1,}[.][a-zA-Z]{2,4}([.]{1}[a-zA-Z]{2,4})?$/;*/
  var check_password =/^(?=^.{8,}$)(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])[a-zA-Z0-9]+$/;

  function validation(){
    var user= document.getElementById('userid').value;
  /*  var email= document.getElementById("emailid").value;*/
    var password= document.getElementById('passwordid').value;
  
	if(user ===""){
		alert("Please enter a valid userid");
		return false;
	}

 	if(password === ""){
		alert("Please enter a valid password");
		return false;
	}

    if(!check_userid.test(user)){
     alert("user id must contain a-z");
		return false;
	}

    if(!check_password.test(password)){
      alert("password must contain length 8 with atleast one number , atleast one uppercase letter, atleast one lowercase letter ");
		return false;
	 }
	 
	alert("Login Successful");
	return true;
  }
//Problem: Hints are shown even when form is valid
//Solution: Hide and show them at appropriate times
-->


</head>

	<body>
             <h1 style="text-align:center;color:#009999 ;">Admin Login</h1>
	<section class = "login-form">
		<div class ="form-box">
			<form method ="post" id="login" class="input-group" action="../adminlogin" onsubmit= "return validation();" >
				<div >
                                    <input type ="text" class ="input-field" id= "userid" placeholder="User Id" name="UserName">
				</div>

				<div>
                                    <input type ="password" class ="input-field" id="passwordid" placeholder="Enter Password" name="password">
				</div>
<!-- 
				<input type ="checkbox" class ="checkbox"> <span>Remember Password</span> -->
				<button type="submit" class= "submit-btn" id="submit">Log in</button>
			</form>
		</div>
	</section>
         <script src=" ../js/jqureg.js" ></script>
         <script src="../js/particilog.js"></script>      
	</body>
</html>