<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.JDBC"%>
<%@page import="classes.Buku"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <title>Daftar Buku</title>
        <style>
            body {
                margin: 0;
                padding: 0;
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
                display: flex;
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

            .main-content {
                flex: 1;
                background: rgba(255, 255, 255, 0.5);
                padding: 0px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.2);
                overflow-y: auto;
                transition: margin-left 0.3s ease;
            }

            .book-list {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
                gap: 10px;
                padding: 20px;
                justify-content: center;
            }

            .book-item {
                text-align: center;
                background: #fff;
                padding: 10px;
                border-radius: 5px;
                box-shadow: 0 1px 4px rgba(0,0,0,0.1);
                position: relative;
                display: flex;
                flex-direction: column;
                height: 250px;
                width: 130px;
                justify-content: flex-start;
                text-decoration: none;
                color: inherit;
            }

            .book-item img {
                width: 100%;
                height: 180px;
                background-color: lightgray;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                z-index: 0;
                object-fit: cover;
            }

            .book-item p {
                text-align: left;
                margin: 0;
                margin: 2px 0;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                word-wrap: break-word;
                max-width: 100%;
            }

            .book-item #penulis {
                font-weight: normal;
                font-size: 11px;
                color: grey;
                word-wrap: break-word;
                white-space: normal;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                margin-top: 7px;
            }

            .book-item #judul {
                font-weight: normal;
                font-size: 14px;
                word-wrap: break-word;
                white-space: normal;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                margin-top: 2px;
            }

            .book-item #harga {
                font-weight: bold;
                font-size: 15px;
                word-wrap: break-word;
                white-space: normal;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                margin-top: 2px;
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

            .header {
                background-color: #4A90E2;
                color: white;
                height: 132px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                margin: 0;
            }

            .search-input {
                flex-grow: 1;
                display: flex;
                justify-content: center;
            }

            .search-input input {
                width: 500px;
                padding: 15px;
                border: none;
                border-radius: 35px;
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

            /* Tambah Buku button */
            .add-book-btn {
                display: flex;
                justify-content: flex-end;
                padding: 20px 30px 0 30px;
            }

            .add-book-btn a {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
                transition: background-color 0.3s;
            }

            .add-book-btn a:hover {
                background-color: #45a049;
            }

            .add-book-btn i {
                margin-right: 5px;
            }

            .delete-button {
                position: absolute;
                top: 5px;
                right: 5px;
                background: #e74c3c;
                color: white;
                border: none;
                border-radius: 50%;
                width: 24px;
                height: 24px;
                font-size: 12px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0;
                z-index: 1;
                transition: background-color 0.2s ease;
            }

            .delete-button:hover {
                background-color: #c0392b;
            }


        </style>
    </head>
    <body>

        <span class="toggle-button" onclick="toggleSidebar()">&#9776;</span>

        <div class="container">
            <div class="sidebar" id="sidebar">
                <header>
                    <h2>Admin Menu</h2>
                    <a href="AdminPage.jsp" class="icon-button" title="Daftar User">
                        <i class="fa-solid fa-user"></i> Daftar User
                    </a>
                    <a href="AdminBukuPage.jsp" class="icon-button" title="Edit Buku">
                        <i class="fa-solid fa-book-open-reader"></i> Edit Buku
                    </a>
                    <a href="DaftarPenjualanPage.jsp" class="icon-button" title="Daftar Penjualan Buku">
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

            <div class="main-content">
                <div class="header">
                    <a href="AdminBukuPage.jsp">
                        <div class="nama-logo">
                            <img src="imgBuku/Logo.png"/>
                            <h1>E-TokoBuku</h1>
                        </div>
                    </a>

                    <div class="search-input">
                        <input type="text" placeholder="Search">
                    </div>

                    <div class="profil profil-menu">
                        <h3>Admin</h3>
                        <img src="imgBuku/user.png"/>
                    </div>

                    <a href="logout.jsp" id="logout" style="margin-right: 40px" title="Logout">
                        <i class="fa-solid fa-right-from-bracket"></i>
                    </a>
                </div>

                <!-- Tombol Tambah Buku -->
                <div class="add-book-btn">
                    <a href="tambahBukuAdmin.jsp"><i class="fa fa-plus"></i>Tambah Buku</a>
                </div>

                <div class="book-list">
                    <%
                        JDBC db = new JDBC();
                        ResultSet rs = db.getDataAll("SELECT * FROM buku"); // ganti "buku" sesuai tabelmu
                        if (rs != null) {
                            while (rs.next()) {
                                String id = rs.getString("id_buku");
                                String judul = rs.getString("judul");
                                String penulis = rs.getString("penulis");
                                String harga = rs.getString("harga");
                                String gambar = rs.getString("gambar"); // pastikan kolom ini ada
                    %>
                    <div class="book-item">
                        <!-- Tombol hapus -->
                        <a href="AdminController?action=hapus&id=<%= id%>"
                           onclick="return confirm('Yakin ingin menghapus buku ini (<%= id%>)?')"
                           class="delete-button"
                           title="Hapus Buku">
                            <i class="fa fa-trash"></i>
                        </a>

                        <!-- Gambar buku sebagai link ke halaman detail -->
                        <a href="DetailBukuPage.jsp?id=<%= id%>" style="text-decoration: none;">
                            <img src="<%= gambar != null ? gambar : "img/default-cover.jpg"%>" alt="Cover Buku">
                        </a>

                        <!-- Informasi buku -->
                        <p id="penulis"><%= penulis%></p>
                        <p id="judul"><%= judul%></p>
                        <p id="harga">Rp<%= harga%></p>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>

        <script>
            function toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('hidden');
                sidebar.style.transform = sidebar.classList.contains('hidden') ? 'translateX(-100%)' : 'translateX(0)';
            }
            q
        </script>

    </body>
</html>
