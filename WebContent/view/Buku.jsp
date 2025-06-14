<%-- 
    Document   : Books
    Created on : May 27, 2025, 9:31:25 PM
    Author     : OMEN
--%>

<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<%
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("penggunaGuest.jsp");
        return;
    }
%>
<html>
    <head>
        <title>${judul}</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #F2F2F2;
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

            .search-input {
                flex-grow: 1;
                display: flex;
                justify-content: center;
                position: relative;
                margin-top: 20px;
            }
            .search-button {
                background-color: #4A90E2;
                border: 1px white solid;
                color: white;
                padding: 0 20px;
                border-radius: 0 35px 35px 0;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .search-button:hover {
                background-color: #357ABD;
            }

            .search-input input {
                width: 450px;
                padding: 15px;
                border: none;
                border-radius: 35px 0 0 35px;
                font-size: 14px;
            }

            #clearBtn {
                position: absolute;
                right: 80px;
                top: 50%;
                transform: translateY(-50%);
                color: #888;
                cursor: pointer;
                font-size: 18px;
            }

            .cart-icon {
                font-size: 22px;
                color: white;
                margin-right: 20px;
                position: relative;
                transition: color 0.3s ease;
            }

            .cart-icon:hover {
                color: #FFD700;
            }

            .cart-icon i {
                vertical-align: middle;
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
                display: flex;
                background-color: white;
                margin: 40px;
                border-radius: 32px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                overflow: hidden;
            }

            .left {
                flex: 1;
                padding: 20px;
            }

            .left img {
                width: 100%;
                height: auto;
                border-radius: 16px;
            }

            .right {
                flex: 2;
                padding: 30px;
            }

            .right h1 {
                font-size: 28px;
                color: #4A90E2;
            }

            .right p {
                font-size: 16px;
                margin: 10px 0;
            }

            .price {
                font-size: 22px;
                color: #e53935;
                font-weight: bold;
            }

            .original-price {
                text-decoration: line-through;
                font-size: 16px;
                color: gray;
                margin-left: 10px;
            }

            .discount {
                font-size: 16px;
                color: green;
                margin-left: 10px;
            }

            .btn-container {
                margin-top: 20px;
            }

            .btn-beli, .btn-keranjang {
                background-color: #4A90E2;
                color: white;
                border: none;
                padding: 12px 24px;
                border-radius: 32px;
                margin-right: 10px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .btn-beli:hover, .btn-keranjang:hover {
                background-color: #357ABD;
            }

            .section {
                margin: 40px;
                background-color: white;
                border-radius: 32px;
                padding: 30px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }

            .section h2 {
                font-size: 24px;
                color: #4A90E2;
                margin-bottom: 20px;
            }

            .book-details table {
                width: 100%;
                border-collapse: collapse;
            }

            .book-details td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            .book-details td:first-child {
                font-weight: bold;
                width: 200px;
                color: #333;
            }

            .fa-star{
                color: goldenrod;
            }
        </style>
    </head>
    <body>

        <div class="header">
            <a href="pengguna.jsp">
                <div class="nama-logo">
                    <img src="imgBuku/Logo.png"/>
                    <h1>E-TokoBuku</h1>
                </div>
            </a>

            <div class="search-input">
                <form action="searchResult.jsp" method="get" style="position: relative; display: flex;">
                    <input type="text" name="query" id="searchInput" placeholder="Search" required oninput="toggleClearButton()">
                    <span id="clearBtn" onclick="clearSearch()" style="display:none;">
                        <i class="fas fa-times"></i>
                    </span>
                    <button type="submit" class="search-button">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>

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
            <div class="left">
                <img src="imgBuku/coverBuku.jpg" alt="${buku.judul}">
            </div>
            <div class="right">
                <h1>${buku.judul}</h1>
                <p><strong>Penulis:</strong> ${buku.penulis}</p>
                <p><strong>Jenis:</strong> ${buku.jenis}</p>
                <p><strong>Rating:</strong> ${buku.rating} / 5.0 <i class="fas fa-star"></i> </p>
                <p class="price">Rp${buku.harga}</p>
                <a href="checkout.jsp?judul=${buku.judul}&harga=${buku.harga}&username=<%= username %>">
                <div class="btn-container">
                    <button class="btn-beli">Beli</button>
                </div>
                </a>
            </div>
        </div>

        <!-- Deskripsi -->
        <div class="section">
            <h2>Deskripsi</h2>
            <p>${buku.deskripsi}</p>
        </div>

        <!-- Detail Buku -->
        <div class="section book-details">
            <h2>Detail Buku</h2>
            <table>
                <p><strong>Penulis:</strong> ${buku.penulis}</p>
                <p><strong>Tahun:</strong> ${buku.tahun}</p>
                <p><strong>Jenis:</strong> ${buku.jenis}</p>
                <p><strong>ISBN:</strong> ${buku.isbn}</p>
                <p><strong>Rating:</strong> ${buku.rating} / 5.0 <i class="fas fa-star"></i> </p>
                <p><strong>Harga:</strong> Rp${buku.harga}</p>
            </table>
        </div>
        <script>function toggleDropdown() {
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
                var dropdown = document.getElementById("dropdown-menu");
                var icon = document.getElementById("dropdown-icon");

                if (!event.target.matches('#profile-img') && !event.target.matches('#dropdown-icon')) {
                    if (dropdown.style.display === "block") {
                        dropdown.style.display = "none";
                        icon.classList.remove("flip");
                    }
                }
            };
        </script>
    </body>

</html>
