

<%@page import="java.sql.Connection"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    
    <h4 onclick="document.location.href='../jsp/participant.jsp'">Home</h4>
    <h4 onclick="document.location.href='../jsp/noticeview.jsp'">Notices</h4>
 <h4 onclick="document.location.href='../displayphoto'">Go To Contest and voting</h4>
 <h4 onclick="document.location.href='../jsp/upload.jsp'"> Contest participation</h4>
<h4 onclick="document.location.href='../jsp/achievementsview.jsp'">Achievements</h4>
<h4 onclick="document.location.href='../displayalbum'">Album</h4>
<h4 onclick="document.location.href='../logout'">Logout</h4>
</div>

<div class="content">
        <br><br><br>
         <h2>Achievements</h2>
<!--          <h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>achievement</td>
</tr>-->
<%
    Statement statement = null;
ResultSet resultSet = null;
String name=(String)session.getAttribute("use");
try{
mydb db=new mydb();
Connection connection=db.getCon();
statement=connection.createStatement();
String sql ="select * from achievements";
resultSet = statement.executeQuery(sql);
int flag=1;
while(resultSet.next()){
    if((String)resultSet.getString("username")!=null && name.equals(resultSet.getString("username"))){
        flag=0;
%>

<!--<tr>
</tr>-->
<div class="w3-container">
 

  <ul class="w3-ul w3-border">
    <li><%=resultSet.getString("achievement") %></li>
  </ul>
</div>
<%
    }
}
if(flag==1)
{
    %><h2> No Achievements</h2><%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<!--</table>-->
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
