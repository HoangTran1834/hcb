SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `ChiTietDatXe`;
DROP TABLE IF EXISTS `DanhGia`;
DROP TABLE IF EXISTS `DatXe`;
DROP TABLE IF EXISTS `CaTaiXe`;
DROP TABLE IF EXISTS `TaiXe`;
DROP TABLE IF EXISTS `NhanVien`;
DROP TABLE IF EXISTS `HanhKhach`;
DROP TABLE IF EXISTS `Xe`;
DROP TABLE IF EXISTS `TuyenDuong`;
DROP TABLE IF EXISTS `NguoiDung`;
DROP TABLE IF EXISTS `VaiTro`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `NguoiDung` (
    `maNguoiDung` INT NOT NULL AUTO_INCREMENT,
    `hoTen` VARCHAR(50) NOT NULL,
    `soDienThoai` VARCHAR(15) NOT NULL,
    `matKhau` VARCHAR(255) NOT NULL,
    `email` VARCHAR(100),
    `vaiTro` INT NOT NULL,
    PRIMARY KEY (`maNguoiDung`)
);

CREATE TABLE `VaiTro` (
    `maVaiTro` INT NOT NULL AUTO_INCREMENT,
    `tenVaiTro` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`maVaiTro`)
);

CREATE TABLE `NhanVien` (
    `maNhanVien` INT NOT NULL,
    `ngayVaoLam` DATE NOT NULL,
    `cccd` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`maNhanVien`)
);

CREATE TABLE `HanhKhach` (
    `maHanhKhach` INT NOT NULL,
    PRIMARY KEY (`maHanhKhach`)
);

CREATE TABLE `TaiXe` (
    `maTaiXe` INT NOT NULL,
    `cccd` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`maTaiXe`)
);

CREATE TABLE `DatXe` (
    `maDatXe` INT NOT NULL AUTO_INCREMENT,
    `maHanhKhach` INT NOT NULL,
    `thoiGianDat` DATETIME NOT NULL,
    `maNhanVien` INT,
    `maCa` INT NOT NULL,
    `diemTra` VARCHAR(100) NOT NULL,
    `diemDon` VARCHAR(100) NOT NULL,
    `maTuyenDuong` INT NOT NULL,
    `trangThai` VARCHAR(50) NOT NULL,
    `ghiChu` TEXT,
    `yeuCauChungXe` BOOLEAN NOT NULL,
    PRIMARY KEY (`maDatXe`)
);

CREATE TABLE `DanhGia` (
    `maDatXe` INT NOT NULL,
    `diemSo` TINYINT NOT NULL,
    `binhLuan` TEXT,
    `ngayDanhGia` DATE NOT NULL,
    PRIMARY KEY (`maDatXe`)
);

CREATE TABLE `CaTaiXe` (
    `maCa` INT NOT NULL AUTO_INCREMENT,
    `maTaiXe` INT NOT NULL,
    `maXe` INT NOT NULL,
    `gioXuatPhat` TIME NOT NULL,
    `ngayXuatPhat` DATE NOT NULL,
    `diaDiemXuatPhat` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`maCa`)
);

CREATE TABLE `Xe` (
    `maXe` INT NOT NULL AUTO_INCREMENT,
    `bienSoXe` VARCHAR(20) NOT NULL,
    `loaiXe` VARCHAR(50),
    `soChoNgoi` INT NOT NULL,
    PRIMARY KEY (`maXe`)
);

CREATE TABLE `TuyenDuong` (
    `maTuyenDuong` INT NOT NULL AUTO_INCREMENT,
    `diemDon` VARCHAR(25) NOT NULL,
    `diemTra` VARCHAR(25) NOT NULL,
    `giaCuoc` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`maTuyenDuong`)
);

CREATE TABLE `ChiTietDatXe` (
    `maChiTiet` INT NOT NULL AUTO_INCREMENT,
    `maDatXe` INT NOT NULL,
    `maCa` INT NOT NULL,
    `tenKhach` VARCHAR(50) NOT NULL,
    `soDienThoaiKhach` VARCHAR(15) NOT NULL,
    `diemTra` VARCHAR(100) NOT NULL,
    `diemDon` VARCHAR(100) NOT NULL,
    `maTuyenDuong` INT NOT NULL,
    `trangThai` VARCHAR(50) NOT NULL,
    `ghiChu` TEXT,
    PRIMARY KEY (`maChiTiet`)
);

-- FOREIGN KEYS
ALTER TABLE `NguoiDung` ADD FOREIGN KEY (`vaiTro`) REFERENCES `VaiTro`(`maVaiTro`);
ALTER TABLE `NhanVien` ADD FOREIGN KEY (`maNhanVien`) REFERENCES `NguoiDung`(`maNguoiDung`);
ALTER TABLE `HanhKhach` ADD FOREIGN KEY (`maHanhKhach`) REFERENCES `NguoiDung`(`maNguoiDung`);
ALTER TABLE `TaiXe` ADD FOREIGN KEY (`maTaiXe`) REFERENCES `NguoiDung`(`maNguoiDung`);
ALTER TABLE `DatXe` ADD FOREIGN KEY (`maNhanVien`) REFERENCES `NhanVien`(`maNhanVien`);
ALTER TABLE `DatXe` ADD FOREIGN KEY (`maHanhKhach`) REFERENCES `HanhKhach`(`maHanhKhach`);
ALTER TABLE `DatXe` ADD FOREIGN KEY (`maCa`) REFERENCES `CaTaiXe`(`maCa`);
ALTER TABLE `DatXe` ADD FOREIGN KEY (`maTuyenDuong`) REFERENCES `TuyenDuong`(`maTuyenDuong`);
ALTER TABLE `DanhGia` ADD FOREIGN KEY (`maDatXe`) REFERENCES `DatXe`(`maDatXe`);
ALTER TABLE `CaTaiXe` ADD FOREIGN KEY (`maTaiXe`) REFERENCES `TaiXe`(`maTaiXe`);
ALTER TABLE `CaTaiXe` ADD FOREIGN KEY (`maXe`) REFERENCES `Xe`(`maXe`);
ALTER TABLE `ChiTietDatXe` ADD FOREIGN KEY (`maDatXe`) REFERENCES `DatXe`(`maDatXe`);
ALTER TABLE `ChiTietDatXe` ADD FOREIGN KEY (`maCa`) REFERENCES `CaTaiXe`(`maCa`);
ALTER TABLE `ChiTietDatXe` ADD FOREIGN KEY (`maTuyenDuong`) REFERENCES `TuyenDuong`(`maTuyenDuong`);












INSERT INTO VaiTro (tenVaiTro) VALUES
('Admin'),
('Hàng khách'),
('Tài xế'),
('Nhân viên');

INSERT INTO NguoiDung (hoTen, soDienThoai, matKhau, email, vaiTro) VALUES
('Nguyễn Văn An', '0912345678', 'password123', 'nguyenvanan@gmail.com', 2),
('Trần Thị Bình', '0987654321', 'securepass456', 'tranthibinh@gmail.com', 3),
('Lê Văn Chính', '0909090909', 'mypassword789', 'levanchinh@gmail.com', 4),
('Quản Trị Viên', '0123456789', 'adminsecure123', 'admin@hethongdatxe.com', 1),
('Phạm Minh Đức', '0933123456', 'userpass321', 'phamminhduc@gmail.com', 2),
('Hoàng Thị Em', '0944987654', 'strongpass654', 'hoangthiem@gmail.com', 2),
('Đặng Văn Phúc', '0967894321', 'safe123pass', 'dangvanphuc@gmail.com', 2);

INSERT INTO NhanVien (maNhanVien, ngayVaoLam, cccd) VALUES
(3, '2023-05-10', '123456789012');

INSERT INTO HanhKhach (maHanhKhach) VALUES (1);

INSERT INTO TaiXe (maTaiXe, cccd) VALUES
(2, '987654321098');

INSERT INTO Xe (bienSoXe, loaiXe, soChoNgoi) VALUES
('51A-12345', '4 chỗ', 4),
('29B-67890', '7 chỗ', 7);

INSERT INTO CaTaiXe (maTaiXe, maXe, gioXuatPhat, ngayXuatPhat, diaDiemXuatPhat) VALUES
(2, 1, '06:00:00', '2025-04-18', 'Tam Kỳ');

INSERT INTO TuyenDuong (diemDon, diemTra, giaCuoc) VALUES
('Đà Nẵng', 'Tam Kỳ', 200000),
('Tam Kỳ', 'Đà Nẵng', 200000);


DELIMITER //

CREATE TRIGGER them_nguoi_dung_sau_khi_insert
AFTER INSERT ON NguoiDung
FOR EACH ROW
BEGIN
    IF NEW.vaiTro = 1 THEN
        INSERT INTO HanhKhach(maHanhKhach)
        VALUES (NEW.maNguoiDung);
    ELSEIF NEW.vaiTro = 2 THEN
        INSERT INTO TaiXe(maTaiXe, cccd)
        VALUES (NEW.maNguoiDung, ''); -- Bạn cần sửa giá trị CCCD cho phù hợp
    ELSEIF NEW.vaiTro = 3 THEN
        INSERT INTO NhanVien(maNhanVien, ngayVaoLam, cccd)
        VALUES (NEW.maNguoiDung, CURDATE(), ''); -- Sửa lại CCCD nếu cần
    END IF;
END //

DELIMITER ;


