/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.photography.controller;

import com.photography.beans.loginbean;
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

/**
 *
 * @author manish
 */
public class viewlo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           HttpSession ss=request.getSession(false);
           if(ss !=null){
            out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
   out.println("<p style='color:red;'>User or password incorrect!</p>");
        }
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //String name=request.getParameter("UserName");
            //String email=request.getParameter("Email");
            String email=request.getParameter("text1");
            
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
//loginbean rb=new loginbean(name,password);

userdb db=new userdb();

boolean register;
register=db.checkviewerlogin(email);
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
                          HttpSession session = request.getSession();
                    session.setAttribute("use", email);
    session.setAttribute("data", email);
    //processRequest(request, response);
//    RequestDispatcher rd;
//    rd = request.getRequestDispatcher("jsp/viewerafterlo.jsp");
//    rd.forward(request, response);
     response.sendRedirect(request.getContextPath()+"/jsp/viewerafterlo.jsp");
    //}
    
}


else
{
//                  rd = request.getRequestDispatcher("index.jsp");
//                  rd.forward(request, response);
    //out.println("<script> window.alert('login failed') </script>");
    
    //out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
    //out.println("<p style='color:red;'>User or password incorrect!</p>");
    processRequest(request, response);
    //request.setAttribute("loginError","password incoorect");
    // response.sendRedirect(request.getContextPath()+"/index.jsp");
}
        } catch (SQLException ex) {
            Logger.getLogger(viewlo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
