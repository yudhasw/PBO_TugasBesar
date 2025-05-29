<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
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

    String nama = request.getParameter("nama");
    String email = request.getParameter("email");
    String alamat = request.getParameter("alamat");
    String metode = request.getParameter("metode_pembayaran");

    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Pembayaran Buku</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <div class="payment-box">
        <h2>Pembayaran</h2>

        <div class="info">
            <p><strong>Judul Buku:</strong> <%= judul %></p>
            <p><strong>Harga:</strong> <%= formatter.format(harga) %></p>
            <p><strong>Nama:</strong> <%= nama %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Alamat:</strong> <%= alamat %></p>
            <p><strong>Metode Pembayaran:</strong> <%= metode %></p>
        </div>

        <hr>

        <h3>Silakan lakukan pembayaran melalui:</h3>
        <div class="payment-method">
        <%
            switch (metode) {
                case "Transfer Bank":
        %>
            <p>Bank BNI - 123456789 a.n. Toko Buku Kita</p>
        <% break;
            case "OVO":
        %>
            <p>OVO - 0812-3456-7890</p>
        <% break;
            case "DANA":
        %>
            <p>DANA - 0812-9876-5432</p>
        <% break;
            case "ShopeePay":
        %>
            <p>ShopeePay - 0813-1111-2222</p>
        <% break;
            case "COD":
        %>
            <p>Silakan siapkan uang tunai saat kurir mengantar buku.</p>
        <% break;
            default:
        %>
            <p>Metode tidak diketahui.</p>
        <% } %>
        </div>

        <form action="prosesPembayaran" method="post">
            <input type="hidden" name="judul" value="<%= judul %>">
            <input type="hidden" name="harga" value="<%= harga %>">
            <input type="hidden" name="nama" value="<%= nama %>">
            <input type="hidden" name="email" value="<%= email %>">
            <input type="hidden" name="alamat" value="<%= alamat %>">
            <input type="hidden" name="metode_pembayaran" value="<%= metode %>">

            <input type="submit" value="Selesaikan Pembayaran">
        </form>
    </div>

</body>
</html>
