<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.JDBC"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Penjualan Buku</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #add8e6;
                color: #333;
                height: 100vh;
                overflow: hidden;
                position: relative;
            }

            .container {
                position: relative;
                height: 100%;
            }

            .sidebar {
                position: absolute;
                top: 0;
                left: 0;
                width: 250px;
                height: 100%;
                background: rgba(255, 255, 255, 0.8);
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.2);
                transform: translateX(0);
                opacity: 1;
                transition: transform 0.3s ease, opacity 0.3s ease;
                z-index: 10;
            }

            .sidebar.hidden {
                transform: translateX(-100%);
                opacity: 0;
            }

            .toggle-button {
                position: absolute;
                top: 15px;
                left: 15px;
                background: #fff;
                border-radius: 4px;
                padding: 5px 10px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.2);
                cursor: pointer;
                font-size: 20px;
                z-index: 20;
            }

            .content {
                flex: 1;
                background: rgba(255, 255, 255, 0.5);
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.2);
                transition: margin-left 0.3s ease;
                overflow-y: auto;
            }

            header {
                margin-bottom: 20px;
            }

            .icon-button {
                text-decoration: none;
                display: block;
                margin: 10px 0;
                color: #2c3e50;
                transition: color 0.3s, transform 0.3s;
            }

            .icon-button i {
                font-size: 24px;
                margin-right: 8px;
            }

            .icon-button:hover {
                color: #3498db;
                transform: translateY(-5px);
            }

            h1 {
                margin-bottom: 20px;
            }

            .user-list {
                margin-top: 20px;
                background: #fff;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .user-list table {
                width: 100%;
                border-collapse: collapse;
            }

            .user-list th, .user-list td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }

            .delete-icon {
                cursor: pointer;
                color: #e74c3c;
            }

            .header {
                background-color: #4A90E2;
                color: white;
                height: 132px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                margin: 0; /* Pastikan tidak ada margin */
            }

            .profil {
                display: flex;
                position: relative;
                justify-content: space-between;
                align-items: center;
                margin-right: 20px;
            }

            .profil h3{
                text-align: center;
                color: white;
                padding: 10px 15px;
                border-radius: 5px;
                margin: 20px;
            }

            .profil-menu{
                display: flex;
                position: relative;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                margin-left: auto;
            }
            .profil-menu img {
                width: 50px;
                height: 50px;
                cursor: pointer;
                margin-left: 10px;
            }
            .profil img {
                background-color: #6c757d;
                padding: 15px;
                border: none;
                border-radius: 100px;
            }

            .delete-icon {
                cursor: pointer;
                color: #e74c3c;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ccc;
            }
            a {
                text-decoration: none;
            }

            .nama-logo{
                margin-left: 20px;
                margin-right: 40px;
                display: flex;
                justify-content: space-around;
            }

            .nama-logo h1{
                font-size: 20px;
                margin: 20px;
                text-decoration: none;
                color: white;
            }

            .nama-logo img{
                width: 60px;
                height: 60px;
            }
        </style>
    </head>
    <body>
        <!-- Toggle Button di luar sidebar -->
        <span class="toggle-button" onclick="toggleSidebar()">&#9776;</span>

        <div class="container">

            <!<!-- Header -->
            <div class="header">
                <a href="AdminPage.jsp">
                    <div class="nama-logo">
                        <img src="imgBuku/Logo.png"/>
                        <h1>E-TokoBuku</h1>
                    </div>
                </a>

                <div class="profil profil-menu">
                    <h3>Admin</h3>
                    <img src="imgBuku/user.png"/>
                </div>

                <a href="logout.jsp" id="logout" style="margin-right: 40px" title="Logout">
                    <i class="fa-solid fa-right-from-bracket"></i>
                </a>
            </div>

            <div class="sidebar" id="sidebar">
                <header>
                    <h2>Admin Menu</h2>
                    <a href="AdminPage.jsp" class="icon-button" title="Daftar User">
                        <i class="fa-solid fa-user"></i> Daftar User
                    </a>
                    <a href="AdminBukuPage.jsp" class="icon-button" title="Edit Buku">
                        <i class="fa-solid fa-book-open-reader"></i> Edit Buku
                    </a>
                    <a href="#" class="icon-button" title="Daftar Penjualan Buku">
                        <i class="fa-solid fa-chart-line"></i> Daftar Penjualan
                    </a>
                    <a href="VerifikasiPage.jsp" class="icon-button" title="Daftar Penjualan Buku">
                        <i class="fa-solid fa-square-check"></i> Verifikasi
                    </a>
                    <a href="AdminReviewPage.jsp" class="icon-button" title="Forum Review Buku">
                        <i class="fa-solid fa-comments"></i> Forum Review Buku
                    </a>
                </header>
            </div>
            <div class="content" id="content">

                <div class="user-list">
                    <h3>Daftar Penjualan</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Judul Buku</th>
                                <th>harga Buku</th>
                                <th>Metode Pembayaran</th>
                                <th>Status</th>
                                <th>Harga+Diskon</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                JDBC db = new JDBC();
                                ResultSet rs = db.getDataAll("SELECT * FROM daftar_penjualan");
                                if (rs != null) {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("id_pembelian")%></td>
                                <td><%= rs.getString("nama_pembeli")%></td>
                                <td><%= rs.getString("email")%></td>
                                <td><%= rs.getString("judul_buku")%></td>
                                <td><%= rs.getString("harga")%></td>
                                <td><%= rs.getString("metode_pembayaran")%></td>
                                <td><%= rs.getString("status")%></td>
                                <td><%= rs.getString("harga_akhir")%></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <script>
                    function toggleSidebar() {
                        const sidebar = document.getElementById('sidebar');
                        sidebar.classList.toggle('hidden');
                        sidebar.style.transform = sidebar.classList.contains('hidden') ? 'translateX(-100%)' : 'translateX(0)';
                    }
                </script>
                </body>
                </html>
