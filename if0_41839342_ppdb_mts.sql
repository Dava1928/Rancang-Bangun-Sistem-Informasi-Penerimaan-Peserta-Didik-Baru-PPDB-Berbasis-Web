-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql300.infinityfree.com
-- Waktu pembuatan: 07 Bulan Mei 2026 pada 14.23
-- Versi server: 11.4.10-MariaDB
-- Versi PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41839342_ppdb_mts`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_orang_tua`
--

CREATE TABLE `data_orang_tua` (
  `id` int(11) NOT NULL,
  `pendaftaran_id` int(11) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `pekerjaan_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `pekerjaan_ibu` varchar(50) NOT NULL,
  `no_telepon_ortu` varchar(15) NOT NULL,
  `penghasilan_ortu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_orang_tua`
--

INSERT INTO `data_orang_tua` (`id`, `pendaftaran_id`, `nama_ayah`, `pekerjaan_ayah`, `nama_ibu`, `pekerjaan_ibu`, `no_telepon_ortu`, `penghasilan_ortu`) VALUES
(1, 1, 'huuiuhu', 'gvtrderseecjb', 'jojojojoj', 'uhiuhuihih', '090909090999', '&gt; Rp5.000.000'),
(2, 2, 'huuiuhu', 'gvtrderseecjb', 'jojojojoj', 'uhiuhuihih', '090909090999', '&gt; Rp5.000.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pribadi`
--

CREATE TABLE `data_pribadi` (
  `id` int(11) NOT NULL,
  `pendaftaran_id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL DEFAULT 'Islam',
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `asal_sekolah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_pribadi`
--

INSERT INTO `data_pribadi` (`id`, `pendaftaran_id`, `nama_lengkap`, `nik`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `agama`, `alamat`, `no_telepon`, `asal_sekolah`) VALUES
(1, 1, 'dava', '8080808080808080', '909090909009090', 'bogor', '2026-05-21', 'L', 'Islam', 'kpkpkpkpkp0', '0990909000900', 'mimimim'),
(2, 2, 'test2', '8080808080808080', '909090909009090', 'bogor', '2019-02-06', 'L', 'Islam', 'kp kpan', '12031294341', 'dimana aja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL,
  `pendaftaran_id` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `ijazah_sd` varchar(255) NOT NULL,
  `akta_kelahiran` varchar(255) NOT NULL,
  `kartu_keluarga` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dokumen`
--

INSERT INTO `dokumen` (`id`, `pendaftaran_id`, `foto`, `ijazah_sd`, `akta_kelahiran`, `kartu_keluarga`, `uploaded_at`) VALUES
(1, 1, 'foto_20260505134532_69fa2cbc32e7f.png', 'ijazah_sd_20260505134532_69fa2cbc33265.png', 'akta_kelahiran_20260505134532_69fa2cbc33441.png', 'kartu_keluarga_20260505134532_69fa2cbc335dc.png', '2026-05-05 17:45:31'),
(2, 2, 'foto_PPDB_2026_0002_20260505183323_97793821.jpeg', 'ijazah_sd_PPDB_2026_0002_20260505183323_052240b8.jpeg', 'akta_kelahiran_PPDB_2026_0002_20260505183323_6565a59e.jpeg', 'kartu_keluarga_PPDB_2026_0002_20260505183323_cec98594.jpeg', '2026-05-05 22:33:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `no_pendaftaran` varchar(20) NOT NULL,
  `status` enum('menunggu','diterima','ditolak') NOT NULL DEFAULT 'menunggu',
  `catatan_admin` text DEFAULT NULL,
  `tanggal_daftar` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `user_id`, `no_pendaftaran`, `status`, `catatan_admin`, `tanggal_daftar`) VALUES
(1, 2, 'PPDB-2026-0001', 'diterima', '', '2026-05-05 17:44:39'),
(2, 3, 'PPDB-2026-0002', 'ditolak', 'ditolak karena nyawit terus', '2026-05-05 22:32:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Administrator PPDB', 'admin@binarahmah.sch.id', '$2y$12$xXdiz0dEHa.KkgCIdFwe4e.hk9pEhOw4j9GCOccrm6l.abE6YWpLa', 'admin', '2026-05-05 16:59:46'),
(2, 'dava', 'erdfcgffc@gmail.com', 'kontol1928', 'user', '2026-05-05 17:42:51'),
(3, 'test2', 'ayamayam@gmail.com', '$2y$10$NvxShDk0wfN4TIIhOwzKm.MZxZ8npRKjEbun.0LciHw6U6l95jBQW', 'user', '2026-05-05 22:20:07'),
(4, 'bda', 'admin@binarahmah.infinityfree.me', '$2y$10$b7eEDtfGK0MkvSQsPT5jZOIuelWPCF4FFk8GyIGrD0j8ogqYvfonG', 'user', '2026-05-06 02:13:20'),
(5, 'Alif Afriza', 'rikuk212@gmail.com', '$2y$10$dntwSQd1hHyhPGFE3gfm1u7Su3umva28aY3G5TExpD6D9iV44ikYa', 'user', '2026-05-06 02:21:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_orang_tua`
--
ALTER TABLE `data_orang_tua`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pendaftaran_data_orang_tua` (`pendaftaran_id`);

--
-- Indeks untuk tabel `data_pribadi`
--
ALTER TABLE `data_pribadi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pendaftaran_data_pribadi` (`pendaftaran_id`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_nisn` (`nisn`);

--
-- Indeks untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pendaftaran_dokumen` (`pendaftaran_id`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_no_pendaftaran` (`no_pendaftaran`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_orang_tua`
--
ALTER TABLE `data_orang_tua`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_pribadi`
--
ALTER TABLE `data_pribadi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_orang_tua`
--
ALTER TABLE `data_orang_tua`
  ADD CONSTRAINT `fk_data_orang_tua_pendaftaran` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_pribadi`
--
ALTER TABLE `data_pribadi`
  ADD CONSTRAINT `fk_data_pribadi_pendaftaran` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `fk_dokumen_pendaftaran` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `fk_pendaftaran_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
