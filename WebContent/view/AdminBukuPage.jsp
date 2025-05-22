<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            display: flex;
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

        .main-content {
            flex: 1;
            background: rgba(255, 255, 255, 0.5);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            overflow-y: auto;
            transition: margin-left 0.3s ease; 
        }

        .search-bar {
            display: flex;
            margin-bottom: 20px;
        }

        .search-bar input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px 0 0 4px;
        }

        .search-bar button {
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            padding: 10px 15px;
            cursor: pointer;
        }

        .search-bar button i {
            margin-right: 5px;
        }

        .book-list {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .book-item {
            text-align: center;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }

        .book-item img {
            max-width: 100%;
            height: auto;
        }

        .icon-button {
            display: flex;
            align-items: center;
            margin: 10px 0;
            text-decoration: none;
            color: #333;
        }

        .icon-button i {
            margin-right: 10px;
        }
    </style>
    <title>Daftar Buku</title>
</head>
<body>

<!-- Toggle Button di luar sidebar -->
<span class="toggle-button" onclick="toggleSidebar()">&#9776;</span>

<div class="container">
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <header>
            <h2>Admin Menu</h2>
            <a href="#" class="icon-button" title="Daftar User">
                <i class="fa-solid fa-user"></i> Daftar User
            </a>
            <a href="#" class="icon-button" title="Edit Buku">
                <i class="fa-solid fa-book-open-reader"></i> Edit Buku
            </a>
            <a href="#" class="icon-button" title="Daftar Penjualan Buku">
                <i class="fa-solid fa-chart-line"></i> Daftar Penjualan
            </a>
        </header>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" id="search" placeholder="Cari buku...">
            <button id="addBookButton">
                <i class="fa-solid fa-plus"></i> Tambah Buku
            </button>
        </div>

        <!-- Daftar Buku -->
        <div class="book-list">
            <div class="book-item">
                <img src="path/to/book1.jpg" alt="Judul Buku 1">
                <h3>Judul Buku 1</h3>
            </div>
            <div class="book-item">
                <img src="path/to/book2.jpg" alt="Judul Buku 2">
                <h3>Judul Buku 2</h3>
            </div>
            <div class="book-item">
                <img src="path/to/book3.jpg" alt="Judul Buku 3">
                <h3>Judul Buku 3</h3>
            </div>
            <div class="book-item">
                <img src="path/to/book4.jpg" alt="Judul Buku 4">
                <h3>Judul Buku 4</h3>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('hidden');
        sidebar.style.transform = sidebar.classList.contains('hidden') ? 'translateX(-100%)' : 'translateX(0)';
    }
</script>

</body>
</html>
