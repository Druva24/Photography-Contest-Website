<%@page import="java.sql.SQLException"%>
<%@page import="com.photography.model.mydb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String ide = request.getParameter("id");
String notic=(String)session.getAttribute("use");
if(ide != null)
{
        //Statement statement = null;
//ResultSet resultSet = null;
mydb db=new mydb();
Connection con=db.getCon();
PreparedStatement ps = null;
try
{
String sql="Update CONTESTMANAGERS set winner=? where username=?";
ps = con.prepareStatement(sql);
ps.setString(2,notic);
ps.setString(1, ide);

int i = ps.executeUpdate();
if(i > 0)
{
        %> <script>
        window.alert( "Declared as Winner  Successfully");
</script>           <%
     %> <meta http-equiv='refresh' content='0;URL=contest.jsp'> <%
}
else
{
      %> <script>
        window.alert("Already Declared as winner");
</script>           <%
     %> <meta http-equiv='refresh' content='0;URL=contest.jsp'> <%
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
