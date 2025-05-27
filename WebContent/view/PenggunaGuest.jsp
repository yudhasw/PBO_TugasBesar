<%-- 
    Document   : PenggunaGuest
    Created on : 24 May 2025, 17.02.21
    Author     : GAMING 3
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>E-TokoBuku</title>
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
            width: 100%;
        }

        .nama-logo {
            margin-left: 20px;
            margin-right: 40px;
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
        }

        .search-input input {
            width: 500px;
            padding: 15px;
            border: none;
            border-radius: 35px;
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
            justify-content: flex-start; /* Memperbaiki: Agar item buku dimulai dari kiri */
            margin: 0px 40px 40px 40px;
            padding: 20px;
            background-color: #F2F2F2;
            border: none;
            border-radius: 32px;
            overflow-x: auto; /* Memungkinkan scroll horizontal */
            white-space: nowrap; /* Mencegah pemisahan elemen pada baris baru */
        }

        .rekomendasi-buku::-webkit-scrollbar {
            display: none; /* Menyembunyikan scrollbar */
        }

        .rekomendasi-buku a:hover {
            border: none;
            border-radius: 32px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05), 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .book-item {
            margin: 20px;
            align-items: center;
            justify-content: center;
            display: inline-block; /* Memastikan item buku tetap dalam satu baris */
        }

        .book-item img {
            width: 190px;
            height: 250px;
            background-color: lightgray;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .book-item p {
            text-align: center;
            font-weight: bold;
        }

        .scroll-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 20px;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }

        .scroll-button.left {
            left: 10px;
        }

        .scroll-button.right {
            right: 10px;
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

        .fitur a:hover {
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
            <input type="text" placeholder="Search">
        </div>

        <div class="guest">
            <a>Login</a>
            <a>Register</a>
        </div>

    </div>
    <h2>Rekomendasi Buku</h2>
    <div class="rekomendasi-buku">
        <button class="scroll-button left">&#8592;</button>
        <a href="url">
            <div class="book-item">
                <img src="img" alt="Buku 1">
                <p>Judul Buku 1</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img" alt="Buku 2">
                <p>Judul Buku 2</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img" alt="Buku 3">
                <p>Judul Buku 3</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img" alt="Buku 4">
                <p>Judul Buku 4</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img" alt="Buku 5">
                <p>Judul Buku 5</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img" alt="Buku 6">
                <p>Judul Buku 6</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img" alt="Buku 7">
                <p>Judul Buku 7</p>
            </div>
        </a>

        <button class="scroll-button right">&#8594;</button>
    </div>

    <div class="fitur">
        <a href="url">
            <div class="opsi">
                <img src="src" alt="Beli Buku"/>
                <p>Beli Buku</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src" alt="Buku Favorit"/>
                <p>Buku Favorit</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src" alt="Buku Saya"/>
                <p>Buku Saya</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src" alt="Review Buku"/>
                <p>Review Buku</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src" alt="Riwayat Pembelian"/>
                <p>Riwayat Pembelian</p>
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
