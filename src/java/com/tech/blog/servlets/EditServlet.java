/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.*;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author simra
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
//            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
            
            String mail= request.getParameter("user_mail");
            String name= request.getParameter("user_name");
            String password= request.getParameter("user_pass");
            String about= request.getParameter("user_about");
            Part p= request.getPart("image");
            String imgName= p.getSubmittedFileName();
            
            HttpSession s= request.getSession();
            user u= (user)s.getAttribute("currentUser");
            u.setMail(mail);
            u.setAbout(about);          
            u.setPassword(password);
            String oldProfile= u.getProfile();
            u.setProfile(imgName);
            u.setName(name);
            
            
            userDao dao= new userDao(ConnectionProvider.getConnection());
            boolean ans= dao.updateUser(u);
            if(ans){
                
                String path= request.getRealPath("/") +"pics"+File.separator+ u.getProfile();
                String pathOld= request.getRealPath("/") +"pics"+File.separator+ oldProfile;
                if(!oldProfile.equals("default.png"))
                {
                    Helper.deleteFile(pathOld);
                }
                
                if (Helper.saveFile(p.getInputStream(), path)) {
                    out.println("Done baby");
                    Message msg= new Message("Profile details updated!", "success", "alert-success");
                    s.setAttribute("msg", msg);
                }
                else{
                    Message msg= new Message("OOPS! Something went wrong", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }              
                }
                else{
                    Message msg= new Message("OOPS! Something went wrong", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
            response.sendRedirect("profile.jsp");
           
            
            
            
            out.println("</body>");
            out.println("</html>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
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
