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
String dbUsername;
//if(ide != null)
//{
        //Statement statement = null;
//ResultSet resultSet = null;
mydb db=new mydb();
Connection con=db.getCon();
PreparedStatement ps = null;
    Statement statement1 = null;
ResultSet rs = null;
int i=0;
try
{
    statement1=con.createStatement();
String sql1 ="select * from REPORTEDACCOUNTS";
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
                dbUsername = rs.getString("username");
                //dbPassword = rs.getString("email");

                if(ide.equals(dbUsername))
                {
                  pre=false;               
                }                
                }
//}
if(pre)
{
        String sql="insert into REPORTEDACCOUNTS values(?,?)";
ps = con.prepareStatement(sql);
ps.setString(2,notic);
ps.setString(1, ide);

     i = ps.executeUpdate();
}
if(i > 0)
{
      %> <script>
        window.alert("Reported succesfully");
</script>           <%
     %> <meta http-equiv='refresh' content='0;URL=contest.jsp'> <%
}
else
{
      %> <script>
        window.alert("Already reported");
</script>           <%
     %> <meta http-equiv='refresh' content='0;URL=contest.jsp'> <%
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>
