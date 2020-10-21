-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2020 at 02:40 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basisdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(55) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `deskripsi` text NOT NULL,
  `tempat` varchar(125) NOT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `anggaran`
--

CREATE TABLE `anggaran` (
  `id_anggaran` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_jenis_anggaran` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bayar_pajak`
--

CREATE TABLE `bayar_pajak` (
  `id_bayar_pajak` int(11) NOT NULL,
  `nik` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(55) NOT NULL,
  `deskripsi` text NOT NULL,
  `isi` text NOT NULL,
  `hits` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `gambar` text NOT NULL,
  `status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brosur`
--

CREATE TABLE `brosur` (
  `id_brosur` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(55) NOT NULL,
  `tanggal` datetime NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `id_foto` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(55) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id_info` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `deskripsi` text NOT NULL,
  `logo` text NOT NULL,
  `email` varchar(55) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `puskesmas` varchar(155) NOT NULL,
  `link_map` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_anggaran`
--

CREATE TABLE `jenis_anggaran` (
  `id_jenis_anggaran` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `status` enum('anggaran','pajak','foto') NOT NULL COMMENT 'anggara, pajak, foto',
  `tahun` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_user`, `nama`, `lokasi`, `tanggal`, `status`, `tahun`) VALUES
(1, 1, 'LAPORAN PAJAK TAHUN 2019', NULL, '2020-10-21 00:00:00', 'pajak', 2019),
(2, 1, 'LAPORAN PAJAK TAHUN 2020', NULL, '2020-10-21 00:00:00', 'pajak', 2020),
(3, 1, 'Anggaran Dana Desa Tahun 2019', NULL, '2020-10-21 00:00:00', 'anggaran', 2019),
(4, 1, 'Anggaran Dana Desa Tahun 2020', NULL, '2020-10-21 00:00:00', 'anggaran', 2019);

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `nik` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `jk` varchar(11) NOT NULL,
  `alamat` text NOT NULL,
  `status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(55) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` text NOT NULL,
  `nama_pengusaha` varchar(55) NOT NULL,
  `nama_usaha` varchar(55) NOT NULL,
  `jenis_usaha` varchar(55) NOT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `username` varchar(8) NOT NULL,
  `password` varchar(8) NOT NULL,
  `tanggal` datetime NOT NULL,
  `level` varchar(55) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `tanggal`, `level`, `status`) VALUES
(1, 'farih alil himam', 'admin', 'admin', '0000-00-00 00:00:00', '', 0),
(2, 'farih alil himam', 'admin', 'admin', '2020-10-21 00:00:00', 'admin', 1),
(3, 'haron arrosyid', 'harun', 'harun', '2020-10-21 00:00:00', 'petugas', 1),
(4, 'pak pungki', 'pungki', 'pungki', '2020-10-21 00:00:00', 'petugas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vidio`
--

CREATE TABLE `vidio` (
  `id_vidio` int(11) NOT NULL,
  `judul` varchar(55) NOT NULL,
  `embed` text NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`),
  ADD KEY `fk_agenda_user` (`id_user`);

--
-- Indexes for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD PRIMARY KEY (`id_anggaran`),
  ADD KEY `fk_kategori_anggaran` (`id_kategori`),
  ADD KEY `fk_jenis_anggaran_anggaran` (`id_jenis_anggaran`);

--
-- Indexes for table `bayar_pajak`
--
ALTER TABLE `bayar_pajak`
  ADD PRIMARY KEY (`id_bayar_pajak`),
  ADD KEY `fk_penduduk_bayar_pajak` (`nik`),
  ADD KEY `fk_kategori` (`id_kategori`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `fk_berita_user` (`id_user`);

--
-- Indexes for table `brosur`
--
ALTER TABLE `brosur`
  ADD PRIMARY KEY (`id_brosur`),
  ADD KEY `fk_brosur_user` (`id_user`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `fk_kategori_foto` (`id_kategori`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id_info`);

--
-- Indexes for table `jenis_anggaran`
--
ALTER TABLE `jenis_anggaran`
  ADD PRIMARY KEY (`id_jenis_anggaran`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `fk_kategori_user` (`id_user`);

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `fk_produk_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `vidio`
--
ALTER TABLE `vidio`
  ADD PRIMARY KEY (`id_vidio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anggaran`
--
ALTER TABLE `anggaran`
  MODIFY `id_anggaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bayar_pajak`
--
ALTER TABLE `bayar_pajak`
  MODIFY `id_bayar_pajak` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brosur`
--
ALTER TABLE `brosur`
  MODIFY `id_brosur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_anggaran`
--
ALTER TABLE `jenis_anggaran`
  MODIFY `id_jenis_anggaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `nik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vidio`
--
ALTER TABLE `vidio`
  MODIFY `id_vidio` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `fk_agenda_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD CONSTRAINT `fk_jenis_anggaran_anggaran` FOREIGN KEY (`id_jenis_anggaran`) REFERENCES `jenis_anggaran` (`id_jenis_anggaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kategori_anggaran` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bayar_pajak`
--
ALTER TABLE `bayar_pajak`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penduduk_bayar_pajak` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `fk_berita_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `brosur`
--
ALTER TABLE `brosur`
  ADD CONSTRAINT `fk_brosur_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_kategori_foto` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `fk_kategori_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_produk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
