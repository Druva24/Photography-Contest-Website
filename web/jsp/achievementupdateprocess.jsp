

<%@page import="java.sql.SQLException"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String ide = request.getParameter("id");
String notic=request.getParameter("achievement");
if(ide != null)
{
        //Statement statement = null;
//ResultSet resultSet = null;
mydb db=new mydb();
Connection con=db.getCon();
PreparedStatement ps = null;
try
{
String sql="insert into ACHIEVEMENTS(username,achievement) values(?,?)";
ps = con.prepareStatement(sql);
ps.setString(1,ide);
ps.setString(2,notic);

int i = ps.executeUpdate();
if(i > 0)
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print("Achievement Updated Successfully. We will redirect wait for 3 sec...");
}
else
{
   %> <meta http-equiv='refresh' content='3;URL=admin.jsp'> <%
out.print("There is a problem in updating Achievement. We will redirect wait for 3 sec...");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
