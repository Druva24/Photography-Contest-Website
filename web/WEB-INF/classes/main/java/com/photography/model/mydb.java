/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.photography.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author manish
 */
public class mydb {
    Connection con=null;
    public Connection getCon() throws SQLException
    {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","c##scott","tiger");
            
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(mydb.class.getName()).log(Level.SEVERE, null, ex);
        }
         return con;
    }
    
}
