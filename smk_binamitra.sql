-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2021 pada 19.50
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smk_binamitra`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nik` int(5) NOT NULL,
  `nama_guru` varchar(20) NOT NULL,
  `no_tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`nik`, `nama_guru`, `no_tlp`) VALUES
(1, 'Panji', '0821-1440-123'),
(2, 'Surya', '0821-1440-456'),
(3, 'Alanda', '0821-1440-789'),
(4, 'Adi', '0821-1440-891'),
(5, 'Dimas', '0821-1440-010');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_mp` int(5) NOT NULL,
  `nama_mp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_mp`, `nama_mp`) VALUES
(101, 'Bahasa Indonesia'),
(103, 'Bahasa Ingris'),
(104, 'IPA'),
(105, 'IPS'),
(102, 'MTK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `murid`
--

CREATE TABLE `murid` (
  `nim` int(5) NOT NULL,
  `nama_murid` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `murid`
--

INSERT INTO `murid` (`nim`, `nama_murid`, `tgl_lahir`, `jenis_kelamin`) VALUES
(1, 'Robi', '2001-06-08', 'L'),
(2, 'Raka', '2000-05-11', 'L'),
(3, 'Dessy', '2002-01-01', 'P'),
(4, 'Mawar', '2001-04-02', 'P'),
(5, 'Dadang', '2001-11-04', 'L');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_rapot`
--

CREATE TABLE `nilai_rapot` (
  `id_rapot` int(5) NOT NULL,
  `nama_murid` varchar(20) NOT NULL,
  `nama_mp` varchar(20) NOT NULL,
  `nik` int(5) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_rapot`
--

INSERT INTO `nilai_rapot` (`id_rapot`, `nama_murid`, `nama_mp`, `nik`, `nilai`) VALUES
(1, 'Dadang', 'Bahasa Indonesia', 1, '80');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kode_mp`),
  ADD UNIQUE KEY `nama_mp` (`nama_mp`);

--
-- Indeks untuk tabel `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`nim`),
  ADD UNIQUE KEY `nama_murid` (`nama_murid`);

--
-- Indeks untuk tabel `nilai_rapot`
--
ALTER TABLE `nilai_rapot`
  ADD PRIMARY KEY (`id_rapot`),
  ADD KEY `nik` (`nik`),
  ADD KEY `nama_mp` (`nama_mp`),
  ADD KEY `nama_murid` (`nama_murid`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai_rapot`
--
ALTER TABLE `nilai_rapot`
  ADD CONSTRAINT `nilai_rapot_ibfk_3` FOREIGN KEY (`nik`) REFERENCES `guru` (`nik`),
  ADD CONSTRAINT `nilai_rapot_ibfk_4` FOREIGN KEY (`nama_mp`) REFERENCES `mata_pelajaran` (`nama_mp`),
  ADD CONSTRAINT `nilai_rapot_ibfk_5` FOREIGN KEY (`nama_murid`) REFERENCES `murid` (`nama_murid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
