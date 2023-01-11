<%-- 
    Document   : error
    Created on : 08-Jan-2023, 1:01:06 pm
    Author     : simra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something went wrong</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        <div class="container text-center">
            <img src="image/computer.png" class="img-fluid" alt="ERROR"/>
            <h5 class="display-3">SORRY! SOMETHING WENT WRONG</h5>
            <%= exception%>
            <a href="index.jsp" class="btn btn-lg bg-custom text-white mt-5">Go back to home</a>
        </div>
    </body>
</html>
