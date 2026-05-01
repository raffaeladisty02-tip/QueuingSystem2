-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2022 at 09:20 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bengkel`
--

-- --------------------------------------------------------

--
-- Table structure for table `213_konsumen`
--

CREATE TABLE `213_konsumen` (
  `id_konsumen` int(4) NOT NULL,
  `nama_konsumen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_konsumen`
--

INSERT INTO `213_konsumen` (`id_konsumen`, `nama_konsumen`) VALUES
(1, 'Ujang'),
(1, 'Ujang'),
(1, 'Ujang');

-- --------------------------------------------------------

--
-- Table structure for table `213_mekanik`
--

CREATE TABLE `213_mekanik` (
  `id_mekanik` int(5) UNSIGNED NOT NULL,
  `nama_mekanik` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_mekanik`
--

INSERT INTO `213_mekanik` (`id_mekanik`, `nama_mekanik`) VALUES
(1, 'Dadan Sarkopet'),
(2, 'Jajang'),
(3, 'Sudrajat'),
(9, 'Agung'),
(10, 'supratno'),
(11, 'udin');

-- --------------------------------------------------------

--
-- Table structure for table `213_pembelian`
--

CREATE TABLE `213_pembelian` (
  `id_pembelian` int(5) NOT NULL,
  `id_mekanik` int(5) DEFAULT NULL,
  `id_sparepart` int(5) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `harga_jasa` varchar(10) DEFAULT NULL,
  `tgl_beli` date DEFAULT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pembelian`
--

INSERT INTO `213_pembelian` (`id_pembelian`, `id_mekanik`, `id_sparepart`, `qty`, `harga_jasa`, `tgl_beli`, `status`) VALUES
(6, 11, 11, 1, '50000', '2022-06-17', 'Selsai'),
(7, 1, 10, 1, '10000', '2022-07-07', 'Selesai'),
(8, 3, 20, 1, '10000', '2022-07-07', 'Selesai'),
(9, 10, 8, 1, '30000', '2022-07-07', 'Prosses'),
(10, 1, 5, 1, '30000', '2022-07-07', 'Prosses'),
(11, 9, 0, 1, '30000', '2022-07-07', 'Prosses'),
(12, 11, 0, 1, '10000', '2022-07-07', 'Selesai');

--
-- Triggers `213_pembelian`
--
DELIMITER $$
CREATE TRIGGER `jual` AFTER INSERT ON `213_pembelian` FOR EACH ROW BEGIN
UPDATE 213_sparepart SET stock=stock-NEW.qty
WHERE id_sparepart=NEW.id_sparepart;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `213_pengguna`
--

CREATE TABLE `213_pengguna` (
  `id_pengguna` int(5) NOT NULL,
  `nama_pengguna` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pengguna`
--

INSERT INTO `213_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`) VALUES
(1, 'damdam', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `213_sparepart`
--

CREATE TABLE `213_sparepart` (
  `id_sparepart` int(5) NOT NULL,
  `sparepart` varchar(50) DEFAULT NULL,
  `stock` varchar(5) DEFAULT NULL,
  `harga` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_sparepart`
--

INSERT INTO `213_sparepart` (`id_sparepart`, `sparepart`, `stock`, `harga`) VALUES
(1, 'Filter Udara', '2', '32000'),
(2, 'Kampas Rem Depan', '1', '37000'),
(3, 'Kampas Rem Belakang', '11', '26000'),
(4, 'Rantai', '11', '65000'),
(5, 'Gir Depan', '7', '35000'),
(6, 'Gir belakang', '6', '63000'),
(7, 'Bohlam Depan', '15', '25000'),
(8, 'Bohlam Belakang', '15', '7500'),
(9, 'Kabel Gas', '20', '20000'),
(10, 'Kampas Kopling', '0', '148000'),
(11, 'Piston', '0', '38000'),
(12, 'Ring Piston', '5', '60000'),
(13, 'V-belt', '4', '43000'),
(14, 'CDI', '4', '340000'),
(15, 'Relay Starter', '6', '40000'),
(16, 'Sokbreker Belakang', '6', '180000'),
(17, 'Kem', '3', '115000'),
(18, 'Oli Yamalube', '10', '35000'),
(19, 'Oli Top One', '2', '40000'),
(20, 'Oli Castroll', '4', '65000'),
(21, 'Oli Mesran', '5', '35000'),
(27, 'Spion', '5', '25000'),
(0, 'kabel spidometer', '8', '18000'),
(0, 'filter udara ', '8', '37000'),
(0, 'kabel kopling ', '8', '23000'),
(0, 'lahar ', '8', '30000'),
(0, 'knalpot ', '8', '250000'),
(0, 'jari jari', '8', '100000'),
(0, 'baterai', '8', '180000'),
(0, 'kabel baterai', '8', '5000'),
(0, 'footset pijakan', '8', '18000'),
(0, 'cover depan', '8', '75000'),
(0, 'cover belakang', '8', '37000'),
(0, 'setandar samping ', '8', '35000'),
(0, 'saringan oli', '8', '15000'),
(0, 'ring piston', '8', '120000'),
(0, 'CDI', '8', '100000'),
(0, 'helm SNI', '8', '250000'),
(0, 'jok', '8', '90000'),
(0, 'oli', '8', '60000'),
(0, 'tangki ', '8', '215000'),
(0, 'kepala busi', '8', '35000'),
(0, 'mika lampu depan', '8', '140000'),
(0, 'visor ', '8', '70000'),
(0, 'saklar sen', '8', '40000'),
(0, 'coil stater', '8', '100000'),
(0, 'ban tubles', '8', '300000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `213_mekanik`
--
ALTER TABLE `213_mekanik`
  ADD PRIMARY KEY (`id_mekanik`);

--
-- Indexes for table `213_pembelian`
--
ALTER TABLE `213_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `213_mekanik`
--
ALTER TABLE `213_mekanik`
  MODIFY `id_mekanik` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `213_pembelian`
--
ALTER TABLE `213_pembelian`
  MODIFY `id_pembelian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
