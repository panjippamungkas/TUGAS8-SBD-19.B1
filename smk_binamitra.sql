-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jun 2021 pada 08.12
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
  `nik` varchar(5) NOT NULL,
  `nama_guru` varchar(20) NOT NULL,
  `no_tlp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`nik`, `nama_guru`, `no_tlp`) VALUES
('GR-01', 'Panji', '0821-1440-1231'),
('GR-02', 'April', '0821-1440-4564');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_mp` varchar(3) NOT NULL,
  `nama_mp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_mp`, `nama_mp`) VALUES
('IPA', 'IPA'),
('IPS', 'IPA'),
('TIK', 'Teknik Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `murid`
--

CREATE TABLE `murid` (
  `nim` varchar(5) NOT NULL,
  `nama_murid` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `murid`
--

INSERT INTO `murid` (`nim`, `nama_murid`, `tgl_lahir`, `jenis_kelamin`) VALUES
('MRD01', 'Puja', '1996-04-06', 'L'),
('MRD02', 'Desi', '1996-08-31', 'P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_rapot`
--

CREATE TABLE `nilai_rapot` (
  `id_rapot` varchar(5) NOT NULL,
  `nim` varchar(5) NOT NULL,
  `kode_mp` varchar(3) NOT NULL,
  `nik` varchar(5) NOT NULL,
  `nilai` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_rapot`
--

INSERT INTO `nilai_rapot` (`id_rapot`, `nim`, `kode_mp`, `nik`, `nilai`) VALUES
('RPT-1', 'MRD01', 'TIK', 'GR-02', '80'),
('RPT-2', 'MRD02', 'TIK', 'GR-02', '90');

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
  ADD PRIMARY KEY (`kode_mp`);

--
-- Indeks untuk tabel `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `nilai_rapot`
--
ALTER TABLE `nilai_rapot`
  ADD PRIMARY KEY (`id_rapot`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kode_mp` (`kode_mp`),
  ADD KEY `nik` (`nik`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai_rapot`
--
ALTER TABLE `nilai_rapot`
  ADD CONSTRAINT `nilai_rapot_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `murid` (`nim`),
  ADD CONSTRAINT `nilai_rapot_ibfk_2` FOREIGN KEY (`kode_mp`) REFERENCES `mata_pelajaran` (`kode_mp`),
  ADD CONSTRAINT `nilai_rapot_ibfk_3` FOREIGN KEY (`nik`) REFERENCES `guru` (`nik`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
