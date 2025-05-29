<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<%
    String judul = request.getParameter("judul");
    String hargaStr = request.getParameter("harga");
    double harga = 0;
    try {
        harga = Double.parseDouble(hargaStr);
    } catch (Exception e) {
        harga = 0;
    }
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout Buku</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <div class="header">
        <div class="nama-logo">
            <img src="imgBuku/Logo.png" alt="Logo">
            <h1>E-TokoBuku</h1>
        </div>
    </div>

    <div class="checkout-box">
        <h2>Checkout Buku</h2>
        <p><strong>Judul Buku:</strong> <%= judul != null ? judul : "Tidak diketahui"%></p>
        <p><strong>Harga:</strong> <%= formatter.format(harga)%></p>

        <form action="bayar.jsp" method="post">
            <input type="hidden" name="judul" value="<%= judul%>">
            <input type="hidden" name="harga" value="<%= harga%>">

            <label>Nama Pembeli:</label>
            <input type="text" name="nama" required>

            <label>Email:</label>
            <input type="text" name="email" required>

            <label>Alamat Pengiriman:</label>
            <textarea name="alamat" rows="3" required></textarea>

            <label>Metode Pembayaran:</label>
            <select name="metode_pembayaran" required>
                <option value="">-- Pilih Metode --</option>
                <option value="Transfer Bank">Transfer Bank</option>
                <option value="OVO">OVO</option>
                <option value="DANA">DANA</option>
                <option value="ShopeePay">ShopeePay</option>
                <option value="COD">Bayar di Tempat (COD)</option>
            </select>

            <input type="submit" value="Konfirmasi Pembelian">
        </form>
    </div>

</body>
</html>
