<%-- 
    Document   : post
    Created on : 10-Jan-2023, 2:38:54 pm
    Author     : simra
--%>

<%@page import="com.tech.blog.entities.user"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">       
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body class="bg-lt">
        <%
            user u= (user)session.getAttribute("currentUser");
            session.setAttribute("currentUser", u); 
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk mr-3"></span>Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="#"><span class="fa fa-bullseye mr-1"></span>Learn coding <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                      <a class="nav-link" href="#"><span class="fa fa-comments-o mr-1"></span>Contact us</a>
                </li>
                
                
              </ul>
                    <ul class="navbar-nav mr-right">                        
                        <li class="nav-item">
                            <a class="nav-link" href="profile.jsp"> <span class="fa fa-mail-reply"></span> Return</a>
                        </li>
                    </ul>
            </div>
      </nav>
        <div class="container">
            <div class="row d-flex align-items-center justify-content-center mt-4">
                <span class="fa fa-asterisk mr-3" style="font-size:48px;"></span>      
            </div>
            <div class="row d-flex align-items-center justify-content-center">
            <h1>Welcome to TechBlog</h1>
            </div>
            <br>
            <form id="post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                <div class="form-group"> 
                  <label for="exampleFormControlSelect1">Select the category of your post: </label>
                  <select name="cid" class="form-control" id="exampleFormControlSelect1">
                    <option selected disabled>---Select Category---</option>
                    <%
                      postDao post = new postDao(ConnectionProvider.getConnection());
                      
                      ArrayList<category> al= post.getCategories();
                      for(category c: al){
                    %>  
                    <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                    <%
                        }
                    %> 
                   </select>
                </div>
                <div class="form-group">
                  <label for="title">Give a Title to your blog: </label>
                  <input type="text" name="ptitle" class="form-control" id="title" placeholder="Your title goes here">
                </div>
                <div class="form-group">
                  <label for="content">Enter your content: </label>
                  <textarea class="form-control" name="pcontent" id="content" rows="15">Your content goes here</textarea>
                </div>
                <div class="form-group">
                  <label for="code">Enter your program code(if any): </label>
                  <textarea class="form-control" name="pcode" id="code" rows="15">Your code goes here</textarea>
                </div>
                <div class="form-group">
                  <label for="title">Enter any pictures you want to add: </label>
                  <input type="file" class="form-control" name="ppic" id="title">
                </div>
                <div class="row">
                    
                    <div class="col text-center">
                    
                        <button type="submit" class="btn btn-primary m-5">Submit the blog</button>
                
                    </div>
                </div>
            </form>
        </div>
                   
                   
         <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                alert("Loaded");
                
            });
        </script>
        
        
    </body>
</html>
