<%-- 
    Document   : pengguna
    Created on : 22 May 2025, 19.04.55
    Author     : alif
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

            .search-input{
                flex-grow: 1;
                display: flex;
                justify-content: center;
            }

            .search-input input{
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
                margin-left: 40px;
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
                background-color: grey;
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

            .rekomendasi-buku {
                display: flex;
                justify-content: flex-start;
                margin: 0px 40px 40px 40px;
                padding: 20px;
                background-color: #F2F2F2;
                border: none;
                border-radius: 32px;
                overflow-x: auto;
                white-space: nowrap;
            }

            .rekomendasi-buku::-webkit-scrollbar {
                display: none;
            }

            .rekomendasi-buku a {
                border: solid grey 1px;
                border-radius: 10px;
                margin: 20px;
            }

            .rekomendasi-buku a:hover {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05), 0 4px 12px rgba(0, 0, 0, 0.08);
            }

            .book-item {
                margin: 20px;
                position: relative; /* Pastikan .book-item relatif untuk posisi absolut anaknya */
                display: flex;
                flex-direction: column;
                height: 250px;
                width: 110px;
                justify-content: flex-start;
            }

            .book-item img {
                width: 110px;
                height: 150px;
                background-color: lightgray;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                z-index: 0;
            }

            .book-item .wishlist-btn {
                background-color: transparent;
                color: grey;
                border: none;
                font-size: 20px;
                cursor: pointer;
                position: absolute;
                top: -15px;
                right: -15px;
                padding: 10px;
                border-radius: 50%;
                transition: background-color 0.3s ease;
                z-index: 1;
            }

            .book-item .wishlist-btn:hover {
                background-color: rgba(255, 87, 51, 0.2);
            }

            .book-item .wishlist-btn:focus {
                outline: none;
            }

            .book-item p {
                text-align: left;
                margin: 0;
            }

            .book-item #penulis {
                font-weight: normal;
                font-size: 11px;
                color: grey;
                margin-top: 10px;
            }

            .book-item #judul {
                font-weight: normal;
                font-size: 14px;
                word-wrap: break-word;
                white-space: normal;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .book-item #harga {
                font-weight: bold;
                font-size: 15px;
                margin-top: auto;
            }

            .scroll-button {
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 20px;
                cursor: pointer;
                font-size: 20px;
                position: absolute;
                top: 50%;
                z-index: 10;
                border-radius: 32px;
            }

            .scroll-button.left {
                left: 60px;
            }

            .scroll-button.right {
                right: 60px;
            }

            .scroll-button:hover{
                background-color: #4A90E2;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05), 0 4px 12px rgba(0, 0, 0, 0.08);
            }

            #popup-content {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                text-align: center;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            }

            #popup-content button {
                background-color: #4A90E2;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
            }


            .fitur {
                display: flex;
                justify-content: space-around;
                margin: 0px 40px 40px 40px;
                padding: 20px;
                background-color: #F2F2F2;
                border: none;
                border-radius: 32px;
            }

            .fitur a:hover{
                border: none;
                border-radius: 32px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05), 0 4px 12px rgba(0, 0, 0, 0.08);
            }

            .opsi {
                margin: 20px;
                align-items: center;
                justify-content: center;
            }

            .opsi img {
                width: 150px;
                height: 150px;
                background-color: lightgray;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .opsi p {
                text-align: center;
                font-weight: bold;
            }

            #wishlist-message {
                margin-top: 10px;
                color: green;
                font-weight: bold;
            }

        </style>
        <title>E-TokoBuku</title>
    </head>
    <body>
        <!-- Pesan status -->
        <div id="wishlist-message" style="display: none; color: green; font-weight: bold;"></div>
        <div class="header">
            <a href="pengguna.jsp">
                <div class="nama-logo">
                    <img src="imgBuku/Logo.png"/>
                    <h1>E-TokoBuku</h1>
                </div>
            </a>

            <div class="search-input">
                <input type="text" placeholder="Search">
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

        <h2>Rekomendasi Buku</h2>
        <div class="rekomendasi-buku">
            <button class="scroll-button left">&#8592;</button>
            <a href="url">
                <div class="book-item">
                    <button class="wishlist-btn">
                        <i class="fas fa-heart"></i>
                    </button>
                    <img src="img" alt="Buku 1">
                    <p id="penulis">Penulis</p>
                    <p id="judul">Judul Buku 1</p>
                    <p id="harga">Rp50.000</p>
                </div>
            </a>

            <a href="url">
                <div class="book-item">
                    <button class="wishlist-btn">
                        <i class="fas fa-heart"></i>
                    </button>
                    <img src="img" alt="Buku 1">
                    <p id="penulis">Penulis</p>
                    <p id="judul">Judul Buku 2 ini panjang</p>
                    <p id="harga">Rp50.000</p>
                </div>
            </a>

            <a href="url">
                <div class="book-item">
                    <button class="wishlist-btn">
                        <i class="fas fa-heart"></i>
                    </button>
                    <img src="img" alt="Buku 1">
                    <p id="penulis">Penulis</p>
                    <p id="judul">Judul Buku 3 ini sangat amat teramat panjang</p>
                    <p id="harga">Rp50.000</p>
                </div>
            </a>

            <button class="scroll-button right">&#8594;</button>
        </div>

        <div class="fitur">
            <a href="url">
                <div class="opsi">
                    <img src="src" />
                    <p>Buku Favorit</p>
                </div>
            </a>

            <a href="url">
                <div class="opsi">
                    <img src="src" />
                    <p>Buku Saya</p>
                </div>
            </a>

        </div>

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


        </script>
    </body>
</html>
