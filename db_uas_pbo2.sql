-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jul 2023 pada 17.52
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uas_pbo2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_cabang`
--

CREATE TABLE `tb_cabang` (
  `id_cabang` varchar(35) NOT NULL,
  `id_gudang` varchar(35) NOT NULL,
  `kode_alat` varchar(35) NOT NULL,
  `nama_alat` varchar(35) NOT NULL,
  `harga_alat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `merek` varchar(35) NOT NULL,
  `tgl_terima` date NOT NULL,
  `tgl_kirim` date NOT NULL,
  `Cabang` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_cabang`
--

INSERT INTO `tb_cabang` (`id_cabang`, `id_gudang`, `kode_alat`, `nama_alat`, `harga_alat`, `jumlah`, `merek`, `tgl_terima`, `tgl_kirim`, `Cabang`) VALUES
('IDbali0001', 'IDGD003', 'E-EL094A-RT', 'POST OP ELBOW WITH  HAND GRIP-RT', 3400, 2, 'ELIFE', '2023-07-13', '2023-07-13', 'Bali'),
('IDbandung0001', 'IDGD003', 'E-EL094A-RT', 'POST OP ELBOW WITH  HAND GRIP-RT', 3400, 2, 'ELIFE', '2023-07-13', '2023-07-13', 'Bandung'),
('IDbandung0002', 'IDGD003', 'E-EL094A-RT', 'POST OP ELBOW WITH  HAND GRIP-RT', 3400, 2, 'ELIFE', '2023-07-13', '2023-07-13', 'Bandung'),
('IDbandung0003', 'IDGD008', 'E-KN096', 'DELUXE KNEE BRACE', 4500, 2, 'ELIFE', '2023-07-13', '2023-07-13', 'Bandung'),
('IDjogja0001', 'IDGD009', 'EWRR 052-RT-S', 'BASOURAT', 12500, 2, 'CIS', '2023-07-13', '2023-07-13', 'Jogja');

--
-- Trigger `tb_cabang`
--
DELIMITER $$
CREATE TRIGGER `diambilcabang` AFTER INSERT ON `tb_cabang` FOR EACH ROW BEGIN
    UPDATE tb_gudang
    SET jumlah = jumlah - (SELECT SUM(jumlah) FROM tb_cabang WHERE kode_alat = new.kode_alat)
    WHERE kode_alat = new.kode_alat;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_data_alat`
--

CREATE TABLE `tb_data_alat` (
  `kode_alat` varchar(15) NOT NULL,
  `nama_alat` varchar(40) NOT NULL,
  `stock` int(11) NOT NULL,
  `merek` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_data_alat`
--

INSERT INTO `tb_data_alat` (`kode_alat`, `nama_alat`, `stock`, `merek`, `harga`) VALUES
('E-EL092-RT', 'ECONOMIC POST OP ELBOW-RT', 206, 'ELIFE', 4300),
('E-EL094A-LT', 'POST OP ELBOW WITH  HAND GRIP-LT', 120, 'ELIFE', 4500),
('E-EL094A-RT', 'POST OP ELBOW WITH  HAND GRIP-RT', 98, 'ELIFE', 3400),
('E-KN009', 'ECONOMIC POST OP KNEE BRACE', 144, 'ELIFE', 2785000),
('E-KN096', 'DELUXE KNEE BRACE', 223, 'ELIFE', 4500),
('EWRR 052-RT-S', 'BASOURAT', 118, 'CIS', 12500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gudang`
--

CREATE TABLE `tb_gudang` (
  `id_gudang` varchar(15) NOT NULL,
  `kode_alat` varchar(35) NOT NULL,
  `nama_alat` varchar(35) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `merek` varchar(35) NOT NULL,
  `tglmskgudang` date NOT NULL,
  `status` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_gudang`
--

INSERT INTO `tb_gudang` (`id_gudang`, `kode_alat`, `nama_alat`, `jumlah`, `harga`, `merek`, `tglmskgudang`, `status`) VALUES
('IDGD002', 'E-KN009', 'ECONOMIC POST OP KNEE BRACE', 1, 2785000, 'ELIFE', '2023-07-13', 'diizinkan'),
('IDGD005', 'E-EL092-RT', 'ECONOMIC POST OP ELBOW-RT', 1, 4300, 'ELIFE', '2023-07-13', 'diizinkan'),
('IDGD006', 'E-EL092-RT', 'ECONOMIC POST OP ELBOW-RT', 2, 4300, 'ELIFE', '2023-07-13', 'diizinkan'),
('IDGD007', 'E-KN009', 'ECONOMIC POST OP KNEE BRACE', 5, 2785000, 'ELIFE', '2023-07-13', 'diizinkan'),
('IDGD008', 'E-KN096', 'DELUXE KNEE BRACE', 4, 4500, 'ELIFE', '2023-07-13', 'diizinkan'),
('IDGD009', 'EWRR 052-RT-S', 'BASOURAT', 3, 12500, 'CIS', '2023-07-13', 'diizinkan');

--
-- Trigger `tb_gudang`
--
DELIMITER $$
CREATE TRIGGER `diambilgudang` AFTER INSERT ON `tb_gudang` FOR EACH ROW BEGIN
    UPDATE tb_data_alat
    SET stock = stock - (SELECT SUM(jumlah) FROM tb_gudang WHERE kode_alat = new.kode_alat)
    WHERE kode_alat = new.kode_alat;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kirim_cabang`
--

CREATE TABLE `tb_kirim_cabang` (
  `id_kirim` varchar(35) NOT NULL,
  `id_gudang` varchar(35) NOT NULL,
  `kode_alat` varchar(35) NOT NULL,
  `nama_alat` varchar(35) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `merek` varchar(35) NOT NULL,
  `tglkirim` varchar(35) NOT NULL,
  `Cabang` varchar(35) NOT NULL,
  `status` enum('belum_diterima','diterima') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_kirim_cabang`
--

INSERT INTO `tb_kirim_cabang` (`id_kirim`, `id_gudang`, `kode_alat`, `nama_alat`, `jumlah`, `harga`, `merek`, `tglkirim`, `Cabang`, `status`) VALUES
('IDKRM001', 'IDGD001', 'E-KN096', 'DELUXE KNEE BRACE', 4500, 2, 'ELIFE', '2023-07-13', 'Bali', 'belum_diterima'),
('IDKRM002', 'IDGD008', 'E-KN096', 'DELUXE KNEE BRACE', 2, 4500, 'ELIFE', '2023-07-13', 'Jogja', 'belum_diterima'),
('IDKRM003', 'IDGD008', 'E-KN096', 'DELUXE KNEE BRACE', 3, 4500, 'ELIFE', '2023-07-13', 'Semarang', 'belum_diterima'),
('IDKRM004', 'IDGD009', 'EWRR 052-RT-S', 'BASOURAT', 2, 12500, 'CIS', '2023-07-13', 'Bandung', 'belum_diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengelolaan`
--

CREATE TABLE `tb_pengelolaan` (
  `id_pengelolaan` varchar(35) NOT NULL,
  `id_gudang` varchar(15) NOT NULL,
  `kode_alat` varchar(35) NOT NULL,
  `nama_alat` varchar(35) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `merek` varchar(35) NOT NULL,
  `tglmskgudang` date NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pengelolaan`
--

INSERT INTO `tb_pengelolaan` (`id_pengelolaan`, `id_gudang`, `kode_alat`, `nama_alat`, `jumlah`, `harga`, `merek`, `tglmskgudang`, `status`) VALUES
('IAPG001', 'IDGD001', 'E-KN096', 'DELUXE KNEE BRACE', 2, 4500, 'ELIFE', '2023-07-13', 'diizinkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengelolaan_cabang`
--

CREATE TABLE `tb_pengelolaan_cabang` (
  `id_cabang` varchar(35) NOT NULL,
  `id_gudang` varchar(35) NOT NULL,
  `kode_alat` varchar(35) NOT NULL,
  `nama_alat` varchar(35) NOT NULL,
  `harga_alat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `merek` varchar(35) NOT NULL,
  `tgl_terima` date NOT NULL,
  `tgl_kirim` date NOT NULL,
  `Cabang` varchar(35) NOT NULL,
  `status` enum('Di_izinkan','Belum_Diizinkan','','') NOT NULL,
  `status2` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pengelolaan_cabang`
--

INSERT INTO `tb_pengelolaan_cabang` (`id_cabang`, `id_gudang`, `kode_alat`, `nama_alat`, `harga_alat`, `jumlah`, `merek`, `tgl_terima`, `tgl_kirim`, `Cabang`, `status`, `status2`) VALUES
('IDbali0001', 'IDGD009', 'EWRR 052-RT-S', 'BASOURAT', 12500, 3, 'CIS', '2023-07-13', '2023-07-13', 'Bali', 'Di_izinkan', 'menerima_kiriman'),
('IDbandung0001', 'IDGD007', 'E-KN009', 'ECONOMIC POST OP KNEE BRACE', 2785000, 2, 'ELIFE', '2023-07-13', '2023-07-13', 'Bandung', 'Di_izinkan', 'ambil_data_digudang'),
('IDbandung0002', 'IDGD008', 'E-KN096', 'DELUXE KNEE BRACE', 4500, 2, 'ELIFE', '2023-07-13', '2023-07-13', 'Bandung', 'Belum_Diizinkan', 'ambil_data_digudang'),
('IDbandung0003', 'IDGD008', 'E-KN096', 'DELUXE KNEE BRACE', 4500, 3, 'ELIFE', '2023-07-13', '2023-07-13', 'Bandung', 'Belum_Diizinkan', 'ambil_data_digudang'),
('IDjakarta0001', 'IDGD008', 'E-KN096', 'DELUXE KNEE BRACE', 4500, 1, 'ELIFE', '2023-07-13', '2023-07-13', 'Jakarta', 'Belum_Diizinkan', 'ambil_data_digudang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan_cabang`
--

CREATE TABLE `tb_penjualan_cabang` (
  `id_penjualan` varchar(255) NOT NULL,
  `id_cabang` varchar(255) DEFAULT NULL,
  `kode_alat` varchar(255) DEFAULT NULL,
  `nama_alat` varchar(255) DEFAULT NULL,
  `merek` varchar(35) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `nama_marketing` varchar(255) DEFAULT NULL,
  `hargajual` decimal(10,2) DEFAULT NULL,
  `jumlahjual` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `hargaSetorSMI` decimal(10,2) DEFAULT NULL,
  `pokok` decimal(10,2) DEFAULT NULL,
  `profitSMI` decimal(10,2) DEFAULT NULL,
  `tgl_jual` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_penjualan_cabang`
--

INSERT INTO `tb_penjualan_cabang` (`id_penjualan`, `id_cabang`, `kode_alat`, `nama_alat`, `merek`, `id_user`, `nama_marketing`, `hargajual`, `jumlahjual`, `total`, `hargaSetorSMI`, `pokok`, `profitSMI`, `tgl_jual`) VALUES
('IDPNCB001', 'IDbandung0003', 'E-KN096', 'DELUXE KNEE BRACE', 'ELIFE', 'USER007', 'polo2', 4500.00, 2, 9000.00, 2700.00, 4500.00, 6300.00, '2023-07-13'),
('IDPNCB002', 'IDjogja0001', 'EWRR 052-RT-S', 'BASOURAT', 'CIS', 'USER008', 'kira', 13000.00, 2, 26000.00, 7800.00, 12500.00, 17200.00, '2023-07-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan_gudang`
--

CREATE TABLE `tb_penjualan_gudang` (
  `id_penjualan` varchar(50) NOT NULL,
  `id_gudang` varchar(50) DEFAULT NULL,
  `kode_alat` varchar(50) DEFAULT NULL,
  `nama_alat` varchar(100) DEFAULT NULL,
  `merek` varchar(30) NOT NULL,
  `id_user` varchar(25) NOT NULL,
  `nama_marketing` varchar(40) NOT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `harga_setor_smi` decimal(10,2) DEFAULT NULL,
  `pokok` decimal(10,2) DEFAULT NULL,
  `profit_smi` decimal(10,2) DEFAULT NULL,
  `tgl_jual` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_setor_cabang`
--

CREATE TABLE `tb_setor_cabang` (
  `id_setor` varchar(50) NOT NULL,
  `id_penjualan` varchar(35) NOT NULL,
  `id_cabang` varchar(35) NOT NULL,
  `kode_alat` varchar(50) DEFAULT NULL,
  `nama_alat` varchar(50) DEFAULT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL,
  `merek` varchar(50) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `tanggal_terpakai` date DEFAULT NULL,
  `harga_setor` decimal(10,2) DEFAULT NULL,
  `jam` varchar(11) DEFAULT NULL,
  `jumlah_setor` int(11) DEFAULT NULL,
  `tanggal_setor` date DEFAULT NULL,
  `pokok` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_setor_cabang`
--

INSERT INTO `tb_setor_cabang` (`id_setor`, `id_penjualan`, `id_cabang`, `kode_alat`, `nama_alat`, `harga_jual`, `merek`, `jumlah_jual`, `tanggal_terpakai`, `harga_setor`, `jam`, `jumlah_setor`, `tanggal_setor`, `pokok`, `profit`) VALUES
('IDSETRCB001', 'IDPNCB001', 'IDbandung0003', 'E-KN096', 'DELUXE KNEE BRACE', 4500.00, 'ELIFE', 2, '2023-07-13', 2700.00, '19:56', 2, '2023-07-13', 4500.00, 6300.00),
('IDSETRCB002', 'IDPNCB002', 'IDjogja0001', 'EWRR 052-RT-S', 'BASOURAT', 13000.00, 'CIS', 2, '2023-07-13', 7800.00, '20:40', 2, '2023-07-13', 12500.00, 17200.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_setor_gudang`
--

CREATE TABLE `tb_setor_gudang` (
  `id_setor` varchar(50) NOT NULL,
  `id_penjualan` varchar(35) NOT NULL,
  `id_gudang` varchar(35) NOT NULL,
  `kode_alat` varchar(50) DEFAULT NULL,
  `nama_alat` varchar(50) DEFAULT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL,
  `merek` varchar(50) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `tanggal_terpakai` date DEFAULT NULL,
  `harga_setor` decimal(10,2) DEFAULT NULL,
  `jam` varchar(11) DEFAULT NULL,
  `jumlah_setor` int(11) DEFAULT NULL,
  `tanggal_setor` date DEFAULT NULL,
  `pokok` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(30) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `jenis_kelamin` varchar(40) NOT NULL,
  `no_telpon` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `level` enum('Admin','Gudang','Direktur','Marketing') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `alamat`, `jenis_kelamin`, `no_telpon`, `email`, `level`) VALUES
('USER001', 'yoga', 'Prayoga123', 'yoga', '', '', '0', '', 'Admin'),
('USER002', 'rony', 'Rony123', 'roby', '', '', '0', '', 'Gudang'),
('USER003', 'silvy', 'Silvy123', 'silvy', '', '', '0', '', 'Direktur'),
('USER004', 'albi', 'Albi123', 'alby', '', '', '0', '', 'Marketing'),
('USER005', 'ilham', 'Ilham123', 'ilham', '', '', '0', '', 'Admin'),
('USER006', 'dian2', 'dian123', 'dian', 'bandung', 'laki_laki', '0998845', 'dian@gmail.com', 'Admin'),
('USER007', 'polo123', 'polo123', 'polo2', 'sulsel', 'laki_laki', '0892737273', 'makasar@gmail.com', 'Marketing'),
('USER008', 'kira123', 'kira123', 'kira', 'jakarta', 'laki_laki', '08938424', 'kira@gmail.com', 'Marketing'),
('USER009', 'yogaprayoga', 'yogaprayoga387', 'prayoga', 'perancis', 'laki_laki', '08972993293', 'yoga@gmail.com', 'Direktur');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_cabang`
--
ALTER TABLE `tb_cabang`
  ADD PRIMARY KEY (`id_cabang`);

--
-- Indeks untuk tabel `tb_data_alat`
--
ALTER TABLE `tb_data_alat`
  ADD PRIMARY KEY (`kode_alat`);

--
-- Indeks untuk tabel `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indeks untuk tabel `tb_kirim_cabang`
--
ALTER TABLE `tb_kirim_cabang`
  ADD PRIMARY KEY (`id_kirim`);

--
-- Indeks untuk tabel `tb_pengelolaan`
--
ALTER TABLE `tb_pengelolaan`
  ADD PRIMARY KEY (`id_pengelolaan`);

--
-- Indeks untuk tabel `tb_pengelolaan_cabang`
--
ALTER TABLE `tb_pengelolaan_cabang`
  ADD PRIMARY KEY (`id_cabang`);

--
-- Indeks untuk tabel `tb_penjualan_cabang`
--
ALTER TABLE `tb_penjualan_cabang`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `tb_penjualan_gudang`
--
ALTER TABLE `tb_penjualan_gudang`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `tb_setor_cabang`
--
ALTER TABLE `tb_setor_cabang`
  ADD PRIMARY KEY (`id_setor`);

--
-- Indeks untuk tabel `tb_setor_gudang`
--
ALTER TABLE `tb_setor_gudang`
  ADD PRIMARY KEY (`id_setor`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
