-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.44 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.14.0.7165
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for quan_ly_khach_san
CREATE DATABASE IF NOT EXISTS `quan_ly_khach_san` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quan_ly_khach_san`;

-- Dumping structure for table quan_ly_khach_san.bang_gia_phong
CREATE TABLE IF NOT EXISTS `bang_gia_phong` (
  `MaGia` int NOT NULL AUTO_INCREMENT,
  `MaLoaiPhong` varchar(10) DEFAULT NULL,
  `NgayApDung` date DEFAULT NULL,
  `Gia` double DEFAULT NULL,
  PRIMARY KEY (`MaGia`),
  UNIQUE KEY `MaLoaiPhong` (`MaLoaiPhong`,`NgayApDung`),
  CONSTRAINT `bang_gia_phong_ibfk_1` FOREIGN KEY (`MaLoaiPhong`) REFERENCES `loai_phong` (`MaLoaiPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.bang_gia_phong: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.checkin_checkout
CREATE TABLE IF NOT EXISTS `checkin_checkout` (
  `MaPhieu` varchar(10) NOT NULL,
  `MaDatPhong` varchar(10) DEFAULT NULL,
  `MaNV` varchar(10) DEFAULT NULL,
  `GioCheckInThucTe` datetime DEFAULT NULL,
  `GioCheckOutThucTe` datetime DEFAULT NULL,
  `TrangThai` varchar(30) DEFAULT NULL,
  `GhiChu` text,
  PRIMARY KEY (`MaPhieu`),
  KEY `MaDatPhong` (`MaDatPhong`),
  KEY `MaNV` (`MaNV`),
  CONSTRAINT `checkin_checkout_ibfk_1` FOREIGN KEY (`MaDatPhong`) REFERENCES `dat_phong` (`MaDatPhong`),
  CONSTRAINT `checkin_checkout_ibfk_2` FOREIGN KEY (`MaNV`) REFERENCES `nhan_vien` (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.checkin_checkout: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.danh_sach_cho
CREATE TABLE IF NOT EXISTS `danh_sach_cho` (
  `MaCho` int NOT NULL AUTO_INCREMENT,
  `MaKH` varchar(10) DEFAULT NULL,
  `MaLoaiPhong` varchar(10) DEFAULT NULL,
  `NgayNhan` datetime DEFAULT NULL,
  `NgayTra` datetime DEFAULT NULL,
  `SoNguoi` int DEFAULT NULL,
  `ThoiGianDangKy` datetime DEFAULT NULL,
  `TrangThai` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaCho`),
  KEY `MaKH` (`MaKH`),
  KEY `MaLoaiPhong` (`MaLoaiPhong`),
  CONSTRAINT `danh_sach_cho_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khach_hang` (`MaKH`),
  CONSTRAINT `danh_sach_cho_ibfk_2` FOREIGN KEY (`MaLoaiPhong`) REFERENCES `loai_phong` (`MaLoaiPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.danh_sach_cho: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.dat_phong
CREATE TABLE IF NOT EXISTS `dat_phong` (
  `MaDatPhong` varchar(10) NOT NULL,
  `MaKH` varchar(10) DEFAULT NULL,
  `MaPhong` varchar(10) DEFAULT NULL,
  `MaNV` varchar(10) DEFAULT NULL,
  `ThoiGianDat` datetime DEFAULT NULL,
  `HanGiuCho` datetime DEFAULT NULL,
  `NgayNhanDuKien` datetime DEFAULT NULL,
  `NgayTraDuKien` datetime DEFAULT NULL,
  `SoNguoi` int DEFAULT NULL,
  `TienCoc` double DEFAULT '0',
  `TrangThai` varchar(30) DEFAULT NULL,
  `GhiChu` text,
  PRIMARY KEY (`MaDatPhong`),
  KEY `MaKH` (`MaKH`),
  KEY `MaPhong` (`MaPhong`),
  KEY `MaNV` (`MaNV`),
  CONSTRAINT `dat_phong_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khach_hang` (`MaKH`),
  CONSTRAINT `dat_phong_ibfk_2` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`),
  CONSTRAINT `dat_phong_ibfk_3` FOREIGN KEY (`MaNV`) REFERENCES `nhan_vien` (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.dat_phong: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.dich_vu
CREATE TABLE IF NOT EXISTS `dich_vu` (
  `MaDV` varchar(10) NOT NULL,
  `TenDV` varchar(100) DEFAULT NULL,
  `GiaDV` double DEFAULT NULL,
  `DonViTinh` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaDV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.dich_vu: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.hoa_don
CREATE TABLE IF NOT EXISTS `hoa_don` (
  `MaHD` varchar(10) NOT NULL,
  `MaPhieu` varchar(10) DEFAULT NULL,
  `MaKM` varchar(10) DEFAULT NULL,
  `TienPhong` double DEFAULT NULL,
  `TienDichVu` double DEFAULT NULL,
  `PhuThu` double DEFAULT NULL,
  `GiamGia` double DEFAULT NULL,
  `TongTien` double DEFAULT NULL,
  `NgayThanhToan` datetime DEFAULT NULL,
  `HinhThucThanhToan` varchar(30) DEFAULT NULL,
  `TrangThai` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaHD`),
  KEY `MaPhieu` (`MaPhieu`),
  KEY `MaKM` (`MaKM`),
  CONSTRAINT `hoa_don_ibfk_1` FOREIGN KEY (`MaPhieu`) REFERENCES `checkin_checkout` (`MaPhieu`),
  CONSTRAINT `hoa_don_ibfk_2` FOREIGN KEY (`MaKM`) REFERENCES `khuyen_mai` (`MaKM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.hoa_don: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.khach_hang
CREATE TABLE IF NOT EXISTS `khach_hang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(15) DEFAULT NULL,
  `CCCD` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.khach_hang: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.khuyen_mai
CREATE TABLE IF NOT EXISTS `khuyen_mai` (
  `MaKM` varchar(10) NOT NULL,
  `TenKM` varchar(100) DEFAULT NULL,
  `LoaiGiam` varchar(20) DEFAULT NULL,
  `GiaTriGiam` double DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `TrangThai` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaKM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.khuyen_mai: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.loai_phong
CREATE TABLE IF NOT EXISTS `loai_phong` (
  `MaLoaiPhong` varchar(10) NOT NULL,
  `TenLoaiPhong` varchar(50) NOT NULL,
  `SoNguoiToiDa` int DEFAULT NULL,
  `MoTa` text,
  PRIMARY KEY (`MaLoaiPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.loai_phong: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.nhan_vien
CREATE TABLE IF NOT EXISTS `nhan_vien` (
  `MaNV` varchar(10) NOT NULL,
  `TenNV` varchar(100) DEFAULT NULL,
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(100) DEFAULT NULL,
  `ChucVu` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaNV`),
  UNIQUE KEY `TaiKhoan` (`TaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.nhan_vien: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.phong
CREATE TABLE IF NOT EXISTS `phong` (
  `MaPhong` varchar(10) NOT NULL,
  `MaLoaiPhong` varchar(10) DEFAULT NULL,
  `TenPhong` varchar(50) DEFAULT NULL,
  `Tang` int DEFAULT NULL,
  `TrangThai` varchar(30) DEFAULT NULL,
  `MoTaPhong` text,
  `HinhAnh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaPhong`),
  KEY `MaLoaiPhong` (`MaLoaiPhong`),
  CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`MaLoaiPhong`) REFERENCES `loai_phong` (`MaLoaiPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.phong: ~0 rows (approximately)

-- Dumping structure for table quan_ly_khach_san.su_dung_dich_vu
CREATE TABLE IF NOT EXISTS `su_dung_dich_vu` (
  `MaSD` int NOT NULL AUTO_INCREMENT,
  `MaPhieu` varchar(10) DEFAULT NULL,
  `MaDV` varchar(10) DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `DonGia` double DEFAULT NULL,
  `ThoiGianSuDung` datetime DEFAULT NULL,
  PRIMARY KEY (`MaSD`),
  KEY `MaPhieu` (`MaPhieu`),
  KEY `MaDV` (`MaDV`),
  CONSTRAINT `su_dung_dich_vu_ibfk_1` FOREIGN KEY (`MaPhieu`) REFERENCES `checkin_checkout` (`MaPhieu`),
  CONSTRAINT `su_dung_dich_vu_ibfk_2` FOREIGN KEY (`MaDV`) REFERENCES `dich_vu` (`MaDV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quan_ly_khach_san.su_dung_dich_vu: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
