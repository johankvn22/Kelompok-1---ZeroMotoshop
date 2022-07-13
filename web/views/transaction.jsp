<%-- 
    Document   : transaction
    Created on : Jul 12, 2022, 8:58:40 PM
    Author     : Johan Kevin
--%>

<%@page import="Controller.TransactionController"%>
<%@page import="java.sql.ResultSet"%>
<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Transaction" />
        </jsp:include>
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body class="d-flex flex-column h-100">
        <jsp:include page='layouts/navbar.jsp'></jsp:include>

        <%
            TransactionController tc = new TransactionController();

            String search = "";
            ResultSet rs;

            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 

            if (search.equals("")) {
                rs = tc.get();
            } else {
                rs = tc.getByName(search);
            }
        %>

        <!-- Begin page content -->
        <main>
            <div class="col-12 title">
                <h2>Transaksi</h2>
            </div>
            <div class="container">
                <h2 class="col-12 title2">Hello, <%= request.getSession(true).getAttribute("name") %></h2>
                <p class="lead">Welcome to the inventory app! You are logged in using username: <strong><%= request.getSession().getAttribute("username") %></strong></p>
                <div class="row pt-5">
                    <div class="col-6">
                        <form action="transaction" method="GET">
                            <div class="mb-3">
                                <label class="form-label">Search</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="search" value="<%= search%>" />
                                    <span class="input-group-append">
                                        <button class="input-group-text bg-light d-block">
                                            <i class='bx bxs-search'></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-12">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nama Barang</th>
                                    <th>Jenis Barang</th>
                                    <th>Jenis Transaksi</th>
                                    <th>Jumlah</th>
                                    <th>Tanggal Transaksi</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                               <% while (rs.next()) {%>
                                <tr>
                                    <td><%= rs.getString("id")%></td>
                                    <td><%= rs.getString("name")%></td>
                                    <td><%= rs.getString("product_type")%></td>
                                    <td><%= rs.getString("transaction_type")%></td>
                                    <td><%= rs.getString("jumlah")%></td>
                                    <td><%= rs.getString("transaction_date")%></td>
                                    <td>
                                        <form action="deletetransaction?id=<%= rs.getString("id") %>" method="POST"
                                              onsubmit="return confirm('Are you sure want to delete the data?')"
                                        >
                                            <a href="edittransaction?id=<%= rs.getString("id") %>" class="btn btn-sm btn-info">Edit</a>
                                            <input type="hidden" name="id" value="<%= rs.getString("id")%>" />
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                        
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>


        <jsp:include page='layouts/footer.jsp'></jsp:include>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>
