<%-- 
    Document   : Review
    Created on : May 31, 2025, 7:55:27 AM
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

            h2 {
                margin-left: 40px;
                font-size: 30px;
            }

            .main-nav {
                background-color: #e9ebee; /* Warna abu-abu muda navigasi utama */
                padding: 0 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #ddd;
            }

            .main-nav ul {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
            }

            .main-nav ul li {
                padding: 15px 20px;
            }

            .main-nav ul li.active {
                border-bottom: 3px solid #3b5998; /* Indikator tab aktif */
                font-weight: bold;
            }

            .main-nav ul li a {
                text-decoration: none;
                color: #3b5998;
            }

            .main-nav .search-bar {
                display: flex;
                align-items: center;
            }

            .main-nav .search-bar input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px 0 0 4px;
            }

            .main-nav .search-bar button {
                padding: 8px 12px;
                background-color: #f5f6f7;
                border: 1px solid #ccc;
                border-left: none;
                border-radius: 0 4px 4px 0;
                cursor: pointer;
            }

            .sub-nav {
                background-color: #ffffff;
                padding: 10px 20px;
                border-bottom: 1px solid #ddd;
            }

            .sub-nav ul {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
            }

            .sub-nav ul li {
                margin-right: 20px;
            }

            .sub-nav ul li a {
                text-decoration: none;
                color: #333;
            }

            main {
                padding: 20px;
            }

            .breadcrumb {
                font-size: 0.9em;
                color: #666;
                margin-bottom: 20px;
            }

            .breadcrumb a {
                color: #3b5998;
                text-decoration: none;
            }

            .forum-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .forum-button {
                justify-content: space-between;
                align-items: right;
            }

            .forum-header h1 {
                font-size: 1.8em;
                color: #333;
                margin: 0;
            }

            .new-topic-btn {
                background-color: #1877f2; /* Warna biru tombol topik baru */
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 0.9em;
            }

            .forum-category {
                background-color: #ffffff;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 20px;
            }

            .forum-category h2 {
                background-color: #f5f6f7; /* Latar belakang judul kategori */
                padding: 12px 15px;
                margin: 0;
                font-size: 1.1em;
                border-bottom: 1px solid #ddd;
            }

            .forum-topic {
                display: flex;
                align-items: center;
                padding: 15px;
                border-bottom: 1px solid #e9ebee;
            }

            .forum-topic:last-child {
                border-bottom: none;
            }

            .topic-icon {
                width: 40px;
                height: 40px;
                background-color: #d9e2f7; /* Warna ikon default */
                border-radius: 50%;
                margin-right: 15px;
                /* Anda bisa menggunakan gambar ikon di sini */
            }
            .topic-icon.user-icon {
                background-color: #e0e0e0; /* Warna ikon user */
            }


            .topic-details {
                flex-grow: 1;
                max-width: 70%;
            }

            .topic-details h3 {
                margin: 0 0 5px 0;
                font-size: 1.1em;
            }

            .topic-details h3 a {
                text-decoration: none;
                color: #056ac4; /* Warna link judul topik */
            }

            .topic-details p {
                font-size: 0.9em;
                color: #666;
                margin: 3px 0;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 4; 
                -webkit-box-orient: vertical;
                word-wrap: break-word;
                max-width: 100%;
            }

            .topic-stats {
                width: 100px;
                text-align: center;
                font-size: 0.9em;
                color: #666;
            }

            .topic-last-post {
                width: 200px;
                font-size: 0.85em;
                color: #666;
                display: flex;
                margin-left: auto;
                max-width: 20%;
            }
            .topic-last-post .avatar {
                width: 30px;
                height: 30px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .topic-last-post p {
                margin: 2px 0;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2; 
                -webkit-box-orient: vertical;
                word-wrap: break-word;
                max-width: 100%;
            }

            .topic-last-post a {
                color: #056ac4;
                text-decoration: none;
            }
        </style>
        <title>E-TokoBuku</title>
    </head>
    <body>
        <!-- Pesan status -->
        <div id="wishlist-message" style="display: none; color: green; font-weight: bold;"></div>
        <div class="header">
            <a href="Pengguna.jsp">
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
            <a href="keranjang.jsp" class="cart-icon">
                <i class="fas fa-shopping-cart"></i>
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

        <main>
            <div class="breadcrumb">
                <a href="Review.jsp">Forum Review Buku</a> 
            </div>

            <div class="forum-header">
                <h1>Forum Review Buku</h1>
                <div class="forum-button">
                    <a href="Review_hapusPost.jsp">
                        <button class="new-topic-btn">Hapus Post</button>
                    </a>
                    <a href="Review_buatPost.jsp">
                        <button class="new-topic-btn">Buat Post</button>
                    </a>
                </div>

            </div>

            <%
                JDBC db = new JDBC();
                List<Map<String, String>> allPosts = db.getForumData();
            %>

            <section class="forum-category">
                <h2>Non-Fiksi</h2>
                <%
                    boolean hasNonFiksi = false;
                    for (Map<String, String> post : allPosts) {
                        if (post.get("kategori").equals("Non-Fiksi")) {
                            hasNonFiksi = true;
                %>
                <div class="forum-topic">
                    <div class="topic-icon"></div>
                    <div class="topic-details">
                        <h3><a href="ReviewController?action=detail&id= <%= post.get("id_post") %>"> <%= post.get("judul_forum")%> </a></h3>
                        <p> <%= post.get("deskripsi")%> </p>
                    </div>
                    <div class="topic-last-post">
                        <p>Oleh <a href="#"> <%= post.get("username_pengirim")%></a>, <%= post.get("waktu")%></p>
                    </div>
                </div>
                <%
                        }
                    }
                    if (!hasNonFiksi) {
                %>
                <div class="forum-topic"><p>Tidak ada post</p></div>
                <%
                    }
                %>
            </section>

            <section class="forum-category">
                <h2>Fiksi</h2>
                <%
                    boolean hasFiksi = false;
                    for (Map<String, String> post : allPosts) {
                        if (post.get("kategori").equals("Fiksi")) {
                            hasFiksi = true;
                %>
                <div class="forum-topic">
                    <div class="topic-icon"></div>
                    <div class="topic-details">
                        <h3><a href="#"> <%= post.get("judul_forum")%> </a></h3>
                        <p> <%= post.get("deskripsi")%> </p>
                    </div>
                    <div class="topic-last-post">
                        <p>Oleh <a href="#"> <%= post.get("username_pengirim")%></a>, <%= post.get("waktu")%></p>
                    </div>
                </div>
                <%
                        }
                    }
                    if (!hasFiksi) {
                %>
                <div class="forum-topic"><p>Tidak ada post</p></div>
                <%
                    }
                %>
            </section>
        </main>

        <script>
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
                var dropdown = document.getElementById("dropdown-menu");
                var icon = document.getElementById("dropdown-icon");

                if (!event.target.matches('#profile-img') && !event.target.matches('#dropdown-icon')) {
                    if (dropdown.style.display === "block") {
                        dropdown.style.display = "none";
                        icon.classList.remove("flip");
                    }
                }
            };

            const leftButton = document.querySelector('.scroll-button.left');
            const rightButton = document.querySelector('.scroll-button.right');
            const booksContainer = document.querySelector('.rekomendasi-buku');

            function updateScrollButtons() {
                const scrollLeft = booksContainer.scrollLeft;
                const maxScrollLeft = booksContainer.scrollWidth - booksContainer.clientWidth;

                if (scrollLeft <= 0) {
                    leftButton.style.display = 'none';
                } else {
                    leftButton.style.display = 'block';
                }

                if (scrollLeft >= maxScrollLeft) {
                    rightButton.style.display = 'none';
                } else {
                    rightButton.style.display = 'block';
                }
            }

            updateScrollButtons();

            booksContainer.addEventListener('scroll', updateScrollButtons);

            leftButton.addEventListener('click', () => {
                booksContainer.scrollBy({
                    left: -250,
                    behavior: 'smooth'
                });
            });

            rightButton.addEventListener('click', () => {
                booksContainer.scrollBy({
                    left: 250,
                    behavior: 'smooth'
                });
            });
            function showPopup(message) {
                document.getElementById("popup-message").innerText = message;
                document.getElementById("wishlist-popup").style.display = "flex";
            }

            function closePopup() {
                document.getElementById("wishlist-popup").style.display = "none";
            }

            function toggleWishlist(button) {
                const messageDiv = document.getElementById("wishlist-message");

                if (button.style.color === "red") {

                    button.style.color = "grey";

                    messageDiv.innerText = "Berhasil dihapus dari Wishlist!";
                    messageDiv.style.display = "block";
                } else {

                    button.style.color = "red";

                    messageDiv.innerText = "Berhasil menambahkan ke Wishlist!";
                    messageDiv.style.display = "block";
                }
            }

            const wishlistButtons = document.querySelectorAll('.wishlist-btn');
            wishlistButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    toggleWishlist(button);
                });
            });

            function toggleClearButton() {
                const input = document.getElementById('searchInput');
                const clearBtn = document.getElementById('clearBtn');
                clearBtn.style.display = input.value.length > 0 ? 'block' : 'none';
            }

            function clearSearch() {
                const input = document.getElementById('searchInput');
                input.value = '';
                document.getElementById('clearBtn').style.display = 'none';
                input.focus();
            }

        </script>
    </body>
</html>
