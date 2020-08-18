
package com.photography.controller;

import com.photography.beans.loginbean;
import com.photography.model.userdb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
       try (PrintWriter out = response.getWriter()) {
           HttpSession ss=request.getSession(false);
           if(ss !=null){
            out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
   out.println("<p style='color:red;'>User or password incorrect!</p>");
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
           }
           
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
        
        try {
            PrintWriter out = response.getWriter();
            
            String name=request.getParameter("UserName");
            //String email=request.getParameter("Email");
            String password=request.getParameter("password");
            
            //String type=request.getParameter("typeoflo");
//            if("cmpgod".equals(type))
//            {
//                response.sendRedirect(request.getContextPath()+"/jsp/contest.jsp");
//                return;
//            }
           // String ne ;
           // String cpa=request.getParameter("confirm_password");
           //HttpSession session=request.getSession();
            //session.setAttribute("option",ne);
            loginbean rb=new loginbean(name,password);
            
            userdb db=new userdb();
            
            boolean register;
            register=db.checkuserparti(rb);
            //boolean ne=Objects.equals("contestmanager",rb.getType());
//            if(ne)
//            {
//               register=db.checkuser(rb);
//             if(register)
//            {
////                if(!"contestmanager".equals(type))
////                {
////                    //request.getSession().setAttribute("user", name);
////                    response.sendRedirect(request.getContextPath()+"/jsp/participant.jsp");
////                }
////                else
////                {
//                    //request.getSession().setAttribute("user", name);
//                    response.sendRedirect(request.getContextPath()+"/jsp/contest.jsp");
//                    return;
//                //}
//            
//            }
//            
//            
//            else 
//            {
//                  rd = request.getRequestDispatcher("index.jsp");
//                  rd.forward(request, response);
                //out.println("<script> window.alert('login failed') </script>");
               
              //out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
               //out.println("<p style='color:red;'>User or password incorrect!</p>");
               // processRequest(request, response);
                //request.setAttribute("loginError","password incoorect");
//                response.sendRedirect(request.getContextPath()+"/index.jsp");
//                return;
//            }
//             
//            }
//            
//            else
//            {
                
            
      
          
//              request.setAttribute("data", register); 
//             RequestDispatcher rd; 

//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet register</title>");            
//            out.println("</head>");
//            out.println("<body>");
           
                                HttpSession session = request.getSession();
                session.setAttribute("loginsuccess", register);    
            if(register)
            {
//                if(!"contestmanager".equals(type))
//                {
//                    //request.getSession().setAttribute("user", name);
//                    response.sendRedirect(request.getContextPath()+"/jsp/.jsp");
//                }
//                else
//                {
                    //request.getSession().setAttribute("user", name);
                      //HttpSession session = request.getSession();
                    session.setAttribute("use", name);
            // request.setAttribute("data", name); 
             //processRequest(request, response);
             session.setAttribute("NAMee",name);
      
//             RequestDispatcher rd; 
//              rd = request.getRequestDispatcher("jsp/participant.jsp");
//                  rd.forward(request, response);
                response.sendRedirect(request.getContextPath()+"/jsp/participant.jsp");
                //}
            
            }
            
            
            else 
            {
//                  rd = request.getRequestDispatcher("index.jsp");
//                  rd.forward(request, response);
                //out.println("<script> window.alert('login failed') </script>");
               
              //out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
               //out.println("<p style='color:red;'>User or password incorrect!</p>");
               // processRequest(request, response);
                //request.setAttribute("loginError","password incoorect");
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            }
            
            //out.println("</body>");
            //out.println("</html>");
            //}      
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }

        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
