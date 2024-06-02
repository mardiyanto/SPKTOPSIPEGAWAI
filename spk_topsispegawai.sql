-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02 Jun 2024 pada 06.32
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_topsispegawai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(10) NOT NULL,
  `no_alternatif` varchar(6) NOT NULL,
  `ciri_khas` text NOT NULL,
  `tanggal_input` date NOT NULL,
  `warna` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `no_alternatif`, `ciri_khas`, `tanggal_input`, `warna`) VALUES
(1, 'A1', 'PEGAWAI 1', '2024-06-02', '#1c84e3'),
(2, 'A2', 'PEGAWAI 2', '2024-06-02', '#23ba45'),
(3, 'A3', 'PEGAWAI 3', '2024-06-02', '#2336db'),
(4, 'A4', 'PEGAWAI 4', '2024-06-02', '#db4b0d'),
(5, 'A5', 'PEGAWAI 5', '2024-06-02', '#201ce8');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `type` enum('benefit','cost') NOT NULL,
  `bobot` float NOT NULL,
  `ada_pilihan` tinyint(1) DEFAULT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama`, `kode`, `type`, `bobot`, `ada_pilihan`, `urutan_order`) VALUES
(1, 'C1', 'Presensi', 'benefit', 5, 1, 1),
(2, 'C2', 'Sikap/etika', 'benefit', 4, 1, 2),
(3, 'C3', 'Komunikasi', 'benefit', 4, 1, 3),
(4, 'C4', 'Kualitas kerja', 'benefit', 2, 1, 4),
(5, 'C5', 'Kerja tim', 'benefit', 5, 1, 5),
(6, 'C6', 'Masa Kerja', 'benefit', 2, 1, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_alternatif`
--

CREATE TABLE `nilai_alternatif` (
  `id_nilai_alternatif` int(11) NOT NULL,
  `id_alternatif` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_alternatif`
--

INSERT INTO `nilai_alternatif` (`id_nilai_alternatif`, `id_alternatif`, `id_kriteria`, `nilai`) VALUES
(1, 1, 1, 4),
(2, 1, 2, 5),
(3, 1, 3, 4),
(4, 1, 4, 2),
(5, 1, 5, 5),
(6, 1, 6, 3),
(7, 2, 1, 5),
(8, 2, 2, 5),
(9, 2, 3, 3),
(10, 2, 4, 2),
(11, 2, 5, 4),
(12, 2, 6, 3),
(13, 3, 1, 2),
(14, 3, 2, 3),
(15, 3, 3, 3),
(16, 3, 4, 2),
(17, 3, 5, 4),
(18, 3, 6, 4),
(19, 4, 1, 1),
(20, 4, 2, 5),
(21, 4, 3, 4),
(22, 4, 4, 4),
(23, 4, 5, 3),
(24, 4, 6, 3),
(25, 5, 1, 3),
(26, 5, 2, 5),
(27, 5, 3, 3),
(28, 5, 4, 2),
(29, 5, 5, 2),
(30, 5, 6, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pilihan_kriteria`
--

CREATE TABLE `pilihan_kriteria` (
  `id_pil_kriteria` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nilai` float NOT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pilihan_kriteria`
--

INSERT INTO `pilihan_kriteria` (`id_pil_kriteria`, `id_kriteria`, `nama`, `nilai`, `urutan_order`) VALUES
(1, 1, 'Sangat Baik', 5, 1),
(2, 1, 'Baik', 4, 2),
(3, 1, 'Cukup Baik', 3, 3),
(4, 1, 'Kurang Baik', 2, 4),
(5, 1, 'Tidak Baik', 1, 5),
(6, 2, 'Sangat Baik', 5, 1),
(7, 2, 'Baik', 4, 2),
(8, 2, 'Cukup Baik', 3, 3),
(9, 2, 'Kurang Baik', 2, 4),
(10, 2, 'Tidak Baik', 1, 5),
(11, 3, 'Sangat Baik', 5, 1),
(12, 3, 'Baik', 4, 2),
(13, 3, 'Cukup Baik', 3, 3),
(14, 3, 'Kurang Baik', 2, 4),
(15, 3, 'Tidak Baik', 1, 5),
(16, 4, 'Sangat Baik', 5, 1),
(17, 4, 'Baik', 4, 2),
(18, 4, 'Cukup Baik', 3, 3),
(19, 4, 'Kurang Baik', 2, 4),
(20, 4, 'Tidak Baik', 1, 5),
(21, 5, 'Sangat Baik', 5, 1),
(22, 5, 'Baik', 4, 2),
(23, 5, 'Cukup Baik', 3, 3),
(24, 5, 'Kurang Baik', 2, 4),
(25, 5, 'Tidak Baik', 1, 5),
(26, 6, 'Sangat Baik', 5, 1),
(27, 6, 'Baik', 4, 2),
(28, 6, 'Cukup Baik', 3, 3),
(29, 6, 'Kurang Baik', 2, 4),
(30, 6, 'Tidak Baik', 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil`
--

CREATE TABLE `profil` (
  `id_profil` int(11) NOT NULL,
  `foto` text NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `nama` varchar(50) NOT NULL,
  `isi` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `profil`
--

INSERT INTO `profil` (`id_profil`, `foto`, `aktif`, `nama`, `isi`) VALUES
(1, '', 'N', 'Visi Dan Misi', '<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<ol>\r\n	<li>Ruang lingkup subjek Kabupaten Lampung Tengah</li>\r\n	<li>Ruang lingkup objek penelitian</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:35.45pt;\">Penelitian dilakukan terhadap SPK Rekrutmen Pendamping Lokal Desa Di Kabupaten Lampung Tengah Berbasis Website Menggunakan Metode TOPSIS, serta dilakukan dengan data-data yang sifatnya bisa dilihat oleh publik.</p>\r\n\r\n<ol>\r\n	<li value=\"3\">Ruang lingkup waktu penelitian</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:35.45pt;\">Penelitian dilakukan pada tahun 2019</p>\r\n</body>\r\n</html>\r\n'),
(2, 'SPK TOPSIS KARYAWAN TERBAIK', 'Y', 'Website SPK TOPSIS', '<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>Untuk menentukan karyawan terbaik bukanlah hal yang mudah bagi perusahaan karena penilaian tersebut harus didasarkan pada kriteria yang sudah ditetapkan oleh perusahaan. Sering kali penentuan karyawan terbaik terkendala pada hanya penilaian absensi saja tanpa memperhatikan kemampuan kinerja karyawan apakah karyawan mampu menyelesaikan setiap pekerjaan dengan baik atau tidak. Ataupun menilai kinerja tanpa melihat absensi karyawan dan faktor lainnya. SPK ini menggunakan metode Technique for Others Preference by Similarity to Ideal Solution (TOPSIS). Jenis data yang digunakan dalam penelitian ini adalah data primer.&nbsp;</p>\r\n</body>\r\n</html>\r\n'),
(3, '', 'N', 'Profil Kami', '<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>1.	Apakah dengan menggunakan metode TOPSIS pada Sistem Pendukung Keputusan mampu menyelesaikan masalah yang ada dalam rekrutmen Pendamping Lokal Desa Berbasis Website di Kabupaten Lampung Tengah. </body>\r\n</html>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `role` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `email`, `alamat`, `role`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Zunan Arif R.', 'oxzygenz@gmail.com', 'Jalan Naik Turun 3312', '1'),
(7, 'petugas', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Anton S', 'test@thesamplemail.com', 'test', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_alternatif`
--
ALTER TABLE `nilai_alternatif`
  ADD PRIMARY KEY (`id_nilai_alternatif`),
  ADD UNIQUE KEY `id_alternatif_2` (`id_alternatif`,`id_kriteria`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD PRIMARY KEY (`id_pil_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `nilai_alternatif`
--
ALTER TABLE `nilai_alternatif`
  MODIFY `id_nilai_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  MODIFY `id_pil_kriteria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai_alternatif`
--
ALTER TABLE `nilai_alternatif`
  ADD CONSTRAINT `nilai_alternatif_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`),
  ADD CONSTRAINT `nilai_alternatif_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD CONSTRAINT `pilihan_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
