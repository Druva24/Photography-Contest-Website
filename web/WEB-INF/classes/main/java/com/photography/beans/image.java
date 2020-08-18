/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.photography.beans;

/**
 *
 * @author manish
 */
public class image 
{
    String name;
    int like;
    String email;
    int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }
    private String base64Image;
 
 
    public String getBase64Image() {
        return base64Image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
    
}
