<%-- 
    Document   : Review_buatPost
    Created on : May 31, 2025, 3:57:41 PM
    Author     : yudha
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.JDBC"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("penggunaGuest.jsp");
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background: white;
                margin: 0;
                padding: 0;
            }

            a {
                text-decoration: none;
                color: black;
                cursor: pointer;
            }

            .header {
                background-color: #4A90E2;
                color: white;
                height: 132px;
                display: flex;
                justify-content: space-between;
                align-items: center;
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
                margin-right: 10px;
            }
            .profil-menu{
                display: flex;
                position: relative;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
            }
            .profil-menu img {
                width: 50px;
                height: 50px;
                cursor: pointer;
                margin-left: 10px;
            }

            .profil-menu:hover{
                background-color: #357ABD;
                border-radius: 32px;
            }

            #dropdown-icon{
                text-align: center;
                color: white;
                padding: 10px 15px;
                border-radius: 5px;
                cursor: pointer;
                transition: transform 0.3s ease;
            }

            #dropdown-icon.flip {
                transform: rotate(180deg);
            }

            #dropdown-menu {
                display: none;
                position: absolute;
                right: 0;
                top: 60px;
                background-color: white;
                min-width: 220px;
                box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
                border-radius: 8px;
                z-index: 1;
                padding: 10px 0;
            }

            #dropdown-menu a {
                color: black;
                padding: 16px 24px;
                font-size: 16px;
                text-decoration: none;
                display: block;
                transition: background-color 0.2s ease;
            }

            #dropdown-menu a:hover {
                background-color: #e6e6e6;
            }

            .container {
                max-width: 900px;
                margin: 40px auto;
                background-color: #F2F2F2;
                padding: 30px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .container-header {
                margin: 40px auto;
                text-align: center;
            }

            h2 {
                margin-top: 0;
            }
            label {
                font-weight: bold;
                display: block;
                margin: 20px 0 5px;
            }
            input[type="text"], input[type="email"], textarea {
                width: 100%;
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            select {
                width: 100%;
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .submit-btn {
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bdb;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .submit-btn:hover {
                background-color: #005bb5;
            }
        </style>
        <title>E-TokoBuku</title>
    </head>
    <body>
        <div class="header">
            <a href="Pengguna.jsp">
                <div class="nama-logo">
                    <img src="imgBuku/Logo.png"/>
                    <h1>E-TokoBuku</h1>
                </div>
            </a>
            <div class="profil">
                <h3><%= username%></h3>
                <div class="profil-menu">
                    <i class="fas fa-chevron-down" id="dropdown-icon" onclick="toggleDropdown()"></i>
                    <img src="imgBuku/user.png" id="profile-img" onclick="toggleDropdown()"/>
                </div>
                <div id="dropdown-menu" class="dropdown-content">
                    <a href="profilPengguna.jsp">Profil Pengguna</a>
                    <a href="riwayatTransaksi.jsp">Riwayat Transaksi</a>
                    <a href="wishlist.jsp">Wishlist</a>
                    <a href="logout.jsp">Keluar Akun</a>
                </div>
            </div>
        </div>

        <div class="container">
            <h1 style="text-align: center">Buat Review Buku</h1>

            <form action="ReviewController" method="post">
                <label for="judul_postingan">Judul Postingan</label>
                <input type="text" id="judul_postingan" name="judul_postingan" required>
                <label for="judul_buku">Judul Buku</label>
                <input type="text" id="judul_buku" name="judul_buku" required>
                <label for="kategori">Kategori Buku</label>
                <select id="kategori" name="kategori" required>
                    <option value="">-- Pilih Kategori --</option>
                    <option value="Fiksi">Fiksi</option>
                    <option value="Non-Fiksi">Non-Fiksi</option>
                </select>
                <label>Deskripsi</label>
                <div>
                    <textarea name="konten" rows="8" maxlength="256" required></textarea>
                </div>
                <div>
                    <button type="button" class="submit-btn" onclick="window.location.href = 'Review.jsp'">Kembali</button>
                    <button type="submit" name="action" value="buat" class="submit-btn">Post</button>
                </div>
                <input type="hidden" name="username" value="<%= username%>">
            </form>
        </div>


        <script>
            document.addEventListener("DOMContentLoaded", function () {

                // Toggle dropdown
                document.getElementById("dropdown-icon").onclick = toggleDropdown;
                document.getElementById("profile-img").onclick = toggleDropdown;

                function toggleDropdown() {
                    var dropdown = document.getElementById("dropdown-menu");
                    var icon = document.getElementById("dropdown-icon");

                    if (dropdown.style.display === "block") {
                        dropdown.style.display = "none";
                        icon.classList.remove("flip");
                    } else {
                        dropdown.style.display = "block";
                        icon.classList.add("flip");
                    }
                }

                window.onclick = function (event) {
                    if (!event.target.matches('#profile-img') && !event.target.matches('#dropdown-icon')) {
                        var dropdown = document.getElementById("dropdown-menu");
                        var icon = document.getElementById("dropdown-icon");

                        if (dropdown.style.display === "block") {
                            dropdown.style.display = "none";
                            icon.classList.remove("flip");
                        }
                    }
                };
            });
        </script>
    </body>
</html>
