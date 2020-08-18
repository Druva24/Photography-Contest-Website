<%@page import="com.photography.beans.eventhandler"%>
<%@page import="com.photography.model.userdb"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload to Database Demo</title>
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
        <%

                       userdb db=new userdb();
                       eventhandler eh =db.checkeve();
        if(eh.isAcc()){


        request.getSession();
   %>

<div class="content">
        <br><br><br>
    <center>
        <h1>File Upload to Database Demo</h1>
        <%  String name=(String)session.getAttribute("use");  
            session.setAttribute("data", name);%>
        <form method="post" action="../uploadServlet" enctype="multipart/form-data">
            <table border="0">
                
<!--                <tr>
                    <td>name: </td>
                    <td><input type="text" name="name" size="50"/></td>
                </tr>-->
                <tr>
                    <td>email: </td>
                    <td><input type="email" name="email" size="50"/></td>
                </tr>
                <tr>
                    <td>Portrait Photo: </td>
                    <td><input type="file" name="photo" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save">
                    </td>
                </tr>
            </table>
        </form>
    </center>
     </div>
         <%
             }
else
{
            session.setAttribute("cont", false);
             response.sendRedirect(request.getContextPath()+"/jsp/participant.jsp");
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