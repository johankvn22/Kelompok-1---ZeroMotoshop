<%-- 
    Document   : about
    Created on : Jun 28, 2022, 3:19:51 PM
    Author     : Johan Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="About Page" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        <div class="col-12 title">
        <h2>About</h2>
        </div>
        <div class="container">
        <%--<img src="img/menuabout.jpeg" style="width: 1000px; height:600px;">--%>
        <h3 class=" title2 ">What is Zeromotoshop?</h3>
        <p>Zeromotoshop is a shop that provides various motorcycle parts, especially for the motorcycle community.</p>
        <p>In this shop, customers can ask questions about motorcycle topics</p>

        <h3 class="title2 ">VISION</h3>
        <p>“Become a shop that makes it easy for customers to buy motorcycle parts ”.</p>

        <h3 class="title2 ">MISSION</h3>
        <p>“1.Make it easier for customers to find the needed motorcycle parts”.</p>
        <p>“2.Spread knowledge about motorcycle modification“.</p>
        <p>“3.Provides some references to motor modifications“.</p>
    </div>
        <jsp:include page='layouts/footer.jsp'></jsp:include>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>