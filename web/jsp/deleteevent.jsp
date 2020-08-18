

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   //Statement statement = null;
   mydb db=new mydb();
Connection con=db.getCon();
Statement ps = null;
PreparedStatement ps1 = null;
PreparedStatement ps2 = null;
try
{
String sql2="Update PARTICIPANTS set PHOTO = NULL";
String sql="UPDATE contestmanagers set EVENTACC=? where EVENTACC =?";
ps1 = con.prepareStatement(sql);
ps1.setString(1,"no");
ps1.setString(2,"yes");
ps2 = con.prepareStatement(sql2);
ps2.executeUpdate();
int i = ps1.executeUpdate();
if(i >0)
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print(" Deleted Event Successfully. We will redirect wait for 3 sec...");
}
else
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print("There is a no Deleting Event. We will redirect wait for 3 sec...");
}
}
catch(Exception e)
{
System.out.print(e);

e.printStackTrace();
}
%>