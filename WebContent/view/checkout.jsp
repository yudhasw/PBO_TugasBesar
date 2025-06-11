<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<%
    String judul = request.getParameter("judul");
    String hargaStr = request.getParameter("harga");
    String username = request.getParameter("username");
    double harga = 0;
    try {
        harga = Double.parseDouble(hargaStr);
    } catch (Exception e) {
        harga = 0;
    }
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));

    String nama = (String) session.getAttribute("nama");
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!--        <link rel="stylesheet" type="text/css" href="css/style.css">-->
        <title>Checkout Buku</title>
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

            .payment-box {
                max-width: 600px;
                margin: 40px auto;
                background-color: white;
                padding: 30px;
                border-radius: 16px;
                box-shadow: 0 0 12px rgba(0, 0, 0, 0.05);
            }

            .payment-box h2 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .payment-box p {
                font-size: 16px;
                margin: 8px 0;
            }

            .payment-box hr {
                margin: 20px 0;
                border: none;
                border-top: 1px solid #ddd;
            }

            .payment-method {
                margin-top: 10px;
                background-color: #f9fafc;
                padding: 16px;
                border-radius: 10px;
                border: 1px solid #d9e2ec;
            }

            form input[type="submit"] {
                margin-top: 25px;
                width: 100%;
                padding: 14px;
                background-color: #4A90E2;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            form input[type="submit"]:hover {
                background-color: #357ABD;
            }
            .checkout-box {
                max-width: 600px;
                background-color: #ffffff;
                margin: 40px auto;
                padding: 30px;
                border-radius: 24px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            /* Judul */
            h2 {
                font-size: 28px;
                margin-bottom: 20px;
                color: #333;
                text-align: center;
            }

            /* Paragraf */
            p {
                font-size: 18px;
                margin: 10px 0;
                color: #333;
            }

            /* Label */
            label {
                display: block;
                margin-top: 15px;
                font-weight: bold;
                color: #333;
            }

            /* Input, textarea, select */
            input[type="text"],
            input[type="email"],
            textarea,
            select {
                width: 100%;
                padding: 12px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-sizing: border-box;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

            input[type="text"]:focus,
            input[type="email"]:focus,
            textarea:focus,
            select:focus {
                border-color: #4A90E2;
                outline: none;
            }

            /* Tombol Submit */
            input[type="submit"] {
                margin-top: 25px;
                width: 100%;
                padding: 15px;
                background-color: #4A90E2;
                color: white;
                border: none;
                border-radius: 12px;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #3a78c2;
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
                <h3><%= username%></h3>
            </div>
        </div>

        <div class="checkout-box">
            <h2>Checkout Buku</h2>
            <p><strong>Judul Buku:</strong> <%= judul != null ? judul : "Tidak diketahui"%></p>
            <p><strong>Harga:</strong> <%= formatter.format(harga)%></p>

            <form action="bayar.jsp" method="post">
                <input type="hidden" name="judul" value="<%= judul%>">
                <input type="hidden" name="harga" value="<%= harga%>">

                <p><strong>Nama Pembeli:</strong> <%= nama != null ? nama : username%></p>
                <input type="hidden" name="nama" value="<%= nama%>">

                <label>Kode Voucher (Opsional):</label>
                <input type="text" name="kode_voucher" placeholder="Masukkan kode voucher jika ada">
                <%
                    String pesanError = (String) request.getAttribute("voucherMessage");
                    if (pesanError != null) {
                %>
                <p style="color:red;"><%= pesanError%></p>
                <%
                    }
                %>

                <label>Email:</label>
                <input type="email" name="email" required>

                <label>Metode Pembayaran:</label>
                <select name="metode_pembayaran" required>
                    <option value="">-- Pilih Metode --</option>
                    <option value="Transfer Bank">Transfer Bank</option>
                    <option value="OVO">OVO</option>
                    <option value="DANA">DANA</option>
                    <option value="ShopeePay">ShopeePay</option>
                    <option value="COD">Bayar di Tempat (COD)</option>
                </select>

                <label>
                    Nama Pentransfer:
                    <span class="tooltip-container" tabindex="0">
                        <span class="tooltip-circle">!</span>
                        <span class="tooltip-text">masukkan nama pengguna E-wallet atau Bank anda</span>
                    </span>
                </label>
                <input type="text" name="nama_pentransfer" required>
                <input type="hidden" name="username" value="<%= username%>">
                <input type="submit" value="Konfirmasi Pembelian">
            </form>
        </div>
    </body>
</html>
