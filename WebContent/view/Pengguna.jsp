<%-- 
    Document   : pengguna
    Created on : 22 May 2025, 19.04.55
    Author     : GAMING 3
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        }

        .nama-logo{
            margin-left: 20px;
            margin-right: 40px;
            display: flex;
            justify-content: space-around;
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

        .search-input{
            flex-grow: 1;
            display: flex;
            justify-content: center;
        }

        .search-input input{
            width: 500px;
            padding: 15px;
            border: none;
            border-radius: 35px;
        }

        .profil {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-right: 20px;
            margin-left: 40px;
        }

        .profil h3{
            text-align: center;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            margin: 20px;
        }

        .profil img {
            width: 50px;
            height: 50px;
        }

        h2 {
            margin-left: 40px;
            font-size: 30px;
        }

        .rekomendasi-buku {
            display: flex;
            justify-content: space-around;
            margin: 0px 40px 40px 40px;
            padding: 20px;
            background-color: #F2F2F2;
            border: none;
            border-radius: 32px;
        }

        .rekomendasi-buku a:hover{
            border: none;
            border-radius: 32px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05), 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .book-item {
            margin: 20px;
            align-items: center;
            justify-content: center;
        }

        .book-item img{
            width: 190px;
            height: 250px;
            background-color: lightgray;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .book-item p{
            text-align: center;
            font-weight: bold;
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

        .fitur a:hover{
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
    <title>E-TokoBuku</title>
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
        
        <div class="profil">
            <h3><%= username %></h3>
            <img src="imgBuku/user.png"/>
        </div>
        
    </div>
    <h2>Rekomendasi Buku</h2>
    <div class="rekomendasi-buku">
        <!-- BUAT PERULANGAN rs -->
        <a href="url">
            <div class="book-item">
                <img src="img">
                <p>Judul Buku</p>
<!--                <p> rs . getString("judul"); %></p> -->
            </div>
        </a>

        <a href="url">
            <div class="book-item">
                <img src="img">
                <p>Judul Buku</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img">
                <p>Judul Buku</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img">
                <p>Judul Buku</p>
            </div>
        </a>
        
        <a href="url">
            <div class="book-item">
                <img src="img">
                <p>Judul Buku</p>
            </div>
        </a>
    </div>
    
    <div class="fitur">
        <a href="url">
            <div class="opsi">
                <img src="src"/>
                <p>Beli Buku</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src"/>
                <p>Buku Favorit</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src"/>
                <p>Buku Saya</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src"/>
                <p>Review Buku</p>
            </div>
        </a>
        
        <a href="url">
            <div class="opsi">
                <img src="src"/>
                <p>Riwayat Pembelian</p>
            </div>
        </a>
        
    </div>
</body>
</html>
