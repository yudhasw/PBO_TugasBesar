<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Pembelian Buku | Toko Buku Online</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f5f5f5;
        }
        header {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .book-info, .form-section {
            margin-bottom: 30px;
        }
        .book-info img {
            float: left;
            margin-right: 20px;
        }
        .book-info h2 {
            margin-top: 0;
        }
        form label {
            display: block;
            margin-top: 10px;
        }
        form input, form select, form textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        .summary {
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }
        .btn {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<header>
    <h1>Toko Buku Online</h1>
</header>

<div class="container">
    <div class="book-info">
        <img src="cover-buku.jpg" alt="Sampul Buku" width="120">
        <h2>Judul Buku: Belajar Pemrograman Go</h2>
        <p>Penulis: Jane Doe</p>
        <p>Harga: Rp 85.000</p>
    </div>

    <div class="form-section">
        <h3>Informasi Pembeli</h3>
        <form>
            <label for="nama">Nama Lengkap:</label>
            <input type="text" id="nama" name="nama">

            <label for="alamat">Alamat Pengiriman:</label>
            <textarea id="alamat" name="alamat"></textarea>

            <label for="metode">Metode Pembayaran:</label>
            <select id="metode" name="metode">
                <option value="transfer">Transfer Bank</option>
                <option value="cod">Bayar di Tempat (COD)</option>
                <option value="ewallet">E-Wallet</option>
            </select>

            <div class="summary">
                <p><strong>Total: Rp 85.000</strong></p>
                <button type="submit" class="btn">Konfirmasi Pembelian</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
