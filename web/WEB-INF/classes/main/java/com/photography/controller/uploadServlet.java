/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.photography.controller;

import com.photography.model.mydb;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@MultipartConfig(maxFileSize = 16177215) 

/**
 *
 * @author manish
 */
@WebServlet(name = "uploadServlet", urlPatterns = {"/uploadServlet"})
public class uploadServlet extends HttpServlet {
//private String dbURL = "jdbc:oracle:thin:@localhost:1521:ORCL";
//    private String dbUser = "c##scott";
//    private String dbPass = "tiger";
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
       try (PrintWriter out = response.getWriter()) {
           HttpSession ss=request.getSession(false);
           if(ss !=null){
//            out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
//   out.println("<p style='color:red;'>User or password incorrect!</p>");
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet register</title>");            
//            out.println("</head>");
//            out.println("<body>");
//           // out.println("<h1>Servlet register at " + name+email+pa+request.getContextPath() + "</h1>");
//          // out.println("<script> window.alert('login succesful') </script>");
//            out.println("</body>");
//            out.println("</html>");

               //String name=request.getParameter("UserName");
               //String email=request.getParameter("Email");
              // String pa=request.getParameter("password");
             //  String cpa=request.getParameter("confirm_password");
               
                             //out.println("name: "+name+email+pa+cpa);
                                                     out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet register</title>");            
            out.println("</head>");
            out.println("<body>");
           // out.println("<h1>Servlet register at " + name+email+pa+request.getContextPath() + "</h1>");
           out.println("<script> window.alert('upload succesful') </script>");
            out.println("</body>");
            out.println("</html>");
             out.println("<meta http-equiv='refresh' content='3;URL=/jsp/participant.jsp'>");
                      //  getServletContext().getRequestDispatcher("/jsp/participant.jsp").forward(request, response);
           }
           
       }
    }
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
                                        //HttpSession session = request.getSession();
           PrintWriter out = response.getWriter();       
        HttpSession session = request.getSession();
    String name=(String)session.getAttribute("use");
        String email = request.getParameter("email");
          String name1=(String)session.getAttribute("use");
        InputStream inputStream = null; // input stream of the upload file
         InputStream inputStream1 = null; 
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            inputStream1 = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        boolean msg=false;
        try {
            // connects to the database
            // constructs SQL statement
                             mydb db=new mydb();
             conn=db.getCon();
            String sql = " UPDATE PARTICIPANTS SET photo=? WHERE email=? AND username=?  ";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(3, name);
            statement.setString(2, email);
            String sql1 = "insert into ALBUM(username,photo) values(?,?)";
            PreparedStatement statement1 = conn.prepareStatement(sql1);
            statement1.setString(1, name1);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, inputStream);
                statement1.setBlob(2, inputStream1);
            }

            //statement1.setString(2, email);

             int j=  statement1.executeUpdate();
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
                msg=true;
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }

            
            // sets the message in request scope
            request.setAttribute("Message", message);
               session.setAttribute("msg", msg);
            // forwards to the message page
            //processRequest(request,response);
            // getServletContext().getRequestDispatcher("/jsp/participant.jsp").forward(request, response);
              response.sendRedirect(request.getContextPath()+"/jsp/participant.jsp");

        }
    }
}
