


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
   //Statement statement = null;
   mydb db=new mydb();
Connection con=db.getCon();
PreparedStatement ps = null;
PreparedStatement ps1 = null;
try
{
String sql="DELETE FROM PARTICIPANTS WHERE username=?";
String sql1="DELETE FROM REPORTEDACCOUNTS WHERE username=?";
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps1 = con.prepareStatement(sql1);
ps1.setString(1,id);
ps1.executeUpdate();
int i = ps.executeUpdate();
if(i > 0)
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print("Participant Deleted Successfully. We will redirect wait for 3 sec...");
}
else
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print("There is a problem in Deleting Participant. We will redirect wait for 3 sec...");
}
}
catch(Exception e)
{
System.out.print(e);

e.printStackTrace();
}
%>