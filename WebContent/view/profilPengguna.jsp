<%-- 
    Document   : pengguna
    Created on : 28 May 2025, 20.03.06
    Author     : GAMING 3
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (username == null) {
        response.sendRedirect("penggunaGuest.jsp");
        return;
    }
    String status = request.getParameter("status");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

            .nama-logo {
                margin-left: 20px;
                margin-right: 40px;
                display: flex;
                justify-content: space-around;
            }

            .nama-logo h1 {
                font-size: 20px;
                margin: 20px;
                text-decoration: none;
                color: white;
            }

            .nama-logo img {
                width: 60px;
                height: 60px;
            }

            .search-input {
                flex-grow: 1;
                display: flex;
                justify-content: center;
            }

            .search-input input {
                width: 500px;
                padding: 15px;
                border: none;
                border-radius: 35px;
            }

            .profil {
                display: flex;
                position: relative;
                justify-content: space-between;
                align-items: center;
                margin-right: 20px;
                margin-left: 40px;
            }

            .profil h3 {
                text-align: center;
                color: white;
                margin-right: 10px;
            }

            .profil-menu {
                display: flex;
                position: relative;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
            }

            .profil-menu img {
                width: 50px;
                height: 50px;
                cursor: pointer;
                margin-left: 10px;
            }

            .profil-menu:hover {
                background-color: grey;
                border-radius: 32px;
            }

            #dropdown-icon {
                text-align: center;
                color: white;
                padding: 10px 15px;
                border-radius: 5px;
                cursor: pointer;
                transition: transform 0.3s ease;
            }

            #dropdown-menu {
                display: none;
                position: absolute;
                right: 0;
                top: 60px;
                background-color: white;
                min-width: 220px;
                box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
                border-radius: 8px;
                z-index: 1;
                padding: 10px 0;
            }

            #dropdown-menu a {
                color: black;
                padding: 16px 24px;
                font-size: 16px;
                text-decoration: none;
                display: block;
                transition: background-color 0.2s ease;
            }

            #dropdown-menu a:hover {
                background-color: #e6e6e6;
            }

            h2 {
                margin-left: 40px;
                font-size: 30px;
                margin-top: 30px;
            }

            .profil-container {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin: 40px;
                background-color: #F2F2F2;
                padding: 20px;
                border-radius: 16px;
            }

            .profil-container img {
                border-radius: 50%;
                width: 150px;
                height: 150px;
                margin-bottom: 20px;
                border: 3px solid #4A90E2;
            }

            .profil-info {
                font-size: 16px;
                color: #333;
                margin-bottom: 10px;
            }

            .profil-info span {
                font-weight: bold;
                color: #4A90E2;
            }

            .edit-icon {
                color: #4A90E2;
                cursor: pointer;
            }

            .edit-icon:hover {
                color: #4A90E2;
            }

            .edit-btn {
                background-color: #4A90E2;
                color: white;
                padding: 10px 20px;
                border-radius: 32px;
                cursor: pointer;
                border: none;
                font-size: 16px;
                margin-top: 20px;
                transition: background-color 0.3s ease;
            }

            .edit-btn:hover {
                background-color: #007BFF;
            }

            /* Popup Form Styling */
            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 2;
            }

            .popup-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                width: 300px;
                text-align: center;
            }

            .popup-content h2{
                margin: 20px;
            }

            .success-popup-content h2{
                margin: 20px;
            }

            .input-field {
                width: 100%;
                padding: 10px;
                border-radius: 8px;
                border: 1px solid #ddd;
                font-size: 16px;
                margin: 10px 0px;
            }

            .cancel-btn {
                background-color: #ccc;
                color: white;
                padding: 10px 20px;
                border-radius: 32px;
                cursor: pointer;
                border: none;
                font-size: 16px;
            }

            .success-popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 3;
            }

            .success-popup-content {
                background-color: #4CAF50;
                padding: 20px;
                border-radius: 8px;
                color: white;
                text-align: center;
                font-size: 18px;
                width: 300px;
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

            .fitur a:hover {
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
        <title>Profil Pengguna</title>
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
                <h3><%= username%></h3>
                <div class="profil-menu">
                    <i class="fas fa-chevron-down" id="dropdown-icon" onclick="toggleDropdown()"></i>
                    <img src="imgBuku/user.png" id="profile-img" onclick="toggleDropdown()"/>
                </div>
                <div id="dropdown-menu" class="dropdown-content">
                    <a href="profilPengguna.jsp">Profil Pengguna</a>
                    <a href="riwayat_transaksi.jsp">Riwayat Transaksi</a>
                    <a href="wishlist.jsp">Wishlist</a>
                    <a href="logout.jsp">Keluar Akun</a>
                </div>
            </div>
        </div>

        <h2>Profil Pengguna</h2>

        <div class="profil-container">
            <img src="imgBuku/user.png" alt="Profile Picture">
            <div class="profil-info">
                <p><span>Username:</span> <%= username %> 
                    <i class="fas fa-edit edit-icon" onclick="openPopup('editUsername')"></i></p>
                <p><span>Password:</span> ******** 
                    <i class="fas fa-edit edit-icon" onclick="openPopup('editPassword')"></i></p>
            </div>
        </div>

        <%
            if (status != null) {
                out.println("<div style='color: green;'>" + status + "</div>");
            }
        %>

        <div id="editUsername" class="popup">
            <div class="popup-content">
                <h2>Edit Username</h2>
                <form action="PenggunaController" method="POST">
                    <input type="text" name="newUsername" value="<%= username%>" class="input-field" placeholder="Username Baru" required>
                    <button type="submit" class="edit-btn">Simpan Perubahan</button>
                    <button type="button" class="cancel-btn" onclick="closePopup('editUsername')">Batal</button>
                </form>
            </div>
        </div>

        <div id="editPassword" class="popup">
            <div class="popup-content">
                <h2>Edit Password</h2>
                <form action="PenggunaController" method="POST">
                    <input type="password" name="oldPassword" class="input-field" placeholder="Password Lama" required>
                    <input type="password" name="newPassword" class="input-field" placeholder="Password Baru" required>
                    <input type="password" name="newPasswordConfirm" class="input-field" placeholder="Konfirmasi Password Baru" required>
                    <button type="submit" class="edit-btn">Simpan Perubahan</button>
                    <button type="button" class="cancel-btn" onclick="closePopup('editPassword')">Batal</button>
                </form>
            </div>
        </div>

        <script>
            function toggleDropdown() {
                var dropdown = document.getElementById("dropdown-menu");
                var icon = document.getElementById("dropdown-icon");

                if (dropdown.style.display === "block") {
                    dropdown.style.display = "none";
                    icon.classList.remove("flip");
                } else {
                    dropdown.style.display = "block";
                    icon.classList.add("flip");
                }
            }

            window.onclick = function (event) {
                var dropdown = document.getElementById("dropdown-menu");
                var icon = document.getElementById("dropdown-icon");

                if (!event.target.matches('#profile-img') && !event.target.matches('#dropdown-icon')) {
                    if (dropdown.style.display === "block") {
                        dropdown.style.display = "none";
                        icon.classList.remove("flip");
                    }
                }
            };

            function openPopup(popupId) {
                var popup = document.getElementById(popupId);
                popup.style.display = "flex";
            }

            function closePopup(popupId) {
                var popup = document.getElementById(popupId);
                popup.style.display = "none";
            }
        </script>
    </body>
</html>
