<%-- 
    Document   : profile
    Created on : 08-Jan-2023, 2:06:15 pm
    Author     : simra
--%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="error.jsp" %>
<%
    user u= (user)session.getAttribute("currentUser");
    if (u==null)
        {
            response.sendRedirect("login_page.jsp");

        }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            #blog-card:hover{
                background-color:#f5dcf9;
                transition: 0.2s;
                /* color: white; */
                transform: scale(1.05);
            }        
        </style>
    </head>
    <body>
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

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-reorder mr-1"></span> Categories
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>

                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"><span class="fa fa-comments-o mr-1"></span>Contact us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="post.jsp"><span class="fa fa-bookmark mr-1"></span>Do post</a>
                </li>
                
               </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#myModal" > <span class="fa fa-user-circle"></span> <%= u.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-mail-reply"></span> Logout</a>
                    </li>
                </ul>
            </div>
      </nav>
                    
        <%
            Message m= (Message)session.getAttribute("msg");
            if(m!=null)
            {
        %>            
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
            session.removeAttribute("msg");
            }
        %>
                    <!-- Button trigger modal -->
  


        <!-- The Modal -->
        <div class="modal" id="myModal">
          <div class="modal-dialog">
            <div class="modal-content">

              <!-- Modal Header -->
              <div class="modal-header bg-custom text-white text-center">
                <h4 class="modal-title">TechBlog</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>

              <!-- Modal body -->
              <div class="modal-body ">
                  
                  <div class="container text-center">
                      <img class="img-fluid" style="max-width: 150px; border-radius: 50%"  src="pics/<%= u.getProfile()%>" 
                      <br>
                      <h4 class="modal-title mt-2"><%= u.getName()%></h4>
                      <div class="container" >
                            <div id="profile-details">
                              <table class="table" >

                                <tbody>
                                  <tr>
                                    <th scope="row">ID: </th>
                                    <td> <%= u.getId()%> </td>        
                                  </tr>

                                  <tr>
                                    <th scope="row">E-mail: </th>
                                    <td> <%= u.getMail()%> </td>        
                                  </tr>

                                  <tr>
                                    <th scope="row">Date of registration: </th>
                                    <td> <%= u.getDate()%> </td>        
                                  </tr>

                                  <tr>
                                    <th scope="row">About: </th>
                                    <td> <%= u.getAbout()%> </td>        
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                        
                      </div>
                            
                            <!--profile edit-->
                            
                      <div id="profile-edit" style="display: none;">
                          <form action="EditServlet" method="post" enctype="multipart/form-data">
                              <table class="table">
                                  
                                  <tr>
                                    <th scope="row">ID: </th>
                                    <td> <%= u.getId()%> </td>                                        
                                  </tr>
                                  <tr>
                                    <th scope="row">Select profile picture: </th>
                                    <td> <input type="file" name="image" class="form-control"> </td>        
                                  </tr>
                                  <tr>
                                    <th scope="row">Name: </th>
                                    <td> <input type="text" class="form-control" name="user_name" value="<%= u.getName()%>"> </td>        
                                  </tr> 
                                  <tr>
                                    <th scope="row">E-mail: </th>
                                    <td> <input type="email" class="form-control" name="user_mail" value="<%= u.getMail()%>"> </td>        
                                  </tr>                                  
                                  <tr>
                                    <th scope="row">Password: </th>
                                    <td> <input type="password" class="form-control" name="user_pass" value="<%= u.getPassword()%>"> </td>        
                                  </tr> 
                                  <tr>
                                    <th scope="row">Status: </th>
                                    <td> <textarea rows="4" class="form-control" name="user_about" ><%= u.getAbout()%></textarea> </td>        
                                  </tr>                                 
                              </table>
                                <div>
                                  <button class="btn btn-outline-success">Save changes</button>
                                </div>
                         </form>
                      </div>                                                                           
                  </div>
              </div>

              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" id="edit-profile" class="btn bg-custom text-white" >Edit profile</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>

            </div>
          </div>
        </div>
        <%--<%= u.getName()%>--%>
        <br>
        <%--<%= u.getMail()%>--%>
        <br>
        <%--<%= u.getAbout()%>--%>
        
        <% session.setAttribute("currentUser", u); %>
        
        
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="list-group text-center">
                            <a href="#" class="list-group-item list-group-item-action active">
                              All posts
                            </a>
                            <%
                                postDao d= new postDao(ConnectionProvider.getConnection());
                                ArrayList<category> l= d.getCategories();
                                for(category c: l){
                            %>
                            <a href="#" class="list-group-item list-group-item-action"><%= c.getName()%></a>
                             <%
                                 }
                             %>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="container text-center">
                            <div class="row">
                            
                                <%
                                    postDao ds= new postDao(ConnectionProvider.getConnection());
                                    List<post> pst= ds.getAllPosts();
                                    for(post c: pst){
                                %>
                                <div class="col-md-6">
                                    <div class="card shadow rounded mb-3" id="blog-card" >

                                            <div class="card-title bg-custom text-white m-0" >
                                                <h5 class=""><%= c.getPtitle()%></h5>
                                            </div>  
                                                <img src="pics/<%= c.getPpic() %>" style="height: 200px; background-image:url('https://th.bing.com/th/id/OIP.JZGU7zkhMrBFGBhcjYDL8QHaEK?pid=ImgDet&rs=1');" alt=""/>
                                            <div class="card-body">                                                              
                                                <p class="card-text"><%= c.getPcontent() %></p>
                                                <a href="#" class="btn bg-custom text-white">Read more</a>
                                            </div>
                                    </div>
                                </div>
                                 <%
                                     }
                                 %>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
        
        
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                
                let editStatus= false;
                
                $('#edit-profile').click(function(){
                    
                    if(editStatus === false)
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus= true;
                        $(this).text("Back");
                    }
                    
                    else{
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus= false;
                        $(this).text("Edit profile");
                    }
                    
                });
            });
        </script>
        
    </body>
</html>
