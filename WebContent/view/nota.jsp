<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.Pembelian" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    Pembelian pembelian = (Pembelian) session.getAttribute("pembelian");
    if (pembelian == null) {
        response.sendRedirect("pengguna.jsp");
        return;
    }
    String username = pembelian.getNamaPembeli();
%>
<%
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nota Pembelian</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f4f7fa;
                margin: 0;
                padding: 0;
            }

            .header {
                background-color: #4A90E2;
                color: white;
                padding: 16px 32px;
                font-size: 20px;
                font-weight: 600;
                display: flex;
                align-items: center;
            }
            
            .nama-logo{
                margin-left: 20px;
                display: flex;
                justify-content: space-around;
                text-decoration: none;
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
            
            .profil {
                display: flex;
                position: relative;
                justify-content: space-between;
                align-items: center;
                margin-right: 20px;
                margin-left: auto;
            }

            .profil h3{
                text-align: center;
                color: white;
                margin-right: 10px;
            }

            .nota-box {
                max-width: 600px;
                margin: 50px auto;
                background-color: white;
                padding: 30px;
                border-radius: 16px;
                box-shadow: 0 0 12px rgba(0, 0, 0, 0.05);
                text-align: left;
            }

            .nota-box h2 {
                font-size: 22px;
                color: green;
                margin-bottom: 20px;
            }

            .info p {
                font-size: 16px;
                margin: 10px 0;
            }

            .id-box {
                background-color: #e9f0fb;
                padding: 12px;
                margin-top: 15px;
                border-left: 4px solid #4A90E2;
                font-weight: 600;
            }

            .thanks-text {
                margin-top: 30px;
                font-size: 16px;
                color: #444;
            }

            .back-button {
                text-align: center;
                margin-top: 20px;
            }

            .back-button a {
                background-color: #4A90E2;
                color: white;
                padding: 12px 24px;
                text-decoration: none;
                border-radius: 8px;
                font-weight: 600;
                transition: background-color 0.3s ease;
            }

            .back-button a:hover {
                background-color: #357ABD;
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

            <div class="profil">
                <h3> <%= username%></h3>
            </div>
        </div>

        <div class="nota-box">
            <h2>✅ Pesanan Diterima!</h2>
            <!-- ✅ Status konfirmasi -->
            <p style="margin-top: 20px; font-weight: bold; color: orange;">
                Pembayaran Anda sedang dikonfirmasi oleh admin. Mohon tunggu.
            </p>
            <div class="info">
                <p><strong>Nama Pembeli:</strong> <%= username%> </p>
                <p><strong>Email:</strong> <%= pembelian.getEmail()%></p>
                <p><strong>Judul Buku:</strong> <%= pembelian.getNamaBuku()%></p>
                <p><strong>Harga:</strong> <%= formatter.format(pembelian.getHarga())%></p>
                <%
                    if (pembelian.getDiskon() != 0) {
                %>
                <p><strong>Diskon:</strong> <%= formatter.format(pembelian.getDiskon())%></p>
                <p><strong>Harga Diskon:</strong> <%= formatter.format(pembelian.getHargaAkhir())%></p>
                <% }%>
                <p><strong>Metode Pembayaran:</strong> <%= pembelian.getMetodePembayaran()%></p>
                <div class="id-box">
                    <strong>Nomor Pesanan:</strong> <%= pembelian.getIdPembelian()%>
                </div>
            </div>
            <p class="thanks-text">
                Terima kasih telah berbelanja di toko kami!
            </p>
        </div>

        <div class="back-button">
            <a href="pengguna.jsp">Kembali ke Beranda</a>
        </div>
    </body>
</html>
