<%@page import="com.photography.beans.eventhandler"%>
<%@page import="com.photography.model.userdb"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.photography.beans.image"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-size: 28px;
  font-family: Arial, Helvetica, sans-serif;
}

#navbar {
  overflow: hidden;
  background-color: #333;
}

#navbar h4 {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

#navbar h4:hover {
  background-color: #ddd;
  color: black;
}

#navbar h4.active {
  background-color: #4CAF50;
  color: white;
}

.content {
  padding: 16px;
}

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

.sticky + .content {
  padding-top: 60px;
}
</style>
</head>
<body>

     <%
    if (session != null) {

  %>


           <div id="navbar">
     <h4 onclick="document.location.href='../jsp/viewerafterlo.jsp'">Home</h4>
    <h4 onclick="document.location.href='../jsp/viewernoti.jsp'">Notices</h4>
 <h4 onclick="document.location.href='../displayphotoview'">Go To Contest and voting</h4>
<h4 onclick="document.location.href='../logout'">Logout</h4>
</div>

<div class="content">
        <%

                             userdb db=new userdb();
                       eventhandler eh =db.checkeve();
        if(eh.isAcc()){
   %>
    <h1>
        GOING ON CONTEST 
    </h1>
    
    
    <% out.print(eh.getEvname());
        
     out.println(eh.getEvdate());
        }
else{

%>
<h1>
    NO CONTEST GOING ON
</h1>
    <%
}
    %>
</div>
   <% 
    }
    else{
        response.sendRedirect("../index.jsp");
    }
      %>
<script>
window.onscroll = function() {myFunction();};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky");
  } else {
    navbar.classList.remove("sticky");
  }
}
</script>

</body>
</html>
