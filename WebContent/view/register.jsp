<%-- 
    Document   : register
    Created on : May 22, 2025, 5:07:51 PM
    Author     : yudha
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String status = (String) request.getAttribute("status");
    if (status == null) {
        status = "Register berhasil";
    }
    boolean isRegisterFailed = !"Register berhasil".equals(status);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap');

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Montserrat', sans-serif;
            background: #f0f2f5;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            display: flex;
            height: 80vh;
            width: 100vw;
            max-width: 900px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
            background: white;

            <% if (isRegisterFailed) { %> animation: shake 0.3s; <% } %>
        }

        .image-section {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80') no-repeat center center;
            background-size: cover;
        }

        .form-section {
            flex: 1;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-section h2 {
            margin-bottom: 30px;
            font-weight: 600;
            color: #333;
            font-size: 28px;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
            font-size: 14px;
        }

        input[type="text"], input[type="password"], input[type="confirm-password"] {
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1.5px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .input-error {
            border-color: #d9281e !important;
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="confirm-password"]:focus {
            border-color: #4a90e2;
            outline: none;
        }

        button {
            padding: 14px;
            background: #4a90e2;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: 700;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background: #357ABD;
        }

        .footer-note {
            margin-top: 15px;
            text-align: center;
            font-size: 13px;
            color: #999;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }
        
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                height: auto;
                max-width: 100vw;
            }

            .image-section {
                height: 200px;
                flex: none;
            }

            .form-section {
                padding: 30px 20px;
                flex: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-section"></div>
        <div class="form-section">
            <h2>Register</h2>

            <% if (isRegisterFailed) { %>
                <div class="error-message"><%= status %></div>
            <% } %>
            
            <form action="AksesWebController" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Masukkan username" required class="<%= isRegisterFailed ? "input-error" : "" %>" >
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Masukkan password" required class="<%= isRegisterFailed ? "input-error" : "" %>">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Masukan ulang password" required class="<%= isRegisterFailed ? "input-error" : "" %>">
                <button type="submit">Register</button><input type="hidden" name="page" value="register">
                <input type="hidden" name="page" value="register">
            </form>

            <div class="footer-note">
                Sudah punya akun? <a href="login.jsp" style="color:#4a90e2; text-decoration:none;">Login di sini</a>
            </div>
        </div>
    </div>
</body>
</html>

