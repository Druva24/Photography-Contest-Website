
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
   //Statement statement = null;
   String id1=id;
   mydb db=new mydb();
Connection con=db.getCon();
PreparedStatement ps = null;
PreparedStatement ps1 = null;
try
{
String sql="Update CONTESTMANAGERS set EVENTACC=? where USERNAME=?";
ps = con.prepareStatement(sql);
ps.setString(1,"yes");
ps.setString(2,id);
String sql1="DELETE FROM REQUESTED WHERE CONTESTMANAGER=?";
ps1 = con.prepareStatement(sql1);
ps1.setString(1,id1);
int j=ps1.executeUpdate();
int i = ps.executeUpdate();
if(i > 0 && j>0)
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print("Record Updated Successfully. We will redirect wait for 3 sec...");
}
else
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print("There is a problem in updating Record. We will redirect wait for 3 sec...");
}
}
catch(Exception e)
{
System.out.print(e);

e.printStackTrace();
}
%>
