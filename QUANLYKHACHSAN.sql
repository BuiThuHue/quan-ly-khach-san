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


-- Dumping database structure for quanlykhachsan
CREATE DATABASE IF NOT EXISTS `quanlykhachsan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quanlykhachsan`;

-- Dumping structure for table quanlykhachsan.dat_phong
CREATE TABLE IF NOT EXISTS `dat_phong` (
  `MaDatPhong` varchar(10) NOT NULL,
  `MaPhong` varchar(10) DEFAULT NULL,
  `MaKH` varchar(10) DEFAULT NULL,
  `ThoiDiemDat` datetime DEFAULT NULL,
  `NgayNhan` date DEFAULT NULL,
  `NgayTra` date DEFAULT NULL,
  `SoNguoi` int DEFAULT NULL,
  `TrangThai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaDatPhong`),
  KEY `MaPhong` (`MaPhong`),
  KEY `MaKH` (`MaKH`),
  CONSTRAINT `dat_phong_ibfk_1` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`),
  CONSTRAINT `dat_phong_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khach_hang` (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quanlykhachsan.dat_phong: ~0 rows (approximately)

-- Dumping structure for table quanlykhachsan.dich_vu
CREATE TABLE IF NOT EXISTS `dich_vu` (
  `MaDV` varchar(10) NOT NULL,
  `TenDV` varchar(100) DEFAULT NULL,
  `GiaDV` double DEFAULT NULL,
  PRIMARY KEY (`MaDV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quanlykhachsan.dich_vu: ~0 rows (approximately)

-- Dumping structure for table quanlykhachsan.khach_hang
CREATE TABLE IF NOT EXISTS `khach_hang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(15) DEFAULT NULL,
  `CCCD` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quanlykhachsan.khach_hang: ~0 rows (approximately)

-- Dumping structure for table quanlykhachsan.khuyen_mai
CREATE TABLE IF NOT EXISTS `khuyen_mai` (
  `MaKM` varchar(10) NOT NULL,
  `TenKM` varchar(100) NOT NULL,
  `LoaiGiam` varchar(20) DEFAULT NULL,
  `GiaTriGiam` double DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `DieuKien` text,
  `TrangThai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaKM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quanlykhachsan.khuyen_mai: ~0 rows (approximately)

-- Dumping structure for table quanlykhachsan.loai_phong
CREATE TABLE IF NOT EXISTS `loai_phong` (
  `MaLoaiPhong` varchar(10) NOT NULL,
  `TenLoaiPhong` varchar(50) NOT NULL,
  `GiaCoBan` double NOT NULL,
  `SoNguoiToiDa` int DEFAULT NULL,
  `MoTa` text,
  PRIMARY KEY (`MaLoaiPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quanlykhachsan.loai_phong: ~0 rows (approximately)

-- Dumping structure for table quanlykhachsan.phong
CREATE TABLE IF NOT EXISTS `phong` (
  `MaPhong` varchar(10) NOT NULL,
  `MaLoaiPhong` varchar(10) DEFAULT NULL,
  `TrangThai` varchar(20) DEFAULT NULL,
  `Tang` int DEFAULT NULL,
  PRIMARY KEY (`MaPhong`),
  KEY `MaLoaiPhong` (`MaLoaiPhong`),
  CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`MaLoaiPhong`) REFERENCES `loai_phong` (`MaLoaiPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quanlykhachsan.phong: ~0 rows (approximately)

-- Dumping structure for table quanlykhachsan.su_dung_dich_vu
CREATE TABLE IF NOT EXISTS `su_dung_dich_vu` (
  `MaSD` int NOT NULL AUTO_INCREMENT,
  `MaDatPhong` varchar(10) DEFAULT NULL,
  `MaDV` varchar(10) DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `ThoiDiemSuDungDV` datetime DEFAULT NULL,
  `TrangThai` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaSD`),
  KEY `MaDatPhong` (`MaDatPhong`),
  KEY `MaDV` (`MaDV`),
  CONSTRAINT `su_dung_dich_vu_ibfk_1` FOREIGN KEY (`MaDatPhong`) REFERENCES `dat_phong` (`MaDatPhong`),
  CONSTRAINT `su_dung_dich_vu_ibfk_2` FOREIGN KEY (`MaDV`) REFERENCES `dich_vu` (`MaDV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table quanlykhachsan.su_dung_dich_vu: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
