
<%@page import="java.util.ArrayList"%>
<%@page import="com.photography.beans.image"%>
<%@page import="com.photography.beans.imagedao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
        <div align="center">
<!--           	<label for="Email" >Email </label>
                 <input  name="email" type="text" />    -->
    <%
//          imagedao dao = new imagedao();
//            ArrayList<image> imagelist =new ArrayList<>();
//             imagelist = dao.get();
    ArrayList<image> imagelist =new ArrayList<>();
            imagelist=(ArrayList<image>)session.getAttribute("imagelist");
             //session.setAttribute("totallist",imagelist);
             int i=0;
             if(!imagelist.isEmpty()){
        %>
  
    <c:forEach var="j" items="${imagelist}" >  
    <h2> <c:out value="${j.name}" /> </h2>
    <h2> <c:out value="${j.like}" /> </h2>
    <img src="data:image/jpg;base64,${j.base64Image}" width="400" height="400"/>
    <% i++;%>
    </c:forEach>
    <%    }
    else
    {
       %>
       <h2> No Photos in Your Album</h2>
       <%
     }%>

</div>
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
