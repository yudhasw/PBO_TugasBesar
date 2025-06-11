<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<%@ page import="classes.JDBC" %>
<%
    request.setCharacterEncoding("UTF-8");

    String judul = request.getParameter("judul");
    String hargaStr = request.getParameter("harga");
    double harga = 0;
    try {
        harga = Double.parseDouble(hargaStr);
    } catch (Exception e) {
        harga = 0;
    }

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String metode = request.getParameter("metode_pembayaran");
    String kodeVoucher = request.getParameter("kode_voucher");
    String namaPentransfer = request.getParameter("nama_pentransfer");

    JDBC db = new JDBC();
    boolean diskon = false;
    double hargaAkhir = harga;

    double diskonNominal = 0;
    try {
        diskonNominal = Double.parseDouble(db.getData("SELECT nilai_diskon FROM vouchers WHERE kode_voucher='" + kodeVoucher + "'", "nilai_diskon"));

        if (diskonNominal > 0) {
            hargaAkhir = harga * (1 - diskonNominal);
            diskon = true;
        } else {
            hargaAkhir = harga;
            diskon = false;
        }
    } catch (Exception e) {
        hargaAkhir = harga;
        diskon = false;
    }
    DecimalFormat df = new DecimalFormat("0");  // Format to remove decimals
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pembayaran Buku</title>
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
        </style>
    </head>
    <body>

        <div class="header">
            <a href="pengguna.jsp">
                <div class="nama-logo">
                    <img src="imgBuku/Logo.png">
                    <h1>E-TokoBuku</h1>
                </div>
            </a>
            <div class="profil">
                <h3><%= username%></h3>
            </div>
        </div>

        <div class="payment-box">
            <h2 style="text-align: center" >Pembayaran</h2>

            <div class="info">
                <h3><strong>Data Buku</strong></h3>
                <p><strong>Judul Buku:</strong> <%= judul%></p>
                <p><strong>Harga Buku:</strong> <%= formatter.format(harga)%></p>
                <h3><strong>Data Pembelian</strong></h3>
                <p><strong>Nama:</strong> <%= username%></p>
                <p><strong>Email:</strong> <%= email%></p>
                <p><strong>Metode Pembayaran:</strong> <%= metode%></p>
                <p><strong>Nama Pentransfer:</strong> <%= namaPentransfer%></p>
                <h3><strong>Diskon</strong></h3>
                <%
                    if (!diskon){
                %>
                <p>Tidak ada diskon yang digunakan</p>
                <%
                    } else { 
                %>
                <p><strong>Kode Voucher:</strong> <%= kodeVoucher != null && !kodeVoucher.isEmpty() ? kodeVoucher : "Tidak ada"%></p>
                <p><strong>Diskon:</strong> <%= df.format(diskonNominal * 100) %>%</p>
                <p><strong>Harga Akhir:</strong> <%= formatter.format(hargaAkhir)%></p>
                <%
                    } 
                %>
            </div>

            <hr>

            <h3>Silakan lakukan pembayaran melalui:</h3>
            <div class="payment-method">
                <%                    switch (metode) {
                        case "Transfer Bank":
                %>
                <p>Bank BNI - 123456789 a.n. Toko Buku Kita</p>
                <%
                        break;
                    case "OVO":
                %>
                <p>OVO - 0812-3456-7890</p>
                <%
                        break;
                    case "DANA":
                %>
                <p>DANA - 0812-9876-5432</p>
                <%
                        break;
                    case "ShopeePay":
                %>
                <p>ShopeePay - 0813-1111-2222</p>
                <%
                        break;
                    case "COD":
                %>
                <p>Silakan siapkan uang tunai saat kurir mengantar buku.</p>
                <%
                        break;
                    default:
                %>
                <p>Metode tidak diketahui.</p>
                <%
                    }
                %>
            </div>

            <form action="prosesPembayaran" method="post">
                <input type="hidden" name="judul" value="<%= judul%>">
                <input type="hidden" name="harga" value="<%= harga%>">
                <input type="hidden" name="username" value="<%= username%>">
                <input type="hidden" name="email" value="<%= email%>">
                <input type="hidden" name="nama_pentransfer" value="<%= namaPentransfer%>">
                <input type="hidden" name="kode_voucher" value="<%= kodeVoucher%>">
                <input type="hidden" name="metode_pembayaran" value="<%= metode%>">

                <input type="submit" value="Selesaikan Pembayaran">
            </form>
        </div>

    </body>
</html>
