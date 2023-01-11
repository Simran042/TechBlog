<%-- 
    Document   : login_page
    Created on : 31-Dec-2022, 5:08:48 pm
    Author     : simra
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--css-->
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        
        
        
        <div class="bg-lt" style="height: 100vh; background-color: #f8defc" >
            <%@include file="normal_navbar.jsp" %>
            <main class='d-flex align-items-center bg-custom-lt' style="height: 70vh">
                <div class='container '>

                    <div class='row'>
                        <div class='col-md-4 offset-md-4'>
                            <div class='card'>
                                <div class='card-header bg-custom text-white text-center'>
                                    Login here
                                </div>
                                
                                <%
                                    Message m= (Message)session.getAttribute("msg"); 
                                    Message mR= (Message)session.getAttribute("msgR"); 
                                    
                                    if(m!= null)
                                    {
                                %>
                                
                                <div class="alert alert-danger" role="alert">
                                    <%= m.getContent() %>
                                </div>
                                
                                <%
                                    session.removeAttribute("msg");                                    
                                    }

                                    if(mR != null)
                                    {
                                %>
                                
                                    <div class="alert alert-success" role="alert">
                                    <%= mR.getContent() %>
                                    </div>
                                    
                                <%
                                    session.removeAttribute("msgR");
                                    }
                                %>                           
                                
                                <div class='card-body text-center'>
                                    <form action="LoginServlet" method="post">
                                        
                                        
                                        <div class="form-group">
                                          <label for="exampleInputEmail1">Email address</label>
                                          <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                          <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        
                                        
                                        <div class="form-group">
                                          <label for="exampleInputPassword1">Password</label>
                                          <input type="password" name="password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        
                                        
<!--                                        <div class="form-check">
                                          <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                          <label class="form-check-label" for="exampleCheck1">I agree to the terms and conditions.</label>
                                        </div>
                                        -->
                                        <br>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                      </form>
                                </div>
                                <div class='card-footer text-center'>
                                    <a href="register_page.jsp"><span class="fa fa-user-plus mr-1"></span>New user? Register here!</a>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </main>
        </div>
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

            
    </body>
</html>
