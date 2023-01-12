/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.category;
import com.tech.blog.entities.post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author simra
 */
public class postDao {
    Connection con;

    public postDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<category> getCategories(){
        ArrayList<category> list= new ArrayList<>();
        try{
            String q= "select * from categories";
            Statement st= this.con.createStatement();
            ResultSet set= st.executeQuery(q);
            
            while(set.next())
            {
                int cid= set.getInt("cid");
                String title= set.getString("title");
                String description= set.getString("description");
                
                category c= new category(cid, title, description);
                list.add(c);
            }
            
        }
        catch(Exception e){
            
        }
        return list;
    }
    
    public boolean savePost(post p)
    {
        boolean f= false;
        try{
            String q= "insert into post(ptitle, pcontent, pcode, ppic, pcid, userId) values(?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt= con.prepareStatement(q);
            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPcontent());
            pstmt.setString(3, p.getPcode());
            pstmt.setString(4, p.getPpic());
            pstmt.setInt(5, p.getCid());
            pstmt.setInt(6, p.getUserID());
            pstmt.executeUpdate();
            f=true;            
        }   
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
    public List<post> getAllPosts()
    {
        List<post> list= new ArrayList<>();
        try{
            String q= "select * from post order by pid desc";
            PreparedStatement pstmt= con.prepareStatement(q);
            ResultSet set=  pstmt.executeQuery();
            
            while(set.next())
            {
                int pid= set.getInt("pid");
                String ptitle= set.getString("ptitle");
                String pcontent= set.getString("pcontent");
                String pcode= set.getString("pcode");
                String ppic= set.getString("ppic");
                Timestamp pdate= set.getTimestamp("pdate");
                int cid= set.getInt("pcid");
                int userId= set.getInt("userID");
                post p= new post(pid, ptitle, pcontent, pcode,ppic, cid, pdate, userId);
                list.add(p);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    public List<post> getPostByCid(int cid)
    {
        List<post> list= new ArrayList<>();
        try{
            String q= "select * from post where pcid= ?";
            PreparedStatement pstmt= con.prepareStatement(q);
            pstmt.setInt(1, cid);
            ResultSet set=  pstmt.executeQuery();
            
            while(set.next())
            {
                int pid= set.getInt("pid");
                String ptitle= set.getString("ptitle");
                String pcontent= set.getString("pcontent");
                String pcode= set.getString("pcode");
                String ppic= set.getString("ppic");
                Timestamp pdate= set.getTimestamp("pdate");
                int userId= set.getInt("userID");
                post p= new post(pid, ptitle, pcontent, pcode,ppic, cid, pdate, userId);
                list.add(p);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
}
