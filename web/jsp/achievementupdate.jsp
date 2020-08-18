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

   


         <div id="navbar">
   <h4 onclick="document.location.href='../jsp/admin.jsp'">Home</h4>         
<h4 onclick="document.location.href='../jsp/achievement.jsp'">Update achievements</h4>
<h4 onclick="document.location.href='../jsp/notice.jsp'">Update notices</h4>
<h4 onclick="document.location.href='../jsp/delete.jsp'">Delete account</h4>
<h4 onclick="document.location.href='../jsp/requestad.jsp'">Requests</h4>
<h4 onclick="document.location.href='../jsp/deleteevent.jsp'">Delete Event</h4>
<h4 onclick="document.location.href='../logout'">Logout</h4>
</div>
    <br><br><br>
<%
    String id = request.getParameter("id");
%>
<div class="content">
  <h1>Achievemnets Update</h1>
<form method="post" action="achievementupdateprocess.jsp">
   <input type="hidden" name="id" value="<%=id %>">
<br>
achievement:<br>
<input type="text" name="achievement" >
<br>
<br>
<input type="submit" value="submit">
</form>
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
