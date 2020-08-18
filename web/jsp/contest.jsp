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
    if (session == null) {
            response.sendRedirect("../index.jsp");
    }
  %>
 
  <% try{
        //boolean login=(boolean)session.getAttribute("registered");
        String name1=(String)session.getAttribute("use");
         boolean loginErr=(boolean)session.getAttribute("loginsuccess");
         
            if(loginErr && name1!=null)
            {
    %> <script>
        window.alert("Succesfully logined  ");
</script>           <%
            }
     session.removeAttribute("loginsuccess");
        
}
    catch(Exception ex)
    {
        //out.println(ex);
    }
 %>
   <% try{
        //boolean login=(boolean)session.getAttribute("registered");
        String name1=(String)session.getAttribute("use");
         boolean loginErr=(boolean)session.getAttribute("access");
         
            if(!loginErr && name1!=null)
            {
    %> <script>
        window.alert("no access, request to admin first  ");
</script>           <%
            }
     session.removeAttribute("access");
        
}
    catch(Exception ex)
    {
        //out.println(ex);
    }
 %>

     <%
    if (session != null) {
      if (session.getAttribute("use") != null) {
                String name=(String)session.getAttribute("use");
   session.setAttribute("NAMee",name);
               ArrayList<image> list=new ArrayList<>();
             session.setAttribute("likelist",list );
        //out.print("Hello, " + name + "  Welcome to ur Profile");
      } else {
        response.sendRedirect("index.jsp");
      }
    }
    
  %>

    <%
  //response.setHeader("Cache-Control","no-cache");
  //response.setHeader("Cache-Control","no-store");
  //response.setHeader("Pragma","no-cache");
  //response.setDateHeader ("Expires", 0);

  //if(session.getAttribute("use")==null)
     // response.sendRedirect("index.jsp");

  %> 
   

<div id="navbar">
     <h4 onclick="document.location.href='../jsp/contest.jsp'">Home</h4>
    <h4 onclick="document.location.href='../jsp/noticeviewcon.jsp'">Notices</h4>
 <h4 onclick="document.location.href='../declareandreport'"> Declare winners /Report Account</h4>
<h4 onclick="document.location.href='../jsp/requestname.jsp'">Request Event/Update Event</h4>
<h4 onclick="document.location.href='../displayphotocon'">Display Photos</h4>
<h4 onclick="document.location.href='../logout'">Logout</h4>
</div>

<div class="content">
        <%

                             userdb db=new userdb();
                       eventhandler eh =db.checkeve();
        if(eh.isAcc()){
   %>
   <h1 style="color:#0000cc ">
        GOING ON CONTEST 
    </h1>
    
    <h2 style="color:#0000cc   ">
        Event Name:
    <% 
        out.print(eh.getEvname());
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
