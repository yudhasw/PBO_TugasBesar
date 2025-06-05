<%-- 
    Document   : riwayatTransaksi
    Created on : 31 May 2025, 14.22.06
    Author     : alif
--%>

<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.Set, java.util.HashSet" %>
<%@ page import="classes.JDBC" %>
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

            .riwayat-transaksi {
                width: 90%;
                margin: 40px auto;
                padding: 20px;
                background: #F2F2F2;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            }

            .riwayat-transaksi h2 {
                font-size: 26px;
                color: #333;
                margin-bottom: 20px;
            }

            .tabel-container {
                overflow-x: auto;
            }

            .transaction-table {
                width: 100%;
                border-collapse: collapse;
                border-radius: 10px;
                overflow: hidden;
            }

            .transaction-table thead {
                background-color: #4A90E2;
                color: white;
            }

            .transaction-table th, .transaction-table td {
                padding: 14px 18px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }

            .transaction-table tbody tr:hover {
                background-color: #f5faff;
            }

            .action-btn {
                padding: 6px 12px;
                background-color: #4A90E2;
                color: white;
                border-radius: 6px;
                font-size: 13px;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .action-btn:hover {
                background-color: #3b78c2;
            }

            .badge {
                display: inline-block;
                padding: 6px 10px;
                border-radius: 10px;
                font-size: 12px;
                font-weight: bold;
            }

            .badge.success {
                background-color: #28a745;
                color: white;
            }

            .badge.pending {
                background-color: yellow;
            }
            
            .badge.failed {
                background-color: lightcoral;
            }
        </style>
        <title>E-TokoBuku</title>
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
                    <a href="profilpengguna.jsp">Profil Pengguna</a>
                    <a href="riwayatTransaksi.jsp">Riwayat Transaksi</a>
                    <a href="wishlist.jsp">Wishlist</a>
                    <a href="logout.jsp">Keluar Akun</a>
                </div>
            </div>
        </div>

        <h2>Riwayat Transaksi</h2>
        <div class="riwayat-transaksi">
            <div class="tabel-container">
                <table class="transaction-table">
                    <thead>
                        <tr>
                            <th>ID Transaksi</th>
                            <th>Judul Buku</th>
                            <th>Harga</th>
                            <th>Metode Pembayaran</th>
                            <th>Status</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                JDBC db = new JDBC();

                                ResultSet rsBukuSaya = db.getDataAll("SELECT id_pembelian, judul_buku, harga, metode_pembayaran, status FROM pembelian WHERE nama_pembeli = '" + username + "'");

                                while (rsBukuSaya != null && rsBukuSaya.next()) {
                                    String idTransaksi = rsBukuSaya.getString("id_pembelian");
                                    String judulBuku = rsBukuSaya.getString("judul_buku");
                                    double harga = rsBukuSaya.getDouble("harga");
                                    String metodePembayaran = rsBukuSaya.getString("metode_pembayaran");
                                    String status = rsBukuSaya.getString("status");

                        %>
                        <tr>
                            <td><%= idTransaksi%></td>
                            <td><%= judulBuku%></td>
                            <td>Rp<%= new DecimalFormat("#,##0").format(harga) %></td>
                            <td><%= metodePembayaran%></td>
                        <% 
                                    if ("lunas".equals(status)){
                        %>
                            <td><span class="badge success">Berhasil</span></td>
                        <% 
                            } else if ("pending".equals(status)) {
                        %>
                            <td><span class="badge pending">Pending</span></td>
                        <% 
                            } else if ("gagal".equals(status)) {
                        %>
                            <td><span class="badge failed">Gagal</span></td>
                        <% 
                            }
                        %>
                            <td><a href="detailTransaksi.jsp?id=<%= idTransaksi%>&username=<%= username%>" class="action-btn">Lihat</a></td>
                        </tr>
                        <%
                                }

                                if (rsBukuSaya != null) {
                                    rsBukuSaya.close(); // Tutup ResultSet pembelian setelah selesai dibaca
                                }
                            } catch (Exception e) {
                                out.println("<p style='color:red'>Terjadi error: " + e.getMessage() + "</p>");
                                e.printStackTrace(new java.io.PrintWriter(out));
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <script>
            // Fungsi untuk menampilkan atau menyembunyikan dropdown menu
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

            // Fungsi untuk menutup dropdown jika klik di luar dropdown
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

            // Fungsi untuk menampilkan tombol bersih pencarian
            function toggleClearButton() {
                const input = document.getElementById('searchInput');
                const clearBtn = document.getElementById('clearBtn');
                clearBtn.style.display = input.value.length > 0 ? 'block' : 'none';
            }

            // Fungsi untuk membersihkan input pencarian
            function clearSearch() {
                const input = document.getElementById('searchInput');
                input.value = '';
                document.getElementById('clearBtn').style.display = 'none';
                input.focus();
            }

            // Fungsi untuk memperbarui tombol scroll
            const leftButton = document.querySelector('.scroll-button.left');
            const rightButton = document.querySelector('.scroll-button.right');
            const booksContainer = document.querySelector('.rekomendasi-buku');

            function updateScrollButtons() {
                const scrollLeft = booksContainer.scrollLeft;
                const maxScrollLeft = booksContainer.scrollWidth - booksContainer.clientWidth;

                if (scrollLeft <= 0) {
                    leftButton.style.display = 'none'; // Sembunyikan tombol kiri jika sudah di kiri
                } else {
                    leftButton.style.display = 'block'; // Tampilkan tombol kiri jika tidak di kiri
                }

                if (scrollLeft >= maxScrollLeft) {
                    rightButton.style.display = 'none'; // Sembunyikan tombol kanan jika sudah di kanan
                } else {
                    rightButton.style.display = 'block'; // Tampilkan tombol kanan jika tidak di kanan
                }
            }

            // Perbarui tombol scroll setiap kali pengguna melakukan scroll
            updateScrollButtons();

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
