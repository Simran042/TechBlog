/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.user;
import java.sql.*;
/**
 *
 * @author simra
 */
public class userDao {
    private Connection con;
    
    public userDao(Connection con)
    {
        this.con= con;
    }
    
    //insert user to db
    
    public boolean saveUser(user u)
    {
        boolean f= false;
        try{
            
            String q= "insert into user(name, email, password, about) values (?, ?, ?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getMail());
            pstmt.setString(3, u.getPassword());
            pstmt.setString(4, u.getAbout());
            System.out.println(u.getName());
            System.out.println(u.getMail());
            System.out.println(u.getPassword());
            System.out.println(u.getAbout());
            pstmt.executeUpdate();
            f=true;            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public user getUserByEmailAndPassword(String email, String password)
    {
        user u= null;
        try{
            String q= "select * from user where email=? and password=?";
            PreparedStatement pstmt= con.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set= pstmt.executeQuery();
            
            if(set.next())
            {
                u= new user();
                String name= set.getString("name");
                u.setName(name);
                u.setId(set.getInt("id"));
                u.setMail(set.getString("email"));
                u.setPassword(set.getString("password"));
                u.setAbout(set.getString("about"));
                u.setDate(set.getTimestamp("rdate"));
                u.setProfile(set.getString("profile"));
                
            }
        }
        catch(Exception e){
            
        }
        return u;
    }
    
    public boolean updateUser(user u) throws SQLException
    {
        boolean f= false;
        try {
        String q= "update user set name=? , email=? , password=? , about=? , profile=? where id=?";
        PreparedStatement pstmt= con.prepareStatement(q);
        pstmt.setString(1, u.getName());
        pstmt.setString(2, u.getMail());
        pstmt.setString(3, u.getPassword());
        pstmt.setString(4, u.getAbout());
        pstmt.setString(5, u.getProfile());
        pstmt.setInt(6, u.getId());
        pstmt.executeUpdate();
        f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
        
    }
    
}
