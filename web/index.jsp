 <%@page import="com.tech.blog.entities.Message"%>
<%-- 
    Document   : index
    Created on : 30-Dec-2022, 6:48:36 pm
    Author     : simra
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">       
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 76% 91%, 50% 100%, 26% 91%, 0 100%, 0% 35%, 0 0);

            }
        </style>
    </head>
    <body>
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        <%
                                    Message m= (Message)session.getAttribute("msg"); 
                                    if(m!= null)
                                    {
                                %>
                                
                                <div class="alert alert-success" role="alert">
                                    <%= m.getContent() %>
                                </div>
                                <%
                                    session.removeAttribute("msg");
                                    }
                                %>
        <!--banner-->
        <div class="container-fluid p-0 m-0 ">
            <div class="jumbotron bg-custom text-light banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to Tech Blog</h3>
                    
                    <p>Professionals in almost every industry have trouble keeping up to date with changing tech trends. So, the best and the only way to stay relevant with technology is through the information available online! Whether it’s the news or information about the latest gadgets in the market, this blog will bring you everything from the modern tech world!</p>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg m-2 "><span class="fa fa-user-plus mr-1"></span>Start! Its FREE</a>
                    <a href='login_page.jsp' class="btn btn-outline-light btn-lg m-2"><span class="fa fa-user mr-1"></span>Login</a>
                    
                    
                </div>
                
            </div>
        </div>
        
        <!--cards-->
        <div class="container">
            
            
            <div class="row">
                <div class="col-md-4 mb-2">
                    <div class="card" >
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn bg-custom text-white">Read more</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4 mb-2">
                    <div class="card" >
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn bg-custom text-white">Read more</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4 mb-2">
                    <div class="card" >
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn bg-custom text-white">Read more</a>
                        </div>
                     </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4 mb-2">
                    <div class="card" >
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn bg-custom text-white">Read more</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4 mb-2">
                    <div class="card" >
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn bg-custom text-white">Read more</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4 mb-2">
                    <div class="card" >
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn bg-custom text-white">Read more</a>
                        </div>
                     </div>
                </div>
            </div>
            
           
        </div>
        
        
        
        <%
//            Connection con= ConnectionProvider.getConnection();
        %>

        
        
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

            
    </body>
</html>
