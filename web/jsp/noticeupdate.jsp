<%@page import="java.util.ArrayList"%>
<%@page import="com.photography.beans.image"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<div class="content">
  <%
    String id = request.getParameter("id");
    Statement statement = null;
ResultSet resultSet = null;
try{
mydb db=new mydb();
Connection connection=db.getCon();
statement=connection.createStatement();
String sql ="select * from notices where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<form method="post" action="noticeupdateprocess.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">

<br>
notice:<br>
<input type="text" name="notice" value="<%=resultSet.getString("notice") %>">
<br>
<br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
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
