<%-- 
    Document   : penggunaGuest
    Created on : 24 May 2025, 17.02.21
    Author     : alif
--%>

<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<%
    String username = (String) session.getAttribute("username");

    if (username != null) {
        response.sendRedirect("pengguna.jsp");
        return; // Pastikan eksekusi berhenti setelah redirect
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <title>E-TokoBuku</title>
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
                width: 100%;
            }

            .nama-logo {
                margin-left: 20px;
                display: flex;
                justify-content: space-around;
            }

            .nama-logo h1 {
                font-size: 20px;
                margin: 20px;
                text-decoration: none;
                color: white;
            }

            .nama-logo img {
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

            .guest {
                display: flex;
                align-items: center;
                margin-right: 20px;
                justify-content: space-around;
                background-color: white;
                border-radius: 32px;
            }

            .guest a {
                padding: 15px;
            }

            .guest a:hover {
                border-radius: 32px;
                background-color: #8CBCF3;
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
                background-color: white;
                border: none;
                border-radius: 32px;
                overflow-x: auto;
                white-space: nowrap;
            }

            .rekomendasi-buku::-webkit-scrollbar {
                display: none;
            }

            .book-item {
                background-color: white;
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
                background-color: white;
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

            <div class="guest">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>

        </div>
        <h2>Rekomendasi Buku</h2>
        <div class="rekomendasi-buku">

            <button class="scroll-button left">&#8592;</button>

            <%
                try {
                    JDBC db = new JDBC();
                    ResultSet rs = db.getDataAll("SELECT * FROM buku");

                    while (rs != null && rs.next()) {
                        String idBuku = rs.getString("id_buku");
            %>
            <div class="book-item">
                <a href="login.jsp">
                    <button class="wishlist-btn">
                        <i class="fas fa-heart"></i>
                    </button>
                </a>
                <a href="login.jsp">
                    <img src="imgBuku/coverBuku.jpg" alt="<%= rs.getString("judul")%>">
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
                } catch (Exception e) {
                    out.println("<p style='color:red'>Terjadi error: " + e.getMessage() + "</p>");
                    e.printStackTrace(new java.io.PrintWriter(out));
                }
            %>

            <button class="scroll-button right">&#8594;</button>
        </div>

        <div class="fitur">

            <a href="login.jsp">
                <div class="opsi">
                    <img src="imgBuku/bukuSaya.jpg" />
                    <p>Buku Saya</p>
                </div>
            </a>

            <a href="login.jsp">
                <div class="opsi">
                    <img src="imgBuku/forum.jpg" />
                    <p>Review Buku</p>
                </div>
            </a>
            
            <a href="login.jsp">
                <div class="opsi">
                    <img src="imgBuku/riwayat.jpg" />
                    <p>Riwayat Transaksi</p>
                </div>
            </a>
        </div>

        <script>
            // JavaScript untuk tombol scroll
            const leftButton = document.querySelector('.scroll-button.left');
            const rightButton = document.querySelector('.scroll-button.right');
            const booksContainer = document.querySelector('.rekomendasi-buku');

            // Fungsi untuk memeriksa posisi scroll dan menyesuaikan visibilitas tombol
            function updateScrollButtons() {
                const scrollLeft = booksContainer.scrollLeft;
                const maxScrollLeft = booksContainer.scrollWidth - booksContainer.clientWidth;

                // Tombol kiri
                if (scrollLeft <= 0) {
                    leftButton.style.display = 'none'; // Sembunyikan tombol kiri jika sudah di kiri
                } else {
                    leftButton.style.display = 'block'; // Tampilkan tombol kiri jika tidak di kiri
                }

                // Tombol kanan
                if (scrollLeft >= maxScrollLeft) {
                    rightButton.style.display = 'none'; // Sembunyikan tombol kanan jika sudah di kanan
                } else {
                    rightButton.style.display = 'block'; // Tampilkan tombol kanan jika tidak di kanan
                }
            }

            // Perbarui tombol saat halaman dimuat pertama kali
            updateScrollButtons();

            // Perbarui tombol setiap kali pengguna melakukan scroll
            booksContainer.addEventListener('scroll', updateScrollButtons);

            // Tombol scroll kiri
            leftButton.addEventListener('click', () => {
                booksContainer.scrollBy({
                    left: -250, // Sesuaikan jumlah scroll sesuai kebutuhan
                    behavior: 'smooth'
                });
            });

            // Tombol scroll kanan
            rightButton.addEventListener('click', () => {
                booksContainer.scrollBy({
                    left: 250, // Sesuaikan jumlah scroll sesuai kebutuhan
                    behavior: 'smooth'
                });
            });

        </script>

    </body>
</html>
