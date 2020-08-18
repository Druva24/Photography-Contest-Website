
package com.photography.controller;

import com.photography.beans.registerbean;
import com.photography.model.userdb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class register extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
        try (PrintWriter out = response.getWriter()) {
//            if((boolean)request.getAttribute("data"))
//            {
                       out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
                        out.println("<p style='color:red;'>User already exist!</p>");
            //}
            //else 
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet register</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet register at " + name+email+pa+request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");

               //String name=request.getParameter("UserName");
               //String email=request.getParameter("Email");
              // String pa=request.getParameter("password");
             //  String cpa=request.getParameter("confirm_password");
               
                             //out.println("name: "+name+email+pa+cpa);
       }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
        try {
            PrintWriter out = response.getWriter();
            
            String name=request.getParameter("UserName");
            String email=request.getParameter("Email");
            String pa=request.getParameter("password");
            String cpa=request.getParameter("confirm_password");
            String type=request.getParameter("option");
            
            registerbean rb=new registerbean(name,email,pa,type);
            userdb db=new userdb();
            boolean register=db.insertuser(rb);
            
      
          
                                  HttpSession session = request.getSession();
                    session.setAttribute("registered", register);
            if(register)
            {
                
             request.setAttribute("data", register); 
             //processRequest(request, response);
             RequestDispatcher rd; 
              rd = request.getRequestDispatcher("index.jsp");
                  rd.forward(request, response);
            }
            
           else 
            {
              
             request.setAttribute("data", register); 
               //processRequest(request, response);
             RequestDispatcher rd; 
              rd = request.getRequestDispatcher("index.jsp");
                  rd.forward(request, response);
           }
           
            
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }

        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
