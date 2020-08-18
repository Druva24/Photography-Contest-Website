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
public class eventhandler {
    String name;
    boolean acc;
    String evname;
     String evdate;

    public String getEvdate() {
        return evdate;
    }

    public void setEvdate(String evdate) {
        this.evdate = evdate;
    }
    public String getEvname() {
        return evname;
    }

    public void setEvname(String evname) {
        this.evname = evname;
    }

//    public eventhandler(String name, boolean acc) {
//        this.name = name;
//        this.acc = acc;
//    }

//    public eventhandler() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isAcc() {
        return acc;
    }

    public void setAcc(boolean acc) {
        this.acc = acc;
    }
    
}
