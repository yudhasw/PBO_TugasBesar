<%-- 
    Document   : register-success
    Created on : May 24, 2025, 2:41:19 PM
    Author     : yudha
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--    <meta http-equiv="refresh" content="5;URL=login.jsp">-->
    <title>Registrasi Berhasil</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap');
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .success-icon {
            font-size: 50px;
            color: #4caf50;
        }
        .success-message {
            font-size: 20px;
            color: #333;
        }
        .continue-button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #4caf50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
        }
        .continue-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon">✔️</div>
        <h1 class="success-message">Berhasil</h1>
        <p>Selamat, akun anda berhasil didaftarkan!</p>
        <button class="continue-button" onclick="window.location.href='login.jsp'">Continue</button>
    </div>
</body>
</html>
