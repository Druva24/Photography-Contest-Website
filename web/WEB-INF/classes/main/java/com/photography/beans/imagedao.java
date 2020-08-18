/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.photography.beans;

import com.photography.model.mydb;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author manish
 */
public class imagedao 
{
        public ArrayList<image> get() throws SQLException, IOException 
        {
            
            ArrayList<image> imagelist =new ArrayList<image>();
            image book=null;
            Connection conn;
             mydb db=new mydb();
             conn=db.getCon();
             int i=0;
        String sql = "SELECT * FROM PARTICIPANTS ";
            //PreparedStatement statement = conn.prepareStatement(sql);
            //ResultSet result = statement.executeQuery();
             Statement statement = conn.createStatement();
ResultSet result = statement.executeQuery(sql);
            while (result.next()) 
            {
                book = new image();
                String user = result.getString("username");
                String email=result.getString("email");
                Blob blob = result.getBlob("photo");    
                ByteArrayOutputStream outputStream;
                String base64Image;
                if(blob!=null){
                try (InputStream inputStream = blob.getBinaryStream()) {
                    outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {                  
                        outputStream.write(buffer, 0, bytesRead);
                    }   byte[] imageBytes = outputStream.toByteArray();
                    base64Image = Base64.getEncoder().encodeToString(imageBytes);
                }
                outputStream.close();
                 
                book.setName(user);
                book.setBase64Image(base64Image);
                book.setLike(result.getInt("likes"));
                book.setEmail(email);
                book.setId(i);
                imagelist.add(book);
                i++;
                }
            }
                         Collections.sort(imagelist, new Comparator<image>(){
    @Override
    public int compare(image s1, image s2) {
        return s2.getLike()-s1.getLike();
    }
});
        return imagelist;
    }
      
             public ArrayList<image> getalbum(String name) throws SQLException, IOException 
        {
            
            ArrayList<image> imagelist =new ArrayList<image>();
            image book=null;
            Connection conn;
             mydb db=new mydb();
             conn=db.getCon();
             int i=0;
        String sql = "SELECT * FROM ALBUM ";
            //PreparedStatement statement = conn.prepareStatement(sql);
            //ResultSet result = statement.executeQuery();
             Statement statement = conn.createStatement();
ResultSet result = statement.executeQuery(sql);



            while (result.next()) 
            {
                book = new image();
                String user = result.getString("username");
                //String email=result.getString("email");
                if(name.equals(user)){
                Blob blob = result.getBlob("photo");    
                ByteArrayOutputStream outputStream;
                String base64Image;
                if(blob!=null){
                try (InputStream inputStream = blob.getBinaryStream()) {
                    outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {                  
                        outputStream.write(buffer, 0, bytesRead);
                    }   byte[] imageBytes = outputStream.toByteArray();
                    base64Image = Base64.getEncoder().encodeToString(imageBytes);
                }
                outputStream.close();
                
                book.setName(user);
                book.setBase64Image(base64Image);
                //book.setLike(result.getInt("likes"));
                //book.setEmail(email);
                book.setId(i);
                imagelist.add(book);
                i++;
                }
                }
            }
                         Collections.sort(imagelist, new Comparator<image>(){
    @Override
    public int compare(image s1, image s2) {
        return s2.getLike()-s1.getLike();
    }
});
        return imagelist;
    }
}
