
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.photography.model.mydb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
     <h4 onclick="document.location.href='../jsp/viewerafterlo.jsp'">Home</h4>
    <h4 onclick="document.location.href='../jsp/viewernoti.jsp'">Notices</h4>
 <h4 onclick="document.location.href='../displayphotoview'">Go To Contest and voting</h4>
<h4 onclick="document.location.href='../logout'">Logout</h4>
</div>
<div class="content">
          <br><br><br><br>
          <h1>Notices</h1>
<!--        <h1>Retrieve data from database in jsp</h1>-->
<!--
<table border="1">
<tr>
<td>id</td>
<td>notice</td>
</tr>-->
<%
    Statement statement = null;
ResultSet resultSet = null;
try{
mydb db=new mydb();
Connection connection=db.getCon();
statement=connection.createStatement();
String sql ="select * from notices";
resultSet = statement.executeQuery(sql);
int flag=1;
while(resultSet.next()){
    if((String)resultSet.getString("notice")!=null){
            flag=0;
%>
<!--<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("notice") %></td>
</tr>-->

<div class="w3-container">
  
  
  <ul class="w3-ul w3-card-4">
    <li class="w3-display-container"><%=resultSet.getString("notice") %> <span onclick="this.parentElement.style.display='none'" class="w3-button w3-transparent w3-display-right">&times;</span></li>
  </ul>
</div>
<%
    }
    
}
if(flag==1)
{
%><h1>No Notices</h1><%
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
