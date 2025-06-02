<%-- 
    Document   : searchResult
    Created on : 1 Jun 2025, 16.06.05
    Author     : alif
--%>

<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<%
    String username = (String) session.getAttribute("username");
    String keyword = request.getParameter("query");

    // Jika pengguna belum login, arahkan ke login.jsp
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;  // Pastikan eksekusi berhenti setelah redirect
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

            .book-item {
                margin: 20px;
                position: relative;
                display: flex;
                flex-direction: column;
                height: 230px;
                width: 110px;
                justify-content: flex-start;
                padding: 20px;
                border: solid grey 1px;
                border-radius: 10px;
                margin: 20px;
            }

            .book-item:hover {
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
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

            .book-item p {
                text-align: left;
                margin: 0;
            }

            .wishlist-btn {
                background-color: transparent;
                color: grey;
                border: none;
                font-size: 20px;
                cursor: pointer;
                position: absolute;
                top: 5px;
                right: 5px;
                padding: 10px;
                border-radius: 50%;
                transition: background-color 0.3s ease;
                z-index: 1;
            }

            .wishlist-btn:hover {
                background-color: rgba(255, 87, 51, 0.15);
            }

            .wishlist-btn:focus {
                outline: none;
            }

            .wishlist-btn.active {
                color: red;
            }


            #penulis {
                font-weight: normal;
                font-size: 11px;
                color: grey;
                margin-top: 10px;
            }

            #judul {
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

            #harga {
                font-weight: bold;
                font-size: 15px;
                margin-top: 10px;
                bottom: 20px;
                position: absolute;
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
                display: none;
                position: fixed;
                top: 140px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #4A90E2;
                color: white;
                padding: 12px 24px;
                border-radius: 32px;
                font-weight: bold;
                font-size: 16px;
                z-index: 9999;
                box-shadow: 0 4px 12px rgba(0,0,0,0.2);
                transition: opacity 0.3s ease;
                opacity: 1;
            }

        </style>
        <title>E-TokoBuku</title>
    </head>
    <body>
        <!-- Pesan status -->
        <div id="wishlist-message"></div>
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

            <!--            <a href="keranjang.jsp" class="cart-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </a>-->

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

        <h2>Hasil Pencarian untuk "<%= keyword%>"</h2> 
        <div class="rekomendasi-buku">
            <button class="scroll-button left">&#8592;</button>
            <%
                try {
                    JDBC db = new JDBC();
                    ResultSet rs = db.getDataAll(
                            "SELECT * FROM buku WHERE judul LIKE '%" + keyword + "%' OR penulis LIKE '%" + keyword + "%'"
                    );

                    while (rs != null && rs.next()) {
                        String idBuku = rs.getString("id_buku");
                        ResultSet rsWishlist = db.getDataAll("SELECT * FROM wishlist WHERE idPengguna=(SELECT id FROM pengguna WHERE username='" + username + "') AND idBuku='" + idBuku + "'");
                        boolean isInWishlist = rsWishlist.next();
                        rsWishlist.close();
            %>
            <div class="book-item">
                <button class="wishlist-btn  <%= isInWishlist ? "active" : ""%>"" data-id="<%= idBuku%>" onclick="toggleWishlist(event, this)">
                    <i class="fas fa-heart"></i>
                </button>
                <a href="BukuController?id=<%= idBuku%>">
                    <img src="imgBuku/<%= idBuku%>.jpg" alt="<%= rs.getString("judul")%>">
                    <p id="penulis"><%= rs.getString("penulis")%></p>
                    <p id="judul"><%= rs.getString("judul")%></p>
                    <p id="harga">Rp<%= new DecimalFormat("#,##0").format(rs.getFloat("harga")) %></p>
                </a>
            </div>
            <%
                    }

                    if (rs != null) {
                        rs.close();
                    }
                    db.disconnect();
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Terjadi error: " + e.getMessage() + "</p>");
                }
            %>
        </div>
        <button class="scroll-button right">&#8594;</button>
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

        function toggleWishlist(event, button) {
            event.preventDefault();
            event.stopPropagation();

            const idBuku = button.getAttribute("data-id");

            fetch("toggleWishlist.jsp?idBuku=" + idBuku)
                    .then(response => response.text())
                    .then(result => {
                        const trimmed = result.trim();

                        if (trimmed === "added") {
                            button.classList.add("active");
                            button.style.color = "red";
                            showMessage("Ditambahkan ke wishlist");
                        } else if (trimmed === "removed") {
                            button.classList.remove("active");
                            button.style.color = "grey";
                            showMessage("Dihapus dari wishlist");
                        } else {
                            showMessage("Terjadi kesalahan: " + trimmed);
                        }
                    });
        }

        function showMessage(msg) {
            const div = document.getElementById("wishlist-message");
            div.innerText = msg;
            div.style.display = "block";
            setTimeout(() => div.style.display = "none", 3000);
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

        function showMessage(msg) {
            const div = document.getElementById("wishlist-message");
            div.innerText = msg;
            div.style.display = "block";
            div.style.opacity = "1";

            setTimeout(() => {
                div.style.opacity = "0";
                setTimeout(() => {
                    div.style.display = "none";
                    div.style.opacity = "1";
                }, 300);
            }, 1000);
        }

    </script>
</body>
</html>
