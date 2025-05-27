<%-- 
    Document   : Books
    Created on : May 27, 2025, 9:31:25 PM
    Author     : OMEN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nama Buku - Detail Buku</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .container {
            display: flex;
            max-width: 1000px;
        }
        .cover {
            width: 300px;
            margin-right: 40px;
        }
        .info {
            flex: 1;
        }
        .price {
            font-size: 24px;
            color: #d32f2f;
        }
        .original-price {
            text-decoration: line-through;
            color: gray;
            margin-left: 10px;
        }
        .discount {
            background-color: #f44336;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
            margin-left: 10px;
        }
        .section {
            margin-top: 40px;
        }
        .description, .book-details {
            margin-top: 20px;
        }
        .book-details table {
            width: 100%;
        }
        .book-details td {
            padding: 4px 10px;
            vertical-align: top;
        }
        .book-details td:first-child {
            font-weight: bold;
            width: 180px;
        }
        .buy {
            font-size: 22px;
            padding: 16px 30px;
        }
        
    </style>
</head>
<body>

<div class="container">
    <div class="cover">
        <img src="046aff5d7e1007cbf55f0b49cadb9186_7908340387957284664.jpg" alt="Judul Buku" style="width: 100%;">
    </div>
    <div class="info">
        <h2>Test</h2>
        <p><strong>Penulis:</strong> Brian Khrisna</p>
        <div class="price">
            Rp79.050
            <span class="original-price">Rp93.000</span>
            <span class="discount">15%</span>
        </div>
        <div class="buttons">
            <button>❤️ Favorit</button>
            <button>🔗 Bagikan</button>
        </div>
        <div class="format">
            <strong>Format Buku:</strong> Soft Cover
        </div>
        <div class="shipping">
            <strong>Info:</strong> Bebas biaya pengiriman (Rp0) dengan opsi "Ambil di Toko"
        </div>
    </div>
</div>


<!-- Bagian Deskripsi -->
<div class="section description">
    <h3>Deskripsi</h3>
    <p>
        Ale, seorang pria berusia 37 tahun memiliki tinggi badan 189 cm dan berat 138 kg. Badannya bongsor, berkulit hitam, dan memiliki masalah dengan bau badan. Sejak kecil, Ale hidup di lingkungan keluarga yang tidak mendukungnya. Ia tak memiliki teman dekat dan menjadi korban perundungan di sekolahnya....
    </p>
</div>

<!-- Bagian Detail Buku -->
<div class="section book-details">
    <h3>Detail Buku</h3>
    <table>
        <tr><td>Penerbit</td><td>Gramedia Widiasarana Indonesia</td></tr>
        <tr><td>Tanggal Terbit</td><td>20 Jan 2025</td></tr>
        <tr><td>ISBN</td><td>9786020531328</td></tr>
        <tr><td>Halaman</td><td>216</td></tr>
        <tr><td>Bahasa</td><td>Indonesia</td></tr>
        <tr><td>Panjang</td><td>20.0 cm</td></tr>
        <tr><td>Lebar</td><td>13.5 cm</td></tr>
        <tr><td>Berat</td><td>0.16 kg</td></tr>
    </table>
</div>

<div class="buy">
    <input type="button" onclick="alert('Hello World!')" value="Beli">
</div>

</body>
</html>

    


