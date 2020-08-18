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
  background-image: url('../images/apj.jpg');
  background-size:100% 100%;
  height:100%;
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
    if (session == null) {
            response.sendRedirect("../index.jsp");
    }
  %>

        <div id="navbar">
   <h4 onclick="document.location.href='../jsp/admin.jsp'">Home</h4>         
<h4 onclick="document.location.href='../jsp/achievement.jsp'">Update achievements</h4>
<h4 onclick="document.location.href='../jsp/notice.jsp'">Update notices</h4>
<h4 onclick="document.location.href='../jsp/delete.jsp'">Delete account</h4>
<h4 onclick="document.location.href='../jsp/requestad.jsp'">Requests</h4>
<h4 onclick="document.location.href='../jsp/deleteevent.jsp'">Delete Event</h4>
<h4 onclick="document.location.href='../logout'">Logout</h4>
</div>

    <div class="content">
        <%

                             userdb db=new userdb();
                       eventhandler eh =db.checkeve();
        if(eh.isAcc()){
   %>
   <h1 style="color:black " >
        GOING ON CONTEST 
    </h1>
    
    <h2 style="color:#0000cc   ">
        Event Name:
    <% 
        out.print(eh.getEvname());
       %>
       
    </h2>
       <h2 style="color:#0000cc   ">
        Contest Manager Name:
    <% 
        out.print(eh.getName());
       %>
       
    </h2>
       
       <h2 style="color:#0000cc   ">
       <%
        out.print("\n         Event DeadLine: ");
     out.println(eh.getEvdate());
        }
else{

%>
    </h2>
    <h1 style="color:#ff3333  ">
    NO CONTEST GOING ON
</h1>
    <%
}
    %>
        
</div>

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
