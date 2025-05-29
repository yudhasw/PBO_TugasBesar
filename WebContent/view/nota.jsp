<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.Pembelian" %>
<%
    Pembelian pembelian = (Pembelian) session.getAttribute("pembelian");
    if (pembelian == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Nota Pembelian</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="nota-box">
        <h2>✅ Pembayaran Berhasil!</h2>

        <div class="info">
            <p><strong>Nama Pembeli:</strong> <%= pembelian.getNamaPembeli() %></p>
            <p><strong>Email:</strong> <%= pembelian.getEmail() %></p>
            <p><strong>Judul Buku:</strong> <%= pembelian.getNamaBuku() %></p>
            <p><strong>Harga:</strong> Rp <%= pembelian.getHarga() %></p>
            <p><strong>Metode Pembayaran:</strong> <%= pembelian.getMetodePembayaran() %></p>
            <p><strong>Alamat Pengiriman:</strong> <%= pembelian.getAlamatPengiriman() %></p>
            <div class="id-box">
                <strong>ID Pembelian:</strong> <%= pembelian.getIdPembelian() %>
            </div>
        </div>

        <p class="thanks-text">
            Terima kasih telah berbelanja di toko kami!
        </p>
    </div>

    <div class="back-button">
        <a href="index.jsp">Kembali ke Beranda</a>
    </div>
</body>
</html>
