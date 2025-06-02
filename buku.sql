-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jun 2025 pada 00.37
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_buku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(4) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `tahun` date NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `rating` float NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` float NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `tahun`, `jenis`, `isbn`, `rating`, `deskripsi`, `harga`, `gambar`) VALUES
('1', 'The Three Kingdoms', 'Luo Guanzhong', '0000-00-00', 'Novel Sejarah', '978-3-16-148410-0', 4.5, 'A historical novel about the turbulent period in ancient China.', 100000, 'three_kingdoms.jpg'),
('10', 'Wild Swans', 'Jung Chang', '0000-00-00', 'Memoir', '978-0-00-654014-6', 4.8, 'A memoir about three generations of women in 20th-century China.', 220000, 'wild_swans.jpg'),
('2', 'The Art of War', 'Sun Tzu', '0000-00-00', 'Filsafat', '978-1-23-456789-7', 4.8, 'An ancient Chinese military treatise on strategy and warfare.', 120000, 'art_of_war.jpg'),
('3', 'Journey to the West', 'Wu Cheng’en', '0000-00-00', 'Novel Fantasi', '978-0-19-848724-0', 4.7, 'A Chinese classical novel about the journey of a monk and his companions.', 150000, 'journey_to_the_west.jpg'),
('4', 'The Water Margin', 'Shi Nai’an', '0000-00-00', 'Novel Sejarah', '978-0-14-044719-4', 4.6, 'A novel based on the outlaw heroes of the Song Dynasty.', 130000, 'water_margin.jpg'),
('5', 'Red Cliff', 'John Woo', '0000-00-00', 'Film Sejarah', '978-3-16-148410-1', 4.4, 'A movie adaptation of the historical battle of Red Cliffs in ancient China.', 200000, 'red_cliff.jpg'),
('6', 'The Dream of the Red Chamber', 'Cao Xueqin', '0000-00-00', 'Novel Klasik', '978-0-14-044213-7', 5, 'One of China\'s four great classical novels, depicting the rise and fall of a wealthy family.', 180000, 'dream_of_red_chamber.jpg'),
('7', 'The Legend of the Condor Heroes', 'Jin Yong', '0000-00-00', 'Novel Kungfu', '978-1-4028-9404-7', 4.9, 'A martial arts novel set in the Song Dynasty of China.', 160000, 'legend_of_condor_heroes.jpg'),
('8', 'Mulan', 'Anonymous', '0000-00-00', 'Novel Fantasi', '978-0-7432-7367-3', 4.3, 'A legendary tale of a young woman who disguises herself as a man to fight in the army.', 140000, 'mulan.jpg'),
('9', 'The Book of Changes (I Ching)', 'Confucius', '0000-00-00', 'Filsafat', '978-1-85326-133-4', 4.2, 'An ancient Chinese divination text and one of the Five Classics of Confucianism.', 110000, 'i_ching.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
