/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.*;

/**
 *
 * @author simra
 */
public class user {
    private int id;
    private String name;
    private String mail;
    private String password;
    private String about;
    private Timestamp date;
    private String profile;

    public user(int id, String name, String mail, String password, String about, Timestamp date) {
        this.id = id;
        this.name = name;
        this.mail = mail;
        this.password = password;
        this.about = about;
        this.date = date;
    }

    public user() {
    }

    public user(String name, String mail, String password, String about) {
        this.name = name;
        this.mail = mail;
        this.password = password;
        this.about = about;        
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMail() {
        return mail;
    }

    public String getPassword() {
        return password;
    }

    public String getAbout() {
        return about;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
}
