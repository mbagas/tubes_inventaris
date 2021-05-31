-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 07:29 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes_pbo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_akun`
--

DROP TABLE IF EXISTS `tb_akun`;
CREATE TABLE `tb_akun` (
  `id_akun` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` enum('admin','pegawai') DEFAULT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `NIP_NRK` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telp` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

DROP TABLE IF EXISTS `tb_barang`;
CREATE TABLE `tb_barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `merek` varchar(100) DEFAULT NULL,
  `satuan` enum('buah','kotak') DEFAULT NULL,
  `pinjam_in` int(5) DEFAULT NULL,
  `kembali_out` int(5) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `price_total` int(20) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `gedung` varchar(10) DEFAULT NULL,
  `bast_perolehan` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gedung`
--

DROP TABLE IF EXISTS `tb_gedung`;
CREATE TABLE `tb_gedung` (
  `id_gedung` varchar(10) DEFAULT NULL,
  `gedung` varchar(10) NOT NULL,
  `mg_gedung` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

DROP TABLE IF EXISTS `tb_peminjaman`;
CREATE TABLE `tb_peminjaman` (
  `id_peminjaman` varchar(10) NOT NULL,
  `id_barang` varchar(10) NOT NULL,
  `no_peminjaman` varchar(10) DEFAULT NULL,
  `NIP_NRK` varchar(100) DEFAULT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `bast_disposisi` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ruang`
--

DROP TABLE IF EXISTS `tb_ruang`;
CREATE TABLE `tb_ruang` (
  `id_ruang` varchar(10) DEFAULT NULL,
  `ruang` varchar(10) NOT NULL,
  `pj_ruang` varchar(100) DEFAULT NULL,
  `gedung` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_akun`
--
ALTER TABLE `tb_akun`
  ADD PRIMARY KEY (`NIP_NRK`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `gedung` (`gedung`),
  ADD KEY `ruang` (`ruang`);

--
-- Indexes for table `tb_gedung`
--
ALTER TABLE `tb_gedung`
  ADD PRIMARY KEY (`gedung`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `NIP_NRK` (`NIP_NRK`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tb_ruang`
--
ALTER TABLE `tb_ruang`
  ADD PRIMARY KEY (`ruang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`gedung`) REFERENCES `tb_gedung` (`gedung`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_barang_ibfk_2` FOREIGN KEY (`ruang`) REFERENCES `tb_ruang` (`ruang`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD CONSTRAINT `tb_peminjaman_ibfk_1` FOREIGN KEY (`NIP_NRK`) REFERENCES `tb_akun` (`NIP_NRK`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_peminjaman_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
