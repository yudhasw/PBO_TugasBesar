<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Pembelian Buku</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px #ccc;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        .btn {
            margin-top: 20px;
            padding: 10px;
            background: #28a745;
            color: white;
            border: none;
            width: 100%;
            cursor: pointer;
        }
        .btn:hover {
            background: #218838;
        }
        .nota {
            margin-top: 30px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
            display: none;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Formulir Pembelian Buku</h2>

    <!-- Informasi Buku -->
    <div id="info-buku">
        <p><strong>Judul Buku:</strong> Belajar Pemrograman Go</p>
        <p><strong>Penulis:</strong> Jane Doe</p>
        <p><strong>Harga:</strong> Rp 85.000</p>
    </div>

    <!-- Form Pembelian -->
    <form id="formPembelian">
        <label for="id_pembelian">ID Pembelian:</label>
        <input type="text" id="id_pembelian" required>

        <label for="id_pengguna">ID Pengguna:</label>
        <input type="text" id="id_pengguna" required>

        <label for="metodePembayaran">Metode Pembayaran:</label>
        <select id="metodePembayaran" required>
            <option value="">-- Pilih --</option>
            <option value="Transfer Bank">Transfer Bank</option>
            <option value="COD">COD</option>
            <option value="E-Wallet">E-Wallet</option>
        </select>

        <button type="submit" class="btn">Konfirmasi Pembelian</button>
    </form>

    <!-- Nota Pembelian -->
    <div class="nota" id="notaPembelian">
        <h3>Nota Pembelian</h3>
        <p><strong>ID Pembelian:</strong> <span id="nota_id"></span></p>
        <p><strong>ID Pengguna:</strong> <span id="nota_pengguna"></span></p>
        <p><strong>Buku:</strong> Belajar Pemrograman Go</p>
        <p><strong>Penulis:</strong> Jane Doe</p>
        <p><strong>Harga:</strong> Rp 85.000</p>
        <p><strong>Metode Pembayaran:</strong> <span id="nota_metode"></span></p>
        <p style="color: green;"><strong>Pembelian Telah Dikonfirmasi.</strong></p>
    </div>
</div>

</body>
</html>
