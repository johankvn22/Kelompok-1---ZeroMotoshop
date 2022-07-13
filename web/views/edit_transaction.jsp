<%-- 
    Document   : edit_transaction
    Created on : Jul 12, 2022, 10:48:59 PM
    Author     : Johan Kevin
--%>

<%@page import="Helper.StringHelper"%>
<%@page import="Controller.TransactionController"%>
<%@page import="java.sql.ResultSet"%>
<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Edit Transaction Page" />
        </jsp:include>
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 

    </head>
    <body class="d-flex flex-column h-100">
        <jsp:include page='layouts/navbar.jsp'></jsp:include>

        <%
            String id = request.getParameter("id");
            if (id == null || id.equals("")) {
                response.sendRedirect("transaction");
            }

            TransactionController tc = new TransactionController();
            ResultSet rs = tc.getById(id);
            
            System.out.println(rs);
            
            if (!rs.isBeforeFirst()) {
                response.sendRedirect("transaction");
            }
            
        %>

        <% while(rs.next()) { %>
        <!-- Begin page content -->
        <main>
            <div class="col-12 title">
                <h2>Edit Produk - <%= rs.getString("name") %></h2>
            </div>
            <div class="container">
                <p class="lead">Edit produk <%= rs.getString("name")  %> pada sistem aplikasi produk</p>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="edittransaction">
                            <input type="hidden" name="id" value="<%= rs.getString("id")%>" />
                            <div class="mb-3">
                                <label class="form-label">Nama Barang</label>
                                <input type="text" class="form-control" 
                                       placeholder="Masukkan nama produk..." name="name" required
                                       value="<%= rs.getString("name")%>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Jenis Produk</label>
                                 <select class="form-select" aria-label="Default select example" name="product_type" required>
                                    <option value="Knalpot">Knalpot</option>
                                    <option value="Breaking">Breaking</option>
                                    <option value="Safety Part">Safety Part</option>
                                    <option value="Oil">Oil</option>
                                    <option value="Accessories">Accessories</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Jenis Transaksi</label>
                                <select class="form-select" aria-label="Default select example" name="transaction_type" required>
                                    <option value="Barang Masuk">Barang Masuk</option>
                                    <option value="Barang Keluar">Barang Keluar</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Jumlah</label>
                                <input type="number" min="0" class="form-control" 
                                       placeholder="Masukkan stok..." name="jumlah" required
                                       value="<%= rs.getString("jumlah") %>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tanggal Transaksi</label>
                                <div class="input-group date" id="datepicker">
                                    <input type="text" class="form-control" id="date" name="transaction_date" required
                                           value="<%= StringHelper.modifyDateIntoDatepicker(rs.getString("transaction_date")) %>"
                                    />
                                    <span class="input-group-append">
                                        <span class="input-group-text bg-light d-block">
                                            <i class='bx bxs-calendar'></i>
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary btn-small btn-rounded">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <% } %>


        <jsp:include page='layouts/footer.jsp'></jsp:include>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
        <script src="https://unpkg.com/js-datepicker"></script> 
        <script>
            const picker = datepicker('#date', {
                formatter: (input, date, instance) => {
                    input.value = date.toLocaleDateString(); // => '1/1/2099'
                }
            })
        </script>

    </body>
</html>
