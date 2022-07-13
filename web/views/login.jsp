<%-- 
    Document   : login
    Created on : Jul 8, 2022, 3:30:39 PM
    Author     : Johan Kevin
--%>

<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Login Page" />
        </jsp:include>
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>


    </head>
    <body>
        

            <!-- Begin page content --> 
            <div class="title">
                        <h2>Login</h2>
                    </div>
            
            <div class="container">
                
                    <p class="title2">Masukkan username dan password anda</p>
                    <div class="col-12">
                    <% if (request.getSession(true).getAttribute("errors") != null) {%>
                    <div class="col-12">
                        <div class="errorlogin" role="alert">
                            <strong>Error!</strong> <%= request.getSession(true).getAttribute("errors")%>
                            
                        </div>
                    </div>
                    <% } %>
                    <div class="">
                        <form method="POST" action="login">
                            <div class="labellogin">
                                <p>Username</p>
                                <input type="text" class="col-3" placeholder="Masukkan username anda..." name="username" required>
                            </div>
                            <div class="labellogin">
                                <p>Password</p>
                                <input type="password" class="col-3" placeholder="Masukkan password anda..." name="password" required>
                            </div>
                            <div class="labellogin">
                                <button type="submit" class="title2">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
       
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>