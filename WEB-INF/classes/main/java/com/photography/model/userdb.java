/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.photography.model;

import com.photography.beans.eventhandler;
import com.photography.beans.image;
import com.photography.beans.loginbean;
import com.photography.beans.registerbean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class userdb {
       
    public boolean insertuser(registerbean rb) throws SQLException
        {
            mydb db=new mydb();
            Connection con=db.getCon();
            Statement stmt=con.createStatement();
            Statement stmt2=con.createStatement();
          
     
        // String query;
        String dbUsername, dbPassword,q;
     boolean login = true;
           if(!(rb.getType()).equals("contestmanager"))
           {
               q="select * from PARTICIPANTS";
           }
           else{
               q="select * from CONTESTMANAGERS";
           }
            stmt.executeQuery(q);
            ResultSet rs = stmt.getResultSet();

            while(rs.next())
            {
                dbUsername = rs.getString("username");
                dbPassword = rs.getString("email");
                if(!dbUsername.equals(null)){
                if(dbUsername.equals(rb.getName()) || dbPassword.equals(rb.getEmail()))
                {
                    login = false;
                }
                }
            }
           // stmt.close();
        if((rb.getType()).equals("contestmanager"))
        {
          if(login)
          {
             if(login)
            {
               stmt2.executeUpdate("insert into CONTESTMANAGERS(username,email,password) values('"+rb.getName()+"','"+rb.getEmail()+"','"+rb.getPassword()+"')");
               stmt2.close();
            }
          }
        }
        else{
            if(login)
            {
               stmt2.executeUpdate("insert into PARTICIPANTS(username,email,password) values('"+rb.getName()+"','"+rb.getEmail()+"','"+rb.getPassword()+"')");
               stmt2.close();
            }
        }
 
        return login;
        
       
        }
    public boolean checkuser(loginbean rb) throws SQLException
    {

                    mydb db=new mydb();
            Connection con=db.getCon();
            Statement stmt=con.createStatement();
           // Statement stmt2=con.createStatement();
          
     
        // String query;
        String dbUsername, dbPassword,q;
     boolean login = false;

// if( "contestmanager".equals(rb.getType()))
 //{
     q="select * from CONTESTMANAGERS";
     
 //}
//           else{
//     q="select * from PARTICIPANTS";
// }
            stmt.executeQuery(q);
            ResultSet rs = stmt.getResultSet();

            while(rs.next())
            {
                dbUsername = rs.getString("username");
                dbPassword = rs.getString("password");
                if(!dbUsername.equals(null)){
                if(dbUsername.equals(rb.getName()) && dbPassword.equals(rb.getPassword()))
                {
                    login = true;
                }
                }
            }
            stmt.close();
            
            return login;
    }
       public boolean checkuserparti(loginbean rb) throws SQLException
    {

                    mydb db=new mydb();
            Connection con=db.getCon();
            Statement stmt=con.createStatement();
           // Statement stmt2=con.createStatement();
          
     
        // String query;
        String dbUsername, dbPassword,q;
     boolean login = false;

// if( "contestmanager".equals(rb.getType()))
 //{
    // q="select * from ";
     
 //}
//           else{
    q="select * from PARTICIPANTS";
// }
            stmt.executeQuery(q);
            ResultSet rs = stmt.getResultSet();

            while(rs.next())
            {
                dbUsername = rs.getString("username");
                dbPassword = rs.getString("password");
                 if(!dbUsername.equals(null)){
                if(dbUsername.equals(rb.getName()) && dbPassword.equals(rb.getPassword()))
                {
                    login = true;
                }
                 }
            }
            stmt.close();
            return login;
    }     
    
     public boolean checkviewerlogin(String email) throws SQLException
        {
            mydb db=new mydb();
            Connection con=db.getCon();
            Statement stmt=con.createStatement();
            Statement stmt2=con.createStatement();
          
     
        // String query;
        String dbUsername, q;
     boolean login = true;
    q="select * from PARTICIPANTS";
            stmt.executeQuery(q);
            ResultSet rs = stmt.getResultSet();

            while(rs.next())
            {
                //dbUsername = rs.getString("username");
                dbUsername = rs.getString("email");

                if(dbUsername.equals(email))
                {
                    login = false;
                }
            }
           // stmt.close();

             if(login)
            {
               stmt2.executeUpdate("insert into VIEWER(email) values('"+email+"')" );
               stmt2.close();
            }

 
        return login;
        
       
        }  
     
     public boolean likeimage(String name,image im) throws SQLException
     {
                      mydb db=new mydb();
                      boolean col=false;
            Connection conn;          
         conn= db.getCon();
        String sql = "SELECT * FROM PARTICIPANTS ";
                        //int likes = 0;
                        int maxl = 0;
            PreparedStatement statement2 = conn.prepareStatement(sql);
            ResultSet rs = statement2.executeQuery();
             while(rs.next())
            {
                          String dbUsername = rs.getString("username");
                          //String dbPassword = rs.getString("email");
                          //&& dbPassword.equals(email)
                if(dbUsername.equals(name) )
                {
                         //likes=rs.getInt(6);
                         maxl=rs.getInt(5);
                         
                    
                }
            }

            PreparedStatement pstmt = null;
            PreparedStatement pstmt1 = null;
            if(maxl>=1)
            {
             pstmt = conn.prepareStatement("UPDATE PARTICIPANTS SET likes=likes+1 WHERE username=? ");
            // pstmt.setInt(1, 1);
             pstmt.setString(1,im.getName());
             //pstmt.setString(2,im.getEmail());
             pstmt.executeQuery();
             col=true;
             pstmt1 = conn.prepareStatement("UPDATE PARTICIPANTS SET maxlikes=maxlikes-1 , like3=like2 , like2=like1 , like1=?   WHERE username=? ");
            // pstmt.setInt(1, 1);
            pstmt1.setString(1,im.getName());
             pstmt1.setString(2,name);
             
             pstmt1.executeQuery();
            }
         return col;
     }
     
     
          public boolean likeimageview(String email,image im) throws SQLException
     {
                      mydb db=new mydb();
                      boolean col=false;
            Connection conn;          
         conn= db.getCon();
        String sql = "SELECT * FROM VIEWER ";
                        //int likes = 0;
                        int maxl = 0;
            PreparedStatement statement2 = conn.prepareStatement(sql);
            ResultSet rs = statement2.executeQuery();
             while(rs.next())
            {
                          String dbUsername = rs.getString("email");
                          //String dbPassword = rs.getString("email");
                          //&& dbPassword.equals(email)
                if(dbUsername.equals(email) )
                {
                         //likes=rs.getInt(6);
                         maxl=rs.getInt(2);
                         
                    
                }
            }

            PreparedStatement pstmt = null;
            PreparedStatement pstmt1 = null;
            if(maxl>=1)
            {
             pstmt = conn.prepareStatement("UPDATE PARTICIPANTS SET likes=likes+1 WHERE username=? ");
            // pstmt.setInt(1, 1);
             pstmt.setString(1,im.getName());
             //pstmt.setString(2,im.getEmail());
             pstmt.executeQuery();
             col=true;
             pstmt1 = conn.prepareStatement("UPDATE VIEWER SET maxlikes=maxlikes-1 , like3=like2 , like2=like1 , like1=?   WHERE email=? ");
            // pstmt.setInt(1, 1);
            pstmt1.setString(1,im.getName());
             pstmt1.setString(2,email);
             
             pstmt1.executeQuery();
            }
         return col;
     }
     
     
     
     
     public boolean dislikeimage(String name,image im) throws SQLException
     {
          boolean ans =false; 
                  //likelist.contains(im);
           boolean col=false;
           String liknam,pos = null;
           int index;
                      mydb db=new mydb();
               
            Connection conn;          
         conn= db.getCon();
        String sql = "SELECT * FROM PARTICIPANTS ";
                        //int likes = 0;
                        int maxl = 0;
            PreparedStatement statement2 = conn.prepareStatement(sql);
            ResultSet rs = statement2.executeQuery();
             while(rs.next())
            {
                          String dbUsername = rs.getString("username");
                          //String dbPassword = rs.getString("email");
                          //&& dbPassword.equals(email)
                if(dbUsername.equals(name))
                {
                         //likes=rs.getInt(6);
                         maxl=rs.getInt(5);
                }
                if(im.getName().equals(rs.getString(7))) 
                {
                        ans=true;
                        liknam=rs.getString(7);
                        pos="like1";
                        index=7;
                        
                }
                                if(im.getName().equals(rs.getString(8))) 
                {
                        ans=true;
                        liknam=rs.getString(8);
                        pos="like2";
                        index=8;
                        
                }
                                 if(im.getName().equals(rs.getString(9))) 
                {
                        ans=true;
                        liknam=rs.getString(9);
                        pos="like3";
                        index=9;
                        
                }
                
            }
            if(ans){
            PreparedStatement pstmt = null;
            PreparedStatement pstmt1 = null;
            if(maxl<3 )
            {
             pstmt = conn.prepareStatement("UPDATE PARTICIPANTS SET likes=likes-1   WHERE username=? ");
            // pstmt.setInt(1, 1);
             pstmt.setString(1,im.getName());
             //pstmt.setString(2,im.getEmail());
             pstmt.executeQuery();
             col=true;
             pstmt1 = conn.prepareStatement("UPDATE PARTICIPANTS SET maxlikes=maxlikes+1 ,"+pos+"=?"+"WHERE username=? ");
            // pstmt.setInt(1, 1);
             pstmt1.setString(1,"null");
             pstmt1.setString(2,name);
             //pstmt.setString(2,im.getEmail());
             pstmt1.executeQuery();
            }
            }
         return col;
         
     }
     
         public boolean dislikeimageview(String name,image im) throws SQLException
     {
          boolean ans =false; 
                  //likelist.contains(im);
           boolean col=false;
           String liknam,pos = null;
           int index;
                      mydb db=new mydb();
               
            Connection conn;          
         conn= db.getCon();
        String sql = "SELECT * FROM VIEWER ";
                        //int likes = 0;
                        int maxl = 0;
            PreparedStatement statement2 = conn.prepareStatement(sql);
            ResultSet rs = statement2.executeQuery();
             while(rs.next())
            {
                          String dbUsername = rs.getString("email");
                          //String dbPassword = rs.getString("email");
                          //&& dbPassword.equals(email)
                if(dbUsername.equals(name))
                {
                         //likes=rs.getInt(6);
                         maxl=rs.getInt(2);
                }
                if(im.getName().equals(rs.getString(3))) 
                {
                        ans=true;
                        liknam=rs.getString(3);
                        pos="like1";
                        index=3;
                        
                }
                                if(im.getName().equals(rs.getString(4))) 
                {
                        ans=true;
                        liknam=rs.getString(4);
                        pos="like2";
                        index=4;
                        
                }
                                 if(im.getName().equals(rs.getString(5))) 
                {
                        ans=true;
                        liknam=rs.getString(5);
                        pos="like3";
                        index=5;
                        
                }
                
            }
            if(ans){
            PreparedStatement pstmt = null;
            PreparedStatement pstmt1 = null;
            if(maxl<3 )
            {
             pstmt = conn.prepareStatement("UPDATE PARTICIPANTS SET likes=likes-1   WHERE username=? ");
            // pstmt.setInt(1, 1);
             pstmt.setString(1,im.getName());
             //pstmt.setString(2,im.getEmail());
             pstmt.executeQuery();
             col=true;
             pstmt1 = conn.prepareStatement("UPDATE VIEWER SET maxlikes=maxlikes+1 ,"+pos+"=?"+"WHERE email=? ");
            // pstmt.setInt(1, 1);
             pstmt1.setString(1,"null");
             pstmt1.setString(2,name);
             //pstmt.setString(2,im.getEmail());
             pstmt1.executeQuery();
            }
            }
         return col;
         
     }
     
        public boolean checkadmin(String name,String password) throws SQLException
    {

                    mydb db=new mydb();
            Connection con=db.getCon();
            Statement stmt=con.createStatement();
           // Statement stmt2=con.createStatement();
          
     
        // String query;
        String dbUsername, dbPassword,q;
     boolean login = false;

// if( "contestmanager".equals(rb.getType()))
 //{
     q="select * from ADMIN";
     
 //}
//           else{
//     q="select * from PARTICIPANTS";
// }
            stmt.executeQuery(q);
            ResultSet rs = stmt.getResultSet();

            while(rs.next())
            {
                dbUsername = rs.getString("username");
                dbPassword = rs.getString("password");

                if(dbUsername.equals(name) && dbPassword.equals(password))
                {
                    login = true;
                }
            }
            stmt.close();
            
            return login;
    }
        
        
        
           public boolean checkacces(loginbean rb) throws SQLException
    {

                    mydb db=new mydb();
            Connection con=db.getCon();
            Statement stmt=con.createStatement();
           // Statement stmt2=con.createStatement();
          
     
        // String query;
        String dbUsername, dbEvent,q;
     boolean login = false;
     String mn="yes";
// if( "contestmanager".equals(rb.getType()))
 //{
    // q="select * from ";
     
 //}
//           else{
    q="select * from CONTESTMANAGERS";
// }
            stmt.executeQuery(q);
            ResultSet rs = stmt.getResultSet();

            while(rs.next())
            {
                dbUsername = rs.getString("username");
                dbEvent=rs.getString("eventacc");
                if(dbUsername!=null){
                if(dbUsername.equals(rb.getName())  && mn.equals(dbEvent) )
                {
                    login = true;
                }
                }
            }
            stmt.close();
            return login;
    } 
       public eventhandler checkeve() throws SQLException
    {

                    mydb db=new mydb();
            Connection con=db.getCon();
            Statement stmt=con.createStatement();
            eventhandler eh=new eventhandler();
           // Statement stmt2=con.createStatement();
          
     
        // String query;
        String dbUsername, dbEvent,q;
     boolean login = false;
     String mn="yes";
// if( "contestmanager".equals(rb.getType()))
 //{
    // q="select * from ";
     
 //}
//           else{
    q="select * from CONTESTMANAGERS";
// }
            stmt.executeQuery(q);
            ResultSet rs = stmt.getResultSet();

            while(rs.next())
            {
                dbUsername = rs.getString("username");
                dbEvent=rs.getString("eventacc");
                if(dbUsername!=null){
                if(!dbUsername.equals(null)  && mn.equals(dbEvent) )
                {
                    login = true;
                    eh.setName(dbUsername);
                    eh.setAcc(true);
                    eh.setEvname(rs.getString("EVENTNAME"));
                    eh.setEvdate(rs.getString("EVENTDATE"));
                }
                }
            }
            stmt.close();
            return eh;
    } 
   
}




