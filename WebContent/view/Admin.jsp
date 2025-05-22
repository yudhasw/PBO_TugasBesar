<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #add8e6;
            color: #333;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        .container {
            position: relative;
            height: 100%; 
        }

        .sidebar {
            position: absolute; 
            top: 0;
            left: 0;
            width: 250px;
            height: 100%; 
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            transform: translateX(0);
            opacity: 1;
            transition: transform 0.3s ease, opacity 0.3s ease;
            z-index: 10; 
        }

        .sidebar.hidden {
            transform: translateX(-100%);
            opacity: 0;
        }

        .toggle-button {
            position: absolute;
            top: 15px;
            left: 15px;
            background: #fff;
            border-radius: 4px;
            padding: 5px 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            cursor: pointer;
            font-size: 20px;
            z-index: 20; 
        }

        .content {
            flex: 1;
            background: rgba(255, 255, 255, 0.5);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            transition: margin-left 0.3s ease; 
            overflow-y: auto;
        }

        header {
            margin-bottom: 20px;
        }

        .icon-button {
            text-decoration: none;
            display: block;
            margin: 10px 0;
            color: #2c3e50;
            transition: color 0.3s, transform 0.3s;
        }

        .icon-button i {
            font-size: 24px;
            margin-right: 8px;
        }

        .icon-button:hover {
            color: #3498db;
            transform: translateY(-5px);
        }

        h1 {
            margin-bottom: 20px;
        }

        .user-list {
            margin-top: 20px;
            background: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .user-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .user-list th, .user-list td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        .delete-icon {
            cursor: pointer;
            color: #e74c3c;
        }
    </style>
</head>
<body>

<!-- Toggle Button di luar sidebar -->
<span class="toggle-button" onclick="toggleSidebar()">&#9776;</span>

<div class="container">
    <div class="sidebar" id="sidebar">
        <header>
            <h2>Admin Menu</h2>
            <a href="#" class="icon-button" title="Edit Buku">
                <i class="fa-solid fa-book-open-reader"></i> Edit Buku
            </a>
            <a href="#" class="icon-button" title="Daftar Penjualan Buku">
                <i class="fa-solid fa-chart-line"></i> Daftar Penjualan
            </a>
        </header>
    </div>
    <div class="content" id="content">
        <h1>Selamat datang di Halaman Admin</h1>
        <p>Pilih fitur di sebelah kiri untuk mulai mengelola data.</p>

        <div class="user-list">
            <h3>Daftar User</h3>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Alamat</th>
                    <th>No Telpon</th>
                    <th>Password</th>
                    <th>Aksi</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>A1234</td>
                    <td>hakko</td>
                    <td>Alamat Hakko</td>
                    <td>1234567890</td>
                    <td>password1</td>
                    <td><i class="fa-solid fa-trash delete-icon" title="Hapus User"></i></td>
                </tr>
                <tr>
                    <td>P5678</td>
                    <td>user1</td>
                    <td>Alamat User 1</td>
                    <td>0987654321</td>
                    <td>password2</td>
                    <td><i class="fa-solid fa-trash delete-icon" title="Hapus User"></i></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const content = document.getElementById('content');
        sidebar.classList.toggle('hidden');

        // Ubah margin konten berdasarkan status sidebar
        if (sidebar.classList.contains('hidden')) {
            content.style.marginLeft = '0'; // Kembali ke posisi semula
        } else {
            content.style.marginLeft = '250px'; // Geser konten ke kanan
        }
    }
</script>
</body>
</html>
