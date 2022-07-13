<%-- 
    Document   : create_transaction
    Created on : Jul 12, 2022, 9:00:57 PM
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
            <jsp:param name="title" value="Create Transaction Page" />
        </jsp:include>
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
        
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 

    </head>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>

        <%
            TransactionController tc = new TransactionController();
            ResultSet rs = tc.get();
        %>
        
        <!-- Begin page content -->
                <div class="col-12 title">
                        <h2>Tambah Transaksi</h2>
                    </div>
        <div class="container">
                <p class="lead">Tambah Transaksi baru pada sistem aplikasi</p>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="createtransaction">
                            <div class="mb-3">
                                <label class="form-label">Nama Produk</label>
                                <input type="text" class="form-control" placeholder="Masukkan nama produk..." name="name" required>
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
                                <input type="number" min="0" class="form-control" placeholder="Masukkan stok..." name="jumlah" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tanggal Transaksi</label>
                                <div class="input-group date" id="datepicker">
                                    <input type="text" class="form-control" id="date" name="transaction_date" required />
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
