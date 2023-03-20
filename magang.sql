-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2022 pada 17.23
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magang`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `data_mahasiswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `data_mahasiswa` (
`no` int(11)
,`foto` varchar(225)
,`nama_mahasiswa` varchar(50)
,`nim` int(11)
,`program_studi` varchar(30)
,`universitas` varchar(30)
,`tujuan_magang` varchar(50)
,`periode_masuk` date
,`periode_selesai` date
,`status` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `lainnya`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `lainnya` (
`no` int(11)
,`foto` varchar(225)
,`nama_mahasiswa` varchar(50)
,`nim` int(11)
,`program_studi` varchar(30)
,`universitas` varchar(30)
,`tujuan_magang` varchar(50)
,`tanggal_masuk` date
,`tanggal_selesai` date
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `mahasiswa_diterima`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `mahasiswa_diterima` (
`no` int(11)
,`foto` varchar(225)
,`nama_mahasiswa` varchar(50)
,`nim` int(11)
,`program_studi` varchar(30)
,`universitas` varchar(30)
,`tujuan_magang` varchar(50)
,`periode_masuk` date
,`periode_selesai` date
,`status` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `mahasiswa_kkn`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `mahasiswa_kkn` (
`no` int(11)
,`foto` varchar(225)
,`nama_mahasiswa` varchar(50)
,`nim` int(11)
,`program_studi` varchar(30)
,`universitas` varchar(30)
,`tujuan_magang` varchar(50)
,`periode_masuk` date
,`periode_selesai` date
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `mahasiswa_magang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `mahasiswa_magang` (
`no` int(11)
,`foto` varchar(225)
,`nama_mahasiswa` varchar(50)
,`nim` int(11)
,`program_studi` varchar(30)
,`universitas` varchar(30)
,`tujuan_magang` varchar(50)
,`tanggal_masuk` date
,`tanggal_selesai` date
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `mahasiswa_penelitian`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `mahasiswa_penelitian` (
`no` int(11)
,`foto` varchar(225)
,`nama_mahasiswa` varchar(50)
,`nim` int(11)
,`program_studi` varchar(30)
,`universitas` varchar(30)
,`tujuan_magang` varchar(50)
,`periode_masuk` date
,`periode_selesai` date
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `mahasiswa_pkl`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `mahasiswa_pkl` (
`no` int(11)
,`foto` varchar(225)
,`nama_mahasiswa` varchar(50)
,`nim` int(11)
,`program_studi` varchar(30)
,`universitas` varchar(30)
,`tujuan_magang` varchar(50)
,`periode_masuk` date
,`periode_selesai` date
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran_magang`
--

CREATE TABLE `pendaftaran_magang` (
  `no` int(11) NOT NULL,
  `foto` varchar(225) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nim` int(11) NOT NULL,
  `program_studi` varchar(30) NOT NULL,
  `universitas` varchar(30) NOT NULL,
  `tujuan_magang` varchar(50) NOT NULL,
  `alamat_ktp` varchar(100) NOT NULL,
  `alamat_kost` varchar(100) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `riwayat_sehat` varchar(225) NOT NULL,
  `status` varchar(30) NOT NULL,
  `nama_file` varchar(225) NOT NULL,
  `proposal` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pendaftaran_magang`
--

INSERT INTO `pendaftaran_magang` (`no`, `foto`, `nama_lengkap`, `nim`, `program_studi`, `universitas`, `tujuan_magang`, `alamat_ktp`, `alamat_kost`, `tanggal_masuk`, `tanggal_selesai`, `email`, `no_telp`, `riwayat_sehat`, `status`, `nama_file`, `proposal`) VALUES
(4, 'Poster_1.jpg', 'Banana', 18219023, 'Informatika', 'Ahmad Dahlan', 'Penelitian', 'Kebumen', 'Ngestiharjo', '2021-10-21', '2021-10-31', 'banana@gmail.com', '089837233186', 'Batuk, Pilek', 'Ditolak', '1705-5133-1-PB.pdf', '325-1142-1-PB.pdf'),
(5, '325-1142-1-PB_1.pdf', 'Dini', 18219080, 'Sastra', 'Ahmad Yani', 'Penelitian', '', '', '2021-10-22', '0000-00-00', '', '', '', 'Disetujui', '325-1142-1-PB.pdf', '325-1142-1-PB_3.pdf'),
(6, '7795-16938-2-PB.pdf', 'Dodi', 0, '', '', 'Magang', '', '', '2021-10-22', '0000-00-00', '', '', '', 'pending', '16870-51104-1-PB.pdf', '7795-16938-2-PB_2.pdf'),
(7, '325-1142-1-PB_1.pdf', 'Didi', 0, '', '', 'PKL', '', '', '2021-10-22', '0000-00-00', '', '', '', 'pending', '1705-5133-1-PB.pdf', '1258-1283-2-PB.pdf'),
(8, '325-1142-1-PB.pdf', 'Didi', 0, '', '', 'Lainnya', '', '', '2021-10-22', '0000-00-00', '', '', '', 'pending', '325-1142-1-PB.pdf', '325-1142-1-PB.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `jenis_kelamin`) VALUES
(0, 'Yogi Septian', 'yogi', 'yogi123', 'Laki-Laki'),
(1, 'Dini', 'Dini', 'dini123', 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur untuk view `data_mahasiswa`
--
DROP TABLE IF EXISTS `data_mahasiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_mahasiswa`  AS  select `pendaftaran_magang`.`no` AS `no`,`pendaftaran_magang`.`foto` AS `foto`,`pendaftaran_magang`.`nama_lengkap` AS `nama_mahasiswa`,`pendaftaran_magang`.`nim` AS `nim`,`pendaftaran_magang`.`program_studi` AS `program_studi`,`pendaftaran_magang`.`universitas` AS `universitas`,`pendaftaran_magang`.`tujuan_magang` AS `tujuan_magang`,`pendaftaran_magang`.`tanggal_masuk` AS `periode_masuk`,`pendaftaran_magang`.`tanggal_selesai` AS `periode_selesai`,`pendaftaran_magang`.`status` AS `status` from `pendaftaran_magang` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `lainnya`
--
DROP TABLE IF EXISTS `lainnya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lainnya`  AS  select `pendaftaran_magang`.`no` AS `no`,`pendaftaran_magang`.`foto` AS `foto`,`pendaftaran_magang`.`nama_lengkap` AS `nama_mahasiswa`,`pendaftaran_magang`.`nim` AS `nim`,`pendaftaran_magang`.`program_studi` AS `program_studi`,`pendaftaran_magang`.`universitas` AS `universitas`,`pendaftaran_magang`.`tujuan_magang` AS `tujuan_magang`,`pendaftaran_magang`.`tanggal_masuk` AS `tanggal_masuk`,`pendaftaran_magang`.`tanggal_selesai` AS `tanggal_selesai` from `pendaftaran_magang` where `pendaftaran_magang`.`tujuan_magang` = 'lainnya' ;

-- --------------------------------------------------------

--
-- Struktur untuk view `mahasiswa_diterima`
--
DROP TABLE IF EXISTS `mahasiswa_diterima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mahasiswa_diterima`  AS  select `pendaftaran_magang`.`no` AS `no`,`pendaftaran_magang`.`foto` AS `foto`,`pendaftaran_magang`.`nama_lengkap` AS `nama_mahasiswa`,`pendaftaran_magang`.`nim` AS `nim`,`pendaftaran_magang`.`program_studi` AS `program_studi`,`pendaftaran_magang`.`universitas` AS `universitas`,`pendaftaran_magang`.`tujuan_magang` AS `tujuan_magang`,`pendaftaran_magang`.`tanggal_masuk` AS `periode_masuk`,`pendaftaran_magang`.`tanggal_selesai` AS `periode_selesai`,`pendaftaran_magang`.`status` AS `status` from `pendaftaran_magang` where `pendaftaran_magang`.`status` = 'diterima' ;

-- --------------------------------------------------------

--
-- Struktur untuk view `mahasiswa_kkn`
--
DROP TABLE IF EXISTS `mahasiswa_kkn`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mahasiswa_kkn`  AS  select `pendaftaran_magang`.`no` AS `no`,`pendaftaran_magang`.`foto` AS `foto`,`pendaftaran_magang`.`nama_lengkap` AS `nama_mahasiswa`,`pendaftaran_magang`.`nim` AS `nim`,`pendaftaran_magang`.`program_studi` AS `program_studi`,`pendaftaran_magang`.`universitas` AS `universitas`,`pendaftaran_magang`.`tujuan_magang` AS `tujuan_magang`,`pendaftaran_magang`.`tanggal_masuk` AS `periode_masuk`,`pendaftaran_magang`.`tanggal_selesai` AS `periode_selesai` from `pendaftaran_magang` where `pendaftaran_magang`.`tujuan_magang` = 'kkn' ;

-- --------------------------------------------------------

--
-- Struktur untuk view `mahasiswa_magang`
--
DROP TABLE IF EXISTS `mahasiswa_magang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mahasiswa_magang`  AS  select `pendaftaran_magang`.`no` AS `no`,`pendaftaran_magang`.`foto` AS `foto`,`pendaftaran_magang`.`nama_lengkap` AS `nama_mahasiswa`,`pendaftaran_magang`.`nim` AS `nim`,`pendaftaran_magang`.`program_studi` AS `program_studi`,`pendaftaran_magang`.`universitas` AS `universitas`,`pendaftaran_magang`.`tujuan_magang` AS `tujuan_magang`,`pendaftaran_magang`.`tanggal_masuk` AS `tanggal_masuk`,`pendaftaran_magang`.`tanggal_selesai` AS `tanggal_selesai` from `pendaftaran_magang` where `pendaftaran_magang`.`tujuan_magang` = 'magang' ;

-- --------------------------------------------------------

--
-- Struktur untuk view `mahasiswa_penelitian`
--
DROP TABLE IF EXISTS `mahasiswa_penelitian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mahasiswa_penelitian`  AS  select `pendaftaran_magang`.`no` AS `no`,`pendaftaran_magang`.`foto` AS `foto`,`pendaftaran_magang`.`nama_lengkap` AS `nama_mahasiswa`,`pendaftaran_magang`.`nim` AS `nim`,`pendaftaran_magang`.`program_studi` AS `program_studi`,`pendaftaran_magang`.`universitas` AS `universitas`,`pendaftaran_magang`.`tujuan_magang` AS `tujuan_magang`,`pendaftaran_magang`.`tanggal_masuk` AS `periode_masuk`,`pendaftaran_magang`.`tanggal_selesai` AS `periode_selesai` from `pendaftaran_magang` where `pendaftaran_magang`.`tujuan_magang` = 'penelitian' ;

-- --------------------------------------------------------

--
-- Struktur untuk view `mahasiswa_pkl`
--
DROP TABLE IF EXISTS `mahasiswa_pkl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mahasiswa_pkl`  AS  select `pendaftaran_magang`.`no` AS `no`,`pendaftaran_magang`.`foto` AS `foto`,`pendaftaran_magang`.`nama_lengkap` AS `nama_mahasiswa`,`pendaftaran_magang`.`nim` AS `nim`,`pendaftaran_magang`.`program_studi` AS `program_studi`,`pendaftaran_magang`.`universitas` AS `universitas`,`pendaftaran_magang`.`tujuan_magang` AS `tujuan_magang`,`pendaftaran_magang`.`tanggal_masuk` AS `periode_masuk`,`pendaftaran_magang`.`tanggal_selesai` AS `periode_selesai` from `pendaftaran_magang` where `pendaftaran_magang`.`tujuan_magang` = 'pkl' ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pendaftaran_magang`
--
ALTER TABLE `pendaftaran_magang`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pendaftaran_magang`
--
ALTER TABLE `pendaftaran_magang`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
