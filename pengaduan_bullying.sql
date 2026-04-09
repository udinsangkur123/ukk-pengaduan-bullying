-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 08 Apr 2026 pada 01.40
-- Versi server: 8.0.30
-- Versi PHP: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `pengaduan_bullying`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`, `created_at`) VALUES
(1, 'Guru BK', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:17:52'),
(6, 'Ibu Rina', 'rina_bk', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52'),
(7, 'Pak Andi', 'andi_bk', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int NOT NULL,
  `id_laporan` int NOT NULL,
  `id_admin` int NOT NULL,
  `isi_feedback` text NOT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi_kategori` text,
  `ikon` varchar(50) DEFAULT 'fa-exclamation-circle',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deskripsi_kategori`, `ikon`, `created_at`) VALUES
(1, 'Bullying Fisik', 'Tindakan kekerasan fisik seperti memukul, menendang, mendorong, atau merusak barang milik korban.', 'fa-hand-fist', '2026-04-07 23:17:53'),
(2, 'Bullying Verbal', 'Tindakan pelecehan verbal seperti mengejek, menghina, memaki, atau menyebarkan rumor negatif.', 'fa-comment-slash', '2026-04-07 23:17:53'),
(3, 'Bullying Sosial', 'Tindakan pengucilan sosial seperti mengabaikan, mengisolasi, atau merusak reputasi korban di lingkungan sosial.', 'fa-users-slash', '2026-04-07 23:17:53'),
(4, 'Cyberbullying', 'Tindakan perundungan melalui media digital seperti media sosial, pesan teks, atau platform online lainnya.', 'fa-mobile-screen', '2026-04-07 23:17:53'),
(5, 'Bullying Seksual', 'Tindakan pelecehan yang bersifat seksual termasuk komentar tidak pantas, sentuhan tidak diinginkan, atau penyebaran konten tidak senonoh.', 'fa-shield-halved', '2026-04-07 23:17:53'),
(6, 'Pemerasan', 'Tindakan memaksa korban menyerahkan uang, barang, atau melakukan sesuatu di bawah ancaman.', 'fa-money-bill-wave', '2026-04-07 23:17:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int NOT NULL,
  `kode_laporan` varchar(20) NOT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `is_anonim` tinyint(1) DEFAULT '0',
  `nama_anonim` varchar(100) DEFAULT NULL,
  `id_kategori` int NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `tanggal_kejadian` date NOT NULL,
  `deskripsi` text NOT NULL,
  `nama_pelaku` varchar(255) DEFAULT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `status` enum('Menunggu','Diproses','Selesai','Ditolak') DEFAULT 'Menunggu',
  `prioritas` enum('Normal','Urgent') DEFAULT 'Normal',
  `tanggal_lapor` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `kode_laporan`, `nis`, `is_anonim`, `nama_anonim`, `id_kategori`, `lokasi`, `tanggal_kejadian`, `deskripsi`, `nama_pelaku`, `bukti`, `status`, `prioritas`, `tanggal_lapor`, `updated_at`) VALUES
(1, 'LPR-0001', '12345', 0, NULL, 1, 'Lapangan Sekolah', '2026-03-10', 'Saya didorong dan dipukul oleh kakak kelas saat istirahat.', 'Andi (XI)', NULL, 'Menunggu', 'Normal', '2026-04-07 23:20:52', NULL),
(2, 'LPR-0002', '12346', 0, NULL, 2, 'Kelas XI RPL 1', '2026-03-12', 'Sering diejek dan dipanggil dengan nama tidak pantas.', 'Beberapa teman kelas', NULL, 'Diproses', 'Urgent', '2026-04-07 23:20:52', NULL),
(3, 'LPR-0003', NULL, 1, 'Pelapor Rahasia', 4, 'Grup WhatsApp Kelas', '2026-03-15', 'Ada siswa yang menyebarkan meme menghina teman di grup.', 'Tidak diketahui', NULL, 'Diproses', 'Normal', '2026-04-07 23:20:52', NULL),
(4, 'BLY-260407-526F', NULL, 1, 'PYLKB-Anonim', 6, 'tepa', '2026-04-07', 'korban di palak', 'R', NULL, 'Menunggu', 'Urgent', '2026-04-08 05:39:22', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `kelas`, `jenis_kelamin`, `no_hp`, `password`, `created_at`) VALUES
('12345', 'siswa', 'XII RPL 2', 'Laki-laki', '081234567890', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52'),
('12346', 'Siti Aisyah', 'XI RPL 1', 'Perempuan', '081234567891', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52'),
('12347', 'Rizky Pratama', 'X TKJ 1', 'Laki-laki', '081234567892', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52');

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_laporan` (`id_laporan`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD UNIQUE KEY `kode_laporan` (`kode_laporan`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE SET NULL,
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
