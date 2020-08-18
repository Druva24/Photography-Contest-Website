<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.photography.model.userdb"%>
<%@page import="com.photography.beans.loginbean"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        
String notic=(String)session.getAttribute("use");
String eventname=request.getParameter("eventname");
String date=request.getParameter("date");
                  loginbean rb=new loginbean(notic,null);
                       userdb db1=new userdb();
                       boolean register = false ;   
            register =db1.checkacces(rb);
                


String dbUsername;
        //Statement statement = null;
//ResultSet resultSet = null;
mydb db=new mydb();
Connection con=db.getCon();
PreparedStatement ps = null;
PreparedStatement ps1 = null;
    Statement statement1 = null;
ResultSet rs = null;
int i=0;
try
{
    statement1=con.createStatement();
String sql1 ="select * from REQUESTED";
rs = statement1.executeQuery(sql1);
boolean pre=true;
//if(rs.next()){
//                    
//String sql="insert into REPORTEDACCOUNTS values(?,?)";
//ps = con.prepareStatement(sql);
//ps.setString(2,notic);
//ps.setString(1, ide);
//
//     i = ps.executeUpdate();
//   
//}
//else
//{
                while(rs.next())
            {
                dbUsername = rs.getString("CONTESTMANAGER");
                //dbPassword = rs.getString("email");

                if(dbUsername.equals(notic))
                {
                 pre=false;               
            }                
          }
//}
if(pre)
{
   
     
             String q="Update CONTESTMANAGERS set EVENTNAME=?,EVENTDATE=? where USERNAME=?";
ps1 = con.prepareStatement(q);
ps1.setString(1,eventname);
ps1.setString(2,date);
ps1.setString(3,notic);
ps1.executeUpdate();

     String sql="insert into REQUESTED values(?)";
ps = con.prepareStatement(sql);
ps.setString(1,notic);
//ps.setString(1, ide);

     i = ps.executeUpdate();
}
if(i > 0 && !register)
{
      %> <script>
        window.alert("Request Sent Successfully");
</script>           <%
     %> <meta http-equiv='refresh' content='0;URL=contest.jsp'> <%
    //response.sendRedirect(request.getContextPath()+"/jsp/contest.jsp");
//out.print("Request Sent Successfully. We will redirect you in 3 sec...");
}
else 
{
    if(!register ){
        %> <script>
        window.alert("Already requested");
</script>           <%
     %> <meta http-equiv='refresh' content='0;URL=contest.jsp'> <%
         }
//out.print(" Already requested. We will redirect you in 3 sec...");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}

//  if(!register)
//   {

////out.print(" Event Created");
//   }
if(register)
{
      %> <script>
        window.alert("Event Updated");
</script>           <%
     %> <meta http-equiv='refresh' content='0;URL=contest.jsp'> <%
}

%>
