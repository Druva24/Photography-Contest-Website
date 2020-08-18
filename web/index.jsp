
<%@page import="com.photography.beans.eventhandler"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.photography.model.userdb"%>
<%@page import="com.photography.beans.registerbean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css"/>
        <style>
  {
margin:0;
padding:0;
}

.cover{
background-image:url('images/mn.jpg');

//width:100%;
//height:100%;
}

.nav-bar{
width:100%;
height:90px;
background-color:rgba(0, 0, 0, .1);
}

.left-bar{
width:25%;
height:100%;
line-height:80px;
display:inline-block;
}

.left-bar h4{
padding-left:50px;
font-weight:bold;
color:white;
font-size:45px;
font-family: 'Montserrat', sans-serif;
}
.left-bar h4:hover{
cursor:pointer;
color:orange;
}

.right-bar{
width:70%;
height:100%;
margin-left: 70px;
text-align: right;
display:inline-block;
}
.right-bar ul li
{
font-family: 'Montserrat', sans-serif;
display:inline-block;
color:white;
list-style:none;
font-size:15px;
font-weight:bold;
line-height:80px;
margin-left:40px;
text-transform:uppercase;
}


.right-bar ul li:hover{
cursor:pointer;
color:orange;
}

.right-bar ul ul {
  display: inline;
  margin: 0;
  padding: 0;
}
.right-bar ul ul li {display: inline-block;}
.right-bar ul ul li:hover {background: #555;}
.right-bar ul ul li:hover ul {display: block;}
.right-bar ul ul li ul {
  position: absolute;
  width: 200px;
  display: none;
  right:0;
}
.right-bar ul ul li ul li { 
  background: #555; 
  display: block; 
}
.right-bar ul ul li ul li a {display:block !important;} 
.right-bar ul ul li ul li:hover {background: #666;}

.hero-text{
width:100%;
margin-top:40px;
text-transform:uppercase;
text-align:center;
color:white;
margin-bottom: 100px;
}

.hero-text h4{
font-size:14px;
font-family: 'Montserrat', sans-serif;
}

.hero-text h1{
font-size:62px;
font-family: 'Montserrat', sans-serif;
font-weight:700;
margin:14px 0px;
}

.hero-text h3{
font-size:12px;
font-family: 'Montserrat', sans-serif;
}

.hero-text h2{
font-size:30px;
font-family: 'Montserrat', sans-serif;
font-weight:700;
margin:14px 0px;
}

#he 
{
	background-image: url('images/m.jpg');
	background-size: 1000px,1000px;
	font-size:30px;
        font-family: 'Montserrat', sans-serif;
        font-weight:700;
	text-align: center;
	color: black; 
	padding-bottom: 40px;
	margin-bottom:  5px; 
}

#btn-1,#btn-2{
border:none;
background:linear-gradient(45deg,white,transparent);
font-size:15px;
font-weight:bold;
text-transform:uppercase;
line-height:40px;
width:150px;
font-family: 'Montserrat', sans-serif;
margin-top:25px;
border:3px solid white;
cursor:pointer;
}



        </style>
            
    </head>
    <body>

<div id ="he">
	<h1>Photography Competitions</h1>
</div>
<div class="cover">
	<div class="nav-bar">
			<div class="left-bar">
                            <h4 onclick="mylinkfunction()">Contest</h4>
			</div>
		<div class="right-bar">
				<ul>
					<li onclick="document.location='index.jsp'">Home</li>
<!--					<li>About Us</li>
					<li>Contact</li>-->
                                        <li onclick="document.location=' jsp/registration.jsp'">Sign Up</li>
                                        <ul>
                                        <li> login
                                                  <ul >
                                                      <li onclick="document.location='jsp/adminlogin.jsp'">admin</li>
                                                      <li onclick="document.location='jsp/contestlogin.jsp'">contest manager</li>
                                                      <li onclick="document.location='jsp/participantconlogin.jsp'">Participant</li>
                                                      <li onclick="document.location='jsp/viewerlogin.jsp'">Viewer</li>
                                                  </ul>
                                        </li>
                                        </ul>
				</ul>
		</div>
	</div>

	<div class="hero-text">
			<h4>Photogarphy is passion </h4>
			<h1>Creative & Amazing</h1>
			<h3>We are the ones who gives oppourtunity to the photography.</h3>
                        <h2>Don't have account signup now</h2>
			<button id="btn-2" onclick="document.location='jsp/registration.jsp'">Sign Up</button>

                        <br>
                                           
                              <%

                             userdb db=new userdb();
                       eventhandler eh =db.checkeve();
        if(eh.isAcc()){
   %>
   <h1 style="color:#ccccff " id="neww">
        GOING ON CONTEST 
    </h1>
    
    <h2 style="color:#ccccff    ">
        Event Name:
    <% 
        out.print(eh.getEvname());
       %>
       
    </h2>
       
       <h2 style="color:#ccccff    ">
       <%
        out.print("\n         Event DeadLine: ");
     out.println(eh.getEvdate());
        }
else{

%>
    </h2>
    <h1 style="color:#ccccff  ">
    NO CONTEST GOING ON
</h1>
    <%
}
    %>
        
        </div>
    
</div>
    <% try{
        boolean loginError=(boolean)session.getAttribute("registered");
         //boolean loginErr=(boolean)session.getAttribute("loginsuccess");
            if(loginError)
            {
    %> <script>
        window.alert("Succesfully registered");
</script>           <%
            }
else {
            %> <script>
        window.alert("Username or Email already exist");
</script>           <%
        
}
        session.removeAttribute("registered");
        session.invalidate();
        
}   
    catch(Exception ex)
    {
        //out.println(ex);
    }
    %>

   <% try{
        //boolean login=(boolean)session.getAttribute("registered");
         boolean loginErr=(boolean)session.getAttribute("loginsuccess");
            if(!loginErr)
            {
    %> <script>
        window.alert("Username or Password is incorrect");
</script>           <%
            }
     session.removeAttribute("loginsuccess");
        session.invalidate();
}
    catch(Exception ex)
    {
       // out.println(ex);
    }
    %>


    
    </body>
         <script>

       function mylinkfunction(e) {

       window.location.href="#neww";

       /* need to stop the form sending of the form

        UPDATE as comment: This may not be exactly correct syntax 
        for stopping a form , look up preventing form submission */

       e.preventDefault();
       e.stopPropagation(); 

       }

     </script>
</html>
