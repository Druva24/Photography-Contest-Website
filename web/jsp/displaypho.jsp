<%@page import="java.util.ArrayList"%>
<%@page import="com.photography.beans.image"%>
<%@page import="com.photography.beans.imagedao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
</style>
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
 
 <div class="w3-col m7">
    
     <!-- <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Social Media template by w3.css</h6>
              <p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
              <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>  Post</button> 
            </div>
          </div>
        </div>
      </div>-->
          <%
//          imagedao dao = new imagedao();
//            ArrayList<image> imagelist =new ArrayList<>();
//             imagelist = dao.get();
    ArrayList<image> imagelist =new ArrayList<>();
            imagelist=(ArrayList<image>)session.getAttribute("imagelist");
             session.setAttribute("totallist",imagelist);
             int i=0;
             if(!imagelist.isEmpty()){
        %>
  
    <c:forEach var="j" items="${imagelist}" >  

    
      <div class="w3-container w3-card w3-white w3-round w3-margin">
           <h2> <c:out value="${j.name}" /> </h2>
    <h2> <c:out value="${j.like}" /> </h2>
        
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
              <img src="data:image/jpg;base64,${j.base64Image}" style="width:30%; height: 40%;" alt="Northern Lights" class="w3-margin-bottom">
            </div>
        </div>
              <h4  class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up" onclick="document.location.href='../vote?id=<%=i%>'"></i>  Like</h4>  
              <h4  class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-down" onclick="document.location.href='../disvote?id=<%=i%>'"></i>  DisLike</h4> 
      </div>
      <hr class="w3-clear">
    <% i++;
    %>
    </c:forEach>  
     <%     }
    else
    {
       %>
       <h2> No Photos Submitted Yet</h2>
       <%
     }
       %>
      
    <!-- End Middle Column -->
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